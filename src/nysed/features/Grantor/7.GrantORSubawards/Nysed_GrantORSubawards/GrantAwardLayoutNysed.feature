@GrantSubawardNysed @DirectGrantSubawardLayoutsNysed @grantUpdateFile7
Feature: Validate all scenarios in the award related to Layouts

  @NYSED-1512 @NYSED-1504 @NYSED-1506 @NYSED-1507 @NYSEDSprint-21 @US-NYSED-942 @M05 @santosh @Bug-Ticket-NYSED-8060
  Scenario Outline:  Verify that the Internal users, other than the FD user, cannot see the page-level button 'Manage Dates' on the subaward layout.: Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    #NYSED-1507
    Then I softly see the following messages in the page details contains:
      | To Save, FS-10F Due Date is required in the Budget tab under the Budget Summary section. |
    And I wait for "2" seconds
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    #NYSED-1507
    Then I softly see field "FS-10F Due Date" added after "Amendment Deadline"
    And I wait for "3" seconds
    Then I softly see field "FS-10F Due Date" as "{Date:M/d/yyyy::d+100}"
    And I navigate to "Overview" sub tab
    #NYSED-1512
    Then I softly cannot see top right button "Manage Dates" in page detail
    #NYSED-1504
    And I wait for "2" seconds
    Then I see only the following ordered page blocks :
      | Subaward Information              |
      | Subrecipient Information          |
      | Subaward Description              |
      | Terms and Conditions              |
      | Place of Performance              |
      | Contacts                          |
      | Goals and Objectives              |
      | Key Performance Indicators (KPIs) |
      | System Information                |
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "Automation PO" into field "Assurances__c"
    When I click on "Save" in the page details
    Then I softly see field "Terms and Conditions" as "Automation PO"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-1512
    Then I softly can see top right button "Manage Dates" in page detail
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #NYSED-1506
    Then I see only the following ordered page blocks :
      | Subaward Information              |
      | Subrecipient Information          |
      | Subaward Description              |
      | Terms and Conditions              |
      | Place of Performance              |
      | Contacts/Key Personnel            |
      | Goals and Objectives              |
      | Key Performance Indicators (KPIs) |
      | System Information                |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see that "Terms and Conditions" rendered in view mode only
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #NYSED-1506
    Then I see only the following ordered page blocks :
      | Subaward Information              |
      | Subrecipient Information          |
      | Subaward Description              |
      | Terms and Conditions              |
      | Place of Performance              |
      | Contacts/Key Personnel            |
      | Goals and Objectives              |
      | Key Performance Indicators (KPIs) |
      | System Information                |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see that "Terms and Conditions" rendered in view mode only
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    #NYSED-1506
    Then I see only the following ordered page blocks :
      | Subaward Information              |
      | Subrecipient Information          |
      | Subaward Description              |
      | Terms and Conditions              |
      | Place of Performance              |
      | Contacts/Key Personnel            |
      | Goals and Objectives              |
      | Key Performance Indicators (KPIs) |
      | System Information                |
    #UncommentThisAfterConfirmationBYQA
#    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see that "Terms and Conditions" rendered in view mode only
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    #NYSED-1506
    Then I see only the following ordered page blocks :
      | Subaward Information              |
      | Subrecipient Information          |
      | Subaward Description              |
      | Terms and Conditions              |
      | Place of Performance              |
      | Contacts/Key Personnel            |
      | Goals and Objectives              |
      | Key Performance Indicators (KPIs) |
      | System Information                |
   #UncommentThisAfterConfirmationBYQA
#    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see that "Terms and Conditions" rendered in view mode only

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE          | GRANTEE_SC   |

  @543573 @Yogita @passed
  Scenario Outline: : Verify that the Grantee user with the Submit and Certify role can see the Accept button in Sent to Subrecipient award state, and when click on the 'Accept' button, the subaward status changes to Submitted to Grantor. for FS10 budget
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see top right dropdown button "Accept" in page detail
    Then I softly can see top right dropdown button "Reject" in page detail
    And I click on "Accept" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @543576 @Yogita @passed
  Scenario Outline: Verify that the Grantee user with the Create and Edit or Submit and Certify role can see the Accepted button in Sent to Subrecipient standard award state, and when click on the 'Accepted' button, the subaward status changes to Accepted.
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
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly can see top right dropdown button "Accept" in page detail
    Then I softly can see top right dropdown button "Reject" in page detail
    And I click on "Accept" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Accepted"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @543574  @Yogita @passed
  Scenario Outline: Verify that the Grantee user with the Submit and Certify role can see the Reject button in Sent to Subrecipient award state, and when click on the 'Reject' button, the subaward status changes to Rejected..
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see top right dropdown button "Accept" in page detail
    Then I softly can see top right dropdown button "Reject" in page detail
    And I click on "Reject" in the page details without processing
    And I wait for "3" seconds
    Then I softly see field "Status" as "Rejected"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @543456  @Yogita @passed
  Scenario Outline: Verify that the Program Coordinator/s can see Edit button and edit rights on the Responsibilities-->Peer Reviewers section when award is in Created state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:peerReviewersTableId---" :
      |        | Actions     | Reviewer Name            | Role             | Description    | Due Date               | Allow Record Editing | Status  |
      | extend | Action menu | {SavedValue:PO Username} | Program Reviewer | Review details | {Date:M/dd/yyyy::d+10} | Yes                  | Created |
    Then I softly can see row level action button "Edit" against "{SavedValue:PO Username}" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:PO Username}" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly can see row level action button "Send for Review" against "{SavedValue:PO Username}" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Edit" icon for "{SavedValue:PO Username}" inside table
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | The subaward needs to be sent to the subrecipient before starting review. |
    And I click on "Delete" icon for "{SavedValue:PO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @543520 @Yogita @passed
  Scenario Outline: Verify that the Program Coordinator/s can see Resend for Review and edit buttons on the Responsibilities-->Peer Reviewers section for the previously assigned review when award is in Submitted for Review state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Edit" against "Program Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly can see row level action button "Resend For Review" against "Program Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Edit" icon for "Program Reviewer" inside table
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I wait for "3" seconds
    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "Edit" :
      | Reviewer Name            | Role             | Description      | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details2 | 11       | Yes                  |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:peerReviewersTableId---" :
      |        | Actions     | Reviewer Name            | Role             | Description     | Due Date              | Allow Record Editing | Status    |
      | extend | Action menu | {SavedValue:PO Username} | Program Reviewer | Review details2 | {Date:M/d/yyyy::d+11} | Yes                  | Submitted |
    And I wait for "2" seconds
    And I click on "Resend For Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    Then I see the following messages in the page details contains:
      | Review Successfully Initiated. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @543461  @Yogita @passed
  Scenario Outline: Verify that the Program Coordinator/s can see New button and edit rights on the Responsibilities-->Peer Reviewers section when award is in Sent To Subrecipient state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right button "Edit" in page detail
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    Then I softly can see row level action button "Edit" against "{SavedValue:PO Username}" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:PO Username}" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly can see row level action button "Send for Review" against "{SavedValue:PO Username}" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Edit" icon for "{SavedValue:PO Username}" inside table
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | The subaward cannot be sent for review until subrecipient submits to grantor. |
    And I click on "Delete" icon for "{SavedValue:PO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         |

  @NYSED-3413 @NYSED-3414 @M05 @Ankit @passed
  Scenario Outline: Verify that the Internal user sees on the Grant layout, Management tab is hidden.
  |Verify that the Internal user sees on the Grant layout, Management tab is hidden.|
  |Verify that the Internal user sees that on the Grant layout -> Files tab -> Supporting Documents Checklist section -> Applies To column, hide the below-mentioned options Progress Report, Site Visit, Desk Review, Advance Request, and Closeout.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Direct Grant}" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    #NYSED-3413
    Then I softly cannot see "Management" sub tab at view detail page
    Then I softly cannot see page block "Progress Report"
    Then I softly cannot see page block "Site Visits"
    Then I softly cannot see page block "Desk Reviews"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Subawards" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    #NYSED-3414-Grantor
    And I navigate to "Files" sub tab
    Then I softly see "Supporting Documents Checklist" page block displayed
    Then I softly can see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---"
    When I click on top right button "Add" in flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---"
    Then I see only the following ordered options in dropdown field "AttachmentLocation__c" :
      | Application | Award | Reimbursement Request |

    Examples:
      | Coordinator |
      | PO          |
#      | PM          |
#      | FO          |
#      | FD          |

  @NYSED-3416 @NYSED-3417 @M05 @Ankit @NeedRun @passed
  Scenario Outline:  Verify that Internal User cannot add / update / delete the added budget, under the budget category. - Direct Grant
  |Verify that the Grantee user sees on the Grant layout, the Management tab is hidden.|
  |Verify that the Grantee user sees that on the Grant layout -> Files tab -> Supporting Documents Checklist section -> Applies To column, hide the below-mentioned options Progress Report, Site Visit, Desk Review, Advance Request, and Closeout.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required | Applies To  | Status |
      | Test        | Optional | Application | Active |
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I click on hyperlink containing value "{SavedValue:GRANT_EGMSID}"
    And I wait for "5" seconds
        #NYSED-3416-Grantee
    Then I softly cannot see "Management" sub tab at view detail page
    Then I softly cannot see page block "Progress Report"
    Then I softly cannot see page block "Site Visits"
    Then I softly cannot see page block "Desk Reviews"
    #NYSED-3417-Grantee
    And I navigate to "Files" sub tab
    Then I softly see value "Award" for title "Applies To" against the value "Attach budget narrative" inside table "SubRecipientGrantChecklists"
    Then I softly see value "Reimbursement Request" for title "Applies To" against the value "Include reimbursement receipts" inside table "SubRecipientGrantChecklists"
    Then I softly see value "Application" for title "Applies To" against the value "Test" inside table "SubRecipientGrantChecklists"
    Then I softly do not see "Progress Report" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Site Visit" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Desk Review" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Advance Request" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Closeout" inside flex table with id "SubRecipientGrantChecklists"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I click on hyperlink containing value "{SavedValue:GRANT_EGMSID}"
    And I wait for "5" seconds
        #NYSED-3416-Grantee
    Then I softly cannot see "Management" sub tab at view detail page
    Then I softly cannot see page block "Progress Report"
    Then I softly cannot see page block "Site Visits"
    Then I softly cannot see page block "Desk Reviews"
#    NYSED-3417-Grantee
    And I navigate to "Files" sub tab
    Then I softly see value "Award" for title "Applies To" against the value "Attach budget narrative" inside table "SubRecipientGrantChecklists"
    Then I softly see value "Reimbursement Request" for title "Applies To" against the value "Include reimbursement receipts" inside table "SubRecipientGrantChecklists"
    Then I softly see value "Application" for title "Applies To" against the value "Test" inside table "SubRecipientGrantChecklists"
    Then I softly do not see "Progress Report" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Site Visit" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Desk Review" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Advance Request" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Closeout" inside flex table with id "SubRecipientGrantChecklists"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I click on hyperlink containing value "{SavedValue:GRANT_EGMSID}"
    And I wait for "5" seconds
        #NYSED-3416-Grantee
    Then I softly cannot see "Management" sub tab at view detail page
    Then I softly cannot see page block "Progress Report"
    Then I softly cannot see page block "Site Visits"
    Then I softly cannot see page block "Desk Reviews"
    #NYSED-3417-Grantee
    And I navigate to "Files" sub tab
    Then I softly see value "Award" for title "Applies To" against the value "Attach budget narrative" inside table "SubRecipientGrantChecklists"
    Then I softly see value "Reimbursement Request" for title "Applies To" against the value "Include reimbursement receipts" inside table "SubRecipientGrantChecklists"
    Then I softly see value "Application" for title "Applies To" against the value "Test" inside table "SubRecipientGrantChecklists"
    Then I softly do not see "Progress Report" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Site Visit" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Desk Review" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Advance Request" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Closeout" inside flex table with id "SubRecipientGrantChecklists"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I click on hyperlink containing value "{SavedValue:GRANT_EGMSID}"
    And I wait for "5" seconds
        #NYSED-3416-Grantee
    Then I softly cannot see "Management" sub tab at view detail page
    Then I softly cannot see page block "Progress Report"
    Then I softly cannot see page block "Site Visits"
    Then I softly cannot see page block "Desk Reviews"
    #NYSED-3417-Grantee
    And I navigate to "Files" sub tab
    Then I softly see value "Award" for title "Applies To" against the value "Attach budget narrative" inside table "SubRecipientGrantChecklists"
    Then I softly see value "Reimbursement Request" for title "Applies To" against the value "Include reimbursement receipts" inside table "SubRecipientGrantChecklists"
    Then I softly see value "Application" for title "Applies To" against the value "Test" inside table "SubRecipientGrantChecklists"
    Then I softly do not see "Progress Report" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Site Visit" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Desk Review" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Advance Request" inside flex table with id "SubRecipientGrantChecklists"
    Then I softly do not see "Closeout" inside flex table with id "SubRecipientGrantChecklists"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-543529 @M05 @Ankit @passed
  Scenario Outline: Verify that the Grant Finance Coordinator/s can see the Subaward status changes to 'Submitted for Review' when clicking on the Send Back to Program Office
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance Review"
    Then I softly can see top right dropdown button "Send Back to Program Office" in page detail
    Then I softly cannot see top right dropdown button "Send To Subrecipient" in page detail
    And I click on "Send Back to Program Office" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted for Review"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-3420 @NYSED-3422 @NYSED-3423 @M05 @Ankit @paased
  Scenario Outline: Verify that the Internal user sees on the Subaward layout -> Management tab, sections mentioned below are hidden: Site Visits, and Desk Reviews
  |Verify that the Internal user sees on the Subaward layout -> Management tab, sections mentioned below are hidden: Site Visits, and Desk Reviews|
  |Verify that the Internal user sees that on the Subaward layout -> Responsibilities tab -> Approvers section, hide the sections: Progress Report, Desk Review, Site Visit, and Closeout.|
  |Verify that the Grantee user sees on the Subaward layout -> Management tab, sections mentioned below are hidden: Site Visits, and Desk Reviews|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Grant}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Grant}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Low" into field "Risk_Level__c"
    And I enter value "Justified" into field "GMComments__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
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
 #NYSED-3420
    When I navigate to "Management" sub tab
    Then I softly cannot see page block "Site Visits"
    Then I softly cannot see page block "Desk Reviews"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    #NYSED-3423
    And I navigate to "Management" sub tab
    Then I softly cannot see page block "Site Visits"
    Then I softly cannot see page block "Desk Reviews"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Grant}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Grant}" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
   #NYSED-3422
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Approvers" page block displayed
    Then I softly do not see "Progress Report" in flex table header "Approvers"
    Then I softly do not see "Desk Review" in flex table header "Approvers"
    Then I softly do not see "Site Visit" in flex table header "Approvers"
    Then I softly do not see "Closeout" in flex table header "Approvers"

    Examples:
      | UserType | ExternalUser |
      | FD       | GRANTEE_SC   |
