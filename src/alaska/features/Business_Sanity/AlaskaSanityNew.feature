@AlaskaSanity
Feature: Validate sanity testing of Complete Business Flow

  @mk @closeoutHappyPath
  Scenario: CloseOut Happy Path
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Directed Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:annoucementTableId---"
    When I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:AnnouncementGrantsTableId---" panel
    And I check "All" boxes in flex table with id "---announcement:-:AnnouncementGrantsTableId---"
    And I click on top right button "Bulk Closeout" in flex table with id "---announcement:-:AnnouncementGrantsTableId---"
    Then I softly see the following messages in the page details contains:
      | Following grants are closed successfully. |

  @overrideCloseoutAndSubmitForApproval_Sanity
  Scenario Outline: Grant owner overrides the Closeout and is submitted for approval
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "{closeout:PaymentRequestTitleFiedlID}"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I halt execution
    And I click toggle button to select "Reimbursements -Approved"
    And I halt execution
    When I perform quick search for "{SavedValue:EGMSID}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---"
    And I navigate to "Financials" sub tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:PM Username} | NA            |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I perform quick search for "Record Id" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly see field "EGMS ID" as "{SavedValue:closeoutID}"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | NA       |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 2   |
    Given I click on "Send To Grantee" in the page details
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | Award Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @ChecklistSupportingDocumentNotes_Sanity
  Scenario: Verifying the Checklist of Closeout Request/ Validate the Supporting Document Checklist Section / Validate the user can add the Notes for Closeout Requests
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Checklist" sub tab
    Then I softly see field "Has the Grantee submitted all payment requests?" as "Yes"
    Then I softly see field "Did the Grantee incur any costs after the period of performance end date?" as "Yes"
    Then I softly see field "Have all submitted payments to the Grantee been issued, including the final payment?" as "Yes"
    Then I softly see field "Have all expenditures been reviewed for allowability?" as "Yes"
    Then I softly see field "Is there an unspent balance remaining on this award?" as "Yes"
    Then I softly see field "Have all indirect expenses been posted to the award?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the Grantee met the match requirement?" as "Yes"
    Then I softly see field "Has the Grantee provided supporting documentation for all reported match, including third party in-kind match?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Did the Grantee fully expend program income earned during the award period prior to the closeout of the award?" as "Yes"
    Then I softly see field "Has the Grantee returned unexpended program income to the funding organization, if required by program regulations?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the Grantee completed the scope of work as outlined in the subaward agreement?" as "Yes"
    Then I softly see field "Has the Grantee met all deliverable requirements?" as "Yes"
    Then I softly see field "Has the Grantee submitted required documentation of performance completion?" as "Yes"
    Then I softly see field "Did the Grantee request an extension to the period of performance?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the Grantee submitted all programmatic or progress reports?" as "Yes"
    Then I softly see field "Has the Grantee submitted all required site visit reports?" as "Yes"
    Then I softly see field "Has the funding organization program staff reviewed and accepted all reports?" as "Yes"
    Then I softly see field "Is the Grantee required to provide ongoing outcome or compliance reporting after the period of performance end date?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the Grantee submitted a equipment inventory?" as "Yes"
    Then I softly see field "Has the Grantee put in place the required deed restrictions or mortgage liens for real property acquired, constructed, rehabilitated, or reconstructed with federal award funds?" as "Yes"
    Then I softly see field "Did the grantee make facility or infrastructure improvements that trigger change of use requirements and is the grantee required to provide ongoing maintenance?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the grantee completed all corrective actions for any open findings/concerns?" as "Yes"
    Then I softly see field "Has the funding organization reviewed and accepted all corrective actions?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    When I navigate to "Files" sub tab
#    Then I softly see value "Automation" for title "Description" inside table "---closeout:-:closeoutSupportingDocumentChecklist---"
    And I pause execution for "4" seconds
    When I enter the following values into flex table with id "---closeout:-:closeoutNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---closeout:-:closeoutNotesTableId---"

  @265613_Sanity
  Scenario: Validate SPI user see 'Balance' value for balance column which is Subtraction of Cumulative Obligation and Spent
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "{closeout:PaymentRequestTitleFiedlID}"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
#    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 500                   |
    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
#      | Name                     | Name                      | Reimbursement |
#      | {SavedValue:PM Username} | {SavedValue:EXE Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Paid" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "{closeout:JustificationfieldId}"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name           | Closeout |
      | Automation EXE | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Total" inside table "---closeout:-:subrecipientBudgetSummaryFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Balance" against the value "Total" inside table "---closeout:-:subrecipientBudgetSummaryFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Spent" against the value "Total" inside table "---closeout:-:subrecipientBudgetSummaryFocusAreaTableId---"

  @ValidateSiteVisitInOpenItemsForCloseout_Sanity
  Scenario Outline: Verify user can view pending site visits/ desk reviews in Open Items for closeout Request
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SiteVisitID"
    Then I softly see field "EGMS ID" as "{SavedValue:SiteVisitID}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly see "Create Closeout Request" opens in overLay window
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"
    When I click on "Save" in the page details
    When I navigate to "Open Items" sub tab
    Then I softly see that "{SavedValue:SiteVisitID}" has been added in flextable with Id "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @VerifySubrecipientAbleToAddAttachmentForTerminationCloseoutRequest
  Scenario: Validate subrecipient user is able to see Add files button on under closeout details while creating termination closeout request
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | NA       |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 2   |
    Then I softly see that "{SavedValue:EXE Username}" has been added in flextable with Id "---closeout:-:closeoutApproverTableId---"
    When I click on "Send To Grantee" in the page details
    Then I softly see field "Status" as "Sent To Grantee"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I pause execution for "3" seconds
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---closeout:-:ExternalCloseoutDetailsTableId---"
    And I click on top right button "Add Files" in flex table with id "---closeout:-:ExternalCloseoutDetailsTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Federal Closeout Document" from computer
    And I wait for "4" seconds
    When I click modal button "Close"
    And I refresh the page
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---closeout:-:ExternalCloseoutDetailsTableId---"
    And I click on "Edit" icon for "Attachment.pdf" inside flex table with id "---closeout:-:ExternalCloseoutDetailsTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Other" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---closeout:-:ExternalCloseoutDetailsTableId---"
    Then I softly see value "Other" for title "Classification" inside table "---closeout:-:ExternalCloseoutDetailsTableId---"
    And I click on "Delete" icon for "Automation.pdf" inside flex table with id "---closeout:-:ExternalCloseoutDetailsTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | File Automation.pdf deleted successfully. |

  @487548_Sanity
  Scenario: AS Grantor, Verify validation if payment Request is generated and user trying to close the Grant on Shared Revenue Announcement
    Given I published "Directed" type announcement having name "Automation Runtime FDM NPRA Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM NPRA Announcement}" on announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I enter value "Automation Reimbursement Payment Request" into field "{closeout:PaymentRequestTitleFiedlID}"
    And I click modal button "Save and Continue"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category           | Spent This Action |
      | Labor and Fringe Benefits | 100               |
    When I enter value "I Agree" into field "{closeout:TermsAgreementfieldID}"
    And I enter value "Checked" into field "{closeout:ReceiptsUploadedfieldID}"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Directed Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Bulk Closeout" in flex table with id "---announcement:-:AnnouncementGrantsTableId---"
    Then I softly see the following messages in the page details contains:
      | Payments are required to be paid to close grant {SavedValue:Automation Runtime FDM Announcement} |

  @487414_Sanity
  Scenario: Verify that the status should be changed as 'Acknowledge by grantee' after click on Acknowledge button by GA user
    Given I published "Competitive" type announcement having name "Automation Runtime FDM NPRA Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM NPRA Announcement}" on announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I wait for "2" seconds
    And I enter value "Automation Test justification" into field "{closeout:JustificationfieldId}"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 2   |
    And I click on "Send To Grantee" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    When I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    And I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged by Grantee"

  @clickonAcknowledgebuttonbyGranteeuser
  Scenario: Verify that the status should be changed as 'Acknowledge by grantee' after click on Acknowledge button by Grantee user
    Given I published "Competitive" type announcement having name "Automation Runtime FDM NPRA Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM NPRA Announcement}" on announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I wait for "2" seconds
    And I enter value "Automation Test justification" into field "{closeout:JustificationfieldId}"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 2   |
    And I click on "Send To Grantee" in the page details
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    When I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "checked" into field "Aggreement__c"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged by Grantee"

  @487536_Sanity
  Scenario: AS GA, Verify validation if payment Request is generated and user trying to close the Grant on Shared Revenue Announcement
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I enter value "Automation Advance Payment Request" into field "{closeout:PaymentRequestTitleFiedlID}"
    And I click modal button "Save and Continue"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category           | Spent This Action |
      | Labor and Fringe Benefits | 100               |
    When I enter value "I Agree" into field "{closeout:TermsAgreementfieldID}"
    And I enter value "Checked" into field "{closeout:ReceiptsUploadedfieldID}"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Directed Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Bulk Closeout" in flex table with id "---announcement:-:AnnouncementGrantsTableId---"
    Then I softly see the following messages in the page details contains:
      | Payments are required to be paid to close grant {SavedValue:Automation Runtime FDM Announcement} |

  @BulkCloseoutButtonOnNonSharedRevenueAnnouncement
  Scenario: Bulk Closeout button on Non Shared Revenue Announcement
    Given I published "Competitive" type announcement having name "Automation Runtime FDM NPRA Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM NPRA Announcement}" on announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
