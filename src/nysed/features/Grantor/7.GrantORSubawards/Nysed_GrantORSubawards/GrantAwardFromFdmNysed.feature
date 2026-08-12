@grantAndAwardNysed @GrantSubawardNysed @grantUpdateFile6 @needtocheckwithsantosh
Feature: Validate all scenarios of Subaward From FDM and activating an Award using API


  @490795 @VerifythattheInternalUserdoesnotseetheLeverageAllowedcolumnintheSubawardBudgetCategoriestable @Sprint-00 @US-487276
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the Subaward 'Budget Categories' table.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "RelatedAwards1" without waiting for record
    When I navigate to "Budget" sub tab
    Then I softly do not see "Other Leverage" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |
#      | FO       | Automation FO user    |
#      | FD       | Automation FD user    |
#      | ADMIN    | Automation ADMIN user |

  @490859 @490861 @490863 @490893 @490907 @490909 @VerifythattheInternaluserseeonlyEditactionbuttonattheSubawardpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownSubawardCreated @Sprint-01 @US-490341
  Scenario Outline: Verify that the Internal user see only 'Edit' action button at the Subaward page layout and other record flow action buttons at page level action dropdown.: Subaward: Created
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "NO_RISK_ASSESSMENT-<Filter>"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I wait for "3" seconds
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:GrantsRolesAndResponsibilitiesTableId---" by clicking "New" :
      | Name       | Award  |
      | <Approval> | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I re-login to "Grants Portal" app as "<SubUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:subrecipientPendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:subrecipientPendingTaskTableId---" without waiting for record
    #490862
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Accept" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I wait for "5" seconds
    And I click on "Accept" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Accepted"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Accepted"
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    And I refresh the page
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    #490863
    Then I can see top right button "Undo" in page detail
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<SubUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
     #490893
    Then I see field "Status" as "Sent to Subrecipient after Approval"
    Then I softly can see top right dropdown button "Accept after Approval" in page detail
    Then I softly can see top right dropdown button "Reject" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    #490907
    Then I softly can see top right dropdown button "Activate" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    #490909
    When I click on "Activate" in the page details
    Then I softly can see top right dropdown button "View NOGA" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType | Filter             | Approval      | SubUser    |
      | PM       | Automation PM user | Automation PM | GRANTEE_SC |
#      | EXE      | Automation EXE user|Automation EXE| GRANTEE_CE     |

  @493077 @493081 @VerifythattheReviewerieInternaluserseeEditandSubmitReviewcanseebuttonsonthemodalGrant&Award @Sprint-01 @US-490341
  Scenario Outline: Verify that the Reviewer i.e. Internal user see 'Edit' and 'Submit Review' can see buttons on the modal - Grant & Award
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default-<Filter>"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I enter value "Automation Test Description" into field "GrantAwardDescription__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description            | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see that "Sent for Review" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I softly see "Edit" modal button
    Then I softly see "Submit Review" modal button
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    Then I softly can see top right button "Complete Review" in page detail
    When I click on "Complete Review" in the page details
    #@493081
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"

    Examples:
      | Award Name                                       | Grant Name                                       | UserType | Filter             |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} | PM       | Automation PM user |