#      | PM          |GRANTEE_LEA  |
#      | FO          |GRANTEE_VO   |
#      | PO          |GRANTEE_CE   |

  @543457 @1 @DYogita @passed @Reviewed @draft
  Scenario Outline: Verify that the Program Coordinator/s can see the Send To Subrecipient button when award is in Created OR Submitted to Grantor OR Submitted for Review states
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly cannot see top right dropdown button "Submit For Approval" in page detail
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly cannot see top right dropdown button "Submit For Approval" in page detail
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @543521 @8 @DYogita @Reviewed @passed
  Scenario Outline: Verify that the Program reviewer can see the task is generated and see the inline Enter Review action button on the Responsibilities-->Peer Reviewers section. And able to edit the record if Edit access is Yes.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:awardName}" in "---applicationReview:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:awardName}" for title "EGMS ID" inside table "---applicationReview:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:awardName}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "2" seconds
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Automation Description" into field "GrantAwardDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Enter Review" against "Program Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @543524 @9 @DYogita @Reviewed
  Scenario Outline:Verify that the Grant Finance Coordinator/s can see Resend for Review and edit buttons on the Responsibilities-->Peer Reviewers section for the previously assigned review when award is in Submitted to Grant Finance Review state..
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    Then I softly see field "Status" as "Submitted to Grant Finance Review"
    And I wait for "2" seconds
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly can see row level action button "Resend For Review" against "Fiscal Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Edit" icon for "Fiscal Reviewer" inside table
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I wait for "3" seconds
    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "Edit" :
      | Role            | Description      | Due Date | Allow Record Editing |
      | Fiscal Reviewer | Review  details2 | 11       | No                   |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:peerReviewersTableId---" :
      |        | Actions     | Reviewer Name            | Role             | Description     | Due Date               | Allow Record Editing | Status    |
      | extend | Action menu | {SavedValue:PO Username} | Program Reviewer | Review details  | {Date:M/dd/yyyy::d+10} | Yes                  | Submitted |
      | extend | Action menu | {SavedValue:PO Username} | Fiscal Reviewer  | Review details2 | {Date:M/dd/yyyy::d+11} | No                   | Submitted |
    And I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I click on "Resend For Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    Then I see the following messages in the page details contains:
      | Review Successfully Initiated. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @543575 @11 @DYogita @Reviewed @passed
  Scenario Outline: Verify that the Grantee user with the Submit and Certify role can see the Accepted button in Sent to Subrecipient award state, and when click on the 'Accepted' button, the subaward status changes to Accepted for Lump sum budget type.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "PO" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I navigate to "Overview" sub tab
    When I enter value "Automation Test Description" into field "GrantAwardDescription__c"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    When I enter value "120" into field "BudgetPeriodEndDate__c"
    When I enter value "100" into field "NYSED_FS10DueDate__c"
    When I enter value "100" into field "ApprovedbyODon__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    And I wait for "2" seconds
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Lump Sum        | 1000         |
    And I wait for "2" seconds
    Then I softly can see top right dropdown button "Accept" in page detail
    Then I softly can see top right dropdown button "Reject" in page detail
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Accepted"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |

  @543519 @12 @DYogita @Reviewed
  Scenario Outline: Verify that the Program Coordinator/s can see New button and edit rights on the Responsibilities-->Peer Reviewers section when award is in Submitted for Review state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly can see row level action button "Delete" against "Fiscal Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly can see row level action button "Send for Review" against "Fiscal Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Edit" icon for "{SavedValue:PO Username}" inside table
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "Edit" :
      | Reviewer Name            | Description      | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Review  details2 | 11       | No                   |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:peerReviewersTableId---" :
      |        | Actions     | Reviewer Name            | Role             | Description     | Due Date               | Allow Record Editing | Status          |
      | extend | Action menu | {SavedValue:PM Username} | Program Reviewer | Review details  | {Date:M/dd/yyyy::d+10} | Yes                  | Sent for Review |
      | extend | Action menu | {SavedValue:PO Username} | Fiscal Reviewer  | Review details2 | {Date:M/dd/yyyy::d+11} | No                   | Created         |
    And I wait for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | Only Program reviews are allowed in this state. |
    And I click on "Delete" icon for "{SavedValue:PO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE          | GRANTEE_SC   |

  @543942 @13 @DYogita @pending @Reviewed @executionRemaining @needToCheck
  Scenario Outline: Verify that the Program Coordinator/s can see Resend for Review and edit buttons on the Responsibilities-->Peer Reviewers section for the previously assigned review when award is in Submitted To Grantor State.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Edit" against "Program Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly can see row level action button "Resend For Review" against "Program Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Edit" icon for "Program Reviewer" inside table
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I wait for "3" seconds
    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "Edit" :
      | Reviewer Name            | Description      | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Review  details2 | 11       | Yes                  |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:peerReviewersTableId---" :
      |        | Actions     | Reviewer Name            | Role             | Description     | Due Date              | Allow Record Editing | Status    |
      | extend | Action menu | {SavedValue:PO Username} | Program Reviewer | Review details2 | {Date:M/d/yyyy::d+11} | Yes                  | Submitted |
    And I wait for "2" seconds
    And I click on "Resend For Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    Then I see the following messages in the page details contains:
      | Review Successfully Initiated. |
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Review"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @543482 @14 @DYogita @ReviewRemaining
  Scenario Outline: Verify that the Program Coordinator/s can see the Send to Grant Finance Office button when award is in Submitted to Grantor OR Submitted for Review states
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    Then I softly can see top right dropdown button "Send to Grant Finance Office" in page detail
    Then I softly cannot see top right dropdown button "Submit For Approval" in page detail
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @543568  @Yogita @needtoreview @passed
  Scenario Outline: Verify that the FD user can see the Sent to Subrecipient button when direct grant / award is in Approved state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Accepted"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PO Username} |
    And I wait for "2" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Low" into field "Risk_Level__c"
    And I enter value "Justified" into field "GMComments__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Generate GAN" in the page details
    And I pause execution for "10" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @543534 @Yogita @needtoreview @passed
  Scenario Outline:Verify that the Fiscal reviewer can see the task is generated and see the inline Enter Review action button on the Responsibilities-->Peer Reviewers section. And able to edit the record if Edit access is Yes.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    Then I softly see field "Status" as "Submitted to Grant Finance Review"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---applicationReview:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "2" seconds
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly can see row level action button "Enter Review" against "Fiscal Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance Review"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE          | GRANTEE_SC   |

  @539608 @539606 @539602 @539532 @539601 @544314 @545449 @US-532926 @US-532926 @US-544880 @NYSEDSprint-15 @NYSEDSprint-18 @NYSEDSprint-19 @M05 @M04 @DirectGrant-Yes @FS-10 @t4
  Scenario Outline: Verify that the associated Program Coordinator/s can see on the Grant Layout->Files Tab->Business Forms section is hidden.: Directed
  | Verify that the associated Program Coordinator/s can see on the Grant Layout->Files Tab->Supporting Document Checklist is copied from related announcement.: Directed |
  | Verify that the associated Program Coordinator/s can see on the Grant Layout->Overview Tab->Period of Performance Project Period Start and End date fields are copied from Announcement->Financials tab->Budget Specific setting->Estimated Project Period.: |
  |Verify that the associated Program Coordinator/s can see Grant layout->Overview Tab->Grant information section-> Announcement ID field is visible.: Directed|
  |Verify that the associated Program Coordinator/s can see on the Grant Layout->Overview Tab->Subrecipient Information section details are filled based on subrecipient from related announcements' Applicant section.: Directed |
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation_CompDir_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Comp_Dir_Edition_DirectGrant" values from "Announcement_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "Announcement_Name"
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    And I save the field labeled "Fund Year" as "Fund_Year"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                       | Required  | Applies To | Status |
      | Automation test description-Award | Mandatory | Award      | Active |
    When I navigate to "Overview" sub tab
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
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Announcement_EGMSID}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement_EGMSID}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Announcement_EGMSID}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement_EGMSID}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    #544314
    When I navigate to "Setup" sub tab
    And I click on top right button "Add" in flex table with id "---announcement:-:annChecklist---"
    Then I see only the following ordered options in dropdown field "AttachmentLocation__c" :
      | Application | Award | Reimbursement Request |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "{SavedValue:Announcement_EGMSID}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement_EGMSID}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "3" seconds
    #545449
    Then I softly see default value "No" for the field "NYSED_Contractual__c"
    Then I see only the following ordered options in dropdown field "NYSED_Contractual__c" :
      | --None-- | Yes | No |
    And I enter value "--None--" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Contractual? is required. |
    And I wait for "2" seconds
    And I enter value "Yes" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I see the header is "Grant" in the page details
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation- Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    #539608
    When I navigate to "Files" sub tab
    Then I softly do not see "Business Forms" page block displayed
    #539606
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" :
      | Description                       | Required  | Applies To | Status | Template Link  | Subrecipient Document Link |
      | Automation test description-Award | Mandatory | Award      | Active | Not Applicable | Not Applicable             |
    #539602
    When I navigate to "Overview" sub tab
    Then I softly see field "Project Period Start Date" as "{Date:M/d/yyyy::d+50}"
    Then I softly see field "Project Period End Date" as "{Date:M/d/yyyy::d+150}"
    #539601
    Then I softly see field "Subrecipient Organization" as "{SavedValue:SubrecipientOrg}"
    #
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
    #539599
    Then I softly see field "Grant Title" as "{SavedValue:Announcement_Name}"
    Then I softly see field "Grant Type" as "Directed"
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
    #539532
    When I navigate to "Overview" sub tab
    And I click "{SavedValue:Announcement_EGMSID}" lookup link
    And I wait for "2" seconds
    Then I see the header is "Announcement" in the page details

    Examples:
      | UserType | Approver      |
#      | PM       | Automation PM |
      | PO       | Automation PO |
#      | FO       | Automation FO |
#      | FD       | Automation FD |

  @539571 @539588 @539586 @539585 @539551 @539584 @539583 @539570 @539581 @545445 @US-532926 @US-544880 @NYSEDSprint-15 @NYSEDSprint-19 @M05 @DirectGrant-Yes @FS-10 @EstimatedFundingAmountPopulateCheck
  Scenario Outline:  Verify that the associated Program Coordinator/s can see on the Grant Layout->Budget Tab->Budget summary section->Estimated Funding is populated equal to allocation amount from announcement.: Formula By Applicant and Focus Area
  | Verify that the associated Program Coordinator/s can see on the Grant Layout->Files Tab->Business Forms section is hidden.: Formula By Applicant and Focus Area|
  | Verify that the associated Program Coordinator/s can see on the Grant Layout->Files Tab->Supporting Document Checklist is copied from related announcement.: Formula By Applicant and Focus Area|
  | Verify that the associated Program Coordinator/s can see on the Grant Layout->Overview Tab->Period of Performance Project Period Start and End date fields are copied from Announcement->Financials tab->Budget Specific setting->Estimated Project Period.: |
  |Verify that the associated Program Coordinator/s can see Grant layout->Overview Tab->Grant information section-> Announcement ID field is visible.: Formula By Applicant and Focus Area|
  |Verify that the associated Program Coordinator/s can see on the Grant Layout->Overview Tab->Subrecipient Information section details are filled based on subrecipient from related announcements' Applicant and Allocation section.: Formula BAFA|
  |Verify that the associated Program Coordinator/s can see on the Grant layout->Overview Tab->Grant Details section, field values are copied/referenced from related announcement.: Formula By Applicant and Focus Area|
  | Verify that the associated Program Coordinator/s can see on the validation If the Focus Area Required is Yes, then the Advance Payment Allowed must be selected as No. is removed.: Formula By Applicant and Focus Area|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
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
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Announcement_Name"
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    And I save the field labeled "Fund Year" as "Fund_Year"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                       | Required  | Applies To | Status |
      | Automation test description-Award | Mandatory | Award      | Active |
    When I navigate to "Overview" sub tab
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
    And I perform quick search for "{SavedValue:Announcement_EGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement_EGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Announcement_EGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement_EGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I edit the following rows inline in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | 1500              |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Announcement_EGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement_EGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Overview" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" without waiting for record
    And I wait for "7" seconds
    #545445
    Then I softly see default value "No" for the field "NYSED_Contractual__c"
    Then I see only the following ordered options in dropdown field "NYSED_Contractual__c" :
      | --None-- | Yes | No |
    And I enter value "--None--" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Contractual? is required. |
    And I wait for "3" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I see the header is "Grant" in the page details
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation- Grant Description" into field "GrantDescription__c"
    And I click on "Save" in the page details
    #539571
    When I navigate to "Budget" sub tab
    Then I softly see field "Estimated Funding" as "$1,500"
    #539588
    When I navigate to "Files" sub tab
    Then I softly do not see "Business Forms" page block displayed
    #539586
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" :
      | Description                       | Required  | Applies To | Status | Template Link  | Subrecipient Document Link |
      | Automation test description-Award | Mandatory | Award      | Active | Not Applicable | Not Applicable             |
    #539585
    When I navigate to "Overview" sub tab
    Then I softly see field "Project Period Start Date" as "{Date:M/d/yyyy::d+50}"
    Then I softly see field "Project Period End Date" as "{Date:M/d/yyyy::d+150}"
    #539584
    Then I softly see field "Subrecipient Organization" as "{SavedValue:SubrecipientOrg}"
    #539583
    Then I softly see field "Subrecipient Match Required?" as "Yes"
    Then I softly see field "Advance Payment Allowed?" as "Yes"
    Then I softly see field "Is Detailed Budget Required on the Subaward?" as "Yes"
    Then I softly see field "Focus Areas Required?" as "Yes"
    Then I softly see field "Allocation Level" as "By Applicant and Focus Area"
    Then I softly see field "Objectives Required?" as "Yes"
    Then I softly see field "KPIs Required?" as "Yes"
    Then I softly see field "Risk Assessment Required?" as "No"
    Then I softly see field "Carry Over" as "Yes"
    Then I softly see field "Carry Over Limit" as "Yes"
    Then I softly see field "Carry Over Limit %" as "11.00%"
    Then I softly see field "First Payment %" as "50.00%"
    #539581
    Then I softly see field "Grant Title" as "{SavedValue:Announcement_Name}"
    Then I softly see field "Grant Type" as "Formula"
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
    #539570
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "--None--" into field "IsAdvancePermitted__c"
    And I enter value "Yes" into field "IsAdvancePermitted__c"
    And I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | If the Focus Area Required is Yes, then the Advance Payment Allowed must be selected as No. |
    Then I softly see field "Advance Payment Allowed?" as "Yes"
    #539551
    And I click "{SavedValue:Announcement_EGMSID}" lookup link
    Then I see the header is "Announcement" in the page details

    Examples:
      | UserType | Approver      |
