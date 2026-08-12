@grantAndAwardNysed @GrantSubawardNysed @grantUpdateFile5 @needtocheckwithsantosh
Feature: Validate all scenarios of grant

  @491123-DG @VerifythattheInternalUserdoesnotseetheLeverageAllowedcolumnintheGrantGrantBudgetBudgetCategoriestable @sprint-01-US-487975
    @491130-DG @VerifythattheInternalUserdoesnotseetheLeverageAllowedcolumnintheGrantGrantBudgetBudgetCategoriestable @sprint-01-US-487975
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the Grant 'Grant Budget: Budget Categories' table.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMPETATIVE_DIRECTED_ANN_DIRECT_GRANT_MATCH_NO_FOCUS_AREA_NO"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #491123
    Then I softly do not see "Other Leverage" in flex table header "---subAwardStandAlone:-:GrantBudgetCategoryFlexGridgridTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:grantName}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    #491130
    Then I softly do not see "Other Leverage" in flex table header "---subAwardStandAlone:-:subRecipientGrantBudgetTableId---"

    Examples:
      | UserType | ExternalUser |
      | PM       | GRANTEE_SC   |
#      | EXE      | GRANTEE_CE   |
#      | PO       | GRANTEE_SC   |

  @491121-DG @Sprint-01 @US-487975
    @491127-DG @VerifythattheSubrecipientUserdoesnotseetheLeverageAllowed?columnintheSubawardBudgetCategoriestable @sprint-01-US-487975
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the Grant 'Grant Budget: Budget Categories' table.
  |Verify that the Subrecipient User does not see the "Leverage Allowed?" column in the Subaward 'Budget Categories' table.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMPETATIVE_DIRECTED_ANN_DIRECT_GRANT_MATCH_NO_FOCUS_AREA_NO"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #491121
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly do not see "Other Leverage" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    #491127
    Then I softly do not see "Other Leverage" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | UserType | ExternalUser |
      | PM       | GRANTEE_SC   |
#      | EXE      | GRANTEE_CE   |
#      | PO       | GRANTEE_SC   |

  @490859-DG @490861-DG @490863-DG @490893-DG @490907-DG @490909-DG @VerifythattheInternaluserseeonlyEditactionbuttonattheSubawardpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownSubawardCreated @Sprint-01 @US-490341
  Scenario Outline: Verify that the Internal user see only 'Edit' action button at the Subaward page layout and other record flow action buttons at page level action dropdown.: Subaward: Created
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Construction    | 1000         |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI1 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Award  | Name       |
      | Step 1 | <Approval> |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I re-login to "Grants Portal" app as "<SubUser>" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    #490862
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Accept" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I wait for "5" seconds
    When I click on "Accept" in the page details
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
      | UserType | Approval      | SubUser    |
      | PO       | Automation PO | GRANTEE_SC |

  @493077-DG @493081-DG @VerifythattheReviewerieInternaluserseeEditandSubmitReviewcanseebuttonsonthemodalGrant&Award @Sprint-01 @US-490341
  Scenario Outline: Verify that the Reviewer i.e. Internal user see 'Edit' and 'Submit Review' can see buttons on the modal - Grant & Award
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Construction    | 1000         |
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
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI1 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | Yes                  |
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
      | Award Name               | Grant Name               | UserType |
      | {SavedValue:AwardEGMSID} | {SavedValue:GrantEGMSID} | PM       |
#      | {SavedValue:AwardEGMSID} | {SavedValue:GrantEGMSID} | EXE      |
#      | {SavedValue:AwardEGMSID} | {SavedValue:GrantEGMSID} | PO       |
#      | {SavedValue:AwardEGMSID} | {SavedValue:GrantEGMSID} | ADMIN    |

  @493468 @493471 @Sprint-02 @US-491301
  Scenario Outline:Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: <Focus Area Name>" on the Budget Period-->Budget Categories table of the Subaward when the Announcements is created with the Focus Area Required? is marked as "Yes"
    Given I activated standalone subaward "Automation Runtime Announcement" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:subrecipientGrantBudgetTableId---"
    When I navigate to "Actuals" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:subrecipientGrantActualSummaryBudgetTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---" without waiting for record
    #@493471
    When I navigate to "Budget" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @493470 @Sprint-02 @US-491301
  Scenario Outline:Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: <Focus Area Name>" on the Budget Period-->Budget Categories table of the Subaward when the Announcements is created with the Focus Area Required? is marked as "Yes"
    Given I activated standalone subaward "Automation Runtime Announcement" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-<User>" of type "Competitive"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "GrantorActiveGrants" without waiting for record
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:grantsBudgetCategoryGrantor---"
    When I navigate to "Actuals" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |

  @493513 @493521 @Sprint-02 @US-491301
  Scenario Outline:Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: <Focus Area Name>" on the Budget Period-->Budget Categories table of the Grant when the Direct Grantis created with the Focus Area Required? is marked as "Yes"
    Given I activated standalone subaward "Automation Runtime Announcement" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "{SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:subrecipientGrantBudgetTableId---"
    #493521
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    Then I softly see "{SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "{SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @493518 @493522 @Sprint-02 @US-491301
  Scenario Outline:Verify that the Internal user sees the Focus area name in the format "Focus Area: <Focus Area Name>" on the Budget Period-->Budget Categories table of the Grant when the Direct Grant is created with the Focus Area Required? is marked as "Yes"
    Given I activated standalone subaward "Automation Runtime Announcement" with properties "default-<User>" of type "Competitive"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "GrantorActiveGrants" without waiting for record
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "{SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:grantsBudgetCategoryGrantor---"
    When I navigate to "Actuals" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "{SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---"
    #@493522
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "RelatedAwards1" without waiting for record
    When I navigate to "Budget" sub tab
    Then I softly see "{SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "{SavedValue:Automation Runtime Announcement}" inside rows of enhanced grid id "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |

  @497215-DG @Sprint-05 @US-500362
  Scenario: Verify that the Fund Year column, as Read-only, is added next to the Funding Account column on the Budget on Award layout->Funding Account Information section when Award is in Created state
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:GrantEGMSID}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "GrantorActiveGrants" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I see only the following headers in table with id "---subAwardStandAlone:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Appropriation Amount | Available Balance | Pre-Encumbrance |
    And I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" without waiting for record
    Then I softly see field "Fund Year" is not editable