#      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} | EXE      |  Automation EXE user  |
#      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} | PO       |  Automation PO user   |
#      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} | ADMIN    |  Automation ADMIN user|

  @491445 @491452 @VerifythattheInternaluserseestheFocusareanameintheformatFocusAreaAnnouncementNameontheBudgetPeriodBudgetCategoriestableoftheGrantwhentheAnnouncementsiscreatedwiththeFocusAreaRequiredismarkedasNo @Sprint-01 @US-487306
  Scenario Outline: Verify that the Internal user sees the Focus area name in the format "Focus Area: Announcement Name" on the Budget Period-->Budget Categories table of the Grant when the Announcements is created with the Focus Area Required? is marked as "No"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_FOCUS_AREA_NO-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FIRST_BUDGET_CATEGORY_NO_FOCUS_AREA"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:grantsBudgetCategoryGrantor---"
    When I navigate to "Actuals" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "RelatedAwards1" without waiting for record
    When I navigate to "Budget" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"
    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |

  @491123 @VerifythattheInternalUserdoesnotseetheLeverageAllowedcolumnintheGrantGrantBudgetBudgetCategoriestable @sprint-01-US-487975
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the Grant 'Grant Budget: Budget Categories' table.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly do not see "Other Leverage" in flex table header "---subAwardStandAlone:-:GrantBudgetCategoryFlexGridgridTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user |
#      | PO       | Automation PO user  |

  @491130 @VerifythattheSubrecipientUserdoesnotseetheLeverageAllowedcolumnintheGrantGrantBudget:BudgetCategoriestable @sprint-01-US-487975
  Scenario Outline: Verify that the Subrecipient User does not see the "Leverage Allowed?" column in the Grant 'Grant Budget: Budget Categories' table.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly do not see "Other Leverage" in flex table header "---subAwardStandAlone:-:subRecipientGrantBudgetTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @491121 @VerifythattheInternalUserdoesnotseetheLeverageAllowedcolumnintheSubawardBudgetCategoriestable @sprint-01-US-487975
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the Subaward 'Budget Categories' table.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly do not see "Other Leverage" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user |
#      | PO       | Automation PO user  |

  @491127 @VerifythattheSubrecipientUserdoesnotseetheLeverageAllowedcolumnintheSubawardBudgetCategoriestable @sprint-01-US-487975
  Scenario Outline: Verify that the Subrecipient User does not see the "Leverage Allowed?" column in the Subaward 'Budget Categories' table.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly do not see "Other Leverage" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @491447 @491451 @VerifythattheSubrecipientuserseestheFocusareanameintheformatFocusAreaAnnouncementNameonheBudgetPeriodBudgetCategoriestableoftheGrantwhentheAnnouncementsiscreatedwiththeFocusAreaRequiredismarkedasNo @Sprint-01 @US-487306
  Scenario Outline: Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: Announcement Name" on the Budget Period-->Budget Categories table of the Grant when the Announcements is created with the Focus Area Required? is marked as "No"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FIRST_BUDGET_CATEGORY_NO_FOCUS_AREA"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:subrecipientGrantBudgetTableId---"
    When I navigate to "Actuals" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:subrecipientGrantActualSummaryBudgetTableId---"
    When I navigate to "Subawards" sub tab
    #@491451
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @492559 @492556 @VerifythattheSubrecipientuserseestheFocusareanameintheformatFocusAreaFocusAreaNameontheBudgetPeriod-BudgetCategoriestableoftheSubawardwhentheAnnouncementsiscreatedwiththeFocusAreaRequiredismarkedasYes @Sprint-01 @US-487306
  Scenario Outline:Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: <Focus Area Name>" on the Budget Period-->Budget Categories table of the Subaward when the Announcements is created with the Focus Area Required? is marked as "Yes"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---subAwardStandAlone:-:subrecipientGrantBudgetTableId---"
    When I navigate to "Actuals" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---subAwardStandAlone:-:subrecipientGrantActualSummaryBudgetTableId---"
    When I navigate to "Subawards" sub tab
    #@492556
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @492557 @492562 @VerifythattheInternaluserseestheFocusareanameintheformatFocusAreaFocusAreaNameontheBudgetPeriodBudgetCategoriestableoftheGrantwhentheAnnouncementsiscreatedwiththeFocusAreaRequiredismarkedasYes @Sprint-01 @US-487306
  Scenario Outline: Verify that the Internal user sees the Focus area name in the format "Focus Area: <Focus Area Name>" on the Budget Period-->Budget Categories table of the Grant when the Announcements is created with the Focus Area Required? is marked as "Yes"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_FOCUS_AREA-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---subAwardStandAlone:-:grantsBudgetCategoryGrantor---"
    When I navigate to "Actuals" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---"
    #@492562
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "RelatedAwards1" without waiting for record
    When I navigate to "Budget" sub tab
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |

  @493472 @Sprint-02 @US-491301
  Scenario Outline: Verify that the Internal user sees the Focus area name in the format "Focus Area: <Focus Area Name>" on the Budget Period-->Budget Categories table of the Grant when the Announcements is created with the Focus Area Required? is marked as "Yes"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_FOCUS_AREA_NO-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FIRST_BUDGET_CATEGORY_NO_FOCUS_AREA"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "RelatedAwards1" without waiting for record
    When I navigate to "Budget" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime FDM Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user |