#      | PM       | Automation PM |
#      | PO       | Automation PO |
      | FO       | Automation FO |
#      | FD       | Automation FD|

  @539572 @539593 @539592 @539550 @539595 @539597 @539598 @539591 @US-532926 @NYSEDSprint-15 @M05 @DirectGrant-Yes @FS-10 @EstimatedFundingAmountPopulateCheck
  Scenario Outline:  Verify that the associated Program Coordinator/s can see on the Grant Layout->Budget Tab->Budget summary section->Estimated Funding is populated equal to allocation amount from announcement.: Formula By Applicant
  |Verify that the associated Program Coordinator/s can see on the Grant Layout->Overview Tab->Subrecipient Information section details are filled based on subrecipient from related announcements' Applicant and Allocation section.: Formula By Applicant|
  |Verify that the associated Program Coordinator/s can see on the Grant layout->Overview Tab->Grant Details section, field values are copied/referenced from related announcement.: Formula By Applicant |
  |Verify that the associated Program Coordinator/s can see Grant layout->Overview Tab->Grant information section-> Announcement ID field is visible.: Formula By Applicant|
  | Verify that the associated Program Coordinator/s can see on the Grant Layout->Overview Tab->Period of Performance Project Period Start and End date fields are copied from Announcement->Financials tab->Budget Specific setting->Estimated Project Period.: |
  | Verify that the associated Program Coordinator/s can see on the Grant Layout->Files Tab->Supporting Document Checklist is copied from related announcement.: Formula By Applicant|
  | Verify that the associated Program Coordinator/s can see on the Grant Layout->Files Tab->Business Forms section is hidden.: Formula By Applicant |
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
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
    And I save the field labeled "Announcement Name" as "Announcement_Name"
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    And I save the field labeled "Fund Year" as "Fund_Year"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                       | Required  | Applies To | Status |
      | Automation test description-Award | Mandatory | Award      | Active |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
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
    And I perform quick search for "{SavedValue:Announcement_EGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement_EGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Announcement_EGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement_EGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1500              |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Announcement_EGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement_EGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation- Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    #539572
    When I navigate to "Budget" sub tab
    Then I softly see field "Estimated Funding" as "$1,500"
    #539598
    When I navigate to "Files" sub tab
    Then I softly do not see "Business Forms" page block displayed
    #539597
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" :
      | Description                       | Required  | Applies To | Status | Template Link  | Subrecipient Document Link |
      | Automation test description-Award | Mandatory | Award      | Active | Not Applicable | Not Applicable             |
    #539595
    When I navigate to "Overview" sub tab
    Then I softly see field "Project Period Start Date" as "{Date:M/d/yyyy::d+50}"
    Then I softly see field "Project Period End Date" as "{Date:M/d/yyyy::d+150}"
    #539593
    Then I softly see field "Subrecipient Organization" as "{SavedValue:SubrecipientOrg}"
    #539592
    Then I softly see field "Subrecipient Match Required?" as "Yes"
    Then I softly see field "Advance Payment Allowed?" as "Yes"
    Then I softly see field "Is Detailed Budget Required on the Subaward?" as "Yes"
    Then I softly see field "Focus Areas Required?" as "No"
    Then I softly see field "Allocation Level" as "By Applicant"
    Then I softly see field "Objectives Required?" as "Yes"
    Then I softly see field "KPIs Required?" as "Yes"
    Then I softly see field "Risk Assessment Required?" as "No"
    Then I softly see field "Carry Over" as "Yes"
    Then I softly see field "Carry Over Limit" as "Yes"
    Then I softly see field "Carry Over Limit %" as "11.00%"
    Then I softly see field "First Payment %" as "50.00%"
    #539591
    Then I softly see field "Grant Title" as "{SavedValue:Announcement_Name}"
    Then I softly see field "Grant Type" as "Formula"
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
    #539550
    When I navigate to "Overview" sub tab
    And I click "{SavedValue:Announcement_EGMSID}" lookup link
    Then I see the header is "Announcement" in the page details

    Examples:
      | UserType | Approver      |
#      | PM       | Automation PM |
#      | PO       | Automation PO |
#      | FO       | Automation FO |
      | FD       | Automation FD |

  @539215 @539226 @US-532927 @NYSEDSprint-15 @M05
  Scenario Outline: Verify that internal users see that the Total Commitment amount are copied from the Allocation amount of the related formula (BA) announcement in the Budget summary section under the Budget tab on the Subaward layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation- Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
      #539215
    Then I softly see field "Subrecipient Organization" as "{SavedValue:SubrecipientOrg}"
    When I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$1,000"
    #539226
    Then I softly see value "Professional Staff Salaries" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Support Staff Salaries" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Supplies and Materials" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Indirect Cost" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Equipment" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #539215
    Then I softly see field "Subrecipient Organization" as "{SavedValue:SubrecipientOrg}"
    #539215
    When I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$1,000"
    #539226
    Then I softly see value "Professional Staff Salaries" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Support Staff Salaries" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Supplies and Materials" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Indirect Cost" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Equipment" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | UserType |
      | FD       |
#      | FO       |
#      | EXE      |
#      | PM       |

  @542784 @542774 @542770 @US-541283 @NYSEDSprint-17 @M05
  Scenario: Verify that the inline edit button in the Subaward section is not visible to FD profile users when the grant type is Direct and the budget type is FS-10.
  |Verify that the inline edit button in the Subaward section is visible to Associated Program Coordinators when the grant type is Direct and the budget type is FS-10.|
  |Verify that the page-level edit button is visible to both FD profile users and Associated Program Coordinators when the grant type is Direct and it is in the Draft state.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Overview" sub tab
    And I wait for "5" seconds
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation- Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    #542770
    And I wait for "2" seconds
    Then I can see top right button "Edit" in page detail
    When I navigate to "Subawards" sub tab
    #542774
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Direct Grant}" in flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    #542784
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    #542770
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    And I wait for "2" seconds
    Then I can see top right button "Edit" in page detail
    When I navigate to "Subawards" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Direct Grant}" in flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail

  @539230 @539216 @539229 @539225 @US-532927 @NYSEDSprint-15 @M05
  Scenario Outline: Verify that internal users see that the approvers details are copied from the related announcement in the Approvers section under the Responsibilities tab on the Subaward layout.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
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
    And I save the field labeled "EGMS ID" as "Automation Runtime Direct Grant"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                       | Required  | Applies To | Status |
      | Automation test description-Award | Mandatory | Award      | Active |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                       |
      | {SavedValue:EXE Username} | Program Coordinator        |
      | {SavedValue:PO Username}  | Grants Finance Coordinator |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1500              |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I navigate to "Setup" sub tab
    And I wait for "3" seconds
    And I save the value from row "1" for column name "Title" as "GoalsAndObjectiveTitle" from flex table "---announcement:-:objectivesTableId---"
    And I save the value from row "1" for column name "Title" as "KPITitle" from flex table "---announcement:-:kpiflextableid---"
    When I navigate to "Financials" sub tab
    And I wait for "3" seconds
    And I save the value from row "1" for column name "Funding Account" as "FundingAccount" from flex table "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation- Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "Grant Title" as "GrantTitle"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "3" seconds
    #539216
    Then I softly see field "Subrecipient Organization" as "{SavedValue:SubrecipientOrg}"
    When I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$1,500"
    #539225
    Then I softly see value "{SavedValue:FundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I navigate to "Performance" sub tab
    #539229
    Then I softly see value "{SavedValue:GoalsAndObjectiveTitle}" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I softly see value "{SavedValue:KPITitle}" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"
    When I navigate to "Responsibilities" sub tab
    #539230
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---subAwardStandAlone:-:approversTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---subAwardStandAlone:-:approversTableId---"
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---subAwardStandAlone:-:approversTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:GRANT_EGMSID}" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "{SavedValue:GRANT_EGMSID}" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #539216
    Then I softly see field "Subrecipient Organization" as "{SavedValue:SubrecipientOrg}"
    #539216
    When I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$1,500"
    #539225
    Then I softly see value "{SavedValue:FundingAccount}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I navigate to "Performance" sub tab
    #539229
    Then I softly see value "{SavedValue:GoalsAndObjectiveTitle}" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"
    Then I softly see value "{SavedValue:KPITitle}" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"

    Examples:
      | UserType |
      | FD       |
#      | FO       |
#      | EXE      |
#      | PM       |

  @542778 @542773 @US-541283 @NYSEDSprint-17 @M05
  Scenario: Verify that the inline edit button in the Subaward section is not visible to Associated Program Coordinators when the grant type is Direct and the budget type is Lump Sum.
  |Verify that the inline edit button in the Subaward section is visible to FD profile users when the grant type is Direct and the budget type is Lump Sum.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Overview" sub tab
    And I wait for "5" seconds
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation- Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    When I navigate to "Subawards" sub tab
    #542778
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Direct Grant}" in flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    #542773
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Direct Grant}" in flex table with id "---subAwardStandAlone:-:subawardsTableId---"

  @542827 @NYSED-2152 @US-541943 @US-NYSED-1802 @NYSEDSprint-17 @NYSEDSprint-23 @M04 @M05 @NEEDTOCONNECTTOSANTOSH
  Scenario: Verify that the grantee users do not see the following fields and sections under the Overview and Budget tab on the Grant layout, as these are hidden. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    #NYSED-2152
    When I navigate to "Financials" sub tab
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category    | Line Item Level, If Applicable |
      | Purchased Services | $50,000                        |
    When I navigate to "Overview" sub tab
    And I wait for "5" seconds
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation- Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I enter "Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PO Username} |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I softly can see top right button "Edit" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:subrecipientPendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:subrecipientPendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Funding Organization" inside page block
    Then I softly do not see "Related Federal/NGO Program" page block displayed
    When I navigate to "Budget" sub tab
    Then I softly cannot see field "Estimated Program Income" inside page block
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Accept" in page detail
    And I wait for "5" seconds
    Then I softly see field "Fund Year" added after "Grant Type"
    Then I softly see field "First Payment %" added after "Grant Abbrevation"
    And I click on "Accept" in the page details

  @542829 @US-541943 @NYSEDSprint-17 @M05
  Scenario: Verify that the grantee users see the related budget categories populated in the Grant Budget section and Payment Summary by Focus Area section on the Grant layout when the budget category is Lump Sum. - Grant via FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Direct Grant}" and properties "default"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:grantName}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:grantsBudgetCategoryGrantor---" :
      | Budget Category | Budget Category Code |
      | Lump Sum        | 0                    |
    And I navigate to "Actuals" sub tab
    And I expand nested table containing column value "BP01"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---" :
      | Budget Category | Budget Category Code |
      | Lump Sum        | 0                    |

  @546115 @NYSEDSprint-19 @US-541234 @M04
  Scenario Outline:Verify that the FD user or associated program coordinator(s) sees a new field, 'Contract Amendment Status', added after the 'Contract Amendment Version' field in the Grant Information section when the 'Contractual?' field is set to Yes. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Overview" sub tab
    And I wait for "5" seconds
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "Yes" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I wait for "3" seconds
    Then I softly see field "Contract Amendment Status" added after "Contract Amendment Version"
    Then I softly see that "Contract Amendment Version" rendered in view mode only

    Examples:
      | UserType |
      | PO       |

  @546117 @NYSEDSprint-19 @US-541234 @M04
  Scenario Outline:Verify that the FD user or associated program coordinator(s) cannot see the following fields in the Grant Information section when the 'Contractual?' field is set to No. - Award via FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Overview" sub tab
    And I wait for "5" seconds
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I wait for "3" seconds
    Then I softly do not see field "Contract ID" inside "Grant Information" section
    Then I softly do not see field "Contract Amendment Version" inside "Grant Information" section
    Then I softly do not see field "Contract Amendment Status" inside "Grant Information" section

    Examples:
      | UserType |
      | PO       |
#      | FO       |
#      | EXE      |
#      | PM       |

  @544426 @NYSEDSprint-19 @US-541234 @M05
  Scenario Outline:Verify that the Internal User can see 'Contract Stop' field able to see on grant page layout - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Overview" sub tab
    And I wait for "3" seconds
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    Then I softly see "Grant Details" page block displayed
    Then I softly see field "Contract Stop" added after "First Payment %"
    And I wait for "3" seconds
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | UserType |
      | PO       |
#      | FO       |
#      | EXE      |
#      | PO       |

  @544430 @NYSEDSprint-19 @US-541234 @M05
  Scenario Outline:Verify that the any Internal User  On Grant Approve or Draft state "Manage Holds" button unable to see -Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Overview" sub tab
    And I wait for "5" seconds
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "Yes" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    Then I softly cannot see top right button "Manage Holds" in page detail

    Examples:
      | UserType |
      | PO       |