#    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Announcements - Published"
    When I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Related Log" sub tab
    Then I cannot see top right button "Bulk Closeout" in flex table with id "---announcement:-:AnnouncementGrantsTableId---"

  @MessageTabAndSystemsEmailsForCloseOutRequest
  Scenario:Message tab and systems emails For Close Out Request
    Given I published "Competitive" type announcement having name "Automation Runtime FDM NPRA Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM NPRA Announcement}" on announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I wait for "2" seconds
    And I enter value "Automation Test justification" into field "{closeout:JustificationfieldId}"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---paymentRequest:-:reimburseCollabMessages---"
    And I wait for "30" seconds
    And I send the email under collab tab with following details:
      | To                              | Subject         | Body                       |
      | automationexealaska@yopmail.com | Automation Test | Automation Test Email Body |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---paymentRequest:-:reimburseCollabMessages---"
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:reimburseCollabMessages---" :
      | Actions     | Subject         | From Address             | To Address                      | CC Address | Attention To | Email Subject   | Preview                    |
      | Action menu | Automation Test | automationpm@yopmail.com | automationexealaska@yopmail.com |            |              | Automation Test | Automation Test Email Body |

  @US-AD-2489 @AD-2496 @AD-2499
  Scenario Outline: Verify that the grant owner (PM/PO/EXE/Admin) sees the Award Year field is mandatory while saving the standard grant record
    Given I published "Competitive" type announcement having name "Automation Runtime FDM NPRA Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM NPRA Announcement}" on announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    When I login to "As a Grantor" app as "<User Type>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---closeout:-:grantsTableId---"
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Award Year is required in the Overview tab under the Grant Information section. |

    Examples:
      | User Type |
      | PM        |
#      | ADMIN     |
#      | EXE       |

  @AD-2572
  Scenario: Verify the Award Year field is not editable to the grantee user when the award is in "Sent to Grantee" status
    Given I published "Competitive" type announcement having name "Automation Runtime FDM NPRA Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM NPRA Announcement}" on announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsTableId---"
    Then I softly do not see fields "Award Year" is visible

  @US-AD-2599 @AD-2676 @AD-2680
  Scenario: Verify that Internal User - PM/EXE/FD/FO-program owner sees 'Travel/Training Program' is available in the Program Type dropdown on Program Creation Layout -> Program Specific Settings
  |Verify that Internal User - PM sees the program lifecycle flow remains unchanged when 'Travel/Training Program' is amended |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation_Travel" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "6" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    And I wait for "5" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I wait for "3" seconds
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Active" and is "dark blue"
    #AD-2680
    And I click on "Amend Program" in the page details
    Then I softly see field "Status" as "Being Amended"
    And I click on "Submit For Approval" in the page details
    And I wait for "5" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I wait for "3" seconds
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Active" and is "dark blue"

  @AD-2677 @US-AD-2599
  Scenario:Verify that the Internal User - PM/FD/EXE/FO-program owner sees 'Travel/Training Program' is visible in the Program ID, and the DCRA program type is available on Announcement Layout
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter in modal value "Automation Permanent Travel/Training Program" into field "Program__c"
    Then I softly see lookup or picklist records displayed as below
      | Automation Permanent Travel/Training Program |

  @AD-2678 @US-AD-2599
  Scenario: Verify that Internal User - PM/FD/EXE/FO-program owner sees forms and packages are correctly associated with 'Travel/Training Program' on Announcement Layout as per Alaska DCRA Project configuration
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncementTraningP" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal Ann" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    Then I softly see value "Travel Training Program Form" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"

  @AD-2681 @US-AD-2599
  Scenario: Verify that emails and pending tasks genarated through the announcement life cycle
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncementTraningP" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal Ann" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AnnouncementID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---"
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnouncementID}" in "---announcement:-:homePendingTasksTableId---" panel
    Then I softly see values "{SavedValue:AnnouncementID}" and "Not Started" inside table
    And I click on "Start" icon for "{SavedValue:AnnouncementID}" inside flex table with id "---announcement:-:homePendingTasksTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 90         | 350      |
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I perform quick search for "Acquisition / Lease" in "---announcement:-:selectProgramBudgetCategory---" panel
    When I click "Associate" after selection of "Acquisition / Lease" in the table "---announcement:-:selectProgramBudgetCategory---"
    When I close "Associate Budget Categories" modal by clicking the top right x button
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Forward | Send to Owner | Reject |

  @AD-2682 @US-AD-2599
  Scenario: Verify that Internal User - PM sees all the buttons hidden except Extend Dates when the Announcement is in the Closed state
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    When I click toggle button to select "Announcements - Closed and Archived"
    And I perform quick search for "Automation Runtime Announcement Application Intake91527" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "Automation Runtime Announcement Application Intake91527" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "View" in page detail
    Then I softly can see top right button "Extend Dates" in page detail

  @AD-2683 @US-AD-2599
  Scenario: Verify that Internal User - PM/EXE/FD/FO sees only Amend button when Program is in Active status
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    And I perform quick search for "Automation Permanent Travel/Training Program" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "Automation Permanent Travel/Training Program" inside flex table with id "---program:-:programsTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "View" in page detail
    Then I softly cannot see top right button "Submit For Approval" in page detail
    Then I softly can see top right button "Amend Program" in page detail

  @AD-2684 @US-AD-2599
  Scenario: Verify that Internal User - PM/EXE/FD/FO-Announcement owner sees Extend Dates and Unpublish buttons when Announcement is in Published status
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncementTraningP" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal Ann" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "---AUTOEnvData:-:fundingAccount---" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Then I refresh the page
    When I navigate to "Financials" sub tab
    Then I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                    | Pre-Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 2000            |
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    And I perform quick search for "{SavedValue:EXE Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I wait for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I refresh the page
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I wait for "5" seconds
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 90         | 350      |
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I perform quick search for "Acquisition / Lease" in "---announcement:-:selectProgramBudgetCategory---" panel
    When I click "Associate" after selection of "Acquisition / Lease" in the table "---announcement:-:selectProgramBudgetCategory---"
    When I close "Associate Budget Categories" modal by clicking the top right x button
    And I wait for "2" seconds
    And I enter value "Justified" into field "{amendment:JustificationFieldID}"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    Then I softly can see top right button "Extend Dates" in page detail
    Then I softly can see top right button "Unpublish" in page detail

  @AD-2686 @US-AD-2599
  Scenario: Verify error message when no program type is selected on Program Creation Layout
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation_Travel_Negative" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the following message in the page details contains:
      | Program Type is required to save. Enter it in the Program Specific Settings section. |

  @US-AD-2650 @AD-2712
  Scenario: Verify that GA- all fields from Organization Information section are autopopulated from the organization prfoile-conatct
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_TRAVEL/TRANING"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I wait for "3" seconds
    And I enter value "Automation Direct Application" into field "Title__c"
    And I enter value "Automation Alaska Native Corporataion" into field "ExternalOrganization__c"
    And I enter value "{SavedValue:Automation Runtime Announcement Application Intake}" into field "Announcement__c"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    When I enter values into fields
      | Value                      | Field                     |
      | RN 34, Siege Social        | Addressline1__c           |
      | Address line2              | Addressline2__c           |
      | Anchorage                  | City__c                   |
      | Nome Census Area           | County__c                 |
      | 777                        | CongressionalDistrict1__c |
      | 12346                      | Zip4__c                   |
      | USA                        | Country__c                |
      | 4563                       | ZipCode4Extension__c      |
      | AK                         | State__c                  |
      | Automation New Application | Title__c                  |
      | Automation Data            | ProjectAbstract__c        |
      | Checked                    | Acknowledgment4__c        |
    And I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Travel Training Program" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    Then I softly see "Organization Information" page block displayed
    Then I see below fields in "Organization Information" page block
      | Employer Tax ID Number |
      | UEI                    |
      | Entity Name            |
      | Entity Contact Name    |
      | Mailing Address        |
      | City                   |
      | State                  |
      | Zipcode                |
      | Contact Person         |
      | Email Address          |
      | Phone                  |
      | Fax                    |

  @US-AD-2650 @AD-2713 @AD-2715 @AD-2724
  Scenario: Verify that GA user can see Traveler Information and Travel Information section
  |Verify that GA sees Certification section on Travel/Training Program Application Form|
  |Verify that SPI sees form submission is blocked when Certification Acknowledgement checkbox is not selected on Travel/Training Program Application Form|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_TRAVEL/TRANING"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I wait for "3" seconds
    And I enter value "Automation Direct Application" into field "Title__c"
    And I enter value "Automation Alaska Native Corporataion" into field "ExternalOrganization__c"
    And I enter value "{SavedValue:Automation Runtime Announcement Application Intake}" into field "Announcement__c"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    When I enter values into fields
      | Value                      | Field                     |
      | RN 34, Siege Social        | Addressline1__c           |
      | Address line2              | Addressline2__c           |
      | Anchorage                  | City__c                   |
      | Nome Census Area           | County__c                 |
      | 777                        | CongressionalDistrict1__c |
      | 12346                      | Zip4__c                   |
      | USA                        | Country__c                |
      | 4563                       | ZipCode4Extension__c      |
      | AK                         | State__c                  |
      | Automation New Application | Title__c                  |
      | Automation Data            | ProjectAbstract__c        |
      | Checked                    | Acknowledgment4__c        |
    And I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Travel Training Program" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    Then I softly see "Traveler Information" page block displayed
    Then I see below fields in "Traveler Information" page block
      | Name of the Traveler |
      | Date of Travel       |
    And I click on "Edit" in the page details
#    Then I softly see asterisk mark on "Name of the Traveler"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    Then I see the following message in the page details contains:
      | Name of the Traveler is required to save. Enter it in the Traveler Information section. |
      | Date of Travel is required to save. Enter it in the Traveler Information section.       |
    And I wait for "2" seconds
    Then I softly do not see asterisk mark on "Traveler_Name_2__c"
    Then I softly do not see asterisk mark on "Dates_of_Travel2__c"
    And I enter value "Automation PM" into field "Traveler_Name_1__c"
    And I enter value "10" into field "Dates_of_Travel1__c"
    And I click on "Save" in the page details
    Then I softly see field "Name of the Traveler" as "Automation PM"
    Then I softly see field "Date of Travel" as "{Date:M/d/yyyy::d+10}"
    And I wait for "2" seconds
    And I click on "Validate" in the page details
    #AD-2724
    Then I see the following message in the page details contains:
      | Acknowledgement is Required to save. |

  @US-AD-2650 @AD-2721 @AD-2722 @AD-2723
  Scenario: Verify that SPI seesTravel 1 is mandatory and Traveler Name 2 field remains optional on Travel/Training Program Application Form
  |Verify that SPI sees auto-population of all Grantee Organization Information fields when opening Travel/Training Program Application Form|
  |Verify that SPI sees error handling when required attachments are not uploaded on Travel/Training Program Application Form|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_TRAVEL/TRANING"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Travel Training Program" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    #AD-2722
    Then I softly see "Organization Information" page block displayed
    Then I see below fields in "Organization Information" page block
      | Employer Tax ID Number |
      | UEI                    |
      | Entity Name            |
      | Entity Contact Name    |
      | Mailing Address        |
      | City                   |
      | State                  |
      | Zipcode                |
      | Contact Person         |
      | Email Address          |
      | Phone                  |
      | Fax                    |
    Then I softly see "Traveler Information" page block displayed
    Then I see below fields in "Traveler Information" page block
      | Name of the Traveler |
      | Date of Travel       |
