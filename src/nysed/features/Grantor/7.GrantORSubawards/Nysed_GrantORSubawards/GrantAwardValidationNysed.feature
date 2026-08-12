@GrantSubawardNysed @DirectGrantSubawardValidationNysed @grantUpdateFile9
Feature: Validate all scenarios in the award related to Validations

  @543523 @543526 @Yogita @needtoreview @passed
  Scenario Outline: Verify that the Grant Finance Coordinator/s can see Edit button and edit rights on the 'Responsibilities-->Peer Reviewers section when award is in Sent to Grant Finance Office state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
#    543526
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Program Reviewer | Review  details | 10       | No                   |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:peerReviewersTableId---" :
      |        | Actions     | Reviewer Name            | Role             | Description    | Due Date               | Allow Record Editing | Status    |
      | extend | Action menu | {SavedValue:PO Username} | Program Reviewer | Review details | {Date:M/dd/yyyy::d+10} | Yes                  | Submitted |
      | extend | Action menu | {SavedValue:PM Username} | Program Reviewer | Review details | {Date:M/dd/yyyy::d+10} | No                   | Created   |
    Then I softly can see row level action button "Edit" against "{SavedValue:PM Username}" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:PM Username}" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly can see row level action button "Send for Review" against "{SavedValue:PM Username}" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside table
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | Only Fiscal Reviews are allowed in this state. |
    And I click on "Delete" icon for "{SavedValue:PM Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    Then I softly see field "Status" as "Submitted to Grant Finance Review"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @543531 @Yogita @needtoreview @passed
  Scenario Outline: Verify that the Grant Finance Coordinator/s can see the validation when clicking on the Complete Review button and the assigned peer review is not yet submitted.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    And I pause execution for "3" seconds
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | Responsibilities Tab - At least one Fiscal Review must be completed before completing reviews. |
      | Responsibilities Tab - All assigned reviews must be submitted before completing reviews.       |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @543528 @543527 @Yogita @needtoreview @passed
  Scenario Outline: Verify that the Grant Finance Coordinator/s can see the validation when clicking on the Send Back to Program Office button and the assigned peer review is not yet submitted in Submitted to Grant Finance Review state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    Then I softly see field "Status" as "Submitted to Grant Finance Review"
    Then I softly can see top right dropdown button "Send Back to Program Office" in page detail
    Then I softly cannot see top right dropdown button "Send To Subrecipient" in page detail
    When I click on "Send Back to Program Office" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities Tab - All assigned reviews must be submitted before sending back to Program Office. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @543470 @Yogita @passed
  Scenario Outline: Verify that the Program Coordinator/s can see New button and edit rights on the Responsibilities-->Peer Reviewers section when award is in Submitted to Grantor state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    Then I softly can see row level action button "Edit" against "{SavedValue:PO Username}" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:PO Username}" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly can see row level action button "Send for Review" against "{SavedValue:PO Username}" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Edit" icon for "{SavedValue:PO Username}" inside table
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
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

  @NYSED-543771 @NYSED-543530 @M05 @Ankit @passed
  Scenario Outline:  Verify that Internal User cannot add / update / delete the added budget, under the budget category. - Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
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
    And I click on "Complete Review" in the page details
    And I wait for "3" seconds
    #543530
    Then I softly see the following messages in the page details contains:
      | Responsibilities Tab - At least one Fiscal Review must be completed before completing reviews. |
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
    And I wait for "2" seconds
    Then I can see row level action button "Resend For Review" against "Fiscal Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Resend for Review" icon for "{SavedValue:PO Username}" inside table
    Then I softly see the following messages in the page details contains:
      | Resubmission is not allowed — the review process for this award has been closed. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @543509 @2 @DYogita @passed @ReviewRemaining
  Scenario Outline: Verify that the Program Coordinator/s can see the validation if Program Reviews is not completed and clicks on the Send To Subrecipient button when award is in Submitted for Review state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly cannot see top right dropdown button "Complete Review" in page detail
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | Responsibilities Tab - All 'Program Reviews' must be completed before sending the subaward to the subrecipient. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @543763 @3 @ReviewRemaining
  Scenario Outline: Verify that the Program Coordinator/s can see the validation if they try to resend any program review on the Responsibilities-->Peer Reviewers section for the previously assigned review when the award is in is in Accepted state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend For Review" against "Program Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Resend For Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    Then I see the following messages in the page details contains:
      | Resubmission is not allowed — the review process for this award has been closed. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @543525 @4 @DYogita @passed @ReviewRemaining
  Scenario Outline: Verify that the Program Coordinator/s can see the validation if they try to resend any program review on the Responsibilities-->Peer Reviewers section for the previously assigned review when the award is in Sent to Grant Finance Office state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    Then I softly can see row level action button "Resend For Review" against "Program Reviewer" in flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Resend For Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    Then I see the following messages in the page details contains:
      | Only Fiscal Reviews are allowed in this state. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @543518 @543513 @543511 @DYogita @passed @Reviewed @5 @6 @7
  Scenario Outline: Verify that the Program Coordinator/s can see the validation when clicking on the Send to Grant Finance Office button and the assigned program peer review is not yet submitted.: Submitted for Review state
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
#    543511
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right dropdown button "Send to Grant Finance Office" in page detail
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | Responsibilities Tab - At least one Program Review must be in Submitted status before submitting for Grant Finance Review. |
#  543513
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    Then I softly can see top right dropdown button "Send to Grant Finance Office" in page detail
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | Responsibilities Tab - All assigned reviews must be submitted before submitting for Grant Finance Review. |
    And I wait for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    Then I softly can see top right dropdown button "Send to Grant Finance Office" in page detail
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | Responsibilities Tab - At least one Program Review must be in Submitted status before submitting for Grant Finance Review. |
      | Responsibilities Tab - All assigned reviews must be submitted before submitting for Grant Finance Review.                  |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @543513 @6 @DYogita @passed @ReviewRemaining
  Scenario Outline: Verify that the Program Coordinator/s can see the validation when the program peer reviewer is added but not yet send for review and clicking on the Send to Grant Finance Office button when the award is in the Submitted to Grantor state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    Then I softly can see top right dropdown button "Send to Grant Finance Office" in page detail
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | Responsibilities Tab - All assigned reviews must be submitted before submitting for Grant Finance Review. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @543511 @7 @DYogita @passed @ReviewRemaining
  Scenario Outline: Verify that the Program Coordinator/s can see the validation when the program peer reviewer is not yet added in the section and clicking on the Send to Grant Finance Office button.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    Then I softly can see top right dropdown button "Send to Grant Finance Office" in page detail
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | Responsibilities Tab - At least one Program Review must be in Submitted status before submitting for Grant Finance Review. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FO          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | FD          | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXE         | GRANTEE_SC   |

  @540147 @Sprint-15 @US-494016 @M05
  Scenario Outline: Verify that the peer reviewer with edit access can edit the fields on the Subaward layout. - Subaward via Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
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
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
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
    And I wait for "3" seconds
    Then I softly see value "Sent for Review" for title "Status" against the value "{SavedValue:PO Username}" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    #540147
    Then I softly do not see fields "Announcement__r.NYSED_FundYear__c" is in edit mode
    Then I softly do not see fields "NYSED_Project_ID__c" is in edit mode
    And I clear the value from field "NYSED_ProjectID__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Project ID Seq. No. is required in the Overview tab under the Subaward Information section. |
    And I enter value "ekm" into field "NYSED_ProjectID__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Project ID Seq. No. should consist of 4 digits. |
    And I enter value "-120" into field "NYSED_ProjectID__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Project ID Seq. No. should consist of 4 digits. |
    And I enter value "11.00" into field "NYSED_ProjectID__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Project ID Seq. No. should consist of 4 digits. |
    And I enter value "111" into field "NYSED_ProjectID__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Project ID Seq. No. should consist of 4 digits. |
    And I enter value "11111" into field "NYSED_ProjectID__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Project ID Seq. No. should consist of 4 digits. |
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Project ID Seq. No." as "ProjectIDSeqNo"
    #540147
    Then I softly see field "Project ID Seq. No." as "{SavedValue:ProjectIDSeqNo}"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-1110 @NYSED-1113 @Sprint-21 @US-NYSED-939 @M05 @YugaC
  Scenario Outline: Verify that the Grantee user sees a validation message after clicking the Save button when the budget entered for each line item under the Equipment budget category is less than $10,000.: Direct Grant
  |Verify that the Grantee User see that in the subaward layout -> Budget tab, the Instructional Text in Subaward budget section is added as below.: Direct Grant|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_DETAILED_BUDGET_ON_SUBAWARD_NO"
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
    And I wait for "2" seconds
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    #NYSED-1113
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly see the text containing :
      | Budget Instructions:                                                                                                                                |
      | Equipment Budget:                                                                                                                                   |
      | Each line item under the Equipment category must have a minimum value of $10,000. Please ensure your entries meet this threshold before submission. |
      | Employee Benefits:                                                                                                                                  |
      | This category is not allowed unless staff salaries have been added. To include benefits, first enter corresponding salary details.                  |
    #NYSED-1110
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | 100       | 100              | calclation                                               | 1000                 |
    Then I softly see the following messages in the page details contains:
      | Budget entries under the Equipment category must not be less than $10,000 per line item. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | 100       | 100              | calclation                                               | 10000                |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | 100       | 100              | calclation                                               | 5000                 |
    Then I softly see the following messages in the page details contains:
      | Budget entries under the Equipment category must not be less than $10,000 per line item. |
    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-1111 @Sprint-21 @US-NYSED-939 @M05 @YugaC @Bug-NYSED-7369
  Scenario Outline: Verify that the 'Submit and Certify' user sees a validation message after clicking the Accept button when the Focus Area is set to 'Yes' and budget is not entered for Professional Staff Salaries or Support Staff Salaries in each Focus Area.: Direct Grant
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
    And I navigate to "Overview" sub tab
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    Given I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associateFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date              | End Date                 |
      | Automation Permanent Focus Area  | {Date:MM/dd/yyyy::d+50} | {Date:MM/dd/yyyy::d+120} |
      | Automation Permanent Focus Area2 | {Date:MM/dd/yyyy::d+70} | {Date:MM/dd/yyyy::d+90}  |
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
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | 200                  |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    Then I softly see the following messages in the page details :
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added for Automation Permanent Focus Area |
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 2              | 12  | 100                    | 100                                                | 1000             |
    And I click modal button "Close"
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly cannot see the following messages in the page details :
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added for Automation Permanent Focus Area |
    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-1112 @Sprint-21 @US-NYSED-939 @M05 @YugaC
  Scenario Outline: Verify that the 'Submit and Certify' user sees a validation message after clicking the Accept button when the Focus Area is set to 'No' and budget is not entered for Professional Staff Salaries or Support Staff Salaries.: Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
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
    And I wait for "2" seconds
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---directGrantAndAward:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | 740                  |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    Then I softly see the following messages in the page details :
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added. |
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---directGrantAndAward:-:subawardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 2              | 12  | 100                    | 100                                                | 1000             |
    And I click modal button "Close"
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly cannot see the following messages in the page details :
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added. |
    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-1114 @Sprint-21 @US-NYSED-939 @M05 @YugaC @Bug-NYSED-7582
    @needAPIConfirmationFromDev_om_case_DIRECT_GRANT_YES_BA_DETAILED_BUDGET_ON_SUBAWARD_NO
  Scenario Outline: Verify that the 'Submit and Certify' user sees a validation message after clicking on the Accept button when the Equipment budget category amount is less than $10,000 at the category level.: Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_DETAILED_BUDGET_ON_SUBAWARD_NO"
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
    And I wait for "2" seconds
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:subawardBudgetTableId---" by clicking "Edit" :
      | Budget Category   | Award Amount |
      | Employee Benefits | 5000         |
    When I click on "Save" in the page details
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Budget Tab - Budget entries under the Equipment category must not be less than $10,000. |
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:subawardBudgetTableId---" by clicking "Edit" :
      | Budget Category   | Award Amount |
      | Employee Benefits | 10000        |
    When I click on "Save" in the page details
    And I click on "Accept" in the page details
    Then I softly cannot see the following messages in the page details :
      | Budget Tab - Budget entries under the Equipment category must not be less than $10,000. |
    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-1115 @Sprint-21 @US-NYSED-939 @M05 @YugaC @Bug-NYSED-7369 @Bug-NYSED-7582
  Scenario Outline: Verify that the 'Submit and Certify' user sees a validation message after clicking the Accept button when the Focus Area is set to 'Yes', and budget is not entered for Professional Staff Salaries or Support Staff Salaries in each Focus Area.: Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_DETAILED_BUDGET_NO_SUBAWARD_NO"
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
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    Given I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associateFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date              | End Date                 |
      | Automation Permanent Focus Area  | {Date:MM/dd/yyyy::d+50} | {Date:MM/dd/yyyy::d+120} |
      | Automation Permanent Focus Area2 | {Date:MM/dd/yyyy::d+70} | {Date:MM/dd/yyyy::d+90}  |
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
    And I navigate to "Budget" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:subawardBudgetTableId---" by clicking "Edit" :
      | Budget Category   | Award Amount |
      | Employee Benefits | 10000        |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    Then I softly see the following messages in the page details :
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added for Automation Permanent Focus Area |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---directGrantAndAward:-:subawardBudgetTableId---" by clicking "Edit" :
      | Budget Category             | Award Amount |
      | Professional Staff Salaries | 5000         |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly cannot see the following messages in the page details :
      | Budget Tab - Employee Benefits are not allowed as the staff salaries are not added for Automation Permanent Focus Area |
    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-546055 @NYSEDSprint-19 @US-NYSED-544810 @M05 @YugaC
  Scenario Outline:  Verify that the 'Submit and Certify' user sees the validation when click on 'Accept' button at subaward when subaward is in 'Sent to Subrecipient' state, and if the Requested Indirect Amount is greater than the Maximum Indirect Allowed at focus area level
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_COMPETITIVE_DIRECTED_ANN_TWO_FOCUS_AREA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:directedInvitedApplicatsTableId---" without waiting for record
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
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    Given I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associateFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date              | End Date                 |
      | Automation Permanent Focus Area  | {Date:MM/dd/yyyy::d+50} | {Date:MM/dd/yyyy::d+120} |
      | Automation Permanent Focus Area2 | {Date:MM/dd/yyyy::d+70} | {Date:MM/dd/yyyy::d+90}  |
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I save the field labeled "EGMS ID" as "AwardId"
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
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---" by clicking "New" :
      | Description    | Proposed Expenditure |
      | Position Title | 5000                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Requested Indirect Amount must be less than or equal to the Maximum Indirect Allowed amount for Automation Permanent Focus Area. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-7253 @NYSEDSprint-32 @US-NYSED-6293 @M05 @YugaC
  Scenario Outline: Verifies that the Internal User can see that the County Code field is marked as required to save on the Subaward layout → Overview tab → Place of Performance section.
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
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see asterisk mark on "County Code"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I clear the value from field "County__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | To Save, County Code is required in the Overview tab under the Place of Performance section. |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-7263 @NYSED-7310 @NYSEDSprint-32 @US-NYSED-6293 @M05 @YugaC @Bug-NYSED-8872
  Scenario Outline: Verifies that the Grantee User can see that the County Code field is marked as required to save on the Subaward layout → Overview tab → Place of Performance section.
  |Verifies that the Grantee User can see that the following fields related changes are made on the Subaward Layout sections.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_DETAILED_BUDGET_ON_SUBAWARD_NO"
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
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
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
    #NYSED-7310
    And I navigate to "Overview" sub tab
    Then I see only the following headers in table with id "---subAwardStandAlone:-:RecipientGoalsandObjectives---" :
      | EGMS ID | Title | Strategic Plan | Year Created |
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly see field "Required Match %" inside "Budget Summary" section
    #NYSED-7263
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see asterisk mark on "County Code"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I clear the value from field "County__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, County Code is required in the Overview tab under the Place of Performance section. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-7299 @NYSEDSprint-32 @US-NYSED-6293 @M05 @YugaC @Bug-NYSED-8414
  Scenario Outline: Verifies that the Internal User can see that the validation message for the field ‘Office Phone’ is updated on the Subaward layout → Overview tab → Contacts section → Create Contact modal
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
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    And I enter value "Auto" into field "Title"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Program Contact" into field "ProjectRole__c"
    And I enter value "676yyy5sss" into field "Phone"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Office Phone Number. |

    Examples:
      | Announcement Name                                         | Coordinator |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          |

  @NYSED-8351 @NYSED-8299 @NYSED-8304 @NYSED-8303 @NYSED-8305 @NYSED-8307 @NYSED-8308 @NYSED-8349 @NYSED-Sprint-32 @US-NYSED-2158 @NYSED-Sprint-32 @US-NYSED-2158
  Scenario Outline:Verify that the Internal user can see the OSC Approved? is required to ‘send to subrecipient’ when award is in Approved state if ‘Contractual?’ is set to ‘Yes’ on the related Grant.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
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
    And I enter value "Yes" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    #NYSED-8307
    Then I softly see field "Advance Payment Allowed?" as "No"
    Then I softly do not see "First Payment %" inside page block detail
    #NYSED-8299
    Then I softly see "Contract Start Date" inside page block detail
    Then I softly see "Contract End Date" inside page block detail
    Then I softly see "Contract Number" inside page block detail
    Then I softly see "SFS Contract Id" inside page block detail
    Then I softly see "Contract Amendment Version" inside page block detail
    Then I softly see "Contract Amendment Status" inside page block detail
    #NYSED-8301
    Then I softly see asterisk mark on "Contract Start Date"
    Then I softly see asterisk mark on "Contract End Date"
    Then I softly see asterisk mark on "Contract Number"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    #NYSED-8304 #NYSED-8303 #NYSED-8305
    Then I softly see the following messages in the page details contains:
      | To Save, Contract Start Date is required in the Overview tab under the Grant Information section. |
      | To Save, Contract End Date is required in the Overview tab under the Grant Information section.   |
      | To Save, Contract Number is required in the Overview tab under the Grant Information section.     |
    When I enter value "2" into field "NYSED_Contract_Start_Date__c"
    When I enter value "1" into field "NYSED_Contract_End_Date__c"
    When I enter value "1234567890" into field "NYSED_ContractNumber__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Contract Start Date must be before the Contract End Date. |
    And I click on "Cancel" in the page details
    Then I softly see field "Contract Start Date" as ""
    Then I softly see field "Contract End Date" as ""
    Then I softly see field "Contract Number" as ""
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Position Title                      | Provider of Service        | Calculation         | 1000                 |
    And I click modal button "Close"
    And I pause execution for "2" seconds
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
      | Name                     | Name                     | Award  |
      | {SavedValue:PM Username} | {SavedValue:PO Username} | Step 1 |
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    #NYSED-8304 #NYSED-8303 #NYSED-8305
    Then I softly see the following messages in the page details contains:
      | Grant - Overview Tab - Contract Start Date is required for contractual grants. Enter Contract Start Date before submitting. |
      | Grant - Overview Tab - Contract End Date is required for contractual grants. Enter Contract End Date before submitting.     |
      | Grant - Overview Tab - Contract Number is required for contractual grants. Enter Contract Number before submitting.         |
    And I navigate to "Overview" sub tab
    #NYSED-8349
    Then I softly do not see "Document Number" inside page block detail
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Grant_Edit" values from "Award_Field_Values.xlsx"
    When I enter value "Yes" into field "IsAdvancePermitted__c"
    And I click on "Save" in the page details
    #NYSED-8308
    Then I softly see field "Advance Payment Allowed?" as "Yes"
    Then I softly see "First Payment %" inside page block detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
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
    And I refresh the page
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
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
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    #NYSED-8351
    Then I softly see the following messages in the page details contains:
      | Overview Tab - OSC Approved? is required before sending subaward for subrecipient acceptance. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-8355 @NYSED-7539 @NYSED-Sprint-32 @US-NYSED-2158 @NYSED-Sprint-32 @US-NYSED-5145 @M05
  Scenario Outline:Verify that the Internal user cannot see the OSC Approved? is required to ‘send to subrecipient’ when award is in Approved state if ‘Contractual?’ is set to ‘No’ on the related Grant.
  |Verify that the FD user cannot see the validation message when FD user clicks on ‘Submit for Approval,’ and it is State funded subaward and UEI is not available on the related Subrecipient Organization profile.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I clear the value from field "UEISam__c"
    When I click on "Save" in the page details
    Then I softly see field "UEI" as ""
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Position Title                      | Provider of Service        | Calculation         | 1000                 |
    And I click modal button "Close"
    And I pause execution for "2" seconds
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
      | Name                     | Name                     | Award  |
      | {SavedValue:PM Username} | {SavedValue:PO Username} | Step 1 |
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    #NYSED-7539
    Then I softly cannot see the following messages in the page details contains:
      | UEI (Unique Entity Identifier) is mandatory for federally funded subawards. Please contact system administrator to add valid UEI for the subrecipient organization. |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I refresh the page
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
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
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    #NYSED-8355
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - OSC Approved? is required before sending subaward for subrecipient acceptance. |

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-7537 @NYSED-Sprint-32 @US-NYSED-5145 @M05
  Scenario Outline:Verify that the FD user can see the validation message when FD user clicks on ‘Submit for Approval,’ and it is a Federal-funded subaward and UEI is not available on the related Subrecipient Organization profile.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_FEDERALFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I clear the value from field "UEISam__c"
    When I click on "Save" in the page details
    Then I softly see field "UEI" as ""
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
      | Funding Account EGMS ID      | Enc Life |
      | {SavedValue:fundingAccount2} | 1000     |
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
    And I navigate to "Budget" sub tab
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Position Title                      | Provider of Service        | Calculation         | 1000                 |
    And I click modal button "Close"
    And I pause execution for "2" seconds
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
      | Name                     | Name                     | Award  |
      | {SavedValue:PM Username} | {SavedValue:PO Username} | Step 1 |
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    #NYSED-7537
    Then I softly see the following messages in the page details contains:
      | UEI (Unique Entity Identifier) is mandatory for federally funded subawards. Please contact system administrator to add valid UEI for the subrecipient organization. |
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "TMNCGDWW5QL8" into field "UEISam__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    #NYSED-7537
    Then I softly cannot see the following messages in the page details contains:
      | UEI (Unique Entity Identifier) is mandatory for federally funded subawards. Please contact system administrator to add valid UEI for the subrecipient organization. |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-7535 @NYSED-Sprint-32 @US-NYSED-5145 @M05
  Scenario Outline:Verify that the FD user can see the validation message when FD user clicks on ‘Submit for Approval,’ and it is a Federal-funded subaward and UEI is not available on the related Subrecipient Organization profile.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_SECOND_FUNDING_ACCOUNT"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I clear the value from field "UEISam__c"
    When I click on "Save" in the page details
    Then I softly see field "UEI" as ""
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
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
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associateFocusAreaTableId---" by clicking "Edit" :
      | Title                                     | Start Date                          | End Date                         |
      | {SavedValue:AutomationPermanentFocusArea} | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
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
    And I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:AwardMinorRemodelingTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
      | Position Title                      | Provider of Service        | Calculation         | 1000                 |
    And I click modal button "Close"
    And I pause execution for "2" seconds
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
      | Name                     | Name                     | Award  |
      | {SavedValue:PM Username} | {SavedValue:PO Username} | Step 1 |
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    #NYSED-7535
    Then I softly see the following messages in the page details contains:
      | UEI (Unique Entity Identifier) is mandatory for federally funded subawards. Please contact system administrator to add valid UEI for the subrecipient organization. |
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "TMNCGDWW5QL8" into field "UEISam__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    #NYSED-7535
    Then I softly cannot see the following messages in the page details contains:
      | UEI (Unique Entity Identifier) is mandatory for federally funded subawards. Please contact system administrator to add valid UEI for the subrecipient organization. |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @NYSED-8395 @NYSED-Sprint-32 @US-NYSED-5962 @M05 @Bug-Ticket-NYSED-9085
  Scenario Outline:Verify that the FD user sees the validation message 'Pre‑Encumbrance cannot be reduced below Enc life' when reducing Pre‑Encumbrance below the remaining encumbrance on Announcement layout->Financials tab->Funding account section
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "SECOND_FUNDING_ACCOUNT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<GrantName>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<GrantName>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account Title                              | Pre-Encumbrance |
      | {SavedValue:AutomationExternalFundingAccountTitle} | 999             |
    #NYSED-8395
    Then I softly see the following messages in the page details contains:
      | Pre‑Encumbrance cannot be reduced below Enc life. |
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account Title                    | Pre-Encumbrance |
      | {SavedValue:InternalFundingAccountTitle} | 999             |
    #NYSED-8395
    Then I softly see the following messages in the page details contains:
      | Pre‑Encumbrance cannot be reduced below Enc life. |

    Examples:
      | GrantName                                 |
      | {SavedValue:Automation Runtime FDM Grant} |

  @NYSED-10506 @NYSEDSprint-36 @US-NYSED-9589 @M05
  Scenario Outline: Verify that the FD user cannot submit for approval when Enc Life is $0 and Blank for any associated funding account on the Subaward layout -> Budget tab -> Funding Account Information section - Award from FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<Announcement Name>"
    Given I created approved FDM on application "<Announcement Name>"
    Given I created award from approved FDM with announcement "<Announcement Name>"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 0        |
    When I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | Budget Tab - Funding Account(s) {SavedValue:fundingAccount} cannot have Enc Life as zero or blank. Either remove the Funding Account or enter the Enc Life value in the associated Funding Account. |

    Examples:
      | Announcement Name                         | Coordinator |
      | {SavedValue:Automation Runtime FDM Grant} | FD          |

  @NYSED-10507 @NYSEDSprint-36 @US-NYSED-9589 @M05
  Scenario Outline: Verify that the Program Coordinator user cannot submit for approval when Enc Life is $0 and Blank for any associated funding account on the Subaward layout -> Budget tab -> Funding Account Information section - Direct Grant Award
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
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
    And I save the field labeled "EGMS ID" as "awardName"
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description    | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review details | 10       | Yes                  |
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
    And I click modal button "Close"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Program Contact | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description    | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I click modal button "Close"
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
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 0        |
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | Budget Tab - Funding Account(s) {SavedValue:fundingAccount} cannot have Enc Life as zero or blank. Either remove the Funding Account or enter the Enc Life value in the associated Funding Account. |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} |          |
    And I wait for "2" seconds
    Then I see the following messages in the page details contains:
      | Budget Tab - Funding Account(s) {SavedValue:fundingAccount} cannot have Enc Life as zero or blank. Either remove the Funding Account or enter the Enc Life value in the associated Funding Account. |

    Examples:
      | Coordinator | ExternalUser |
      | PO          | GRANTEE_SC   |

  @NYSED-10987 @NYSED-10986 @NYSEDSprint-37 @US-NYSED-10679 @M05
  Scenario Outline: Verify that the Program Coordinator sees that on the Subaward layout -> Overview tab -> Subaward Information section, the Project ID field has the following changes: required, editable, and a text field that allows exactly a 10-digit number. Direct Grant
  |Verify that the Internal user see that on the Subaward layout -> Overview tab ->Subaward Information section, the ‘Project ID Seq. No.’ field is removed.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I navigate to "Overview" sub tab
    And I clear the value from field "NYSED_ProjectID__c"
    When I click on "Save" in the page details
    #NYSED-10987
    Then I see the following messages in the page details contains:
      | To save, Project ID is required in the Overview tab under the Subaward Information section. |
    #Bug-NYSED-11055
    When I enter value "123456789" into field "NYSED_ProjectID__c"
    When I click on "Save" in the page details
    Then I see the following messages in the page details contains:
      | Overview Tab - The Project ID field should consist of 10 digits. |
    When I enter value "1234567.89" into field "NYSED_ProjectID__c"
    When I click on "Save" in the page details
    Then I see the following messages in the page details contains:
      | Overview Tab - The Project ID field should consist of 10 digits. |
    When I enter value "12345678911" into field "NYSED_ProjectID__c"
    When I click on "Save" in the page details
    Then I softly see field "Project ID" as "1234567891"
    When I click on "Edit" in the page details
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    When I click on "Save" in the page details
    Then I softly see field "Project ID" as "{SavedValue:uniquePROJECTID}"
    #NYSED-10986
    Then I softly cannot see field "Project ID Seq. No." inside page block

    Examples:
      | Coordinator |
      | PO          |

  @NYSED-1198 @NYSEDSprint-37 @US-NYSED-10679 @M05
  Scenario Outline:Verify that the FD user sees that on the Subaward layout -> Overview tab -> Subaward Information section, the 'Project ID' field has the following changes: readonly, and a text field that allows exactly a 10-digit number. : Standard Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<GrantName>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<GrantName>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Project ID" as "ProjectID" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-1198
    Then I softly see asterisk mark on "Project ID"
    When I click on "Edit" in the page details
    Then I softly see that "NYSED_ProjectID__c" rendered in view mode only
    Then I softly see field "Project ID" as "{SavedValue:ProjectID}"

    Examples:
      | GrantName                                        |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @NYSED-1199 @NYSEDSprint-37 @US-NYSED-10679 @M05
  Scenario Outline: Verify that the FD user see the validation if generated Project ID is a duplicate across awards.: Direct Grant: Lump Sum
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I generate the random PROJECTID and save as "uniquePROJECTID"
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    When I click on "Save" in the page details
    Then I softly see field "Project ID" as "{SavedValue:uniquePROJECTID}"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    When I click on "Save" in the page details
    #NYSED-1199
    Then I see the following messages in the page details contains:
      | Overview Tab - Project ID should be unique for subaward. Entered Project ID is already in use for subaward {SavedValue:AwardEGMSID}. |

    Examples:
      | Coordinator |
      | FD          |

  @NYSED-1200 @NYSEDSprint-37 @US-NYSED-10679 @M05
  Scenario Outline: Verify that the FD User see the validation if the Project ID is same as any recommended application of any FDM, for which award in not created. : Direct Grant: Lump Sum
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Project ID" as "ProjectID" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "APPEGMSID" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "{SavedValue:uniquePROJECTID}" into field "NYSED_ProjectID__c"
    When I click on "Save" in the page details
    #NYSED-1200
    Then I see the following messages in the page details contains:
      | Overview Tab - Project ID should be unique for subaward. Entered Project ID is already in use for application {SavedValue:APPEGMSID}. |

    Examples:
      | Coordinator |
      | FD          |