#      | FO       |
#      | EXE      |
#      | PO       |

  @544427 @NYSEDSprint-19 @US-541234 @M05
  Scenario Outline:Verify that only FD profile users able to edit 'Contract Stop' field.  - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Overview" sub tab
    And I wait for "5" seconds
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "Yes" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    Then I softly see "Grant Details" page block displayed
    Then I softly see field "Contract Stop" added after "First Payment %"
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "{Date:M/d/yyyy::d+10}" into field "NYSED_ContractStop__c"
    And I enter value "Brief information" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Contract Stop" as "{Date:M/d/yyyy::d+10}"

    Examples:
      | UserType |
      | PO       |
#      | FO       |
#      | EXE      |
#      | PO       |

  @546118 @NYSEDSprint-19 @US-541234 @M05
  Scenario Outline:Verify that the grantee users can see that new fields are added in the Grant Information section when the 'Contractual?' field is set to Yes. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "Yes" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I enter value "OK" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I save the field labeled "Grant Title" as "GRANT_TITLE"
    And I wait for "3" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:GRANT_TITLE}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "0417" into field "NYSED_ProjectID__c"
    And I enter value "GRANT DISCRIPTION" into field "GrantAwardDescription__c"
    And I enter value "GRANT DISCRIPTION" into field "Assurances__c"
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    And I enter value "{Date:M/d/yyyy::d+1}" into field "NYSED_FS10DueDate__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GRANTSA_EGMSID"
    When I navigate to "Overview" sub tab
    And I wait for "3" seconds
    And I click on "Send To Subrecipient" in the page details
    And I wait for "3" seconds
    When I am on "SUBPORTAL" portal
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "<UserType>" user
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:GRANTSA_EGMSID}" in "---subAwardStandAlone:-:PhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:GRANTSA_EGMSID}" inside flex table with id "---subAwardStandAlone:-:PhasePendingTasks---"
    And I wait for "3" seconds
    #@546118
    Then I softly see field "Contract ID" added after "Contractual?"
    Then I softly see field "Contract Amendment Version" added after "Contract ID"
    Then I softly see field "Contract Amendment Status" added after "Contract Amendment Version"
    #@546118
    When I click on "Edit" in the page details
    Then I softly do not see fields "NYSED_CONTRACTID__c" is in edit mode
    Then I softly do not see fields "NYSED_AMD_VER__c" is in edit mode
    Then I softly do not see fields "NYSED_AMD_STATUS__c" is in edit mode

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @546116 @NYSEDSprint-19 @US-541234 @M04
  Scenario Outline:Verify that, except for the FD user, all other users cannot edit the following fields when the state or federal funding account is in the closed state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Overview" sub tab
    And I wait for "5" seconds
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "Yes" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    Then I softly see field "Contract ID" added after "Contractual?"
    Then I softly see field "Contract Amendment Version" added after "Contract ID"
    Then I softly see field "Contract Amendment Status" added after "Contract Amendment Version"
    And I wait for "3" seconds
    Then I softly see that "Contract ID" rendered in view mode only
    Then I softly see that "Contract Amendment Version" rendered in view mode only
    Then I softly see that "Contract Amendment Status" rendered in view mode only

    Examples:
      | UserType |
      | FO       |
#      | FD       |
#      | FO       |
#      | PM      |

  @NYSED-1211 @NYSED-1208 @NYSED-1209 @NYSED-1207 @NYSEDSprint-21 @US-NYSED-1142 @M04
  Scenario Outline:Verify that Program Coordinator cannot see the 'Edit' inline action, In send to subrecipient state of Award if 'Is a Detailed Budget Required on the Subaward?': NO - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DG_YES_BA_DETAILBUDGETONSUBAWRD_NO"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "Yes" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I enter value "OK" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I save the field labeled "Grant Title" as "GRANT_TITLE"
    And I wait for "3" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:GRANT_TITLE}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "0418" into field "NYSED_ProjectID__c"
    And I enter value "GRANT DISCRIPTION" into field "GrantAwardDescription__c"
    And I enter value "GRANT DISCRIPTION" into field "Assurances__c"
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    And I enter value "1" into field "NYSED_FS10DueDate__c"
    And I enter value "25" into field "BudgetPeriodEndDate__c"
    And I enter value "2000" into field "NewObligation__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AWARDSA_EGMSID"
    When I navigate to "Overview" sub tab
    And I wait for "3" seconds
    And I click on "Send To Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I navigate to "Budget" sub tab
    #NYSED-1211
    Then I softly can see row level action button "No Actions Available" against "Professional Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I am on "SUBPORTAL" portal
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:AWARDSA_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARDSA_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Budget" sub tab
    #NYSED-1208
    Then I softly can see row level action button "No Actions Available" against "Professional Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I am on "SUBPORTAL" portal
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:AWARDSA_EGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AWARDSA_EGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Budget" sub tab
    #NYSED-1208
    Then I softly can see row level action button "No Actions Available" against "Professional Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I am on "SUBPORTAL" portal
    When I re-login to "Grants Portal" app as "<UserType>" user
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AWARDSA_EGMSID}" in "---subAwardStandAlone:-:PhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:AWARDSA_EGMSID}" inside flex table with id "---subAwardStandAlone:-:PhasePendingTasks---"
    When I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category             | Award Amount |
      | Professional Staff Salaries | 2000         |
    #NYSED-1207
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries | 15                   | $2,000       |
    #NYSED-1209
    Then I softly see field "Maximum Indirect Allowed" as "$0"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    Then I softly see that "Maximum Indirect Allowed" rendered in view mode only

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @530389 @NYSEDSprint-11 @US-NYSED-509115 @M05
  Scenario Outline:Verify that internal users cannot see the Subaward Terms and Conditions in the left navigation menu, as it is hidden.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Monitoring" tab
    Then I softly do not see the left navigation link "Subaward Terms and Conditions"

    Examples:
      | UserType |
      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |
#      | EXE      |

  @530396 @NYSEDSprint-11 @US-NYSED-509115 @M05
  Scenario Outline:Verify that granntee users cannot see the Subaward Terms and Conditions in the left navigation menu, as it is hidden.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Monitoring" tab
    Then I softly do not see the left navigation link "Subaward Terms and Conditions"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @539668 @539646 @NYSEDSprint-16 @US-537513 @M05
  Scenario:Verify that the grantee users do not see the Terms tab on the Subaward layout, as it is hidden. - Subaward via Direct Grant
  |Verify that the internal users do not see the Terms tab on the Subaward layout, as it is hidden. - Subaward via Direct Grant|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "PO" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    Then I softly cannot see "Terms" sub tab at view detail page
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    #539646
    And I wait for "2" seconds
    Then I softly cannot see "Terms" sub tab at view detail page
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I wait for "5" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
    #539668
    Then I softly cannot see "Terms" sub tab at view detail page

  @539740 @540189 @540195 @540188 @539743 @Sprint-15 @US-494016 @M05
  Scenario Outline: Verify that internal users see that the Budget Category Code column is added after the Budget Category column in the Subaward Budget section under the Budget tab on the Subaward layout when budget type is FS-10. - Subaward via Direct Grant (Formula Ann)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    And I navigate to "Budget" sub tab
    #539740
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries | 15                   | $0           |
      | Action menu | Support Staff Salaries      | 16                   | $0           |
      | Action menu | Purchased Services          | 40                   | $0           |
      | Action menu | Supplies and Materials      | 45                   | $0           |
      | Action menu | Travel Expenses             | 46                   | $0           |
      | Action menu | Employee Benefits           | 80                   | $0           |
      | Action menu | Indirect Cost               | 90                   | $0           |
      | Action menu | BOCES Purchased Services    | 49                   | $0           |
      | Action menu | Minor Remodeling            | 30                   | $0           |
      | Action menu | Equipment                   | 20                   | $0           |
    And I navigate to "Overview" sub tab
    #539743
    Then I softly see field "Subaward Type" added after "Subaward Title"
    Then I softly see field "Fund Year" added after "Subaward Type"
    Then I softly see field "Version Number" added after "Fund Year"
    Then I softly see field "Project ID Seq. No." added after "Version Number"
    Then I softly see field "Project ID" added after "Project ID Seq. No."
    Then I softly see field "Project Stop" added after "Project ID"
    When I re-login to "As a Grantor" app as "<GrantFinanceCordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #540195
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #540189
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:awardName}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:awardName}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I click on "Accept" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:FD Username} | Program Reviewer | Review  details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FD Username}" inside table
    And I wait for "3" seconds
    Then I softly see value "Sent for Review" for title "Status" against the value "{SavedValue:FD Username}" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "<PeerReviewer>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #540188
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser | PeerReviewer | GrantFinanceCordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   | FD           | EXE                    |

  @539741 @Sprint-15 @US-494016 @M05
  Scenario Outline: Verify that internal users see that the Budget Category Code column is added after the Budget Category column in the Subaward Budget section under Budget tab on the Subaward layout when budget type is Lump Sum. - Subaward via Direct Grant (Formula Ann)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    #539741
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category                  | Budget Category Code | Award Amount |
      | Action menu | Lump Sum                         | 0                    | $0           |
      |             | Focus Area : <Announcement Name> |                      | $0           |
      |             | Total                            |                      | $0           |
      |             | Grand Total                      |                      | $0           |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @542905 @542900 @542907 @542914 @Sprint-17 @US-537575 @M05
    @542988 @542904 @542910 @542916 @Sprint-19 @US-539917 @M05
  Scenario Outline: Verify that FD profile users can add Messages by clicking on the Enter Message button from page details- Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    When I click on hyperlink containing value "{SavedValue:SubrecipientOrg}"
    And I wait for "5" seconds
    And I navigate to "Messages" sub tab
    And I save the field labeled "Subrecipient Organization Message" as "SubrecipientOrganizationMessage"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Messages" sub tab
    #542905 #CreatedState
    Then I softly can see top right button "Enter Message" in page detail
    When I click on "Enter Message" in the page details
    And I navigate to "Subaward Information" sub tab
    Then I softly see "Add/Edit Message" page block displayed
    Then I softly see "Enter Subaward Message" opens in overLay window
    And I enter in modal value "{SavedValue:Char255}" into field "AdministrationAcronym__c"
    When I click modal button "Save"
    Then I see field "Subaward Message" as "{SavedValue:Char255}" on modal
    When I click modal button "Close"
    Then I see below fields in "Subaward Related Message" page block
      | Subrecipient Organization Message | Subaward Message |
    Then I softly see field "Subaward Message" as "{SavedValue:Char255}"
    Then I softly see field "Subrecipient Organization Message" as "{SavedValue:SubrecipientOrganizationMessage}"
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #542907
    Then I softly cannot see top right button "Enter Message" in page detail
    Then I see only the following headers in table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Available Balance | Enc Life |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I navigate to "Messages" sub tab
    And I wait for "2" seconds
    #542900
    Then I softly see that "Subrecipient Organization Message" rendered in view mode only
    Then I softly see that "Subaward Message" rendered in view mode only
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #542900 #542907
    Then I softly see field "Subaward Message" as "{SavedValue:Char255}"
    Then I softly see field "Subrecipient Organization Message" as "{SavedValue:SubrecipientOrganizationMessage}"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    When I click on hyperlink containing value "{SavedValue:fundingAccount}"
    And I wait for "4" seconds
    And I navigate to "Messages" sub tab
    And I wait for "2" seconds
    And I save the field labeled "Funding Account Message" as "FundingAccountMessage"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    #542900
    Then I softly see value "{SavedValue:FundingAccountMessage}" for title "Funding Account Message" against the value "{SavedValue:fundingAccount}" inside table "---subAwardFromFDM:-:AwardFundingAccountTableId---"
    Then I see only the following headers in table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Available Balance | Enc Life |
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #542905 #SendtoSubrecipientState
    And I navigate to "Messages" sub tab
    Then I softly can see top right button "Enter Message" in page detail
    When I click on "Enter Message" in the page details
    And I navigate to "Subaward Information" sub tab
    Then I softly see "Add/Edit Message" page block displayed
    Then I softly see "Enter Subaward Message" opens in overLay window
    And I enter in modal value "" into field "AdministrationAcronym__c"
    When I click modal button "Save"
    Then I see field "Subaward Message" as "" on modal
    When I click modal button "Edit"
    And I wait for "2" seconds
    And I enter in modal value "{SavedValue:Char255}" into field "AdministrationAcronym__c"
    When I click modal button "Save"
    Then I see field "Subaward Message" as "{SavedValue:Char255}" on modal
    When I click modal button "Close"
    Then I see below fields in "Subaward Related Message" page block
      | Subrecipient Organization Message | Subaward Message |
    Then I softly see field "Subaward Message" as "{SavedValue:Char255}"
    Then I softly see field "Subrecipient Organization Message" as "{SavedValue:SubrecipientOrganizationMessage}"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    #542914
    Then I softly cannot see top right button "Enter Message" in page detail
    Then I softly do not see "Subaward Related Message" page block displayed
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    #542914
    Then I softly cannot see top right button "Enter Message" in page detail
    Then I softly do not see "Subaward Related Message" page block displayed
    #542904
    Then I softly cannot see top right button "Edit" in page detail
    #542916
    Then I softly cannot see top right button "Accept" in page detail
    Then I softly cannot see top right button "Reject" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    #542914
    Then I softly cannot see top right button "Enter Message" in page detail
    Then I softly do not see "Subaward Related Message" page block displayed
    #542904
    Then I softly cannot see top right button "Edit" in page detail
    #542916
    Then I softly cannot see top right button "Accept" in page detail
    Then I softly cannot see top right button "Reject" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    #542916
    Then I softly cannot see top right button "Accept" in page detail
    Then I softly cannot see top right button "Reject" in page detail
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Messages" sub tab
    Then I softly cannot see top right button "Enter Message" in page detail
    Then I softly do not see "Subaward Related Message" page block displayed
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    #542910
    Then I softly can see top right button "Accept" in page detail
    Then I softly can see top right button "Reject" in page detail
    And I click on "Accept" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    #542988
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Messages" sub tab
    #542905 #SubmittedtoGrantorState
    Then I softly can see top right button "Enter Message" in page detail
    When I click on "Enter Message" in the page details
    And I navigate to "Subaward Information" sub tab
    Then I softly see "Add/Edit Message" page block displayed
    Then I softly see "Enter Subaward Message" opens in overLay window
    And I enter in modal value "" into field "AdministrationAcronym__c"
    When I click modal button "Save"
    Then I see field "Subaward Message" as "" on modal
    When I click modal button "Edit"
    And I wait for "2" seconds
    And I enter in modal value "{SavedValue:Char255}" into field "AdministrationAcronym__c"
    When I click modal button "Save"
    Then I see field "Subaward Message" as "{SavedValue:Char255}" on modal
    When I click modal button "Close"
    Then I see below fields in "Subaward Related Message" page block
      | Subrecipient Organization Message | Subaward Message |
    Then I softly see field "Subaward Message" as "{SavedValue:Char255}"
    Then I softly see field "Subrecipient Organization Message" as "{SavedValue:SubrecipientOrganizationMessage}"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @546110 @546113 @NYSEDSprint-19 @US-541234 @M05
  Scenario: Verify that the FD user or associated program coordinator(s) sees a new field, 'Contract ID', added after the 'Contractual?' field in the Grant Information section when the 'Contractual?' field is set to Yes. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Overview" sub tab
    And I wait for "5" seconds
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "Yes" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    #546113
    Then I softly see field "Contract Amendment Version" added after "Contract ID"
    Then I softly see that "Contract Amendment Version" rendered in view mode only
    And I wait for "3" seconds
    Then I softly see field "Contract ID" added after "Contractual?"
    Then I softly see fields "NYSED_CONTRACTID__c" is in edit mode
    And I enter value "Grant Discription" into field "GrantDescription__c"
    When I click on "Save" in the page details
    Then I softly do not see asterisk mark on "Contract ID"
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Ehhd1234" into field "NYSED_CONTRACTID__c"
    When I click on "Save" in the page details
    Then I softly see field "Contract ID" as "Ehhd1234"
    And I wait for "3" seconds
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "{SavedValue:StringOf30Chars}" into field "NYSED_CONTRACTID__c"
    When I click on "Save" in the page details
    Then I softly see field "Contract ID" as "test1234567890095test1236"

  @542983 @542984 @542985 @Sprint-19 @US-539917 @M05 @subrecipientNotes
  Scenario Outline: Verify that the section-level button 'New' in the Notes section is only visible to the user with the 'Create and Edit' or 'Submit and Certify' role when the subaward is in the 'Sent to Subrecipient state'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---" by clicking "New" :
      | Title            | Description |
      | Automation Title | testing     |
    #542983
    Then I softly see value "Automation Title" for title "Title" against the value "testing" inside table "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    Then I softly can see row level action button "Edit" against "testing" in flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    Then I softly can see row level action button "Delete" against "testing" in flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---" by clicking "Edit" :
      | Title            | Description |
      | Automation Title | Manual      |
    Then I softly see value "Manual" for title "Description" against the value "Automation Title" inside table "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    #542984 #542985
    Then I softly can see row level action button "No Actions Available" against "Manual" in flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    #542984 #542985
    Then I softly can see row level action button "No Actions Available" against "Manual" in flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    #542985
    Then I softly can see row level action button "No Actions Available" against "Manual" in flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    When I click on "Delete" icon for "Automation Title" inside flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    And I wait for "2" seconds
    #542983
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---" by clicking "New" :
      | Title            | Description |
      | Automation Title | testing     |
    #542983
    Then I softly see value "Automation Title" for title "Title" against the value "testing" inside table "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    Then I softly can see row level action button "Edit" against "testing" in flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    Then I softly can see row level action button "Delete" against "testing" in flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---" by clicking "Edit" :
      | Title            | Description |
      | Automation Title | Manual      |
    Then I softly see value "Manual" for title "Description" against the value "Automation Title" inside table "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    #542985
    Then I softly can see row level action button "No Actions Available" against "Manual" in flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    #542985
    Then I softly can see row level action button "No Actions Available" against "Manual" in flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    #542985
    Then I softly can see row level action button "No Actions Available" against "Manual" in flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    When I click on "Delete" icon for "Automation Title" inside flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"
    And I wait for "2" seconds
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:SubrecipientAwardNotesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @542917 @542918 @542919 @542923 @542920 @542951 @542957 @Sprint-19 @US-539917 @M05 @contacts
  Scenario Outline: Verify that the section-level buttons 'New' and 'Associate' are only visible to the users with the 'Create and Edit' or 'Submit and Certify' role in the Contacts/Key Personnel section when the subaward is in the 'Sent to Subrecipient' and Accepted state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "K.B.Street" into field "Addressline1__c"
    When I enter value "Automation" into field "Addressline2__c"
    When I enter value "12" into field "County__c"
    When I enter value "Chicago" into field "City__c"
    When I enter value "34565" into field "Zip4__c"
    When I enter value "USA" into field "Country__c"
    When I enter value "AK" into field "State__c"
    And I click on "Save" in the page details
    #542919
    Then I softly see field "Street" as "K.B.Street"
    Then I softly see field "PO Box" as "Automation"
    Then I softly see field "City" as "Chicago"
    Then I softly see field "County Code" as "12"
    Then I softly see field "State" as "AK"
    Then I softly see field "Zip Code" as "34565"
    Then I softly see field "Country" as "USA"
    Then I softly do not see "Congressional district" inside page block detail
    Then I softly do not see "4-Digit Zip Code Extension" inside page block detail
    #542917
    Then I softly can see top right button "New" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    And I enter value "Auto" into field "Title"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "FiscaluniqueEmailID"
    And I enter value "{SavedValue:FiscaluniqueEmailID}" into field "Email"
    And I enter value "Program Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    Then I softly see value "Automation Contact" for title "Name" against the value "Program Contact" inside table "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly can see row level action button "View" against "Program Contact" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly can see row level action button "Edit" against "Program Contact" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly can see row level action button "Remove" against "Program Contact" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    When I perform quick search for "<ExternalUserName>" in "---subAwardStandAlone:-:keyContactsTableId---" panel
    When I click "Associate" after selection of "<ExternalUserName>" by showing entries "All" in flex table with id "---subAwardStandAlone:-:keyContactsTableId---"
    Then I softly see value "<ExternalUserName>" for title "Name" inside table "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---" by clicking "Edit" :
      | Name               | Project Role   |
      | <ExternalUserName> | Fiscal Contact |
    Then I softly see value "<ExternalUserName>" for title "Name" against the value "Fiscal Contact" inside table "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---" by clicking "Edit" :
      | Project Role    | Is Key Personnel |
      | Program Contact | Checked          |
    Then I softly can see row level action button "View" against "Program Contact" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Contact" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly cannot see row level action button "Remove" against "Program Contact" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment "AttachmentTesting.pdf" of type "Certification" from computer
    When I click modal button "Close"
    And I wait for "3" seconds
    #542951
    Then I softly can see row level action button "Edit" against "Certification" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    Then I softly can see row level action button "View" against "Certification" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    Then I softly can see row level action button "Download" against "Certification" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    Then I softly can see row level action button "Delete" against "Certification" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #542918 #ContactSelectedIsKeyPersonnel
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly can see row level action button "View" against "Program Contact" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Contact" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly cannot see row level action button "Remove" against "Program Contact" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    #542918 #ContactNotSelectedIsKeyPersonnel
    Then I softly can see row level action button "View" against "<ExternalUserName>" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly cannot see row level action button "Edit" against "<ExternalUserName>" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly cannot see row level action button "Remove" against "<ExternalUserName>" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    #542923
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationPermanentKPI}" in flex table with id "---subAwardStandAlone:-:KeyPerformanceIndicatorsKPITableId---"
    #542920
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Street" as "K.B.Street"
    Then I softly see field "PO Box" as "Automation"
    Then I softly see field "City" as "Chicago"
    Then I softly see field "County Code" as "12"
    Then I softly see field "State" as "AK"
    Then I softly see field "Zip Code" as "34565"
    Then I softly see field "Country" as "USA"
    Then I softly do not see "Congressional district" inside page block detail
    Then I softly do not see "4-Digit Zip Code Extension" inside page block detail
    And I navigate to "Files" sub tab
    #542957
    Then I softly do not see top right button "Add Files" inside flex table "---paymentRequest:-:ExternalAwardFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Certification" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    Then I softly can see row level action button "View" against "Certification" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    Then I softly can see row level action button "Download" against "Certification" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Certification" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #542918 #ContactSelectedIsKeyPersonnel
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly can see row level action button "View" against "Program Contact" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Contact" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly cannot see row level action button "Remove" against "Program Contact" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    #542918 #ContactNotSelectedIsKeyPersonnel
    Then I softly can see row level action button "View" against "<ExternalUserName>" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly cannot see row level action button "Edit" against "<ExternalUserName>" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    Then I softly cannot see row level action button "Remove" against "<ExternalUserName>" in flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    #542923
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationPermanentKPI}" in flex table with id "---subAwardStandAlone:-:KeyPerformanceIndicatorsKPITableId---"
    #542920
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Street" as "K.B.Street"
    Then I softly see field "PO Box" as "Automation"
    Then I softly see field "City" as "Chicago"
    Then I softly see field "County Code" as "12"
    Then I softly see field "State" as "AK"
    Then I softly see field "Zip Code" as "34565"
    Then I softly see field "Country" as "USA"
    Then I softly do not see "Congressional district" inside page block detail
    Then I softly do not see "4-Digit Zip Code Extension" inside page block detail
    And I navigate to "Files" sub tab
    #542957
    Then I softly do not see top right button "Add Files" inside flex table "---paymentRequest:-:ExternalAwardFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Certification" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    Then I softly can see row level action button "View" against "Certification" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    Then I softly can see row level action button "Download" against "Certification" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Certification" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I click on "Remove" icon for "<ExternalUserName>" inside flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "Total Records: 2" inside flex table with id "---subAwardStandAlone:-:RecipientassociatedContactsTableId---"
    And I navigate to "Files" sub tab
    And I click on "Edit" icon for "Certification" inside flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Insurance" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    #542951
    Then I softly see value "Insurance" for title "Classification" inside table "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I click on "Delete" icon for "Insurance" inside flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    Then I softly see "No Records Found" inside flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser | ExternalUserName                 |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   | {SavedValue:GRANTEE_CE Username} |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   |{SavedValue:GRANTEE_SC Username}|

  @542922 @542901 @542940 @542926 @Sprint-19 @US-539917 @M05 @contacts
  Scenario Outline: Verify that the inline action 'Edit' in the Key Performance Indicators (KPIs) section is only visible to the user with the 'Create and Edit' or 'Submit and Certify' role when the subaward is in the 'Sent to Subrecipient state'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Files" sub tab
    #542940
    Then I softly cannot see row level action button "Attach" against "Active" in flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly can see row level action button "No Actions Available" against "Active" in flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Files" sub tab
    #542940
    Then I softly cannot see row level action button "Attach" against "Active" in flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly can see row level action button "No Actions Available" against "Active" in flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #542922
    Then I softly can see row level action button "Edit" against "{SavedValue:AutomationPermanentKPI}" in flex table with id "---subAwardStandAlone:-:KeyPerformanceIndicatorsKPITableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:KeyPerformanceIndicatorsKPITableId---" by clicking "Edit" :
      | Title                               | Target |
      | {SavedValue:AutomationPermanentKPI} | 20     |
    Then I softly see value "20" for title "Target" against the value "{SavedValue:AutomationPermanentKPI}" inside table "---subAwardStandAlone:-:KeyPerformanceIndicatorsKPITableId---"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "testing" into field "GrantAwardDescription__c"
    And I click on "Save" in the page details
    #542901
    Then I softly see field "Subaward Description" as "testing"
    And I navigate to "Files" sub tab
    #542926
    Then I softly can see row level action button "Attach" against "Active" in flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    When I click on "Attach" icon for "Active" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    And I wait for "3" seconds
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I wait for "3" seconds
    And I click modal button "Close"
    Then I softly see value "View" for title "Subrecipient Document Link" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   |

  @542986 @542987 @Sprint-19 @US-539917 @M05 @contacts
  Scenario Outline: Verify that the section-level button 'Send Email' and inline action 'Reply' in the Messages section are only visible to the user with the 'LEA Admin', 'Create and Edit' or 'Submit and Certify' role when the subaward is in the 'Sent to Subrecipient state'.|
  |Verify that the section-level button 'Send Email' and inline action 'Reply' in the Messages section are not visible to the user with the 'View Only' role when the subaward is in the 'Sent to Subrecipient state'.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Messages" sub tab
    #542986
    Then I softly see top right button "Send Email" inside flex table "---announcement:-:collabMessages---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I wait for "7" seconds
    And I send the email under collab tab with following details:
      | To                       | Subject         | Body                       |
      | {SavedValue:PMYopmailId} | Automation Test | Automation Test Email Body |
    And I wait for "7" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    And I refresh the page
    Then I softly can see row level action button "Reply" against "Automation Test" in flex table with id "---announcement:-:collabMessages---"
    Then I softly can see row level action button "View" against "Automation Test" in flex table with id "---announcement:-:collabMessages---"
    When I click on "Reply" icon for "Automation Test" inside flex table with id "---announcement:-:collabMessages---"
    And I wait for "7" seconds
    And I send the email under collab tab with following details:
      | To                        | Subject             | Body                       |
      | {SavedValue:FO1YopmailId} | RE: Automation Test | Automation Test Email Body |
    And I wait for "7" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    Then I softly can see row level action button "Reply" against "RE: Automation Test" in flex table with id "---announcement:-:collabMessages---"
    Then I softly can see row level action button "View" against "RE: Automation Test" in flex table with id "---announcement:-:collabMessages---"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Messages" sub tab
    #542987
    Then I softly do not see top right button "Send Email" inside flex table "---announcement:-:collabMessages---"
    Then I softly cannot see row level action button "Reply" against "Automation Test" in flex table with id "---announcement:-:collabMessages---"
    Then I softly can see row level action button "View" against "Automation Test" in flex table with id "---announcement:-:collabMessages---"
    Then I softly cannot see row level action button "Reply" against "RE: Automation Test" in flex table with id "---announcement:-:collabMessages---"
    Then I softly can see row level action button "View" against "RE: Automation Test" in flex table with id "---announcement:-:collabMessages---"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_CE   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_LEA   |

  @542989 @542991 @NYSEDSprint-17 @US-539917 @M05 @santosh
  Scenario Outline:  Verify that Internal User cannot add / update / delete the added budget, under the budget category. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Accepted"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:FD Username} |
    And I wait for "2" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter "NYSED_RiskAssesment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I click on "Generate GAN" in the page details
    And I pause execution for "10" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    #542989
    Then I softly can see top right button "Accept after Approval" in page detail
    Then I softly can see top right button "Reject" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    #542991
    Then I softly cannot see top right button "Accept after Approval" in page detail
    Then I softly cannot see top right button "Reject" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    #542991
    Then I softly cannot see top right button "Accept after Approval" in page detail
    Then I softly cannot see top right button "Reject" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    #542991
    Then I softly cannot see top right button "Accept after Approval" in page detail
    Then I softly cannot see top right button "Reject" in page detail

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @542890 @497051 @542879 @542877 @542896 @542861 @542880 @Sprint-17 @US-541953 @M05 @YugaC
  Scenario: Verify that FD users see that the subaward budget is copied from the related application's budget periods table when the budget type is FS-10.
  |Verify that Project ID is copied from FDM to Award|
  |Verify that the FD users see all fields in the Budget summary section and the Budget summary by focus area section copied from the related application.|
  |Verify that the FD users see all fields in the Place of Performance section copied from the related application's Overview tab -> Primary Place of Performance.|
  |Verify that the FD users see that the approvers details are copied from the related announcement in the Approvers section under the Responsibilities tab on the Subaward layout.|
  |Verify that the FD users see the Fund Year and the Project ID Seq. No. fields copied from FDM to Award.|
  |Verify that the FD users see the Funding Account Information copied from the related FDM to the Award.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I wait for "3" seconds
    When I navigate to "Funding Decision Memo" sub tab
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Project ID" as "FDMProjectID" from flex table "---applicationReview:-:recommendedTableId---"
    And I save the value from row "1" for column name "Funding Account" as "FundingAccount" from flex table "---applicationReview:-:FDM_FA_TableID---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #497051
    Then I softly see field "Project ID" as "{SavedValue:FDMProjectID}" in "Subaward Information" pageblock
    #542861
    Then I softly see field "Fund Year" as "1992-01"
    #542877
    Then I see below fields in "Place of Performance" page block
      | Street | PO Box | City | County Code | State | Zip Code | Country |
    Then I softly see field "Street" as "6fxpxo301qdm3sednl84zmfr80jb1qoin6vxxh00lyjz4oj1b6xly4gjh5au2zwb8dq6zbwqk2fj0rdly6q3mna63bh70jpjffn5p4snuitk6hsp4ekrn0k3o0l8cgzu2vavat584k78urlq4irsipk9w5lu82ypxhba1b3ns62f3bapp8rfvkcy4tsba9xzf43mxnop4idkf3irnyjnnnok8lltf4to68hwu4rab15igjs66fth3wntx59z56r"
    Then I softly see field "PO Box" as "6fxpxo301qdm3sednl84zmfr80jb1qoin6vxxh00lyjz4oj1b6xly4gjh5au2zwb8dq6zbwqk2fj0rdly6q3mna63bh70jpjffn5p4snuitk6hsp4ekrn0k3o0l8cgzu2vavat584k78urlq4irsipk9w5lu82ypxhba1b3ns62f3bapp8rfvkcy4tsba9xzf43mxnop4idkf3irnyjnnnok8lltf4to68hwu4rab15igjs66fth3wntx59z56r"
    Then I softly see field "City" as "ankfibmuqjkltxbkxaauqdsyvohrsrbtnsllcvef"
    Then I softly see field "County Code" as "12"
    Then I softly see field "State" as "AK"
    Then I softly see field "Zip Code" as "68502"
    Then I softly see field "Country" as "USA"
    When I navigate to "Budget" sub tab
    And I wait for "2" seconds
    #542879
    Then I see below fields in "Budget Summary" page block
      | Budget Period End Date | Amendment Deadline | FS-10F Due Date | New Obligation | Cumulative Obligation | Total Commitment | Match this Budget Period | Waiver | Allocation Amount | Reallocation | Total Available | Indirect Rate (%) | Maximum Indirect Allowed | Budgeted Direct Amount | Requested Indirect Amount | Total Budgeted Amount |
    Then I softly see field "Budget Period End Date" as "{Date:M/d/yyyy::d+150}"
    Then I softly see field "Amendment Deadline" as "{Date:M/d/yyyy::d+140}"
    Then I softly see field "FS-10F Due Date" as "{Date:M/d/yyyy::d+100}"
    Then I softly see field "New Obligation" as "$1,000"
    Then I softly see field "Cumulative Obligation" as "$0"
    Then I softly see field "Total Commitment" as "$1,000"
    Then I softly see field "Match this Budget Period" as "$100"
    Then I softly see field "Waiver" as "N/A"
    Then I softly see field "Allocation Amount" as "$1000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Indirect Rate (%)" as "20.83%"
    Then I softly see field "Maximum Indirect Allowed" as "$208"
    Then I softly see field "Budgeted Direct Amount" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$0"
    Then I softly see field "Total Budgeted Amount" as "$1,000"
    Then I see only the following rows under the following headers in table with id "---subAwardFromFDM:-:focusAreaTableId---" :
      | Actions     | Title                           | Start Date            | End Date               | Maximum Indirect Allowed | Budgeted Direct Amount | Requested Indirect Amount | Total Budgeted Amount |
      | Action menu | Automation Permanent Focus Area | {Date:M/d/yyyy::d+50} | {Date:M/d/yyyy::d+150} | $208                     | $1,000                 | $0                        | $1,000                |
      |             | Grand Total                     |                       |                        | $208                     | $1,000                 | $0                        | $1,000                |
    #542890
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries | 15                   | $1,000       |
      | Action menu | Support Staff Salaries      | 16                   | $0           |
      | Action menu | Purchased Services          | 40                   | $0           |
      | Action menu | Supplies and Materials      | 45                   | $0           |
      | Action menu | Travel Expenses             | 46                   | $0           |
      | Action menu | Employee Benefits           | 80                   | $0           |
      | Action menu | Indirect Cost               | 90                   | $0           |
      | Action menu | BOCES Purchased Services    | 49                   | $0           |
      | Action menu | Minor Remodeling            | 30                   | $0           |
      | Action menu | Equipment                   | 20                   | $0           |
      |             | Grand Total                 |                      | $1,000       |
    #542880
    Then I see the following headers in table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Available Balance | Pre-Encumbrance Balance | Enc Life |
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" :
      | Actions     | Funding Account             | Fund Year | Funding Account Title                      | Funding Account Message | Pre-Encumbrance Balance | Enc Life |
      | Action menu | {SavedValue:FundingAccount} | 1990-25   | Automation Permanent State Funding Account | StateMessage            | $1,000                  | $1,000   |
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    #542896
    Then I see only the following rows under the following headers in table with id "---subAwardFromFDM:-:awardApproverTableId---" :
      | Actions     | Name          | Award | Amendment Request | Reimbursement | Risk Assessment |
      | Action menu | Automation PM | NA    | NA                | NA            | NA              |

  @542891 @545508 @Sprint-17 @US-541953 @M05 @YugaC
  @545508 @Sprint-19 @US-541720 @M05
  Scenario: Verify that FD users see that the subaward budget is copied from the related application's budget periods table when the budget type is Lump Sum.
  |Verify that the FD cannot see on the Grant layout -> Overview tab -> Grant Information section, a new field 'Contractual?' is added if Budget Type is Lump sum.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "LUMPSUM_BUDGETCATEGORY"
    And I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And  I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}" for Lump Sum Type
    And I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #545508
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly do not see field "Contractual?" inside "Grant Information" section
    #542891
    When I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category | Budget Category Code | Award Amount |
      | Action menu | Lump Sum        | 0                    | $1,000       |
      |             | Grand Total     |                      | $1,000       |

  @545484 @Sprint-21 @US-541720 @M05 @YugaC
  Scenario Outline: Verify that the FD can see on the Grant layout -> Overview tab -> Grant Information section, a new field 'Contractual?' is added. ('Contractual? field is set to Yes)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
      #545478
    Then I softly see field "Contractual?" is not editable
    Then I softly see field "Contractual?" as "Yes" in "Grant Information" pageblock
    Examples:
      | Announcement Name                                | Coordinator |
      | {SavedValue:Automation Runtime FDM Announcement} | FD          |

  @545506 @Sprint-21 @US-541720 @M05 @YugaC
  Scenario Outline:Verify that the FD can see on the Grant layout -> Overview tab -> Grant Information section, a new field 'Contractual?' is added.  ('Contractual? field is set to No)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:PM Username} | Step 1 |
      | {SavedValue:FD Username} | Step 2 |
    When I navigate to "Funding Decision Memo" sub tab
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000               | 1000                    | Yes                   | Recommended |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "AWS" into field "GrantCode__c"
    And I enter value "Yes" into field "NYSED_OSCApproved__c"
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "2" seconds
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:ANNEGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:ANNEGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I wait for "2" seconds
    And I navigate to "Applications" tab
    And I wait for "2" seconds
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ANNEGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:ANNEGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I navigate to "Funding Decision Memo" sub tab
    And I wait for "2" seconds
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I save the value from row "1" for column name "Grant" as "GrantID" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on hyperlink containing value "{SavedValue:GrantID}"
    And I wait for "4" seconds
    And I switch to tab number "1"
    And I wait for "4" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Contractual?" is not editable
    Then I softly see field "Contractual?" as "No" in "Grant Information" pageblock

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | FO          |

  @NYSED-3766 @Sprint-27 @US-NYSED-3552 @M05 @YugaC
  Scenario Outline: Verify that the Supporting Document Checklist section-level ‘Add’ button is visible to all FD users, and Inline Edit, Delete, and Upload Template actions are available to the all FD users. - Award Via FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To  | Status |
      | Automation  | Mandatory | Application | Active |
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "Automation" in flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    Then I softly can see row level action button "Delete" against "Automation" in flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    Then I softly can see row level action button "Upload Template" against "Automation" in flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Files" sub tab
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" :
      | Actions     | Description | Required  | Applies To  | Status | Template Link  | Subrecipient Document Link |
      | Action menu | Automation  | Mandatory | Application | Active | Not Applicable | Not Applicable             |
    Then I softly can see row level action button "Edit" against "Automation" in flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    Then I softly can see row level action button "Delete" against "Automation" in flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    Then I softly can see row level action button "Upload Template" against "Automation" in flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    Given I edit the following rows inline in flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" by clicking "Edit" :
      | Description | Required |
      | Automation  | Optional |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" :
      | Actions     | Description | Required | Applies To  | Status | Template Link  | Subrecipient Document Link |
      | Action menu | Automation  | Optional | Application | Active | Not Applicable | Not Applicable             |
    When I click on "Upload Template" icon for "Automation" inside flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I wait for "5" seconds
    When I click modal button "Close"
    Then I softly see value "View" for title "Template Link" inside table "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" by clicking "Add" :
      | Description | Required  | Applies To  | Status |
      | Automation2 | Mandatory | Application | Active |
    When I click on "Delete" icon for "Automation" inside flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    Then I see only the following rows under the following headers in table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" :
      | Actions     | Description | Required  | Applies To  | Status | Template Link  | Subrecipient Document Link |
      | Action menu | Automation2 | Mandatory | Application | Active | Not Applicable | Not Applicable             |
    Examples:
      | Announcement Name                                | Coordinator |
      | {SavedValue:Automation Runtime FDM Announcement} | FD          |

  @NYSED-3767 @NYSED-3768 @Sprint-27 @US-NYSED-3552 @M05 @YugaC
  Scenario Outline: Verify that the Grant Files section-level ‘Add Files’ button is visible to all FD users, and Inline Edit, and Delete actions are available to the record owner only. - Award Via FDM
  |Verify that the Supporting Document Checklist section-level ‘Add’ button and Grant Files section-level ‘Add Files’ button are not visible to other than FD user - Award Via FDM|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Files" sub tab
    #NYSED-3767
    Then I softly can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Files" sub tab
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---" :
      | Actions     | Title          | Classification | File Extension | Description |
      | Action menu | Attachment.pdf | Other          | pdf            |             |
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    Then I softly can see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    And I upload attachment without random number "Attachment1.pdf" of type "Other" from computer
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "Attachment1.pdf" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    Then I softly can see row level action button "Delete" against "Attachment1.pdf" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    Then I softly can see row level action button "View" against "Attachment1.pdf" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    Then I softly can see row level action button "Download" against "Attachment1.pdf" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    #NYSED-3768
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Files" sub tab
    And I wait for "2" seconds
    Then I softly cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    Then I softly cannot see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Files" sub tab
    And I wait for "2" seconds
    Then I softly cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---"
    Then I softly cannot see top right button "Add Files" in flex table with id "---subAwardStandAlone:-:GrantsAttachmentTableId---"

    Examples:
      | Announcement Name                                | Coordinator |
      | {SavedValue:Automation Runtime FDM Announcement} | FD          |

  @NYSED-7332 @NYSED-7335 @NYSEDSprint-32 @US-NYSED-6293 @M05 @YugaC
  Scenario Outline:Verifies that the FD User can see that the confirmation message is updated when clicking on the ‘Sent to Subrecipient’ when the Subaward is in the ‘Approved’ state.
  |Verifies that the Submit and Certify Role User can see that the confirmation message is updated when clicking on the ‘Accept after Approval’ action.|
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
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I enter "FDM_Award_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "8" seconds
    And I refresh the page
    And I pause execution for "2" seconds
    #NYSED-7335
    And I click on "Send to Subrecipient" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "This action will send the subaward to Subrecipient. Are you sure you want to Proceed?" is displayed
    When I click alert button "OK"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Budget" sub tab
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-7332
    And I click on "Accept after Approval" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "This action will accept and activate the subaward. Are you sure you want to proceed?" is displayed
    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-7336 @NYSEDSprint-32 @US-NYSED-6293 @M05 @YugaC
  Scenario:Verifies that the Internal User can see that the confirmation message is updated when the approver clicks on the ‘Reject’ action and ‘Submit’.
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
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I enter "FDM_Award_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I select radio button "Reject" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "Are you sure you want to reject this request? Once rejected, it cannot be reactivated or edited." is displayed

  @NYSED-7845 @NYSED-7847 @NYSED-7851 @NYSED-7849 @US-2566
  Scenario Outline: 544586 - Verify that the FD users cannot see the 'Child Organization' field on the Award layout -> Overview tab -> Subrecipient Information section when 'Creating for' is selected as the 'Self' value on the Application layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-7845
    Then I softly do not see field "Child Organization" inside "Subrecipient Information" section
    #NYSED-7847
    Then I softly see field "Not For Profit" inside "Subrecipient Information" section
    Then I softly see field "Creating For" inside "Subrecipient Information" section
    Then I softly see field "Not For Profit" is not editable
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Creating For" is not editable
    Then I softly see field "Creating For" as "Self"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
  #NYSED-7851
    Then I softly do not see field "Child Organization" inside "Subrecipient Information" section
  #NYSED-7849
    Then I softly see field "Not For Profit" inside "Subrecipient Information" section
    Then I softly see field "Creating For" inside "Subrecipient Information" section
    Then I softly see field "Not For Profit" is not editable
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Creating For" is not editable
    Then I softly see field "Creating For" as "Self"
    Examples:
      | Announcement Name                                | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | FD          | GRANTEE_SC   |

  @NYSED-7848 @NYSED-7850 @US-2566
  Scenario Outline: 544586 - Verify that the FD users cannot see the 'Child Organization' field on the Award layout -> Overview tab -> Subrecipient Information section when 'Creating for' is selected as the 'Self' value on the Application layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    And I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    #NYSED-7848
    Then I softly see field "Child Organization" inside "Subrecipient Information" section
    Then I softly see field "Child Organization" is not editable
    Then I softly see field "Not For Profit" is not editable
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Creating For" is not editable
    Then I softly see field "Creating For" as "On behalf of"
  #NYSED-7850
    And I click on "Send to Subrecipient" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I click on "Edit" in the page details
    Then I softly see field "Child Organization" inside "Subrecipient Information" section
    Then I softly see field "Not For Profit" inside "Subrecipient Information" section
    Then I softly see field "Creating For" inside "Subrecipient Information" section
    Then I softly see field "Child Organization" is not editable
    Then I softly see field "Not For Profit" is not editable
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Creating For" is not editable
    Then I softly see field "Creating For" as "On behalf of"
    Examples:
      | Announcement Name                                | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | FD          | GRANTEE_SC   |

  @NYSED-7846 @NYSED-7852 @US-2566
  Scenario Outline: 544828 - Verify that the FD users or program coordinators see the 'Not For Profit' field added on the award layout and that this is a reference field from the organization profile, the 'Not For Profit' field value. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "Edit" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-7846
    And I navigate to "Overview" sub tab
    Then I softly see field "Not For Profit" inside "Subrecipient Information" section
    Then I softly see field "Not For Profit" is not editable
    Then I softly see field "Not For Profit" as "Yes"
    And I wait for "2" seconds
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I navigate to "Overview" sub tab
    #NYSED-7846
    Then I softly see field "Not For Profit" inside "Subrecipient Information" section
    Then I softly see field "Not For Profit" is not editable
    Then I softly see field "Not For Profit" as "Yes"
    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @545478 @Sprint-21 @US-541720 @M05 @YugaC
  Scenario Outline: Verify that the associated Program Coordinator/s can see on the Grant layout ->Overview tab ->Grant Information section, a new field 'Contractual?' is added. ('Contractual? field is set to Yes)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    When I enter in modal value "Yes" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #545478
    Then I softly see field "Contractual?" is not editable
    Then I softly see field "Contractual?" as "Yes" in "Grant Information" pageblock
    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @545483 @Sprint-21 @US-541720 @M05 @YugaC
  Scenario Outline: Verify that the associated Program Coordinator/s can see on the Grant layout -> Overview tab -> Grant Information section, a new field 'Contractual?' is added. ('Contractual? field is set to No)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    When I enter in modal value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #545478
    Then I softly see field "Contractual?" is not editable
    Then I softly see field "Contractual?" as "No" in "Grant Information" pageblock
    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @545507 @Sprint-21 @US-541720 @M05 @YugaC
  Scenario Outline: Verify that the associated Program Coordinator/s cannot see on the Grant layout -> Overview tab -> Grant Information section, a new field 'Contractual?' is added if Budget type is Lump Sum.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" without waiting for record
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly do not see field "Contractual?" inside "Grant Information" section
    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-546045 @NYSEDSprint-19 @US-NYSED-544810 @M05 @YugaC
  Scenario Outline: Verify that the Program Coordinators can see that for Direct Grant-award related to Competitive announcement where Focus area is set to 'Yes', and budget type is 'FS-10', the indirect cost related calculation takes place at focus area level. :Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_COMPETITIVE_DIRECTED_ANN_TWO_FOCUS_AREA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "Edit" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    Given I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associateFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date              | End Date                 |
      | Automation Permanent Focus Area  | {Date:MM/dd/yyyy::d+50} | {Date:MM/dd/yyyy::d+120} |
      | Automation Permanent Focus Area2 | {Date:MM/dd/yyyy::d+70} | {Date:MM/dd/yyyy::d+90}  |
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---subAwardStandAlone:-:subrecipientFocusAreaTableId---" :
      | Title | Start Date | End Date | Maximum Indirect Allowed | Budgeted Direct Amount | Requested Indirect Amount | Total Budgeted Amount |
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "New" :
      | Description    | Proposed Expenditure |
      | Position Title | 80                   |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I refresh the page
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subrecipientFocusAreaTableId---" :
      | Title                            | Start Date            | End Date               | Maximum Indirect Allowed | Budgeted Direct Amount | Requested Indirect Amount | Total Budgeted Amount |
      | Automation Permanent Focus Area  | {Date:M/d/yyyy::d+50} | {Date:M/d/yyyy::d+120} | $100                     | $1,000                 | $80                       | $1,080                |
      | Automation Permanent Focus Area2 | {Date:M/d/yyyy::d+70} | {Date:M/d/yyyy::d+90}  | $0                       | $0                     | $0                        | $0                    |
      | Grand Total                      |                       |                        | $100                     | $1,000                 | $80                       | $1,080                |
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-546043 @NYSEDSprint-19 @US-NYSED-544810 @M05 @YugaC
  Scenario Outline: Verify that the Grantee Users can see that for Direct Grant-award related to Directed announcement where Focus area is set to 'Yes', and budget type is 'FS-10', the indirect cost related calculation takes place at focus area level. :Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_COMPETITIVE_DIRECTED_ANN_TWO_FOCUS_AREA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "Edit" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    Given I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associateFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date              | End Date                 |
      | Automation Permanent Focus Area  | {Date:MM/dd/yyyy::d+50} | {Date:MM/dd/yyyy::d+120} |
      | Automation Permanent Focus Area2 | {Date:MM/dd/yyyy::d+70} | {Date:MM/dd/yyyy::d+90}  |
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---subAwardStandAlone:-:subrecipientFocusAreaTableId---" :
      | Title | Start Date | End Date | Maximum Indirect Allowed | Budgeted Direct Amount | Requested Indirect Amount | Total Budgeted Amount |
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "New" :
      | Description    | Proposed Expenditure |
      | Position Title | 80                   |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I refresh the page
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subrecipientFocusAreaTableId---" :
      | Title                            | Start Date            | End Date               | Maximum Indirect Allowed | Budgeted Direct Amount | Requested Indirect Amount | Total Budgeted Amount |
      | Automation Permanent Focus Area  | {Date:M/d/yyyy::d+50} | {Date:M/d/yyyy::d+120} | $100                     | $1,000                 | $80                       | $1,080                |
      | Automation Permanent Focus Area2 | {Date:M/d/yyyy::d+70} | {Date:M/d/yyyy::d+90}  | $0                       | $0                     | $0                        | $0                    |
      | Grand Total                      |                       |                        | $100                     | $1,000                 | $80                       | $1,080                |
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-7216 @NYSEDSprint-32 @US-NYSED-6293 @M05
  Scenario Outline: Verifies that the Internal User can see that on the Grant layout 'First Payment %' field is visible when 'Advance Payment Allowed?' is set to Yes on the announcement layout. And sees the Internal Program help text is updated.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO_ADVANCE_PERMITTED_YES"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see field "First Payment %" as "12.60%" in "Grant Details" pageblock
    When I hovering mouse on help text icon inside page block detail "Internal Program"
    Then I softly see "The internal program to which the Grant belongs." shown as help text

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-7218 @NYSEDSprint-32 @US-NYSED-6293 @M05
  Scenario Outline: Verifies that the Internal User, on the Grant layout, cannot see the 'First Payment %' field when 'Advance Payment Allowed?' is set to No on the announcement layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly do not see field "First Payment %" inside "Grant Details" section

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-7221 @NYSEDSprint-32 @US-NYSED-6293 @M05
  Scenario Outline: Verifies that the Internal User and Grantee user can see that the Contract Number column is added after the EGMS ID column in the Grants list view.
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    Then I see only the following headers in table with id "---subAwardStandAlone:-:activeGrantsTableId---" :
      | Actions | EGMS ID | Contract Number | Grant Title | Grantor Organization | Project Period | # of Subawards | Cumulative Obligation | Active Subaward | Status |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---subAwardFromFDM:-:RecipientGrantsTableId---" :
      | Actions | EGMS ID | Contract Number | Grant Title | Grantor Organization | Project Period | # of Subawards | Cumulative Obligation | Active Subaward | Status |
    Examples:
      | Coordinator | ExternalUser |
      | PO          | GRANTEE_SC   |

  @NYSED-7242 @NYSEDSprint-32 @US-NYSED-6293 @M05
  Scenario Outline: Verifies that the Internal User can see that the following fields related changes are made on the Subaward Layout sections.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    Then I see only the following headers in table with id "---subAwardStandAlone:-:objectivesTableId---" :
      | Actions | EGMS ID | Title | Strategic Plan | Year Created |
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly see field "Required Match %" inside "Budget Summary" section
    Then I see only the following headers in table with id "---subAwardStandAlone:-:fundingAccountsTableId---" :
      | Actions | Funding Account EGMS ID | Fund Year | Funding Account Title | Funding Account Message | Available Balance | Enc Life |
    And I navigate to "Actuals" sub tab
    And I wait for "2" seconds
    Then I see the following headers in table with id "---subAwardStandAlone:-:FundingAccountActualsTableId---" :
      |  | Actions | Funding Account EGMS ID | Funding Account Title | Funding Account Message | Fund Year | Enc Life | Outstanding Encumbrance | Payment Split | Revised Payment Split | Withheld Amount | DeObligation Amount |
    And I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    Then I see the following headers in table with id "---subAwardStandAlone:-:approversTableId---" :
      | Actions | Name | Award | Amendment Request | Reimbursement |
    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-7337 @NYSEDSprint-32 @US-NYSED-6293 @M05 @YugaC @Bug-NYSED-8444
  Scenario Outline: Verifies that the Internal User can see that the Announcement Message field is visible from Announcement layout -> Messages tab → ‘Announcement Message' section on the Subaward layout → Messages tab → 'Subaward Related Message' section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "2" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Messages" sub tab
    And I wait for "2" seconds
    Then I softly see field "Announcement Message" inside "Subaward Related Message" section
    Then I softly see field "Announcement Message" is not editable

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-7925 @NYSEDSprint-32 @US-NYSED-6293 @M05 @YugaC
  Scenario Outline: Verifies that the Internal User and Grantee user cannot see the ‘Required Match %’ field on the Subaward layout → Budget tab → Budget Summary section, when the ‘Subrecipient Match Required?’ is set to No on the related Grant.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "Edit" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    Then I softly do not see field "Required Match %" inside "Budget Summary" section
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly do not see field "Required Match %" inside "Budget Summary" section
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-8381 @NYSED-8377 @NYSED-Sprint-32 @US-NYSED-6867 @M05
  Scenario Outline:Verify that the Grantee user cannot see the ‘First Payment %’ field if Advance Payment Allowed? is set to ‘No’ at Grant Layout->Overview tab->Grant Information section.
  |Verify that the Grantee user cannot see the following fields if ‘Contractual?’ is set to ‘No’ at Grant Layout->Overview tab->Grant Information Section.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "Edit" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsTableId---"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #NYSED-8381
    Then I softly do not see field "First Payment %" inside "Grant Information" section
    #NYSED-8377
    Then I softly do not see field "Contract Start Date" inside "Grant Information" section
    Then I softly do not see field "Contract End Date" inside "Grant Information" section
    Then I softly do not see field "Contract Number" inside "Grant Information" section
    Then I softly do not see field "SFS Contract Id" inside "Grant Information" section
    Then I softly do not see field "Contract Amendment Version" inside "Grant Information" section
    Then I softly do not see field "Contract Amendment Status" inside "Grant Information" section
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-8375 @NYSED-8383 @NYSED-8385 @NYSED-Sprint-32 @US-NYSED-6867 @M05
  Scenario Outline:Verify that the Grantee user can see the fields below are added after Contractual? field, and shown only if ‘Contractual?’ is set to ‘Yes’ in the given sequence at the Grant Layout->Overview tab->Grant Information Section,
  |Verify that the Grantee user can see the ‘First Payment %’ field if Advance Payment Allowed? is set to ‘Yes’ at Grant Layout->Overview tab->Grants Information section.|
  |Verify that the Grantee user can see the following fields added if ‘Contractual?’ is set to ‘Yes’ in the given sequence at Subaward Layout → Overview tab → Subaward Information section.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO_ADVANCE_PERMITTED_YES"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "CONTRACTUAL_YES"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "Edit" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsTableId---"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #NYSED-8375
    Then I softly see field "Contract Start Date" inside "Grant Information" section
    Then I softly see field "Contract End Date" inside "Grant Information" section
    Then I softly see field "Contract Number" inside "Grant Information" section
    Then I softly see field "SFS Contract Id" inside "Grant Information" section
    Then I softly see field "Contract Amendment Version" inside "Grant Information" section
    Then I softly see field "Contract Amendment Status" inside "Grant Information" section
    Then I softly see field "Contract Start Date" is not editable
    Then I softly see field "Contract End Date" is not editable
    Then I softly see field "Contract Number" is not editable
    #NYSED-8383
    Then I softly see field "First Payment %" inside "Grant Information" section
    #NYSED-8385
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see field "Subaward Title" inside "Subaward Information" section
    Then I softly see field "Subaward Type" inside "Subaward Information" section
    Then I softly see field "Final Entry Date" inside "Subaward Information" section
    Then I softly see field "Version  Number" inside "Subaward Information" section
    Then I softly see field "Announcement Fund Year" inside "Subaward Information" section
    Then I softly see field "Project ID Seq. No." inside "Subaward Information" section
    Then I softly see field "Project ID" inside "Subaward Information" section
    Then I softly see field "Bud Stop" inside "Subaward Information" section
    Then I softly see field "Pay Stop" inside "Subaward Information" section
    Then I softly see field "Contract Stop" inside "Subaward Information" section
    Then I softly see field "Project Stop" inside "Subaward Information" section
    Then I softly see field "Contract Number" inside "Subaward Information" section
    Then I softly see field "Contract Amendment Version" inside "Subaward Information" section
    Then I softly see field "Contract Amendment Status" inside "Subaward Information" section
    Then I softly see field "Final Entry Date" is not editable
    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-8841 @NYSEDSprint-32 @US-NYSED-6298 @M04 @YugaC
  Scenario Outline: Verify that the Internal User can see an entered 'Announcement Message' on the announcement layout, which is displayed in the 'Announcement Message' field at the Subaward layout -> Messages Tab -> Subaward Related Message section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_COMPETITIVE_DIRECTED_ANN_TWO_FOCUS_AREA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Messages" sub tab
    And I wait for "2" seconds
    Then I softly see field "Announcement Message" as "Automation Message" in "Subaward Related Message" pageblock

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-8335 @NYSED-Sprint-32 @US-NYSED-2158
  Scenario Outline:Verify that the Internal user can see the following fields added if ‘Contractual?’ is set to ‘Yes’ in the given sequence at Subaward Layout → Overview tab → Subaward Information section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DG_YES_BA_COTRACTUAL_YES_BUDSTOP_PRESENT_PAYSTOP_PRESENT"
    Given I created standalone grant from approved announcement with announcement "<Announcement Name>" and properties "CONTRACTUAL_YES_CONTRACTSTOP_PRESENT"
    Given I activated standalone subaward from approved announcement with announcement "<Announcement Name>" and properties "PROJECTSTOP_PRESENT"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    And I save the field labeled "Fund Year" as "AnnouncementFundYear"
    And I save the field labeled "Bud Stop" as "BudStop"
    And I save the field labeled "Pay Stop" as "PayStop"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I save the field labeled "Contract Stop" as "ContractStop"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    #NYSED-8335
    Then I softly see field "Subaward Title" as "{SavedValue:Automation Runtime Announcement Direct Grant}"
    Then I softly see field "Subaward Type" as "Initial"
    Then I softly see field "Final Entry Date" as "{Date:M/d/uuuu}"
    Then I softly see field "Version Number" as "1"
    Then I softly see field "Announcement Fund Year" as "{SavedValue:AnnouncementFundYear}"
    Then I softly see field "Project ID Seq. No." inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Bud Stop" as "{SavedValue:BudStop}"
    Then I softly see field "Pay Stop" as "{SavedValue:PayStop}"
    Then I softly see field "Contract Stop" as "{SavedValue:ContractStop}"
    Then I softly see field "Project Stop" as "{Date:M/d/yyyy::d+150}"
    Then I softly see field "Contract Number" as "12345"
    Then I softly see field "Contract Amendment Version" inside page block
    Then I softly see field "Contract Amendment Status" inside page block
    Then I softly see field "OSC Approved?" inside page block

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-8816 @NYSED-Sprint-32 @US-NYSED-6966 @M05
  Scenario Outline: Verify that the Internal user cannot see the ‘Subawards - My Records' list filter from the Grants phase → Subawards left navigation module.
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    #NYSED-8816
    Then I softly do not see toggle option "Subawards - My Records" inside flex table id "---subAwardStandAlone:-:SubAwardTableId---"

    Examples:
      | UserType |
      | PM       |
      | PO       |
      | FO       |
      | FD       |

  @NYSED-8815 @NYSED-Sprint-32 @US-NYSED-6966 @M05
  Scenario Outline: Verify that the Internal user cannot see the ‘Grants - My Records' list filter from the Grants phase as well as from the Grants phase → Grants left navigation module.
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Grants" tab
    #NYSED-8815
    Then I softly do not see toggle option "Grants - My Records" inside flex table id "---subAwardStandAlone:-:GrantorGrantsTableId---"
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "2" seconds
    #NYSED-8815
    Then I softly do not see toggle option "Grants - My Records" inside flex table id "---subAwardStandAlone:-:GrantsAllTableId---"

    Examples:
      | UserType |
      | PM       |
      | PO       |
      | FO       |
      | FD       |

  @539261 @NYSEDSprint-15 @US-537967 @M05
  Scenario Outline:Verify that the internal users do not see the Business Forms section under the Files tab on the Grant layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Grant}" and properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Grant}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Grant}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
      #539261
    Then I softly do not see "Business Forms" page block displayed

    Examples:
      | UserType |
      | PM       |
#        | PO       |
#        | FO       |
#        | FD       |
#        | EXE      |

  @539289 @NYSEDSprint-15 @US-537967 @M05
  Scenario Outline:Verify that the grantee users do not see the Business Forms section under the Files tab on the Grant layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Grant}" and properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Grant}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Grant}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
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

  @539261 @NYSEDSprint-15 @US-537967 @M05
  Scenario Outline:Verify that the internal users do not see the Business Forms section under the Files tab on the Grant layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Grant}" and properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Grant}" in "---subAwardStandAlone:-:activeGrantsTableIdNew---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Grant}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableIdNew---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
      #539261
    Then I softly do not see "Business Forms" page block displayed

    Examples:
      | UserType |
      | PM       |
      | PO       |
      | FO       |
      | FD       |
      | EXE      |

  @NYSED-9186 @NYSED-9192 @NYSED-Sprint-32 @US-NYSED-8648 @M05
  Scenario Outline:Verify that Internal Profile User sees columns are updated as per below sequence on the Grants phase → Grants list view
  |Verify that Internal Profile User sees columns are updated as per below sequence on the Grants phase → Subawards left module list view|
    Given I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    #NYSED-9186
    Then I softly see column header "EGMS ID" inside table "---subAwardStandAlone:-:GrantorGrantsTableId---"
    Then I softly see column header "Contract Number" inside table "---subAwardStandAlone:-:GrantorGrantsTableId---"
    Then I softly see column header "Active Subaward" inside table "---subAwardStandAlone:-:GrantorGrantsTableId---"
    Then I softly see column header "Project ID" inside table "---subAwardStandAlone:-:GrantorGrantsTableId---"
    Then I softly see column header "Institution ID" inside table "---subAwardStandAlone:-:GrantorGrantsTableId---"
    Then I softly see column header "SED Code" inside table "---subAwardStandAlone:-:GrantorGrantsTableId---"
    Then I softly see column header "SED NYC" inside table "---subAwardStandAlone:-:GrantorGrantsTableId---"
    Then I softly see column header "Organization Name" inside table "---subAwardStandAlone:-:GrantorGrantsTableId---"
    Then I softly see column header "Grant Period" inside table "---subAwardStandAlone:-:GrantorGrantsTableId---"
    Then I softly see column header "# of Subawards" inside table "---subAwardStandAlone:-:GrantorGrantsTableId---"
    Then I softly see column header "Cumulative Obligation" inside table "---subAwardStandAlone:-:GrantorGrantsTableId---"
    Then I softly see column header "Status" inside table "---subAwardStandAlone:-:GrantorGrantsTableId---"
    Then I softly see column header "Application ID" inside table "---subAwardStandAlone:-:GrantorGrantsTableId---"
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "2" seconds
    #NYSED-9192
    Then I softly see column header "EGMS ID" inside table "---subAwardStandAlone:-:SubAwardTableId---"
    Then I softly see column header "Contract Number" inside table "---subAwardStandAlone:-:SubAwardTableId---"
    Then I softly see column header "Project ID" inside table "---subAwardStandAlone:-:SubAwardTableId---"
    Then I softly see column header "Announcement Fund Year" inside table "---subAwardStandAlone:-:SubAwardTableId---"
    Then I softly see column header "Institution ID" inside table "---subAwardStandAlone:-:SubAwardTableId---"
    Then I softly see column header "SED Code" inside table "---subAwardStandAlone:-:SubAwardTableId---"
    Then I softly see column header "Organization Name" inside table "---subAwardStandAlone:-:SubAwardTableId---"
    Then I softly see column header "Budget Period" inside table "---subAwardStandAlone:-:SubAwardTableId---"
    Then I softly see column header "Budget Period Dates" inside table "---subAwardStandAlone:-:SubAwardTableId---"
    Then I softly see column header "New Obligation" inside table "---subAwardStandAlone:-:SubAwardTableId---"
    Then I softly see column header "Status" inside table "---subAwardStandAlone:-:SubAwardTableId---"
    Then I softly see column header "Version" inside table "---subAwardStandAlone:-:SubAwardTableId---"

    Examples:
      | InternalUser |
#      | PM           |
      | PO           |
#      | FO           |
#      | FD           |
#      | EXE          |

  @NYSED-9190 @NYSED-9194 @NYSED-Sprint-32 @US-NYSED-8648 @M05
  Scenario Outline:Verify that External Profile User sees columns are updated as per below sequence on the Grants phase → Grants list view
  |Verify that External Profile User sees columns are updated as per below sequence on the Grants phase → Subawards left module list view|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Grants" tab
    #NYSED-9190
    Then I see only the following headers in table with id "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" :
      | Actions | EGMS ID | Contract Number | Active Subaward | Project ID | Grant Period | # of Subawards | Cumulative Obligation | Status | Application ID |
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" :
      | Actions | EGMS ID | Contract Number | Project ID | Announcement Fund Year | Budget Period | Budget Period Dates | New Obligation | Status | Version |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE         |
#      | GRANTEE_VO         |
#      | GRANTEE_LEA        |

  @NYSED-7534 @NYSED-7574 @NYSED-Sprint-32 @US-NYSED-5145 @M05
  Scenario Outline:Verify that the FD user can see that, on the subaward layout, the page-level button ‘Generate GAN’ is available in the ‘Activated’ state of the subaward.
  |Verify that no users other than FD users can see the page-level “Generate GAN” button when the subaward is in the Active status.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "SECOND_FUNDING_ACCOUNT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-7574
    Then I softly cannot see top right button "Generate GAN" in page detail
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-7574
    Then I softly cannot see top right button "Generate GAN" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-7574
    Then I softly cannot see top right button "Generate GAN" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-7574
    Then I softly cannot see top right button "Generate GAN" in page detail
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-7574
    Then I softly cannot see top right button "Generate GAN" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    Then I softly can see top right button "Generate GAN" in page detail
    And I click on "Generate GAN" in the page details
    And I wait for "4" seconds
    #NYSED-7534
    Then I softly see the text containing "The request for generating the Grant Award Notice has been submitted. Once the document is generated, it will be added to the Subaward Files section under the Files tab. Please refresh the page."
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Grant Award Notice" for title "Classification" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly see value "pdf" for title "File Extension" inside table "---subAwardStandAlone:-:addFilesTableId---"
    Then I softly see value "" for title "Description" inside table "---subAwardStandAlone:-:addFilesTableId---"

    Examples:
      | GrantName                                 |
      | {SavedValue:Automation Runtime FDM Grant} |

  @NYSED-8635 @NYSED-8294 @NYSED-Sprint-32 @US-NYSED-2158 @M05
  Scenario Outline:Verify that the Internal user can see the Final Entry Date field capture the date when the award is activated, at Subaward Layout → Overview tab → Subaward Information section.
  | |Verify that the Internal user can see the following fields added on the Grant Layout->Header.||
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    And I save the field labeled "Institution ID" as "InstitutionID"
    And I save the field labeled "SED Code" as "SEDCode"
    And I save the field labeled "Popular Name" as "PopularName"
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<GrantName>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<GrantName>" inside table
    And I wait for "2" seconds
    And I save the field labeled "Fund Year" as "AnnouncementFundYear"
    When I navigate to "Planning" tab
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-8635
    Then I softly see field "Status" as "Activated"
    Then I softly see field "Final Entry Date" as "{Date:M/d/uuuu}"
    And I save the field labeled "Project ID" as "ProjectID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "<GrantName>" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    #NYSED-8294
    Then I softly see field "EGMS ID" inside page block
    Then I softly see field "Project ID" as "{SavedValue:ProjectID}"
    Then I softly see field "Institution ID" as "{SavedValue:InstitutionID}"
    Then I softly see field "SED Code" as "{SavedValue:SEDCode}"
    Then I softly see field "Organization Name" as "{SavedValue:PopularName}"
    Then I softly see field "Status" as "Active"

    Examples:
      | GrantName                                 |
      | {SavedValue:Automation Runtime FDM Grant} |

  @NYSED-8301 @NYSED-Sprint-32 @US-NYSED-2158 @M05
  Scenario Outline:Verify that the Internal user cannot see the following fields if ‘Contractual?’ is set to ‘No’ at Grant Layout->Overview tab->Grant Information Section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Grant}" on announcement "{SavedValue:Automation Runtime FDM Grant}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Grant}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:FO Username} | Step 1 |
    And I navigate to "Funding Decision Memo" sub tab
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Contractual? | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | No           | 1000                    | Yes                   | Recommended |
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "AWS" into field "GrantCode__c"
    And I enter value "Yes" into field "NYSED_OSCApproved__c"
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - Approved"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I wait for "3" seconds
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I save the value from row "1" for column name "Grant" as "GrantID" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on hyperlink containing value "{SavedValue:GrantID}"
    And I wait for "4" seconds
    And I switch to tab number "1"
    And I wait for "4" seconds
    #NYSED-8301
    Then I softly do not see "Contract Start Date" inside page block detail
    Then I softly do not see "Contract End Date" inside page block detail
    Then I softly do not see "Contract Number" inside page block detail
    Then I softly do not see "SFS Contract Id" inside page block detail
    Then I softly do not see "Contract Amendment Version" inside page block detail
    Then I softly do not see "Contract Amendment Status" inside page block detail

    Examples:
      | Announcement Name                         | Coordinator |
      | {SavedValue:Automation Runtime FDM Grant} | FO          |