#    Then I softly see asterisk mark on "Name of the Traveler"
    And I click on "Edit" in the page details
    And I wait for "5" seconds
    And I click on "Save" in the page details
    Then I see the following message in the page details contains:
      | Name of the Traveler is required to save. Enter it in the Traveler Information section. |
      | Date of Travel is required to save. Enter it in the Traveler Information section.       |
    And I wait for "2" seconds
    Then I softly do not see asterisk mark on "Traveler_Name_2__c"
    Then I softly do not see asterisk mark on "Dates_of_Travel2__c"
    And I enter value "Automation PM" into field "Traveler_Name_1__c"
    And I enter value "10" into field "Dates_of_Travel1__c"
    And I enter value "Checked" into field "Acknowledgement__c"
    And I click on "Save" in the page details
    Then I softly see field "Name of the Traveler" as "Automation PM"
    Then I softly see field "Date of Travel" as "{Date:M/d/yyyy::d+10}"
    And I click on "Validate" in the page details
    And I switch to parent tab
    And I wait for "3" seconds
    #AD-2723
    And I click on "Submit Application" in the page details
    Then I see the following message in the page details contains:
      | Travel/Training Application Files Section Under Forms and Files Tab - Travel Authorization attachment is required for Travel Training program.    |
      | Travel/Training Application Files Section Under Forms and Files Tab - Airfare attachment is required for Travel Training program.                 |
      | Travel/Training Application Files Section Under Forms and Files Tab - Hotel Receipt attachment is required for Travel Training program.           |
      | Travel/Training Application Files Section Under Forms and Files Tab - Transportation Receipts attachment is required for Travel Training program. |

  @AD-2725 @AD-2726
  Scenario: Verify that SPI sees all the buttons hidden when Travel/Training Program Application Form is in Submitted state
  |Verify that SPI sees all the buttons such as Submit when Travel/Training Program Application Form is in Draft state|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_TRAVEL/TRANING"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    #AD-2726
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Submit Application" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I wait for "5" seconds
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:organizationApplicationFilesTableID---"
    When I upload attachment without random number "Attachment.pdf" of type "Travel Authorization" from computer
    And I wait for "2" seconds
    When I upload attachment without random number "Attachment.pdf" of type "Airfare" from computer
    And I wait for "2" seconds
    When I upload attachment without random number "Attachment.pdf" of type "Hotel Receipt" from computer
    And I wait for "2" seconds
    When I upload attachment without random number "Attachment.pdf" of type "Transportation Receipts" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Travel Training Program" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter value "Automation PM" into field "Traveler_Name_1__c"
    And I enter value "10" into field "Dates_of_Travel1__c"
    And I enter value "Checked" into field "Acknowledgement__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    And I switch to parent tab
    And I wait for "3" seconds
    And I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly cannot see top right button "Submit" in page detail
    Then I softly cannot see top right button "Save" in page detail
    Then I softly see field "Status" as "Submitted to Grantor"

  @AD-2728
  Scenario: Verify system behavior with maximum character input for Entity Name on Travel/Training Program Application Form
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_TRAVEL/TRANING"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Travel Training Program" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter value "{AUTOEnvData:StringOf100Chars}" into field "Traveler_Name_1__c"
    And I enter value "{AUTOEnvData:StringOf100Chars}" into field "Traveler_Name_2__c"
    And I enter value "10" into field "Dates_of_Travel1__c"
    And I enter value "Checked" into field "Acknowledgement__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see field "Name of the Traveler" as "{AUTOEnvData:StringOf100Chars}"

  @AD-2805 @debug
  Scenario: Verify that negotiation flow is working as expected
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_TRAVEL/TRANING"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved TRANINGFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    Then I softly see values "{SavedValue:Automation Runtime FDM Announcement}" and "Reviewed" inside table
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Edit" in the page details
    And I pause execution for "10" seconds
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition_Sanity" values from "Negotiations_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "4" seconds
    And I edit the following rows inline in flex table with id "---negotiation:-:NegotiationFormsTableId---" by clicking "Edit" :
      | Form Name               | Needs Negotiation |
      | Travel Training Program | Checked           |
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Send to Grantee" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I click on "Edit" in the page details
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details

  @US-AD-2621 @AD-2945
  Scenario: Verify that Internal User sees 'Grant Agreement' is generated under subaward files section of Files tab once award is activated
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_TRAVEL/TRANING"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_TRAVEL/TRANING"
    And I created approved TRANINGFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"

  @US-AD-2547 @AD-2581 @AD-2583 @AD-2584
  Scenario: Verify that External User sees School District Verification Form is attached when entity type is School District on Opportunity > Application > Forms
  |Verify that External User sees no default forms are added when entity type is School District on Opportunity > Application > Forms|
  |Verify that External User SPI  sees only required verification form appears when accessing Application on Opportunity > Application > Forms|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_PILT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "ANT" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    Then I softly see value "School District Verification Form" for title "Form Name" inside table "---applicationIntake:-:allFormsTableId---"
    Then I softly do not see value "Municipality Verification Form" for title "Form Name" inside table "---applicationIntake:-:allFormsTableId---"

  @AD-2582
  Scenario: Verify that External User sees contact information fields are auto-populated from Grantee Organization Signing Authority on School District Verification Form
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_PILT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "ANT" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "School District Verification Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    Then I softly see "School District Verification Form" page block displayed
    Then I see below fields in "School District Verification Form" page block
      | Name of School District |
      | Vendor Number           |
      | Contact Name            |
      | Tax ID Number           |
      | Contact Phone Number    |
      | Contact Email Address   |
      | Mailing Address         |
      | City                    |
      | State                   |
      | Country                 |
      | Zipcode                 |
      | Fax Number              |

  @AD-2585
  Scenario: Verify that Internal User (PM/GA/EXE/PO/Admin)sees PILT Verification Form package is associated when creating Announcement on Program > Announcement > Forms Package
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncementPILT" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal Ann" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    Then I softly see value "PILT Verification Forms" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    When I click on "Preview" icon for "PILT Verification Forms" inside table
    Then I softly see value "Municipalities Verification Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "School District Verification Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"

  @AD-2586
  Scenario: Verify that External User(SPI) sees All the buttons like Back/Validate/Edit button with Download as pDF and Take snapshot on School District Form when Application is in Application in created state
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_PILT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "ANT" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "School District Verification Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Back" in page detail
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail

  @AD-2588
  Scenario:Verify that GA USER see the Contact details are auto populated on School District Verification form when application is in created state
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_PILT"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I wait for "3" seconds
    And I enter value "Automation Direct Application" into field "Title__c"
    And I enter value "Automation Alaska Native Corporataion" into field "ExternalOrganization__c"
    And I enter value "{SavedValue:Automation Runtime Announcement Application Intake}" into field "Announcement__c"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    When I enter values into fields
      | Value                      | Field                     |
      | RN 34, Siege Social        | Addressline1__c           |
      | Address line2              | Addressline2__c           |
      | Anchorage                  | City__c                   |
      | Nome Census Area           | County__c                 |
      | 777                        | CongressionalDistrict1__c |
      | 12346                      | Zip4__c                   |
      | USA                        | Country__c                |
      | 4563                       | ZipCode4Extension__c      |
      | AK                         | State__c                  |
      | Automation New Application | Title__c                  |
      | Automation Data            | ProjectAbstract__c        |
      | Checked                    | Acknowledgment4__c        |
    And I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "School District Verification Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    Then I softly see "School District Verification Form" page block displayed
    Then I see below fields in "School District Verification Form" page block
      | Name of School District |
      | Vendor Number           |
      | Contact Name            |
      | Tax ID Number           |
      | Contact Phone Number    |
      | Contact Email Address   |
      | Mailing Address         |
      | City                    |
      | State                   |
      | Country                 |
      | Zipcode                 |
      | Fax Number              |

  @AD-2591 @AD-2592
  Scenario: Verify that External User (SPI)sees error when Acknowledgment check box is not selected  on School District Verification Form
  |Verify that SPI user see the Download as PDF link under hamburger menu option on School District Verification Form|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_PILT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "ANT" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "School District Verification Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    Then I softly see "School District Verification Form" page block displayed
    Then I see below fields in "School District Verification Form" page block
      | Name of School District |
      | Vendor Number           |
      | Contact Name            |
      | Tax ID Number           |
      | Contact Phone Number    |
      | Contact Email Address   |
      | Mailing Address         |
      | City                    |
      | State                   |
      | Country                 |
      | Zipcode                 |
      | Fax Number              |
    And I click on "Validate" in the page details
    Then I see the following message in the page details contains:
      | Acknowledgement is Required to save. |
    #AD-2592
    And I click on "Download as PDF" in the page details
    And I wait for "7" seconds
    And I download the file
    Then I see "School District Verification Form" on page "1" of "govgrants" pdf file

  @AD-2993
  Scenario: Verify that External User - SPI & SPA & GA sees Form is not attached If we select an Applicant type other than these four types. (1st Class city, 2nd Class City, Borough, and School District)
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_PILT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "ANCO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I navigate to "Forms and Files" sub tab
    Then I softly do not see value "PILT Verification Forms" for title "Package Name" inside table "---applicationIntake:-:allFormsTableId---"

  @US-AD-3234 @AD-3294 @AD-3295 @AD-3298
  Scenario: Verify email is received to assigned to the newly selected Subaward Owner when Alaska Award Owner is assigned on FDM Creation State -> Recommended Application Section
  |Verify that the Announcement owner can be selected as the Alaska award owner under the recommended application when the FDM is in the Created state.|
  |Verify that Announcement Owner can assign a Subaward Owner by selecting from the 'Alaska Award Owner' picklist and save the selection on FDM Creation State -> Recommended Application Section|
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NFR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NFR"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I wait for "2" seconds
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:grantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "4" seconds
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "1"
    When I edit the following rows inline in flex table with id "---applicationReview:-:reviewStepFormId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I switch to tab number "2"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "{SavedValue:Automation Runtime FDM Announcement}"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details
    And I wait for "2" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "ASC Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "3"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title                                | Alaska Award Owner |
      | {SavedValue:Automation Runtime FDM Announcement} | Automation PM      |
    #AD-3295 #AD-3298
    Then I softly see value "Automation PM" for title "Alaska Award Owner" inside table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "3" seconds
    And I checkout to yopmail with mailid "automationpm@yopmail.com"
    Then I refresh the page
    And I click on mail with subject "Sandbox: Notification from DCRAGrants: Grantee Subaward Acceptance"
    Then I see the mail text is as follows :
      """
      Hello,
      This is to notify you that Subaward AD-G1-16 for Organization Department of Health has been accepted.
      Log in to DCRA Grants and click here for more details.
      Please do not reply to this system-generated email. You may contact the DCRAGrants Support Team at CAA@Alaska.Gov if you have any questions or need assistance with this task.

      Thank you,
      DCRA Grants and Funding
      """

  @US-AD-3234 @AD-3296 @AD-3297 @AD-3301 @AD-3306
  Scenario: Verify that Announcement owner see the subaward owner in Owner field under Responsibility tab of Subaward once award is created from FDM and subaward owner is selected in Created state FDM
  |Verify no validation message appears when Alaska Award Owner is selected and submitting for approval on FDM Creation State -> Recommended Application Section|
  |Verify validation message 'Please provide the Alaska Award Owner for the selected Application (Application ID)' when submitting for approval without selecting Alaska Award Owner on FDM Creation State -> Recommended Application Section|
  |Verify that Announcement Owner see the Alaska Award Owner field is non editable once FDM is approved and respective Grant/Award is created for the same application|
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NFR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NFR"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I wait for "2" seconds
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "4" seconds
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "1"
    When I edit the following rows inline in flex table with id "---applicationReview:-:reviewStepFormId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I switch to tab number "2"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "{SavedValue:Automation Runtime FDM Announcement}"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details
    And I wait for "2" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "ASC Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "3"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field            |
      | AuGr                        | GrantCode__c     |
      | Automation Test Description | Justification__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I edit the following rows inline in flex table with id "---applicationReview:-:recommendedTableId---" by clicking "Edit" :
      | Application Title                                | Recommended Budget | Recommend for Funding | Comments    | Total Commitment Amount | Grant Number |
      | {SavedValue:Automation Runtime FDM Announcement} | 1000               | Yes                   | Recommended | 500                     | 12345        |
    And I refresh the page
    #AD-3301
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Please provide Alaska Award owner for Application |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title                                | Alaska Award Owner |
      | {SavedValue:Automation Runtime FDM Announcement} | Automation PM      |
    Then I softly see value "Automation PM" for title "Alaska Award Owner" inside table "---subAwardFromFDM:-:recommendedAppTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:PM Username} | Step 1 |
    And I click on "Submit for Approval" in the page details
    #AD-3297
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "Announcement EGMS ID" as "AnnID"
    And I refresh the page
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "3" seconds
    When I perform quick search for "{SavedValue:AnnID}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AnnID}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    #AD-3306
    Then I softly see field "Alaska Award Owner" is not editable
    Then I softly cannot see row level action button "Edit" against "Alaska Award Owner" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I pause execution for "5" seconds
    And I enter value "Automation Test Description" into field "{amendment:GrantAwardDescriptionId}"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---subAwardStandAlone:-:subawardOwnerTableId---"

  @US-AD-3234 @AD-3307 @AD-3308
  Scenario: Verify FDM Owner sees the Selected owner in PDF by clicking Download as PDF under Recommended application section of FDM
  |Verify system prevents submission when Alaska Award Owner field is cleared after initial population|
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NFR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NFR"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I wait for "2" seconds
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "4" seconds
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "1"
    When I edit the following rows inline in flex table with id "---applicationReview:-:reviewStepFormId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I switch to tab number "2"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "{SavedValue:Automation Runtime FDM Announcement}"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details
    And I wait for "2" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "ASC Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "3"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field            |
      | AuGr                        | GrantCode__c     |
      | Automation Test Description | Justification__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    #AD-3308
    And I edit the following rows inline in flex table with id "---applicationReview:-:recommendedTableId---" by clicking "Edit" :
      | Application Title                                | Recommended Budget | Recommend for Funding | Comments    | Total Commitment Amount | Alaska Award Owner | Grant Number |
      | {SavedValue:Automation Runtime FDM Announcement} | 1000               | Yes                   | Recommended | 500                     | Automation PM      | 12345        |
    Then I softly see value "Automation PM" for title "Alaska Award Owner" inside table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on "Edit" in the page details
    And I clear the value from field "Alaska Award Owner"
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Please provide Alaska Award owner for Application |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title                                | Alaska Award Owner |
      | {SavedValue:Automation Runtime FDM Announcement} | Automation PM      |
    And I click on "Download as PDF" in the page details
    And I wait for "7" seconds
    And I download the file
    Then I see "Automation PM" on page "1" of "govgrants" pdf file

  @AD-3310
  Scenario:Verify that Announcement Owner can see with a large number of users in the Alaska Award Owner picklist
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NFR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NFR"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I wait for "2" seconds
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:grantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "4" seconds
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "1"
    When I edit the following rows inline in flex table with id "---applicationReview:-:reviewStepFormId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I switch to tab number "2"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "{SavedValue:Automation Runtime FDM Announcement}"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details
    And I wait for "2" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "ASC Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "3"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field            |
      | AuGr                        | GrantCode__c     |
      | Automation Test Description | Justification__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NFR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NFR"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I wait for "2" seconds
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "4" seconds
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "1"
    When I edit the following rows inline in flex table with id "---applicationReview:-:reviewStepFormId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I switch to tab number "2"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "{SavedValue:Automation Runtime FDM Announcement}"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details
    And I wait for "2" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "ASC Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "3"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field            |
      | AuGr                        | GrantCode__c     |
      | Automation Test Description | Justification__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title                                | Alaska Award Owner |
      | {SavedValue:Automation Runtime FDM Announcement} | Automation PM      |
    Then I softly see lookup or picklist records displayed as below
      | Automation PM |
      | nathan gill   |

  @AD-3338
  Scenario: Verify that FDM Owner see the Alaska award owner field and Grant No field are editable when FDM status is approved and Grant is not created yet
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NFR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NFR"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I wait for "2" seconds
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "4" seconds
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "1"
    When I edit the following rows inline in flex table with id "---applicationReview:-:reviewStepFormId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I switch to tab number "2"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "{SavedValue:Automation Runtime FDM Announcement}"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details
    And I wait for "2" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "ASC Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "3"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field            |
      | AuGr                        | GrantCode__c     |
      | Automation Test Description | Justification__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I edit the following rows inline in flex table with id "---applicationReview:-:recommendedTableId---" by clicking "Edit" :
      | Application Title                                | Recommended Budget | Recommend for Funding | Comments    | Total Commitment Amount | Grant Number |
      | {SavedValue:Automation Runtime FDM Announcement} | 1000               | Yes                   | Recommended | 500                     | 1234         |
    And I refresh the page
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Please provide Alaska Award owner for Application |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title                                | Alaska Award Owner |
      | {SavedValue:Automation Runtime FDM Announcement} | Automation PM      |
    Then I softly see value "Automation PM" for title "Alaska Award Owner" inside table "---subAwardFromFDM:-:recommendedAppTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:PM Username} | Step 1 |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "Announcement EGMS ID" as "AnnID"
    And I refresh the page
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "3" seconds
    When I perform quick search for "{SavedValue:AnnID}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AnnID}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    Then I softly see fields "Alaska Award Owner" is in edit mode
    Then I softly see fields "Grant Number" is in edit mode

  @AD-3303
  Scenario: Verify Announcement owner see the details of Alaska Award owner by moving curser on Alaska Award owner under recommended application of FDM
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NFR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NFR"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I wait for "2" seconds
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "4" seconds
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "1"
    When I edit the following rows inline in flex table with id "---applicationReview:-:reviewStepFormId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I switch to tab number "2"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "{SavedValue:Automation Runtime FDM Announcement}"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details
    And I wait for "2" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "ASC Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "3"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field            |
      | AuGr                        | GrantCode__c     |
      | Automation Test Description | Justification__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I edit the following rows inline in flex table with id "---applicationReview:-:recommendedTableId---" by clicking "Edit" :
      | Application Title                                | Recommended Budget | Recommend for Funding | Comments    | Total Commitment Amount | Grant Number |
      | {SavedValue:Automation Runtime FDM Announcement} | 1000               | Yes                   | Recommended | 500                     | 1234         |
    And I refresh the page
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Please provide Alaska Award owner for Application |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title                                | Alaska Award Owner |
      | {SavedValue:Automation Runtime FDM Announcement} | Automation PM      |
    Then I softly see value "Automation PM" for title "Alaska Award Owner" inside table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I hovering mouse on table id "---applicationReview:-:reviewFormsTableId---" with table row level icon "Automation PM" for column value "Automation PM"
    Then I softly see "Automation PM" shown as help text
    Then I softly see "Department of Health" shown as help text
    Then I softly see "automationpm1@yopmail.com" shown as help text

  @AD-3304
  Scenario: Verify that Selected Subaward Owner can complete end-to-end workflow from selecting Alaska Award Owner to Award activation
    Given I published "Competitive" type announcement having name "Automation Runtime FDM NPRA Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM NPRA Announcement}" on announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role         |
      | Automation City1 SPI | Authorized Signatory |
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1                     |
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Award Agreement" from computer
    When I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Accept after Approval" in the page details
    When I click on "Activate" in the page details

  @US-AD-863 @AD-1120
  Scenario: To verify GA user can entered '0' value in Actuals Column of Associated KPIs in Ad-hoc Progress Report (created by Grantee user) and Submitted to Grantor without any validation
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Performance" sub tab
    And I click on top right button "Ad-Hoc Progress Report" in flex table with id "---progressreport:-:grantorProgressReportsTableId---"
    And I enter "Adhoc_Progress_Report" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 0      |
    And I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"

  @AD-1119
  Scenario: To verify Grantee user can entered '0' value in Actuals Column of Associated KPIs in Ad-hoc Progress Report (created by GA user) Submitted to Grantor without any validation
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    And I navigate to "Performance" sub tab
    And I click on top right button "Ad-Hoc Progress Report" in flex table with id "---progressReport:-:recipientAwardProgressReportTableId---"
    And I enter "Adhoc_Progress_Report" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 0      |
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @US-AD-1644 @AD-1670 @AD-1671 @AD-1679 @AD-1680 @AD-1681
  Scenario: Verify 'New' button is not visible on the contact section of Overview tab when Award is in created status
  |Verify user can only associate existing contact in contact section of Overview tab when Award is in created status|
  |Verify modal opens on clicking 'Associate' button in contact section of overview tab of Award module|
  |Verify 'No Records Found' message after removing all contacts|
  |Verify modal closes on clicking 'Close' button|
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    Then I cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    #AD-1671
    Then I can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    #AD-1679
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    Then I softly see the text containing "Associate Contacts"
    #AD-1681
    When I close "Associate Contacts" modal by clicking the top right x button
    #AD-1680
    When I click on "Remove" icon for "{SavedValue:CITY1 Username}" inside flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"

  @AD-1674
  Scenario: Verify user can view contact details in the Award module
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "View" icon for "Project Director/Manager" inside flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    Then I softly see field "AccountId" as "AUTOMATION LIGHTHOUSE VOC-ED CENTER,"
    Then I softly see field "AccountRecordType__c" as "Recipient"

  @AD-1676
  Scenario: Verify system behavior when attempting to associate a non-existent contact
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    When I perform quick search for "{SavedValue:SPI3 Username}" in "---subAwardStandAlone:-:keyContactsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:keyContactsTableId---"

  @AD-1677 @AD-1678
  Scenario: Verify adding new contacts in Organization module
  |Verify system behavior when editing a contact in the Organization module|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I click modal button "Save"
    Then I softly see value "Secondary" for title "Role" against the value "{SavedValue:Automation Runtime Contact} Contact" inside table "---home:-:userContactsTableId---"
    #AD-1678
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:userContactsTableId---"
    When I enter value "Jane" into field "FirstName"
    When I enter value "Doe" into field "LastName"
    When I click modal button "Save"
    Then I softly see value "Jane Doe" for title "Full Name" against the value "Secondary" inside table "---home:-:userContactsTableId---"

  @publishingCompetitiveAnnouncementNfrSrsMajor
  Scenario: Validate once the Competitive Announcement is Published by Grantor and then status changes to Published
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationSecondModalAnnNFRMajor" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Edition1Major" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "---AUTOEnvData:-:fundingAccount---" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Then I refresh the page
    When I navigate to "Financials" sub tab
    Then I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                    | Pre-Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 2000            |
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    And I perform quick search for "{SavedValue:EXE Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I wait for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I refresh the page
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I wait for "5" seconds
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 90         | 350      |
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I perform quick search for "Acquisition / Lease" in "---announcement:-:selectProgramBudgetCategory---" panel
    When I click "Associate" after selection of "Acquisition / Lease" in the table "---announcement:-:selectProgramBudgetCategory---"
    When I close "Associate Budget Categories" modal by clicking the top right x button
    And I wait for "2" seconds
    And I enter value "Justified" into field "{amendment:JustificationFieldID}"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"

  @publishingCompetitiveAnnouncementNfrSrsMinor
  Scenario: Validate once the Competitive Announcement is Published by Grantor and then status changes to Published
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationSecondModalAnnNFRMinor" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Edition1Minor" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "---AUTOEnvData:-:fundingAccount---" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Then I refresh the page
    When I navigate to "Financials" sub tab
    Then I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                    | Pre-Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 2000            |
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    And I perform quick search for "{SavedValue:EXE Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I wait for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I refresh the page
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I wait for "5" seconds
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 90         | 350      |
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I perform quick search for "Acquisition / Lease" in "---announcement:-:selectProgramBudgetCategory---" panel
    When I click "Associate" after selection of "Acquisition / Lease" in the table "---announcement:-:selectProgramBudgetCategory---"
    When I close "Associate Budget Categories" modal by clicking the top right x button
    And I wait for "2" seconds
    And I enter value "Justified" into field "{amendment:JustificationFieldID}"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"

  @publishingCompetitiveAnnouncementNfrSrsModerate
  Scenario: Validate once the Competitive Announcement is Published by Grantor and then status changes to Published
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationSecondModalAnnNFRModera" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Edition1MODRATE" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "---AUTOEnvData:-:fundingAccount---" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Then I refresh the page
    When I navigate to "Financials" sub tab
    Then I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                    | Pre-Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 2000            |
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    And I perform quick search for "{SavedValue:EXE Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I wait for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I refresh the page
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I wait for "5" seconds
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 90         | 350      |
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I perform quick search for "Acquisition / Lease" in "---announcement:-:selectProgramBudgetCategory---" panel
    When I click "Associate" after selection of "Acquisition / Lease" in the table "---announcement:-:selectProgramBudgetCategory---"
    When I close "Associate Budget Categories" modal by clicking the top right x button
    And I wait for "2" seconds
    And I enter value "Justified" into field "{amendment:JustificationFieldID}"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"

  @US-AD-3599 @AD-3796 @AD-3797 @AD-3798 @AD-3799 @AD-3803
  Scenario: Verify that Grantee(SPI/SPA) sees Total Percentage calculated as the sum of Title I, Title II, and Title III percentages on Opportunities > Forms and Files > NFR/SRS Form
  |Verify that the Grantee(SPI/SPA) sees certain fields are visible if the user selects Secure Rural Schools under NFR/SRS Minor form|
  |Verify that the Grantee(SPI/SPA) does not see the dependent options under 'Select Secure Rural Schools (SRS) Act or 1908 Act Amended|
  |Verify that Grantee(SPI/SPA) sees validation message if no option is selected under 'Select Secure Rural Schools (SRS) Act or 1908 Act Amended' on Application> Forms and Files > NFR/SRS Form|
  |Verify system behavior when form data exceeds maximum allowed values|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SRS-MINOR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "REAA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name            | Is Key Contact |
      | Automation REAA | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "NFR/SRS-Minor - REAA Schools" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly see "Secure Rural Schools (SRS) Details" page block displayed
    #AD-3799
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Select Secure Rural Schools (SRS) Act or 1908 Act Amended: is required to save. Enter it in the Secure Rural Schools (SRS) Details section. |
    #AD-3797
    And I click radio button "Secure Rural Schools" in form
    Then I softly see the text containing :
      | Initial your selection and provide the percentage(s):                                                                |
      | Elect total percentage allowed to Title II and Title III, combined must be no less than 15% and no greater than 20%. |
      | Elect to use 100% for public roads and schools under Title I                                                         |
    And I wait for "3" seconds
    #AD-3798
    And I click radio button "1908 Act Amended 25% 7-Year Rolling Average" in form
    Then I softly cannot see the text containing :
      | Initial your selection and provide the percentage(s):                                                                |
      | Elect total percentage allowed to Title II and Title III, combined must be no less than 15% and no greater than 20%. |
      | Elect to use 100% for public roads and schools under Title I                                                         |
    And I wait for "4" seconds
    And I click radio button "Secure Rural Schools" in form
    And I click radio button "Elect total percentage allowed to Title II and Title III, combined must be no less than 15% and no greater than 20%." in form
    When I enter "NFR SRS-Minor - REAA Schools" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Total Percentage(%)" as "100.00%"
    #AD-3803
    And I click on "Edit" in the page details
    And I enter value "20" into field "TitleIIProjectsPct__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The total allocation across Title I, Title II, and Title III Projects must equal 100%. |

  @US-AD-3599 @AD-3805
  Scenario: Verify section B under Secure Rural Schools (SRS details section)
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SRS-MINOR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "REAA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name            | Is Key Contact |
      | Automation REAA | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "NFR/SRS-Minor - REAA Schools" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly see "Secure Rural Schools (SRS) Details" page block displayed
    And I click radio button "Secure Rural Schools" in form
    And I click radio button "Elect to use 100% for public roads and schools under Title I" in form
    Then I softly do not see fields "Title I Projects (%)" is visible
    Then I softly do not see fields "Title II Projects (%)" is visible
    Then I softly do not see fields "Title III Projects (%)" is visible

  @US-AD-3599 @AD-3807
  Scenario: Verify that Grantee(SPI/SPA) can complete end-to-end workflow from login to form submission
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SRS-MINOR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "REAA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name            | Is Key Contact |
      | Automation REAA | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "NFR/SRS-Minor - REAA Schools" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly see "Secure Rural Schools (SRS) Details" page block displayed
    And I click radio button "Secure Rural Schools" in form
    And I click radio button "Elect total percentage allowed to Title II and Title III, combined must be no less than 15% and no greater than 20%." in form
    When I enter "NFR SRS-Minor - REAA Schools" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Validate" in the page details
    And I wait for "3" seconds
    And I click on "Back" in the page details
    And I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @US-AD-3599 @AD-3808
  Scenario: Verify the error message displays when the Total Percentage is below 100% on the Edit NFR/SRS Form for the Secure Rural Schools category
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SRS-MINOR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "REAA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name            | Is Key Contact |
      | Automation REAA | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "NFR/SRS-Minor - REAA Schools" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly see "Secure Rural Schools (SRS) Details" page block displayed
    And I click radio button "Secure Rural Schools" in form
    And I click radio button "Elect total percentage allowed to Title II and Title III, combined must be no less than 15% and no greater than 20%." in form
    When I enter "NFR SRS-Minor - REAA Schools" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "60" into field "TitleIProjectsPct__c"
    And I enter value "20" into field "TitleIIProjectsPct__c"
    And I enter value "05" into field "TitleIIIProjectsPct__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The total allocation across Title I, Title II, and Title III Projects must equal 100%. |

  @US-AD-3642 @AD-3710 @AD-3714
  Scenario: Verify that SPI/SPA User cannot see Section B for allocation election when 'Secure Rural Schools' is not selected in Section A under Secure Rural Schools (SRS) Details section on Application form
  |Verify that SPI/SPA users cannot see percentage allocation fields when selecting radio button :Elect to opt to return the allocation in whole or part, to the Federal Government in Section B by selecting Secure Rural Schools radio button of section A|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SRS-MAJOR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "REAA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name            | Is Key Contact |
      | Automation REAA | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "NFR/SRS-Major - REAA Schools" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly see "Secure Rural Schools (SRS) Details" page block displayed
    And I click radio button "1908 Act Amended 25% 7-Year Rolling Average" in form
    Then I softly cannot see the text containing :
      | Section-B [Options of this section become available only when "Secure Rural Schools" is selected.] |
    #AD-3714
    And I click radio button "Secure Rural Schools" in form
    And I click radio button "Elect to opt to return the allocation in whole or part, to the Federal Government." in form
    And I enter value "4000" into field "Total_Previous_SFY_Schools_Payment__c"
    And I enter value "1000" into field "Operation_PS__c"
    And I enter value "600" into field "Maintenance_PS__c"
    And I enter value "400" into field "Repair_PS__c"
    And I enter value "1000" into field "Construction_PS__c"
    And I enter value "1000" into field "Unexpended_PS__c"
    And I enter value "Checked" into field "Acknowledgement__c"
    And I enter value "Automation Test Data" into field "UnexpendedNarrative_PS__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Return Allocation Comments is required. |

  @US-AD-3642 @AD-3717 @AD-3719 @AD-3729 @AD-3730 @AD-3733
  Scenario: Verify that SPI/SPA sees Section B for allocation election when 'Secure Rural Schools' is selected in Section A on NFR SRS Major application form
  |Verify that SPI/SPA user sees Total Percentage auto-calculated based on entered values for Title I, Title II, and Title III on NFR SRS Major Application form|
  |Verify error message when Title I Projects percentage is outside 80%-85% range on SRS Details|
  |Verify error message when Title III Projects percentage exceeds 7% on SRS Details|
  |Verify error message when values are missing for required percentage fields on SRS Details|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SRS-MAJOR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "REAA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name            | Is Key Contact |
      | Automation REAA | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "NFR/SRS-Major - REAA Schools" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly see "Secure Rural Schools (SRS) Details" page block displayed
    And I click radio button "Secure Rural Schools" in form
    Then I softly see the text containing :
      | Section-B                                                                                                                                                |
      | Initial your selection and provide the percentage(s)                                                                                                     |
      | Elect to opt to return the allocation in whole or part, to the Federal Government.                                                                       |
      | Elect total percentage allocated to Title II and Title III, combined must be no less than 15 6 and no greater than 20%, but Title III may not exceed 7%. |
    #AD-3719
    And I click radio button "Elect total percentage allocated to Title II and Title III, combined must be no less than 15% and no greater than 20%, but Title III may not exceed 7%." in form
    When I enter "NFR SRS-Major - REAA School" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Total Percentage(%)" as "100.00%"
    And I click on "Edit" in the page details
    Then I softly see field "Total Percentage(%)" is not editable
    #AD-3729
    And I enter value "22" into field "TitleIProjectsPct__c"
    And I enter value "10" into field "TitleIIProjectsPct__c"
    And I enter value "5" into field "TitleIIIProjectsPct__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Title I Projects (%) must be between 80% and 85%.                                      |
      | The total allocation across Title I, Title II, and Title III Projects must equal 100%. |
    #AD-3730
    And I click on "Edit" in the page details
    And I enter value "22" into field "TitleIProjectsPct__c"
    And I enter value "1" into field "TitleIIProjectsPct__c"
    And I enter value "7" into field "TitleIIIProjectsPct__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Title I Projects (%) must be between 80% and 85%.                                      |
      | Title II Projects (%) must be between 8% and 20%                                       |
      | The combined total of Title II and Title III Projects (%) must be between 15% and 20%. |
      | The total allocation across Title I, Title II, and Title III Projects must equal 100%. |
    #AD-3733
    And I click on "Edit" in the page details
    When I clear the value from field "TitleIProjectsPct__c"
    When I clear the value from field "TitleIIProjectsPct__c"
    When I clear the value from field "TitleIIIProjectsPct__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The total allocation across Title I, Title II, and Title III Projects must equal 100% |

  @US-AD-3642 @AD-3741
  Scenario: Verify that PM/PO/FD/GA user see the NFR/SRS Form Type field is mandatory and validation when NFR/SRS Form Type is not selected while creating announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationSecondModalAnnNFRMajor" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Edition1Major" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I clear the value from field "NFR_SRS_Form_Type__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | NFR/SRS Form Type is required to save. Enter it in the Announcement Specific Settings section on the Overview tab. |

  @US-AD-3642 @AD-3780
  Scenario: Verify that Subaward owner can perform the flow end to end flow with NFR SRS Major application form
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NFR_SRS-MAJOR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NFR_SRS-MAJOR"
    And I created approved NFRFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role         |
      | Automation City1 SPI | Authorized Signatory |
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1                     |
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Award Agreement" from computer
    When I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Accept after Approval" in the page details
    When I click on "Activate" in the page details

  @US-AD-3642 @AD-3789
  Scenario: Verify that GA user see the NFR SRS Major form on application and able to perform the end to end flow
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SRS-MAJOR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "REAA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name            | Is Key Contact |
      | Automation REAA | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "NFR/SRS-Major - REAA Schools" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly see "Secure Rural Schools (SRS) Details" page block displayed
    And I click radio button "Secure Rural Schools" in form
    And I click radio button "Elect total percentage allocated to Title II and Title III, combined must be no less than 15% and no greater than 20%, but Title III may not exceed 7%." in form
    When I enter "NFR SRS-Major - REAA School" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Validate" in the page details
    And I wait for "3" seconds
    And I click on "Back" in the page details
    And I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @US-AD-3641 @AD-5249 @AD-5252 @AD-5254
  Scenario: Verify that Grantee(SPI/SPA) sees Total Percentage calculated as the sum of Title I, Title II, and Title III percentages on Application> Forms and Files > NFR/SRS Form
  |Verify that the Grantee(SPI/SPA) sees certain fields are visible if the user selects Secure Rural Schools under NFR/SRS Moderate form|
  |Verify that the Grantee(SPI/SPA) does not see the dependent options under 'Select Secure Rural Schools (SRS) Act or 1908 Act Amended|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SRS-MODRATE"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "REAA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name            | Is Key Contact |
      | Automation REAA | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "NFR/SRS-Moderate - REAA Schools" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    #AD-5254
    And I click radio button "1908 Act Amended 25% 7-Year Rolling Average" in form
    Then I softly cannot see the text containing :
      | Section-B                                                                                                                                              |
      | Initial your selection and provide the percentage(s)                                                                                                   |
      | Elect to opt to return the allocation in whole or part, to the Federal Government.                                                                     |
      | Elect total percentage allocated to Title II and Title III, combined must be no less than 15 and no greater than 20%, but Title III may not exceed 7%. |
    And I click radio button "Secure Rural Schools" in form
    And I wait for "2" seconds
    #AD-5252
    Then I softly see the text containing :
      | Section-B                                                                                                                                              |
      | Initial your selection and provide the percentage(s)                                                                                                   |
      | Elect to opt to return the allocation in whole or part, to the Federal Government.                                                                     |
      | Elect total percentage allocated to Title II and Title III, combined must be no less than 15 and no greater than 20%, but Title III may not exceed 7%. |
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Initial your selection and provide the percentage(s): is required to save. Enter it in the Secure Rural Schools (SRS) Details section. |
    And I click radio button "Elect total percentage allowed to Title II and Title III, combined must be no less than 15% and no greater than 20%." in form
    And I wait for "2" seconds
    When I enter "NFR SRS-Moderate - REAA School" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Total Percentage(%)" as "100.00%"

  @US-AD-3641 @AD-5255 @AD-5262
  Scenario: Verify that Grantee(SPI/SPA) sees validation message if no option is selected under 'Select Secure Rural Schools (SRS) Act or 1908 Act Amended' on Application> Forms and Files > NFR/SRS Form
  |Verify system behavior when form data exceeds maximum allowed values|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SRS-MODRATE"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "REAA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name            | Is Key Contact |
      | Automation REAA | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "NFR/SRS-Moderate - REAA Schools" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see "Secure Rural Schools (SRS) Details" page block displayed
    Then I softly see the text containing :
      | Section-A                                                                                          |
      | Select Secure Rural Schools (SRS) Act or 1908 Act Amended:                                         |
      | Secure Rural Schools                                                                               |
      | Section-B [Options of this section become available only when "Secure Rural Schools" is selected.] |
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Select Secure Rural Schools (SRS) Act or 1908 Act Amended: is required in the Secure Rural Schools (SRS) Details section. |
    And I click radio button "Secure Rural Schools" in form
    #AD-5262
    And I click radio button "Elect total percentage allowed to Title II and Title III, combined must be no less than 15% and no greater than 20%." in form
    And I wait for "2" seconds
    When I enter "NFR SRS-Moderate - REAA School" values from "ApplicationForm_Field_Values.xlsx"
    And I wait for "2" seconds
    And I enter value "80" into field "TitleIProjectsPct__c"
    And I enter value "20" into field "TitleIIProjectsPct__c"
    And I enter value "5" into field "TitleIIIProjectsPct__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | The total allocation across Title I, Title II, and Title III Projects must equal 100%. |

  @US-AD-3641 @AD-5265 @AD-5268
  Scenario: Verify section B under Secure Rural Schools (SRS details section)
  |Verify that Grantee(SPI/SPA) can complete end-to-end workflow from login to form submission|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SRS-MODRATE"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "REAA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name            | Is Key Contact |
      | Automation REAA | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "NFR/SRS-Moderate - REAA Schools" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly see "Secure Rural Schools (SRS) Details" page block displayed
    And I click radio button "Secure Rural Schools" in form