#      | PO       | Automation PO user    |

  @497215 @Sprint-05 @US-500362
  Scenario: verify that the Fund Year column, as Read-only, is added next to the Funding Account column on the Budget on Award layout->Funding Account Information section when Award is in Created state
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Appropriation Amount | Available Balance | Pre-Encumbrance |
    And I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    Then I softly see field "Fund Year" is not editable

  @539261 @NYSEDSprint-15 @US-537967 @M05
  Scenario Outline:Verify that the internal users do not see the Business Forms section under the Files tab on the Grant layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Grant}"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Grant}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    #539261
    Then I softly do not see "Business Forms" page block displayed

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |
#      | EXE      |

  @539289 @NYSEDSprint-15 @US-537967 @M05
  Scenario Outline:Verify that the grantee users do not see the Business Forms section under the Files tab on the Grant layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Grant}"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Grant}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    #539289
    Then I softly do not see "Business Forms" page block displayed

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_LEA |
#      | GRANTEE_VO  |
#      | GRANTEE_CE  |

  @544022 @544029 @544014 @544030 @NYSEDSprint-17 @US-541724 @M05 @defect-ID-1407
  Scenario:Verify that the FD users cannot see the 'Child Organization' field on the on the Grant layout -> Overview tab -> Subrecipient Information section when 'Creating for' is selected as the 'Self' value on the Application layout.
  |Verify that the Grantee User can see the 'Creating for' and 'Not For Profit' fields are added on the grant layout and that this is a reference field from Application layout: Creating for is Self|
  |Verify that the FD Users see the 'Creating for', and 'Not For Profit' fields are added on the grant layout and that this is a reference field from Application layout -> Overview tab -> Information section, when 'Creating for' is selected as the 'Self'.|
  |Verify that the Grantee User cannot see the 'Child Organization' field on the on the Grant layout -> Overview tab -> Subrecipient Information section when 'Creating for' is selected as the 'Self' value on the Application layout.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    When I login to "As a Grantor" app as "FD" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Grant}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    #544022
    Then I softly cannot see field "Child Organization" inside page block
    #544014
    Then I softly see field "Creating For" as "Self"
    Then I softly see field "Creating For" is not editable
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Not For Profit" is not editable
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    And I click on "Send to Subrecipient" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
    #544029
    And I wait for "5" seconds
    #544030
    Then I softly cannot see field "Child Organization" inside page block
    Then I softly see field "Creating For" as "Self"
    Then I softly see field "Creating For" is not editable
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Not For Profit" is not editable

  @544012 @544027 @544846 @544841 @544843 @NYSEDSprint-17 @NYSEDSprint-18 @US-541724 @US-541858 @M05 @defect-ID-1407
  Scenario:Verify that the FD Users see the 'Creating for', 'Child Organization', and 'Not For Profit' fields are added on the grant layout and that this is a reference field from Application layout ->Overview tab ->Information section: Creating for is On behalf of
  |Verify that the Grantee User can see the 'Creating for', 'Child Organization', and 'Not For Profit' fields are added on the grant layout and that this is a reference field from Application layout: Creating for is On behalf of|
  |Verify Other than FD Profile 'Manage Dates' button unable to see - Via FDM|
  |Verify "Manage Dates" button able to see on award page layout only with FD Profile.|
  |Verify that the FD Profile on Click "Manage Dates" button "Manage Dates" modal get open - Via FDM|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    When I login to "As a Grantor" app as "FD" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Grant}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    #544012
    And I navigate to "Overview" sub tab
    Then I softly see field "Creating For" added after "Subrecipient Organization"
    Then I softly see field "Child Organization" added after "Creating For"
    Then I softly see field "Not For Profit" added after "Child Organization"
    When I click on "Edit" in the page details
    Then I softly cannot see field "Child Organization" inside page block
    Then I softly see field "Creating For" as "On behalf of"
    Then I softly see field "Creating For" is not editable
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Not For Profit" is not editable
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    And I click on "Send to Subrecipient" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I navigate to "Overview" sub tab
    #544841
    Then I softly can see top right button "Manage Dates" in page detail
    When I click on "Manage Dates" in the page details
    #544843
    When I enter in modal value "1" into field "NYSED_ProjectStop__c"
    When I enter in modal value "20" into field "NYSED_FS10DueDate__c"
    When I click modal button "Save"
    Then I softly see field "Project Stop" as "{Date:M/d/yyyy::d+1}"
    And I click modal button "Close"
    Then I softly see field "Project Stop" as "{Date:M/d/yyyy::d+1}"
    #544846
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Grant}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right button "Manage Dates" in page detail
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Grant}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right button "Manage Dates" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Grant}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right button "Manage Dates" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Grant}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right button "Manage Dates" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I wait for "5" seconds
    #544027
    Then I softly see field "Creating For" added after "Subrecipient Organization"
    Then I softly see field "Child Organization" added after "Creating For"
    Then I softly see field "Not For Profit" added after "Child Organization"
    Then I softly see field "Creating For" as "On behalf of"
    Then I softly see field "Creating For" is not editable
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Not For Profit" is not editable

  @NYSED-1415 @Sprint-21 @US-NYSED-938 @M05 @YugaC
  Scenario Outline: Verify that on the award layout, when FD user(For Standard Grant) click on the 'Send to Subrecipient' button before Award approval, the below task should go to the Subrecipient’s Submit and Certify users.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Grant_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Award_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type       | Subject                                                                           | Due Date Only        | Status      |
      | Action menu | {SavedValue:awardName} | Subaward Review | Review Subaward #{SavedValue:awardName} for Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:completeTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:completeTaskTableId---" :
      | Actions     | EGMS ID                | Task Type       | Subject                                                                           | Due Date             | Completed Date  | Status    |
      | Action menu | {SavedValue:awardName} | Subaward Review | Review Subaward #{SavedValue:awardName} for Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | {Date:M/d/uuuu} | Completed |

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-1419 @Sprint-21 @US-NYSED-938 @M05 @YugaC
  Scenario Outline: Verify that on the award layout, when FD user(For Standard Grant) click on the 'Send to Subrecipient after approval' button after Award approval, the below task should go to the Subrecipient’s Submit and Certify users.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Grant_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Award_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                      | Subject                                         | Due Date Only        | Status      |
      | Action menu | {SavedValue:awardName} | Review Subaward and Accept GAN | Review Subaward #{SavedValue:awardName} and GAN | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "4" seconds
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:completeTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:completeTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                      | Subject                                         | Due Date             | Completed Date  | Status    |
      | Action menu | {SavedValue:awardName} | Review Subaward and Accept GAN | Review Subaward #{SavedValue:awardName} and GAN | {Date:M/d/yyyy::d+7} | {Date:M/d/uuuu} | Completed |

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-1394 @Sprint-21 @US-NYSED-937 @M05 @YugaC
  Scenario: Verify that the task should go to the Peer Reviewer(s) when the FD User clicks on the 'Send for Review' button on the Peer Reviews table of the award. Award via FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Grant_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Award_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Description            | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type       | Subject                                                                           | Due Date Only        | Status      |
      | Action menu | {SavedValue:awardName} | Review Subaward | Review Subaward #{SavedValue:awardName} for Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+5} | Not Started |

  @NYSED-1397 @Sprint-21 @US-NYSED-937 @M05 @YugaC
  Scenario Outline: Verify that the task should go to the FD User when the Submit and Certify user clicks on the Accept button before Award approval. And the task moved under the complete task section once the FD user clicked on the Submit for Approval button. Award via FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Grant_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Award_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Accepted"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type                                      | Subject                                                                             | Due Date Only        | Status      |
      | Action menu | {SavedValue:awardName} | Initial Acceptance of Subaward by Subrecipient | Subaward #{SavedValue:awardName} Accepted for Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | Not Started |

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-1399 @Sprint-21 @US-NYSED-937 @M05 @YugaC
  Scenario: Verify that the task should go to the Assigned Approver when FD user clicks on 'Submit for Approval' button, OR click on ‘Approve’ button by previous Approver, OR once Approver click on 'Forward' action submit by selecting other user. Award via FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Grant_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Award_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PO Username} | Step 3 |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I save the field labeled "EGMS ID" as "awardName"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type        | Subject                                                                            | Due Date Only        | Status      |
      | Action menu | {SavedValue:awardName} | Approve Subaward | Approve Subaward #{SavedValue:awardName} for Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardFromFDM:-:completeTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:completeTaskTableId---" :
      | Actions     | EGMS ID                | Task Type        | Subject                                                                            | Due Date             | Completed Date  | Status    |
      | Action menu | {SavedValue:awardName} | Approve Subaward | Approve Subaward #{SavedValue:awardName} for Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | {Date:M/d/uuuu} | Completed |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type        | Subject                                                                            | Due Date Only        | Status      |
      | Action menu | {SavedValue:awardName} | Approve Subaward | Approve Subaward #{SavedValue:awardName} for Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardFromFDM:-:completeTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:completeTaskTableId---" :
      | Actions     | EGMS ID                | Task Type        | Subject                                                                            | Due Date             | Completed Date  | Status    |
      | Action menu | {SavedValue:awardName} | Approve Subaward | Approve Subaward #{SavedValue:awardName} for Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | {Date:M/d/uuuu} | Completed |
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:SubAwardAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:SubAwardAllTableId---" without waiting for record
    And I wait for "2" seconds
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:EXE Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type        | Subject                                                                            | Due Date Only        | Status      |
      | Action menu | {SavedValue:awardName} | Approve Subaward | Approve Subaward #{SavedValue:awardName} for Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardFromFDM:-:completeTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:completeTaskTableId---" :
      | Actions     | EGMS ID                | Task Type        | Subject                                                                            | Due Date             | Completed Date  | Status    |
      | Action menu | {SavedValue:awardName} | Approve Subaward | Approve Subaward #{SavedValue:awardName} for Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | {Date:M/d/uuuu} | Completed |

  @NYSED-1403 @Sprint-21 @US-NYSED-937 @M05 @YugaC
  Scenario: Verify that the task should go to the FD user when the last approver clicks on 'Approve' action button. Once the FD user clicks on the 'Send to Subrecipient' button, Taks should get closed for all FD users. Award via FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Grant_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Award_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I save the field labeled "EGMS ID" as "awardName"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                | Task Type    | Subject                                                                                     | Due Date Only        | Status      |
      | Action menu | {SavedValue:awardName} | Generate GAN | Generate GAN for Subaward #{SavedValue:awardName} for Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Generate GAN" in the page details
    And I pause execution for "10" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardFromFDM:-:completeTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:completeTaskTableId---" :
      | Actions     | EGMS ID                | Task Type    | Subject                                                                                     | Due Date             | Completed Date  | Status    |
      | Action menu | {SavedValue:awardName} | Generate GAN | Generate GAN for Subaward #{SavedValue:awardName} for Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | {Date:M/d/uuuu} | Completed |

  @NYSED-1524 @NYSEDSprint-21 @US-NYSED-942 @M05
  Scenario Outline: Verify that the Internal users, other than the FD user, cannot see the page-level button 'Manage Dates' on the subaward layout.: Award Via FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-1524
    Then I softly cannot see top right button "Manage Dates" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly can see top right button "Manage Dates" in page detail

    Examples:
      | Announcement Name                         | Coordinator |
      | {SavedValue:Automation Runtime FDM Grant} | PO          |
#      | {SavedValue:Automation Runtime FDM Grant} | PM          |
#      | {SavedValue:Automation Runtime FDM Grant} | FO          |
#      | {SavedValue:Automation Runtime FDM Grant} | EXE          |

  @542765 @US-541283 @NYSEDSprint-17 @M05
  Scenario: Verify that the page-level edit button and inline edit button in the Subaward section are visible to FD profile users when the grant type is Standard and it is in the Draft state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    #542765
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "Automation- Grant Description" into field "GrantDescription__c"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I click on "Save" in the page details
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I enter value "Automation- Award Description" into field "GrantAwardDescription__c"
    And I click on "Save" in the page details

  @542825 @542823 @NYSEDSprint-15 @US-537967 @M05 @APIRequired
  Scenario Outline:Verify that the grantee users see the related budget categories populated in the Grant Budget section and Payment Summary by Focus Area section on the Grant layout when the budget category is FS-10. - Grant via FDM
  |Verify that the grantee users see the following fields added in the Grant Information section under the Overview on the Grant layout. - Grant via FDM|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Grant}"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Grant}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I wait for "2" seconds
    #542823
    And I navigate to "Overview" sub tab
    Then I softly see field "Fund Year" added after "Grant Type"
    Then I softly see field "Fund Year" as "12.60%"
    Then I softly see field "First Payment %" as "12.60%"
    Then I softly see field "First Payment %" added after "Grant Abbrevation"
    #542825
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:grantsBudgetCategoryGrantor---" :
      | Budget Category             | Budget Category Code |
      | Professional Staff Salaries | 15                   |
      | Support Staff Salaries      | 16                   |
      | Purchased Services          | 40                   |
      | Supplies and Materials      | 45                   |
      | Travel Expenses             | 46                   |
      | Employee Benefits           | 80                   |
      | Indirect Cost               | 90                   |
      | BOCES Purchased Services    | 49                   |
      | Minor Remodeling            | 30                   |
      | Equipment                   | 20                   |
    And I navigate to "Actuals" sub tab
    And I expand nested table containing column value "BP01"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | Support Staff Salaries      |
      | Purchased Services          |
      | Supplies and Materials      |
      | Travel Expenses             |
      | Employee Benefits           |
      | Indirect Cost               |
      | BOCES Purchased Services    |
      | Minor Remodeling            |
      | Equipment                   |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_LEA |
#      | GRANTEE_VO  |
#      | GRANTEE_CE  |