#    And I click radio button "Elect to use 100% for public roads and schools under Title I" in form
#    Then I softly do not see fields "Title I Projects (%)" is visible
#    Then I softly do not see fields "Title II Projects (%)" is visible
#    Then I softly do not see fields "Title III Projects (%)" is visible
    #AD-5268
    And I click radio button "Elect total percentage allowed to Title II and Title III, combined must be no less than 15% and no greater than 20%." in form
    And I wait for "2" seconds
    When I enter "NFR SRS-Moderate - REAA School" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    And I click on "Back" in the page details
    And I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @US-AD-3641 @AD-5271
  Scenario: Verify the error message displays when the Total Percentage is below 100% on the Edit NFR/SRS Form for the Secure Rural Schools category
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SRS-MODRATE"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "REAA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name            | Is Key Contact |
      | Automation REAA | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "NFR/SRS-Moderate - REAA Schools" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly see "Secure Rural Schools (SRS) Details" page block displayed
    And I click radio button "Secure Rural Schools" in form
    And I click radio button "Elect total percentage allowed to Title II and Title III, combined must be no less than 15% and no greater than 20%." in form
    And I wait for "2" seconds
    When I enter "NFR SRS-Moderate - REAA School" values from "ApplicationForm_Field_Values.xlsx"
    And I enter value "60" into field "TitleIProjectsPct__c"
    And I enter value "20" into field "TitleIIProjectsPct__c"
    And I enter value "5" into field "TitleIIIProjectsPct__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Title I Projects (%) must be between 80% and 85%.                                      |
      | The combined total of Title II and Title III Projects (%) must be between 15% and 20%. |
      | The total allocation across Title I, Title II, and Title III Projects must equal 100%  |

  @US-AD-9517 @AD-9715 @AD-9717 @AD-9719
  Scenario: Verify Refresh functionality is not affected by the addition of Excel download option for FDM > Recommended Applications
  |Verify that Excel file does not contain extra columns not visible in FDM > Recommended Applications|
  |Verify that the Grant Administrator sees the 'Export to Excel' option on FDM > Recommended Applications|
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NFR_SRS-MAJOR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NFR_SRS-MAJOR"
    And I created approved NFRFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    #AD-9719
    Then I softly see top right button "Export to Excel" inside flex table "---grantor_tableId:-:RecommendedApplicationTableId---"
    When I click on top right button "Export to Excel" in flex table with id "---grantor_tableId:-:RecommendedApplicationTableId---"
    And I pause execution for "3" seconds
    And I save the downloaded Excel file name as "RecommendedApplications"
  #AD-9717
    Then I softly can see "EGMS ID" value in "0" row and "0" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "Application Title" value in "0" row and "1" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "Grantee Organization" value in "0" row and "2" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "Grant" value in "0" row and "3" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "Score" value in "0" row and "4" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "Recommended Budget" value in "0" row and "5" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "Budgeted Amount" value in "0" row and "6" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "Total Commitment Amount" value in "0" row and "7" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "State Allocation" value in "0" row and "8" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "Recommend for Funding" value in "0" row and "9" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "Alaska Award Owner" value in "0" row and "10" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "Comments" value in "0" row and "11" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "Grant Number" value in "0" row and "12" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "Final Decision" value in "0" row and "13" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "Applicant Notified" value in "0" row and "14" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"

  @US-AD-9517 @AD-9720
  Scenario: Verify that data accuracy between UI and downloaded Excel file for FDM > Recommended Applications
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NFR_SRS-MAJOR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NFR_SRS-MAJOR"
    And I created approved NFRFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "AppEGMSID" from flex table "---grantor_tableId:-:RecommendedApplicationTableId---"
    And I save the value from row "1" for column name "Grantee Organization" as "GranteeOrganization" from flex table "---grantor_tableId:-:RecommendedApplicationTableId---"
    And I save the value from row "1" for column name "Grant" as "GrantID" from flex table "---grantor_tableId:-:RecommendedApplicationTableId---"
    And I save the value from row "1" for column name "State Allocation" as "StateAllocation" from flex table "---grantor_tableId:-:RecommendedApplicationTableId---"
    And I save the value from row "1" for column name "Recommend for Funding" as "RecommendforFunding" from flex table "---grantor_tableId:-:RecommendedApplicationTableId---"
    And I save the value from row "1" for column name "Alaska Award Owner" as "AlaskaAwardOwner" from flex table "---grantor_tableId:-:RecommendedApplicationTableId---"
    And I save the value from row "1" for column name "Final Decision" as "FinalDecision" from flex table "---grantor_tableId:-:RecommendedApplicationTableId---"
    When I click on top right button "Export to Excel" in flex table with id "---grantor_tableId:-:RecommendedApplicationTableId---"
    And I pause execution for "3" seconds
    And I save the downloaded Excel file name as "RecommendedApplications"
    Then I softly can see "{SavedValue:AppEGMSID}" value in "1" row and "0" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "{SavedValue:Automation Runtime FDM Announcement}" value in "1" row and "1" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "{SavedValue:GranteeOrganization}" value in "1" row and "2" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "{SavedValue:GrantID}" value in "1" row and "3" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "{SavedValue:StateAllocation}" value in "1" row and "8" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "{SavedValue:RecommendforFunding}" value in "1" row and "9" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "{SavedValue:AlaskaAwardOwner}" value in "1" row and "10" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"
    Then I softly can see "{SavedValue:FinalDecision}" value in "1" row and "13" column in downloaded xlsx file "{SavedValue:RecommendedApplications}"

  @US-AD-9517  @AD-9722
  Scenario: Verify Excel download functionality with maximum column width data for the Recommended Applications
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "PROGRAM_TYPE_NFR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "PROGRAM_TYPE_NFR"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I wait for "2" seconds
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:grantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "4" seconds
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "1"
    When I edit the following rows inline in flex table with id "---applicationReview:-:reviewStepFormId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I switch to tab number "2"
    When I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "{SavedValue:Automation Runtime Announcement Application Review}"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    And I check the checkbox in modal with field value "I Agree"
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "ASC Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "3"
    When I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field            |
      | AuGr                        | GrantCode__c     |
      | Automation Test Description | Justification__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I edit the following rows inline in flex table with id "FundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title              | Recommended Budget | Recommend for Funding | Comments    | Total Commitment Amount |
      | {AUTOEnvData:StringOf100Chars} | 1000               | Yes                   | Recommended | 1000                    |

  @US-AD-9877 @AD-10022 @AD-10027 @AD-10028 @AD-10032
  Scenario: Verify that Grantee (SPI/SPA) can enter decimal values in the Unit Price field on Add Line Items Modal for Payment Request
  |Verify that Grantee (SPI/SPA) sees 'Each' option in Measurement drop-down on Add Line Items Modal for Payment Request|
  |Verify that Grantee (SPI/SPA) sees correct Sub Total calculation with decimal Unit Price and Quantity on Add Line Items Modal for Payment Request|
  |Verify that Grantee (SPI/SPA) sees the correct Sub Total calculation with maximum decimal Unit Price and Quantity values on Add Line Items Modal for Payment Request|
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "{closeout:PaymentRequestTitleFiedlID}"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Labor and Fringe Benefits" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 25.75      | 10       | Boxes       |
    Then I softly see value "257.50" for title "Sub Total" against the value "Extra Salary" inside table "---paymentRequest:-:paymentLineItemsTableId---"
    #AD-10027
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "Edit" :
      | Title        | Measurement |
      | Extra Salary | Each        |
    Then I softly see value "Each" for title "Measurement" against the value "Extra Salary" inside table "---paymentRequest:-:paymentLineItemsTableId---"
    #AD-10028
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "Edit" :
      | Title        | Unit Price | Quantity | Measurement |
      | Extra Salary | 10.10      | 1        | Boxes       |
    Then I softly see value "10.10" for title "Sub Total" against the value "Extra Salary" inside table "---paymentRequest:-:paymentLineItemsTableId---"
    #AD-10032
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "Edit" :
      | Title        | Unit Price | Quantity | Measurement |
      | Extra Salary | 4999.99    | 10       | Each        |
    Then I softly see value "49,999.90" for title "Sub Total" against the value "Extra Salary" inside table "---paymentRequest:-:paymentLineItemsTableId---"

  @US-AD-9877 @AD-10034 @AD-10035
  Scenario:Verify the validation message for the missing Unit Price field on the Add Line Items modal for the Payment Request
  |Verify system handles boundary values for Sub Total calculation on the Add Line Items modal for the Payment Request|
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "{closeout:PaymentRequestTitleFiedlID}"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Labor and Fringe Benefits" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Measurement |
      | Extra Salary | The narrative | 25.75      | Boxes       |
    Then I softly see the following messages in the page details :
      | Please complete all field(s) marked in red. |
    #AD-10035
    When I enter in modal value "0.01" into field "UnitPrice__c"
    When I enter in modal value "1" into field "Quantity__c"
    Then I softly see value "0.01" for title "Sub Total" against the value "Extra Salary" inside table "---paymentRequest:-:paymentLineItemsTableId---"

  @AD-10036
  Scenario: Verify system handles zero as a Quantity value on the Add Line Items modal for the Payment Request
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "{closeout:PaymentRequestTitleFiedlID}"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Labor and Fringe Benefits" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 25.75      | 0        | Boxes       |
    Then I softly see value "0.00" for title "Sub Total" against the value "Extra Salary" inside table "---paymentRequest:-:paymentLineItemsTableId---"

  @US-AD-2473 @AD-2560
  Scenario: Verify that External User - SPI & SPA & GA sees Municipality Verification Form is attached for 1st Class City on Application layout
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_PILT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    Then I softly see value "Municipalities Verification Form" for title "Form Name" inside table "---applicationIntake:-:allFormsTableId---"
    And I click on "View" icon for "Municipalities Verification Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    Then I softly see "Municipalities Verification Form" page block displayed
    Then I see below fields in "Municipalities Verification Form" page block
      | Name of Municipality  |
      | Vendor Number         |
      | Contact Name          |
      | Tax ID Number         |
      | Contact Phone Number  |
      | Contact Email Address |
      | Mailing Address       |
      | City                  |
      | State                 |
      | Country               |
      | Zipcode               |
      | Fax Number            |

  @US-AD-2473  @AD-2567
  Scenario: Verify that Internal User can complete end-to-end workflow for creating application with Municipality Verification Form for 1st/2nd class Tye and Borough
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_PILT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_PILT"
    And I created approved NFRFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role         |
      | Automation City1 SPI | Authorized Signatory |
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1                     |
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Award Agreement" from computer
    When I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Accept after Approval" in the page details
    When I click on "Activate" in the page details

  @US-AD-2473 @AD-2569 @AD-2570
  Scenario: Verify that External User (SPI)sees error when Acknowledgment check box is not selected on Municipalities Verification Form
  |Verify that SPI user see the Download as PDF link under hamburger menu option on Municipalities Verification Form|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_PILT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    Then I softly see value "Municipalities Verification Form" for title "Form Name" inside table "---applicationIntake:-:allFormsTableId---"
    And I click on "View" icon for "Municipalities Verification Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Acknowledgement is Required to save. |
    #AD-2570
    And I click on "Download as PDF" in the page details
    And I wait for "7" seconds
    And I download the file
    Then I see "Municipalities Verification Form" on page "1" of "govgrants" pdf file

  @US-AD-2473 @AD-2755
  Scenario: Verify that External User - SPI & SPA & GA sees no default forms are added for 2nd Class City on Application layout
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_PILT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY2" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    Then I softly see value "Municipalities Verification Form" for title "Form Name" inside table "---applicationIntake:-:allFormsTableId---"

  @US-AD-2473  @AD-2757
  Scenario: Verify SPI user see the Municipalities Verification Form on Application during Negotiation
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_PILT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_PILT"
    And I created approved PILTFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    Then I softly see values "{SavedValue:Automation Runtime FDM Announcement}" and "Reviewed" inside table
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Edit" in the page details
    And I pause execution for "10" seconds
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition_Sanity" values from "Negotiations_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "4" seconds
    And I edit the following rows inline in flex table with id "---negotiation:-:NegotiationFormsTableId---" by clicking "Edit" :
      | Form Name               | Needs Negotiation |
      | Travel Training Program | Checked           |
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Send to Grantee" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    Then I softly see values "{SavedValue:Automation Runtime FDM Announcement}" and "Reviewed" inside table
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    And I navigate to "Forms and Files" sub tab
    Then I softly see value "Municipalities Verification Form" for title "Form Name" inside table "---applicationIntake:-:allFormsTableId---"
    Then I see below fields in "Municipalities Verification Form" page block
      | Name of Municipality  |
      | Vendor Number         |
      | Contact Name          |
      | Tax ID Number         |
      | Contact Phone Number  |
      | Contact Email Address |
      | Mailing Address       |
      | City                  |
      | State                 |
      | Country               |
      | Zipcode               |
      | Fax Number            |

  @US-AD-2473 @AD-2992
  Scenario: Verify that External User - SPI & SPA & GA sees Form is not attached If we select an Applicant type other than these four types. (1st Class city, 2nd Class City, Borough, and School District)
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_PILT"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I wait for "3" seconds
    And I enter value "Automation Direct Application" into field "Title__c"
    And I enter value "Automation Alaska Native Corporataion" into field "ExternalOrganization__c"
    And I enter value "{SavedValue:Automation Runtime FDM Announcement}" into field "Announcement__c"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    When I enter values into fields
      | Value                      | Field                     |
      | RN 34, Siege Social        | Addressline1__c           |
      | Address line2              | Addressline2__c           |
      | Anchorage                  | City__c                   |
      | Nome Census Area           | County__c                 |
      | 777                        | CongressionalDistrict1__c |
      | 12346                      | Zip4__c                   |
      | USA                        | Country__c                |
      | 4563                       | ZipCode4Extension__c      |
      | AK                         | State__c                  |
      | Automation New Application | Title__c                  |
      | Automation Data            | ProjectAbstract__c        |
      | Checked                    | Acknowledgment4__c        |
    And I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    Then I softly do not see value "Municipalities Verification Form" for title "Form Name" inside table "---applicationIntake:-:allFormsTableId---"

  @US-AD-862 @AD-3178 @AD-3183
  Scenario: Verify that all internal users(PM/FD/PO/FO/Admin)profile user can add note when award is in Activated status on Grants phase > Subawards > Files Tab > Notes section
  |Verify end-to-end workflow from award activation to file upload and note addition for PM profile on Subaward Files and Notes sections|
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_PILT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_PILT"
    And I created approved PILTFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    Then I softly can see top right button "Add" in flex table with id "---subAwardFromFDM:-:GrantorAwardNotesTableId---"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:GrantorAwardNotesTableId---" by clicking "Add" :
      | Title              | Description                                      |
      | Automation Testing | This is a test note added after award activation |
    And I wait for "10" seconds
    Then I softly can see row level action button "Delete" against "Automation Testing" in flex table with id "---subAwardFromFDM:-:GrantorAwardNotesTableId---"
    Then I softly can see row level action button "Edit" against "Automation Testing" in flex table with id "---subAwardFromFDM:-:GrantorAwardNotesTableId---"
    #AD-3183
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I pause execution for "6" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Certification" from computer
    When I click modal button "Close"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"

  @US-AD-862  @AD-3179
  Scenario: Verify that GA User profile can delete their own uploaded file on Grants phase > Subawards > Files tab > Subaward Files section
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_PILT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_PILT"
    And I created approved PILTFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I pause execution for "6" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Certification" from computer
    When I click modal button "Close"
    When I click on "Delete File" icon for "Attachment.pdf" inside flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"

  @US-AD-862  @AD-3180
  Scenario: Verify that PM/FD/PO/FO/Admin profile user can upload file successfully and file is visible to all internal users on Grants phase > Subawards/Grants > Files tab > Subaward/Grant Files section(Direct Award/Standard Subaward)
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_PILT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_PILT"
    And I created approved PILTFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I pause execution for "6" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Certification" from computer
    When I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---subAwardStandAlone:-:addFilesTableId---"

  @US-AD-862 @AD-3181 @AD-3182
  Scenario:Verify that non-owner(non Notes Owner) cannot delete another user's note on Grants phase > Subawards > Files tab > Notes section
  |Verify that note owner can delete their own note on Grants phase > Subawards > Files tab > Notes section|
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_PILT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_PILT"
    And I created approved PILTFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    Then I softly can see top right button "Add" in flex table with id "---subAwardFromFDM:-:GrantorAwardNotesTableId---"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:GrantorAwardNotesTableId---" by clicking "Add" :
      | Title              | Description                                      |
      | Automation Testing | This is a test note added after award activation |
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    Then I softly cannot see row level action button "Delete" against "Automation Testing" in flex table with id "---subAwardFromFDM:-:GrantorAwardNotesTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    Then I softly can see row level action button "Delete" against "Automation Testing" in flex table with id "---subAwardFromFDM:-:GrantorAwardNotesTableId---"
    When I click on "Delete" icon for "Automation Testing" inside flex table with id "---subAwardFromFDM:-:GrantorAwardNotesTableId---"
    Then I softly do not see value "Automation Testing" for title "Title" inside table "---subAwardFromFDM:-:GrantorAwardNotesTableId---"

  @US-AD-862  @AD-3186
  Scenario: Verify system restricts file upload when award status is not Activated on Subaward Files section
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_PILT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_PILT"
    And I created approved PILTFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime FDM Announcement}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentID"
    And I wait for "3" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "{amendment:NewBudgetPeriodEndDateFieldID}"
    And I click on "Save" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I get the "EGMS ID"
    And I click on "Send to Grantee" in the page details
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AmendmentID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:AmendmentID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    Then I softly see field "Status" as "Being Amended"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"

  @AD-10157 @AD-10162 @US-AD-10074
  Scenario: Verify that Grantor sees 'CDBG-MIT' in the Program Type picklist when creating a program
  |Verify that Grantor can activate and amend a program with 'CDBG-MIT' program|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation_CDBG-MIT" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "6" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    And I wait for "5" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I wait for "3" seconds
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Active" and is "dark blue"
    #AD-10162
    And I click on "Amend Program" in the page details
    Then I softly see field "Status" as "Being Amended"
    And I click on "Submit For Approval" in the page details
    And I wait for "5" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I wait for "3" seconds
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Active" and is "dark blue"

  @AD-10158 @US-AD-10074
  Scenario: Verify that Grantor sees 'CDBG-MIT' programs in the Program ID picklist when creating an announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement_CDBGMIT" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal Ann" values from "Announcement_Field_Values.xlsx"
    And I halt execution
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "---AUTOEnvData:-:fundingAccount---" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Then I refresh the page
    When I navigate to "Financials" sub tab
    Then I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                    | Pre-Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 2000            |
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    And I perform quick search for "{SavedValue:EXE Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I wait for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I wait for "5" seconds
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 90         | 350      |
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I perform quick search for "Acquisition / Lease" in "---announcement:-:selectProgramBudgetCategory---" panel
    When I click "Associate" after selection of "Acquisition / Lease" in the table "---announcement:-:selectProgramBudgetCategory---"
    When I close "Associate Budget Categories" modal by clicking the top right x button
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I enter value "Justified" into field "AnnouncementDescription__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I halt execution
    And I wait for "4" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"

  @AD-10159 @US-AD-10074
  Scenario: Verify that Grantor sees Business Forms for 'CDBG-MIT' match those of 'CDBG-DR' on Setup tab for created program
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation_CDBG-MIT" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    When I click on "Preview" icon for "Grantor Application Forms" inside table
    Then I softly see value "Program Application Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I softly see value "Standard Assurances Form" for title "Form Name" inside table "---program:-:previewPackageTableId---"

  @AD-10163 @US-AD-10074
  Scenario: Verify that Grantor can create a direct grant with 'CDBG-MIT' program
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter in modal "DirectGrantCDBGMIT" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter in modal "Grant_Edition2" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly see that "Status" is in "Draft" status
    And I enter value "Automation Testing" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see that "Status" is in "Created" status

  @AD-10164 @US-AD-10074
  Scenario: Verify end-to-end workflow of the CDBG-MIT program type (Program creation to award activation)
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CDBG_MIT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CDBG_MIT"
    And I created approved NFRFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role         |
      | Automation City1 SPI | Authorized Signatory |
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1                     |
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Award Agreement" from computer
    When I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Accept after Approval" in the page details
    When I click on "Activate" in the page details

  @AD-10160 @US-AD-10074
  Scenario:Verify that Grantor sees CDBG-MIT Grant Agreement Template for Activated subawards
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CDBG_MIT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CDBG_MIT"
    And I created approved NFRFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Files" sub tab
    And I halt execution