@amendmentRequestsNysed
Feature: Validate all scenarios in the Amendment Request from Direct Grant

  @NYSED-9235 @NYSED-9239 @NYSEDSprint-33 @US-NYSED-8203 @M06
  Scenario Outline: Verify that the Grantee User can see on the Amendment Requests section → Terms and Conditions Change Amendment Request layout, Overview tab -> Overview section, below changes and fields sequence have been made.
  |Verify that the Internal User can see on the Terms and Conditions Change Amendment Request layout the required to submit validations for the following fields.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #NYSED-9235
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly see field "Child Organization" inside page block
    Then I softly see field "Not For Profit" inside page block
    And I wait for "2" seconds
    #NYSED-9239
    And I clear the value from field "Impact__c"
    And I clear the value from field "PurposeRTA__c"
    And I enter value "" into field "NYSED_SubTermsConditions__c"
    And I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | To submit, Overall Justification is required in the Overview tab under the Overview section.                                        |
      | To submit, Overall Impact is required in the Overview tab under the Overview section.                                               |
      | To submit, Justification for Terms and Conditions Change is required in the Overview tab under the Overview section.                |
      | To submit, Subaward Terms and Conditions is required in the Overview tab under the Change in Subaward Terms and Conditions section. |

    Examples:
      | GrantName                                        | InternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | PO           |
#      | {SavedValue:Automation Runtime FDM Announcement} | PM           |

  @NYSED-9240 @NYSED-9247 @NYSEDSprint-33 @US-NYSED-8203 @M06
  Scenario Outline: Verify that the Internal User cannot see the Child Organization fields on the Terms and Conditions Change Amendment Request layout, Overview tab -> Overview section.
  |Verify that the Internal User can see on the Amendment Requests section → Terms and Conditions Change Amendment Request layout, Overview tab -> Change in Subaward Terms and Conditions section is newly added with field ‘Subaward Terms and Conditions’|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #NYSED-9240
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly see field "Not For Profit" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    #NYSED-9247
    Then I softly see "Change in Subaward Terms and Conditions" page block displayed
    Then I softly see field "Subaward Terms and Conditions" as "Award Created From FDM" in "Change in Subaward Terms and Conditions" pageblock

    Examples:
      | GrantName                                        | InternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | PM           |
#      | {SavedValue:Automation Runtime FDM Announcement} | PO           |

  @NYSED-9243 @NYSED-9253 @NYSEDSprint-33 @US-NYSED-8203 @M06
  Scenario Outline: Verify that the Internal User cannot see the Creating For and Child Organization fields on the Terms and Conditions Change Amendment Request layout, when the subaward is created via Direct Grant
  |Verify that the Internal User (Amendment Owner) can see the Edit, Delete, and Send to Subrecipient buttons on the Terms and Conditions Change Amendment Request layout when the Amendment Request is in Created state|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #NYSED-9243
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Not For Profit" inside page block
    #NYSED-9253
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Delete" in page detail
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail

    Examples:
      | GrantName                                                 | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO           |

  @NYSED-9255 @NYSED-Sprint-33 @US-NYSED-8203 @M06
  Scenario Outline: Verify that the Internal User (Amendment Owner) can see the Edit and Submit for Approval Buttons on the Terms and Conditions Change Amendment Request layout when the Amendment Request is in Acknowledged status.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                         | Field                       |
      | Subaward Terms and Conditions | NYSED_SubTermsConditions__c |
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation FD | Step 1            |
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details without processing
    When I click alert button "OK"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |

  @NYSED-9187 @NYSED-9188 @NYSEDSprint-33 @US-NYSED-5894 @M06
  Scenario Outline: Verify that the Internal User can see on the Amendment Requests section → Budget Period Change Amendment Request layout, Overview tab -> Overview section, below changes and fields sequence have been made.
  |Verify that the Internal User can see on the Budget Period Change Amendment Request layout the required to submit validations for the following fields.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #NYSED-9187
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly see field "Child Organization" inside page block
    Then I softly see field "Not For Profit" inside page block
    #NYSED-9188
    And I clear the value from field "Impact__c"
    And I clear the value from field "PurposeRTA__c"
    And I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | To submit, Overall Justification is required in the Overview tab under the Overview section.                  |
      | To submit, Overall Impact is required in the Overview tab under the Overview section.                         |
      | To submit, Justification for Budget Period Change is required in the Overview tab under the Overview section. |
      | To submit, New Budget Period End Date is required in the Overview tab under the Budget Period Change section. |

    Examples:
      | GrantName                                        | InternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | PM           |
#      | {SavedValue:Automation Runtime FDM Announcement} | PO           |

  @NYSED-9191 @NYSEDSprint-33 @US-NYSED-5894 @M06
  Scenario Outline: Verify that the Internal User cannot see the Child Organization fields on the Budget Period Change Amendment Request layout, Overview tab -> Overview section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #NYSED-9191
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly see field "Not For Profit" inside page block
    Then I softly cannot see field "Child Organization" inside page block

    Examples:
      | GrantName                                        | InternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | PM           |
#      | {SavedValue:Automation Runtime FDM Announcement} | PO           |

  @NYSED-9213 @NYSED-9219 @NYSED-9221 @NYSEDSprint-33 @US-NYSED-5894 @M06
  Scenario Outline: Verify that the Internal User cannot see the Creating For and Child Organization fields on the Budget Period Change Amendment Request layout, when the subaward is created via Direct Grant
  |Verify that the Internal User can see on the Amendment Requests section → Budget Period Change Amendment Request layout, Overview tab -> Budget Period Change section, below changes and fields sequence have been made.|
  |Verify that the Internal User can see on the validation on the Budget Period Change Amendment Request layout, if the Amendment Deadline date is more than the ‘New Budget Period End Date’.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #NYSED-9213
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Not For Profit" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    Then I softly cannot see field "Creating For" inside page block
    #NYSED-9219
    Then I softly see field "Budget Period" inside "Budget Period Change" section
    Then I softly see field "New Budget Period End Date" inside "Budget Period Change" section
    Then I softly see field "Amendment Deadline" inside "Budget Period Change" section
    #NYSED-9221
    And I enter value "{Date:M/d/yyyy::d+40}" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Amendment Deadline date cannot be after the New Budget Period End Date. |

    Examples:
      | GrantName                                                 | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO           |

  @NYSED-9222 @NYSED-9228 @NYSEDSprint-33 @US-NYSED-5894 @M06
  Scenario Outline: Verify that the Internal User can see on the Amendment Requests section → Budget Period Change Amendment Request layout, Overview tab -> Budget Summary by Focus Area section table showing below changes and fields sequence.
  |Verify that the Internal User (Amendment Owner) can see the Edit, Delete, and Send To Subrecipient buttons on the Budget Period Change Amendment Request layout when the Amendment Request is in Created state|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #NYSED-9228
    And I enter value "{Date:M/d/yyyy::d+160}" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Delete" in page detail
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail

    Examples:
      | GrantName                                        | InternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | PM           |
#      | {SavedValue:Automation Runtime FDM Announcement} | PO           |

  @NYSED-9231 @NYSEDSprint-33 @US-NYSED-5894 @M06
  Scenario Outline: Verify that the Internal User (Amendment Owner) can see the Edit and Submit for Approval buttons on the Budget Period Change Amendment Request layout when the Amendment Request is in Acknowledged status.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter value "Automation Justification " into field "BudgetPeriodComments__c"
    And I enter value "{Date:M/d/yyyy::d+160}" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetPeriodChangeId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation FD | Step 1            |
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BudgetPeriodChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BudgetPeriodChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:BudgetPeriodChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BudgetPeriodChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details without processing
    When I click alert button "OK"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PO           |

  @NYSED-9507 @NYSED-9509 @NYSEDSprint-33 @US-NYSED-7991 @M06
  Scenario Outline: Verify that the Grantee User can see the 'View/Add Line Item Details'.  inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table when  'Is a Detailed Budget Required on the Subaward?' is set to Yes
  |Verify that the Grantee User can see the 'Original Budget Details'.  inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubBudgetRedirection_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #NYSED-9509
    Then I softly can see row level action button "Original Budget Details" against "Purchased Services" in flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "Original Budget Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Edit" against "Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly cannot see row level action button "Delete" against "Purchased Services - Item 1" in flex table with id "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9507
    Then I see only the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9508 @NYSEDSprint-33 @US-NYSED-7991 @M06
  Scenario Outline:Verify that the Grantee User cannot see the 'View/Add Line Item Details'. inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table when 'Is a Detailed Budget Required on the Subaward?' is set to No.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    #NYSED-9508
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly can see row level action button "Edit" against "Purchased Services" in flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:BudgetChangeTableId---" by clicking "Edit" :
      | Budget Category    | Revised Award Amount |
      | Purchased Services | 100                  |
    Then I softly see value "$100" for title "Revised Award Amount" against the value "Purchased Services" inside table "---amendment:-:BudgetChangeTableId---"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9510 @NYSED-9515 @NYSED-Sprint-33 @US-NYSED-7991 @M06
  Scenario Outline:Verify that the Grantee User can create/update/delete details under the budget category - 'Purchased Services' when the Amendment Request is in the Created state. (This access is only available in case of budget redirection amendment).
  |Verify that the Grantee User can add/update/delete details under the budget category 'Purchased Services', then the following roll-up sum takes place.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider        | Calculation of Cost | 100                  | 100        | 100            |
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item1        | Yes             | Provider1       | Calculation of Cost | 200                  | 100        | 100            |
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item2        | Yes             | Provider2       | Calculation of Cost | 300                  | 100        | 100            |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider        | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
      | Action menu | Description of Item1        | Yes             | Provider1       | Calculation of Cost | $200                 | $100       | $100           | $200        | $400               |
      | Action menu | Description of Item2        | Yes             | Provider2       | Calculation of Cost | $300                 | $100       | $100           | $200        | $500               |
      |             | Total                       |                 |                 |                     | $600                 | $300       | $300           | $600        | $1,200             |
    Then I softly can see row level action button "Edit" against "Description of Item" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item2        | 400                  | 400        | 400            |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider        | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
      | Action menu | Description of Item1        | Yes             | Provider1       | Calculation of Cost | $200                 | $100       | $100           | $200        | $400               |
      | Action menu | Description of Item2        | Yes             | Provider2       | Calculation of Cost | $400                 | $400       | $400           | $800        | $1,200             |
      |             | Total                       |                 |                 |                     | $700                 | $600       | $600           | $1,200      | $1,900             |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0           | $0                       | $0               | $700                 | $700       | $600       | $600           | $1,200      | $1,900             |
      | Action menu | Supplies and Materials      | 45                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Employee Benefits           | 80                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      |             | Total                       |                      | $0           |                          |                  | $700                 | $700       | $600       | $600           | $1,200      | $1,900             |
      |             | Grand Total                 |                      | $0           |                          |                  | $700                 | $700       | $600       | $600           | $1,200      | $1,900             |
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "Delete" icon for "Description of Item2" inside flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider        | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
      | Action menu | Description of Item1        | Yes             | Provider1       | Calculation of Cost | $200                 | $100       | $100           | $200        | $400               |
      |             | Total                       |                 |                 |                     | $300                 | $200       | $200           | $400        | $700               |
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0           | $0                       | $0               | $300                 | $300       | $200       | $200           | $400        | $700               |
      | Action menu | Supplies and Materials      | 45                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Employee Benefits           | 80                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      |             | Total                       |                      | $0           |                          |                  | $300                 | $300       | $200       | $200           | $400        | $700               |
      |             | Grand Total                 |                      | $0           |                          |                  | $300                 | $300       | $200       | $200           | $400        | $700               |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9518 @NYSED-Sprint-33 @US-NYSED-7991 @M06
  Scenario Outline:Verify that users (Internal and Grantee) cannot see Cash Match and Non-Cash Match columns if Subrecipient Match is set as No on the announcement: Purchased Services
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:BudgetChangeTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9513 @NYSED-Sprint-33 @US-NYSED-7991 @M06
  Scenario Outline:Verify that Grantee Users, apart from Submit and Certify & Create and Edit roles, cannot create/update/delete details under the budget category - 'Purchased Services' when the Amendment Req is in the Created OR Send back to Subrecipient.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "BudgetPeriodChangeId"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider        | Calculation of Cost | 100                  | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:BudgetPeriodChangeId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:BudgetPeriodChangeId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:BudgetPeriodChangeId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:BudgetPeriodChangeId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9512 @NYSED-Sprint-33 @US-NYSED-7991 @M06
  Scenario Outline:Verify that the Grantee User can create/update/delete details under the budget category - 'Purchased Services' when the Amendment Request is in the Send to Subrecipient state.(This is for funding change and periodic renewal type of amendment)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider        | Calculation of Cost | 100                  | 100        | 100            |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider        | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
      |             | Total                       |                 |                 |                     | $100                 | $100       | $100           | $200        | $300               |
    Then I softly can see row level action button "Edit" against "Description of Item" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | 400                  | 400        | 400            |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider        | Calculation of Cost | $400                 | $400       | $400           | $800        | $1,200             |
      |             | Total                       |                 |                 |                     | $400                 | $400       | $400           | $800        | $1,200             |
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9514 @NYSED-9519 @NYSED-Sprint-33 @US-NYSED-7991 @M06
  Scenario Outline:Verify that the Grantee user sees Purchased Services, Budget Categories modal, having a 'Description of Item/Service' column (Editable, Blank for new row, Short text 255 Character and Required)
  |Verify that the Grantee user sees Purchased Services, Budget Categories modal, having a 'Is Subcontract?' column (Editable, Picklist: Yes/No, blank for new row and Required)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "BudgetPeriodChangeId"
    #NYSED-9514
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      |                             | Yes             | Provider        | Calculation of Cost | 100                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | {SavedValue:Char256}        | Yes             | Provider        | Calculation of Cost | 100                  | 100        | 100            |
    Then I softly see value "{SavedValue:Char255}" for title "Description of Item/Service" against the value "Provider" inside table "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Provider/Vendor | Description of Item/Service |
      | Provider        | Description of Item         |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider        | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" without waiting for record
    And I wait for "3" seconds
    #NYSED-9519
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Provider        | Calculation of Cost | 100                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider        | Calculation of Cost | 100                  | 100        | 100            |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider        | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Provider/Vendor | Is Subcontract? |
      | Provider        | No              |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | No              | Provider        | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9520 @NYSED-9521 @NYSED-9522 @NYSED-Sprint-33 @US-NYSED-7991 @M06
  Scenario Outline:Verify that the Grantee user sees Purchased Services, Budget Categories modal, having a 'Provider/Vendor' column (Editable, Blank for new row, Short text 255 Character and Required)
  |Verify that the Grantee user sees Purchased Services, Budget Categories modal, having a 'Calculation of Cost' column (Editable, Blank for new row, Short text 255 Character and Required)|
  |Verify that the Grantee user sees Purchased Services, Budget Categories modal, having a 'Proposed Expenditure' column (Editable, Required, Currency Field without decimals and Blank for new row)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "BudgetPeriodChangeId"
    #NYSED-9520
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             |                 | Calculation of Cost | 100                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | {SavedValue:Char256} | Calculation of Cost | 100                  | 100        | 100            |
    Then I softly see value "{SavedValue:Char255}" for title "Provider/Vendor" against the value "Description of Item" inside table "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Provider/Vendor |
      | Description of Item         | Provider        |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider        | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" without waiting for record
    And I wait for "3" seconds
    #NYSED-9521
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider        |                     | 100                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider        | {SavedValue:Char256} | 100                  | 100        | 100            |
    Then I softly see value "{SavedValue:Char255}" for title "Calculation of Cost" against the value "Description of Item" inside table "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost |
      | Description of Item         | Calculation of Cost |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider        | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9522
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider        | Calculation of Cost |                      | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider        | Calculation of Cost | eeee                 | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider        | Calculation of Cost | -99                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider        | Calculation of Cost | 88.88                | 100        | 100            |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider        | Calculation of Cost | $8,888               | $100       | $100           | $200        | $9,088             |
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Proposed Expenditure |
      | Description of Item         | 0                    |
    And I wait for "2" seconds
    Then I softly cannot see the following messages in the page details contains:
      | Proposed Expenditure cannot be zero. |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider        | Calculation of Cost | $0                   | $100       | $100           | $200        | $200               |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9511 @NYSED-9516 @NYSED-9517 @NYSED-Sprint-33 @US-NYSED-7991 @M06
  Scenario Outline:Verify that the Internal User can see the 'View/Add Line Item Details' inline action and cannot add/update/delete the added budget under the budget category 'Purchased Services'.
  |Verify that the Grantee User cannot create/update/delete details under the budget category - 'Purchased Services' when the Amendment Request is not in the Created OR Send back to Subrecipient.|
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Purchased Services' when the Amendment Request is sent back to the Subrecipient.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10PURCHASEDSERVICES_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider        | Calculation of Cost | 100                  | 100        | 100            |
    And I click modal button "Close"
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9516
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:grantorBudgetChangeTableId---"
    #NYSED-9517
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    And I click modal button "Close"
    When I click on "Send Back to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item1        | Yes             | Provider        | Calculation of Cost | 100                  | 100        | 100            |
    #NYSED-9511
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item1        | Yes             | Provider        | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
    Then I softly can see row level action button "Edit" against "Description of Item1" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item1" in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Proposed Expenditure |
      | Description of Item1        | 400                  |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item1        | Yes             | Provider        | Calculation of Cost | $400                 | $100       | $100           | $200        | $600               |
    When I click on "Delete" icon for "Description of Item1" inside flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9561 @NYSED-9563 @NYSEDSprint-33 @US-NYSED-7995 @M06
  Scenario Outline: Verify that the Grantee User can see the 'View/Add Line Item Details'. inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table when 'Is a Detailed Budget Required on the Subaward?' is set to Yes
  |Verify that the Grantee User can see the 'Original Budget Details'. inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10INDIRECTCOST_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubBudgetRedirection_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #NYSED-9563
    Then I softly can see row level action button "Original Budget Details" against "Indirect Cost" in flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "Original Budget Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Edit" against "Indirect Cost - Item 1" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    Then I softly cannot see row level action button "Delete" against "Indirect Cost - Item 1" in flex table with id "---subAwardStandAlone:-:AwardIndirectCostTableId---"
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9561
    Then I see only the following headers in table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" :
      | Actions | Description | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9562 @NYSEDSprint-33 @US-NYSED-7995 @M06
  Scenario Outline:Verify that the Grantee User cannot see the 'View/Add Line Item Details'. inline action on the Amendment layout -> Overview tab -> Budget Change section -> Budget Categories table when 'Is a Detailed Budget Required on the Subaward?' is set to No.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly can see row level action button "Edit" against "Indirect Cost" in flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:BudgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount |
      | Indirect Cost   | 100                  |
    Then I softly see value "$100" for title "Revised Award Amount" against the value "Indirect Cost" inside table "---amendment:-:BudgetChangeTableId---"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9564 @NYSED-9567 @NYSED-Sprint-33 @US-NYSED-7995 @M06
  Scenario Outline: Verify that the Grantee User can create/update/delete details under the budget category - 'Indirect Cost' when the Amendment Request is in the Created state. (This access is only available in case of budget redirection amendment).
  |Verify that the Grantee User can add/update/delete details under the budget category 'Indirect Cost', then the following roll-up sum takes place.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly can see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly see the text containing "Budget Category : Indirect Cost"
    Then I softly can see "90 - Indirect Cost" sub tab at view detail page
    When I enter the following values into flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description | 100                  | 100        | 100            |
    When I enter the following values into flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "New" :
      | Description  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description1 | 200                  | 100        | 100            |
    When I enter the following values into flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "New" :
      | Description  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description2 | 300                  | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" :
      | Actions     | Description  | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description  | $100                 | $100       | $100           | $200        | $300               |
      | Action menu | Description1 | $200                 | $100       | $100           | $200        | $400               |
      | Action menu | Description2 | $300                 | $100       | $100           | $200        | $500               |
      |             | Total        | $600                 | $300       | $300           | $600        | $1,200             |
    Then I softly can see row level action button "Edit" against "Description" in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Description" in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description | 400                  | 200        | 200            |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" :
      | Actions     | Description  | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description  | $400                 | $200       | $200           | $400        | $800               |
      | Action menu | Description1 | $200                 | $100       | $100           | $200        | $400               |
      | Action menu | Description2 | $300                 | $100       | $100           | $200        | $500               |
      |             | Total        | $900                 | $400       | $400           | $800        | $1,700             |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Employee Benefits           | 80                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0           | $0                       | $0               | $900                 | $900       | $400       | $400           | $800        | $1,700             |
      | Action menu | BOCES Purchased Services    | 49                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      |             | Total                       |                      | $0           |                          |                  | $900                 | $900       | $400       | $400           | $800        | $1,700             |
      |             | Grand Total                 |                      | $0           |                          |                  | $900                 | $900       | $400       | $400           | $800        | $1,700             |
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "Delete" icon for "Description2" inside flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" :
      | Actions     | Description  | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description  | $400                 | $200       | $200           | $400        | $800               |
      | Action menu | Description1 | $200                 | $100       | $100           | $200        | $400               |
      |             | Total        | $600                 | $300       | $300           | $600        | $1,200             |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Employee Benefits           | 80                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0           | $0                       | $0               | $600                 | $600       | $300       | $300           | $600        | $1,200             |
      | Action menu | BOCES Purchased Services    | 49                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $0           | $0                       | $0               | $0                   | $0         | $0         | $0             | $0          | $0                 |
      |             | Total                       |                      | $0           |                          |                  | $600                 | $600       | $300       | $300           | $600        | $1,200             |
      |             | Grand Total                 |                      | $0           |                          |                  | $600                 | $600       | $300       | $300           | $600        | $1,200             |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9574 @NYSED-Sprint-33 @US-NYSED-7995 @M06
  Scenario Outline:Verify that users (Internal and Grantee) cannot see Cash Match and Non-Cash Match columns if Subrecipient Match is set as No on the announcement: Indirect Cost
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:BudgetChangeTableId---"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---amendment:-:AmendmentIndirectCostLineItemsTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9566 @NYSED-Sprint-33 @US-NYSED-7995 @M06
  Scenario Outline:Verify that the Grantee User can create/update/delete details under the budget category - 'Indirect Cost' when the Amendment Request is in the Send to Subrecipient state.(This is for funding change and periodic renewal type of amendment)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly see the text containing "Budget Category : Indirect Cost"
    Then I softly can see "90 - Indirect Cost" sub tab at view detail page
    When I enter the following values into flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description | 100                  | 100        | 100            |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" :
      | Actions     | Description | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description | $100                 | $100       | $100           | $200        | $300               |
      |             | Total       | $100                 | $100       | $100           | $200        | $300               |
    Then I softly can see row level action button "Edit" against "Description" in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Description" in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description | 400                  | 400        | 400            |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" :
      | Actions     | Description | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description | $400                 | $400       | $400           | $800        | $1,200             |
      |             | Total       | $400                 | $400       | $400           | $800        | $1,200             |
    When I click on "Delete" icon for "Description" inside flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9565 @NYSED-9572 @NYSED-9573 @NYSED-Sprint-33 @US-NYSED-7995 @M06
  Scenario Outline:Verify that the Internal User can see the 'View/Add Line Item Details' inline action and cannot add/update/delete the added budget under the budget category 'Indirect Cost'.
  |Verify that the Grantee User cannot create/update/delete details under the budget category - 'Indirect Cost' when the Amendment Request is not in the Created OR Send back to Subrecipient.|
  |Verify that the Grantee User can create/update/delete details under the budget category - 'Indirect Cost' when the Amendment Request is sent back to the Subrecipient.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "FS10INDIRECTCOST_BUDGETCATEGORY"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9572
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Indirect Cost - Item 1" in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Indirect Cost - Item 1" in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:grantorBudgetChangeTableId---"
    #NYSED-9573
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Indirect Cost - Item 1" in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly cannot see row level action button "Delete" against "Indirect Cost - Item 1" in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    And I click modal button "Close"
    When I click on "Send Back to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "New" :
      | Description  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description1 | 100                  | 100        | 100            |
    #NYSED-9565
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" :
      | Actions     | Description  | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description1 | $100                 | $100       | $100           | $200        | $300               |
    Then I softly can see row level action button "Edit" against "Description1" in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Description1" in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Description  | Proposed Expenditure |
      | Description1 | 400                  |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" :
      | Actions     | Description  | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description1 | $400                 | $100       | $100           | $200        | $600               |
    When I click on "Delete" icon for "Description1" inside flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_CE   |

  @NYSED-9594 @NYSED-9595 @NYSED-Sprint-33 @US-NYSED-7995 @M06
  Scenario Outline:Verify that the Grantee user sees the Indirect Cost, Budget Categories modal, having a 'Description' column (Editable, Blank for new row, Short text 255 characters, and Required)
  |Verify that the Grantee user sees Indirect Cost, Budget Categories modal, having a 'Proposed Expenditure' column (Editable, Blank for new row, Can not be negative, Currency Field without decimals and Required)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "BudgetPeriodChangeId"
    #NYSED-9594
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      |             | 100                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "New" :
      | Description          | Proposed Expenditure | Cash Match | Non-Cash Match |
      | {SavedValue:Char256} | 100                  | 100        | 100            |
    Then I softly see value "{SavedValue:Char255}" for title "Description" against the value "$100" inside table "---amendment:-:AmendmentIndirectCostLineItemsTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Proposed Expenditure | Description     |
      | $100                 | New Description |
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" :
      | Actions     | Description     | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | New Description | $100                 | $100       | $100           | $200        | $300               |
    When I click on "Delete" icon for "New Description" inside flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" without waiting for record
    And I wait for "3" seconds
    #NYSED-9595
    When I enter the following values into flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description |                      | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description | eee@@$               | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description | -99                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description | 88.88                | 100        | 100            |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" :
      | Actions     | Description | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description | $8,888               | $100       | $100           | $200        | $9,088             |
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "Edit" :
      | Description | Proposed Expenditure |
      | Description | 50                   |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" :
      | Actions     | Description | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description | $50                  | $100       | $100           | $200        | $250               |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-9646 @NYSEDSprint-34 @US-NYSED-7414 @M06
  Scenario Outline: Verify that the Grantee User cannot see the Creating For and Child Organization fields on the Budget Redirection Amendment Request layout, when the subaward is created via Direct Grant.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #NYSED-9687
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Not For Profit" inside page block
    Then I softly cannot see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-9647 @NYSED-9648 @NYSED-9650 @NYSED-9637 @NYSED-Sprint-34 @US-NYSED-7414 @M06
  Scenario Outline: Verify that the Grantee User can see on the Amendments section → Budget Redirection Amendment Request layout, Overview tab -> Budget Summary section, below changes and fields sequence have been made.
  |Verify that the Grantee User can see on the Amendments section → Budget Redirection Amendment Request layout, Overview tab -> Budget Summary by Focus Area section, below changes and fields sequence have been made.|
  |Verify that the Grantee User can see on the Amendments section → Budget Redirection Amendment Request layout, Overview tab -> Budget Change section, below changes and column fields sequence have been made.|
  |Verify that the Grantee User can see on the Amendments section → Budget Redirection Amendment Request layout, Overview tab -> Overview section, below changes and fields sequence have been made.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #NYSED-9637
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly see field "Child Organization" inside page block
    Then I softly see field "Not For Profit" inside page block
    #NYSED-9647
    Then I softly see field "Current Obligation" inside "Budget Summary" section
    Then I softly see field "Expenditure Paid to Date" inside "Budget Summary" section
    Then I softly see field "Total Budgeted Amount" inside "Budget Summary" section
    Then I softly see field "Current Commitment" inside "Budget Summary" section
    Then I softly see field "Budget Redirection Threshold" inside "Budget Summary" section
    Then I softly see field "Subrecipient Match (%)" inside "Budget Summary" section
    Then I softly do not see field "Projected Program Income" inside "Budget Summary" section
    Then I softly do not see field "Program Income Type" inside "Budget Summary" section
    Then I softly do not see field "Program Income Justification" inside "Budget Summary" section
    #NYSED-9648
    Then I see the following headers in table with id "---amendment:-:subrecipientProjectAreasTableId---" :
      | Actions | Title | Start Date | End Date | Current Obligation | Expenditure Paid to Date | Total Budgeted Amount |
    #NYSED-9650
    Then I see the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions | Budget Category | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-9639 @NYSED-Sprint-34 @US-NYSED-7414 @M06
  Scenario Outline: Verify that the Grantee User cannot see the Child Organization fields on the Budget Redirection Amendment Request layout, Overview tab -> Overview section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly see field "Not For Profit" inside page block
    Then I softly cannot see field "Child Organization" inside page block

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-9651 @NYSED-Sprint-34 @US-NYSED-7414 @M06
  Scenario Outline: Verify that the Grantee User can see on the Amendments section → Budget Redirection Amendment Request layout, Overview tab -> Budget Change section, below changes and column fields sequence have been made when subrecipient match required is set to No
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH_NO"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #NYSED-9651
    Then I see only the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions | Budget Category | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-9678 @NYSED-9921 @NYSED-Sprint-34 @Bug-NYSED-10142 @US-NYSED-7414 @M06
  Scenario Outline: Verify that the 'Submit and Certify' Role and 'Create and Edit' Role User can see Revised Award Amount, Cash Match, Non-Cash Match column fields accepts only whole numbers
  |Verify that the Grantee User (Submit and Certify Role) can see on the Budget Redirection Amendment Request layout the required to save and submit validations for the following fields.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I clear the value from field "PurposeRTA__c"
    And I clear the value from field "Impact__c"
    And I clear the value from field "Justification__c"
    And I click on "Save" in the page details
    #NYSED-9921
    Then I softly see the following messages in the page details contains:
      | To save, Justification for Budget Redirection is required in the Overview tab under the Overview section. |
    And I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Enter the Overall Impact.        |
      | Overview Tab - Enter the Overall Justification. |
    #NYSED-9678
    When I edit the following rows inline in flex table with id "---amendment:-:BudgetChangeTableId---" by clicking "Edit" :
      | Budget Category             | Revised Award Amount | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 55.55                | 12.5       | 12.5           |
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Budget Category             | Budget Category Code | Revised Award Amount | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 15                   | $5,555               | $125       | $125           |
    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-10138 @NYSED-10139 @NYSED-Sprint-34 @US-NYSED-7414 @M06
  Scenario Outline: Verify that the Submit and Certify Role and Create and Edit Role User can see a page-level action 'Delete' on the Budget Redirection Amendment Request layout when it is in created state
  |Verify that the 'View Only' or 'LEA Admin' role users cannot see a page-level action 'Delete' on the Budget Redirection Amendment Request layout when it is in created state|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "BudgetRedirectionId"
    And I navigate to "Grants" tab
    And I wait for "4" seconds
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    #NYSED-10138
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "{SavedValue:BudgetRedirectionId}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:BudgetRedirectionId}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:BudgetRedirectionId}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    And I click on "View" icon for "{SavedValue:BudgetRedirectionId}" inside flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Delete" in page detail
    Then I softly can see top right dropdown button "Submit to Grantor" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "{SavedValue:BudgetRedirectionId}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:BudgetRedirectionId}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:BudgetRedirectionId}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    And I click on "View" icon for "{SavedValue:BudgetRedirectionId}" inside flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Delete" in page detail
    #NYSED-10139
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "{SavedValue:BudgetRedirectionId}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:BudgetRedirectionId}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:BudgetRedirectionId}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    And I click on "View" icon for "{SavedValue:BudgetRedirectionId}" inside flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I cannot see top right button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Delete" in page detail
    Then I softly cannot see top right dropdown button "Submit to Grantor" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "{SavedValue:BudgetRedirectionId}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:BudgetRedirectionId}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:BudgetRedirectionId}" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    And I click on "View" icon for "{SavedValue:BudgetRedirectionId}" inside flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I cannot see top right button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Delete" in page detail
    Then I softly cannot see top right dropdown button "Submit to Grantor" in page detail

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-9684 @NYSED-9689 @NYSED-9694 @NYSED-Sprint-34 @US-NYSED-8675 @M06
  Scenario Outline: Verify that the Internal User can see on the Amendment Requests section → Budget Redirection Amendment Request layout, Overview tab -> Overview section, below changes and fields sequence have been made.
  |Verify that the Internal User can see on the Amendments section → Budget Redirection Amendment Request layout, Overview tab -> Budget Summary by Focus Area section, below changes and fields sequence have been made.|
  |Verify that the Internal User can see on the Amendments section → Budget Redirection Amendment Request layout, Overview tab -> Budget Change section, below changes and column fields sequence have been made.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9684
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly see field "Child Organization" inside page block
    Then I softly see field "Not For Profit" inside page block
    #NYSED-9694
    Then I see the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Actions | Budget Category | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-9685 @NYSED-Sprint-34 @US-NYSED-8675 @M06
  Scenario Outline: Verify that the Internal User cannot see the Child Organization fields on the Budget Redirection Change Amendment Request layout, Overview tab -> Overview section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly see field "Not For Profit" inside page block
    Then I softly cannot see field "Child Organization" inside page block

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-9687 @NYSED-Sprint-34 @US-NYSED-8675 @M06
  Scenario Outline: Verify that the Internal User cannot see the Creating For and Child Organization fields on the Budget Redirection Amendment Request layout, when the subaward is created via Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9687
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Not For Profit" inside page block
    Then I softly cannot see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-9695 @NYSED-Sprint-34 @US-NYSED-8675 @M06
  Scenario Outline: Verify that the Internal User can see on the Amendments section → Budget Redirection Amendment Request layout, Overview tab -> Budget Change section, below changes and column fields sequence have been made when subrecipient match required is set to No
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH_NO"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Actions | Budget Category | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-9870 @NYSED-9880 @NYSED-Sprint-34 @US-NYSED-7089 @Bug-NYSED-10059 @M06
  Scenario Outline: Verify that the Internal User can see on the Amendment Requests section → Funding Change Amendment Request layout, Overview tab -> Overview section, below changes and fields sequence have been made.
  |Verify that the Internal User can see on the Funding Change Amendment Request layout, Overview tab -> Budget Change section table showing below changes and fields sequence. (Subrecipient Match Required: Yes)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #NYSED-9870
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly see field "Child Organization" inside page block
    Then I softly see field "Not For Profit" inside page block
    #NYSED-9880
    Then I see the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Actions | Budget Category | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |

    Examples:
      | GrantName                                        |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @NYSED-9875 @NYSED-9877 @NYSED-Sprint-34 @US-NYSED-7089 @Bug-NYSED-10058 @M06
  Scenario Outline: Verify that the Internal User cannot see the Creating For and Child Organization fields on the Funding Change Amendment Request layout, when the subaward is created via Direct Grant
  |Verify that the Internal User can see on the Funding Change Amendment Request layout, Overview tab -> Budget Summary section, below changes and fields sequence have been made.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #NYSED-9875
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Not For Profit" inside page block
    Then I softly cannot see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    #NYSED-9877
    Then I softly see field "Current Obligation" inside "Budget Summary" section
    Then I softly see field "Expenditure Paid to Date" inside "Budget Summary" section
    Then I softly see field "New Obligation" inside "Budget Summary" section
    Then I softly see field "Revised Obligation" inside "Budget Summary" section
    Then I softly see field "Total Budgeted Amount" inside "Budget Summary" section
    Then I softly see field "Current Commitment" inside "Budget Summary" section
    Then I softly see field "Revised Commitment" inside "Budget Summary" section
    Then I softly see field "Subrecipient Match (%)" inside "Budget Summary" section

    Examples:
      | GrantName                                                 |
      | {SavedValue:Automation Runtime Announcement Direct Grant} |

  @NYSED-9876 @NYSED-Sprint-34 @US-NYSED-7089 @M06
  Scenario Outline: Verify that the Internal User can see on the Funding Change Amendment Request layout the required to submit validations for the following fields.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I clear the value from field "PurposeRTA__c"
    And I clear the value from field "Impact__c"
    And I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | To submit, Overall Justification is required in the Overview tab under the Overview section.            |
      | To submit, Overall Impact is required in the Overview tab under the Overview section.                   |
      | To submit, Justification for Funding Change is required in the Overview tab under the Overview section. |
    Examples:
      | GrantName                                                 |
      | {SavedValue:Automation Runtime Announcement Direct Grant} |

  @NYSED-9881 @NYSED-9882 @NYSED-Sprint-34 @US-NYSED-7089 @Bug-NYSED-10060 @Bug-NYSED-10061 @M06
  Scenario Outline: Verify that the Internal User can see on the Funding Change Amendment Request layout, Overview tab -> Budget Change section table showing below changes and fields sequence. (Subrecipient Match Required: No)
  |Verify that the Internal User can see on the Funding Change Amendment Request layout, Overview tab -> Funding Change - Funding Accounts section table showing below changes and fields sequence.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH__NO"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #NYSED-9881
    Then I see only the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Actions | Budget Category | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference |
    #NYSED-9882
    Then I see only the following headers in table with id "---amendment:-:AmendmentFundingAccountTableId---" :
      | Actions | Funding Account EGMS ID | Funding Account Title | Funding Account Message | Fund Year | Available Balance | Enc Life | Expenditure Paid to Date | Outstanding Encumbrance | Revised Enc Life | Difference |

    Examples:
      | GrantName                                        |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @NYSED-9890 @NYSED-9908 @NYSED-9910 @NYSED-9918 @NYSED-Sprint-34 @US-NYSED-8673 @M06
  Scenario Outline: Verify that the Grantee User can see on the Amendment Requests section → Funding Change Amendment Request layout, Overview tab -> Overview section, below changes and fields sequence have been made.
  |Verify that the Grantee User can see on the Funding Change Amendment Request layout, Overview tab -> Budget Change section table showing below changes and fields sequence. (Subrecipient Match Required: Yes)|
  |Verify that the Grantee User can see on the Funding Change Amendment Request layout, Overview tab -> Budget Change section, inline actions are visible.|
  |Verify that, Grantee User can see all currency fields on Funding Change Amendment Request layout are converted to accept whole numbers only.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_DETAILBUDGET_YES_RISK_ASSESSMENT_NO"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 20.5  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "4" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9890
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly see field "Child Organization" inside page block
    Then I softly see field "Not For Profit" inside page block
    #NYSED-9908
    Then I see the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions | Budget Category | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
    #NYSED-9910
    Then I softly can see row level action button "Original Budget Details" against "Purchased Services" in flex table with id "---amendment:-:BudgetChangeTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---amendment:-:BudgetChangeTableId---"
    #NYSED-9918
    Then I softly see field "Current Obligation" as "$1,000"
    Then I softly see field "New Obligation" as "$205"
    Then I softly see field "Revised Obligation" as "$1,205"
    Then I softly see field "Current Commitment" as "$1,000"

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-9894 @NYSED-9905 @NYSED-Sprint-34 @US-NYSED-8673 @M06
  Scenario Outline: Verify that the Grantee User cannot see the Creating For and Child Organization fields on the Funding Change Amendment Request layout, when the subaward is created via Direct Grant.
  |Verify that the Grantee User can see on the Funding Change Amendment Request layout, Overview tab -> Budget Summary section, below changes and fields sequence have been made.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "4" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9894
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Justification for Funding Change" inside page block
    Then I softly see field "Not For Profit" inside page block
    Then I softly cannot see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    #NYSED-9905
    Then I softly see field "Current Obligation" inside "Budget Summary" section
    Then I softly see field "Expenditure Paid to Date" inside "Budget Summary" section
    Then I softly see field "New Obligation" inside "Budget Summary" section
    Then I softly see field "Revised Obligation" inside "Budget Summary" section
    Then I softly see field "Total Budgeted Amount" inside "Budget Summary" section
    Then I softly see field "Current Commitment" inside "Budget Summary" section
    Then I softly see field "Revised Commitment" inside "Budget Summary" section
    Then I softly see field "Subrecipient Match (%)" inside "Budget Summary" section

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-9906 @NYSED-Sprint-34 @US-NYSED-8673 @M06
  Scenario Outline: Verify that the Grantee User can see on the Funding Change Amendment Request layout, Overview tab -> Budget Summary by Focus Area section, below changes and fields sequence have been made.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And  I pause execution for "2" seconds
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "4" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see the following headers in table with id "---amendment:-:subrecipientProjectAreasTableId---" :
      | Actions | Title | Start Date | End Date | Current Obligation | Expenditure Paid to Date | New Obligation | Revised Obligation | Total Budgeted Amount |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-9909 @NYSED-Sprint-34 @US-NYSED-8673 @M06
  Scenario Outline: Verify that the Grantee User can see on the Funding Change Amendment Request layout, Overview tab -> Budget Change section table showing below changes and fields sequence. (Subrecipient Match Required: No)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH__NO"
    Given I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    Given I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    Given I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FD Username} | Step 1            |
    And I save the field labeled "EGMS ID" as "FundingID"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "4" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---amendment:-:BudgetChangeTableId---" :
      | Actions | Budget Category | Budget Category Code | Award Amount | Expenditure Paid to Date | Remaining Budget | Revised Award Amount | Difference |

    Examples:
      | GrantName                                        | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | GRANTEE_SC   |

  @NYSED-9829 @NYSED-9832 @Sprint-35 @US-NYSED-8854 @M06
    @NYSED-9804 @NYSED-9806 @NYSED-9809 @Sprint-35 @US-NYSED-9661 @M06
  Scenario Outline: Verify that GF staff queue member sees Terms and Conditions field updates correctly from amendment to newly created subaward on Subaward Overview tab after clicking 'Amend Subaward'
  |Verify that GF staff queue member sees that after clicking on the 'Amend Subaward' action, the newly created subaward has the same details as the previous subaward except for the updated Terms and Conditions value.|
  |Verify that Internal Profile User see that 'Submit for PO Approval' button appears in page-level action menu when Amendment is in Acknowledged state|
  |Verify that Internal Profile User see that 'Submit for PO Approval' button is not visible in page-level action menu when Amendment is not in Acknowledged state|
  |Verify that Internal Profile User see that status updated to 'Approved By Program Office' after Program Office approval|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                                       | Field                       |
      | Newly Created Subaward Terms and Conditions | NYSED_SubTermsConditions__c |
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    #NYSED-9806
    Then I softly cannot see top right dropdown button "Submit for PO Approval" in page detail
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Acknowledge" in page detail
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    #NYSED-9804
    Then I softly can see top right dropdown button "Submit for PO Approval" in page detail
    And I click on "Submit for PO Approval" in the page details
    And I wait for "4" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    #NYSED-9809
    Then I softly see field "Status" as "Approved By Program Office"
    When I click on "Send to Grant Finance" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation FO | Step 1            |
    When I click on "Mark as Approved" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    #NYSED-9806
    Then I softly cannot see top right dropdown button "Submit for PO Approval" in page detail
    When I click on "Amend Subaward" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #NYSED-9829
    Then I softly see field "Terms and Conditions" as "Newly Created Subaward Terms and Conditions"
    #NYSED-9832
    Then I softly see field "Subrecipient Organization" as "{AUTOEnvData:SubrecipientOrg}"
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Street" as "{AUTOEnvData:Char255}"
    Then I softly see field "PO Box" as "{AUTOEnvData:Char255}"
    Then I softly see field "City" as "{AUTOEnvData:Char40}"
    Then I softly see field "County Code" as "12"
    Then I softly see field "State" as "AK"
    Then I softly see field "Zip Code" as "68502"
    Then I softly see field "Country" as "USA"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:associatedContactsTableId---" :
      | Project Role    | Name                             |
      | Fiscal Contact  | Automation EXE                   |
      | Program Contact | Automation PM                    |
      |                 | Automation Grantee_SubmitCertify |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:objectivesTableId---" :
      | Title                          |
      | Automation Permanent Objective |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:kpiTableId---" :
      | Domain                 | Title                    |
      | Information Technology | Automation Permanent KPI |
    When I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly see field "Project Period Start Date" as "{Date:M/d/yyyy::d+50}"
    Then I softly see field "Project Period End Date" as "{Date:M/d/yyyy::d+150}"
    Then I softly see field "Budget Period End Date" as "{Date:M/d/yyyy::d+150}"
    Then I softly see field "Amendment Deadline" as "{Date:M/d/yyyy::d+140}"
    Then I softly see field "FS-10F Due Date" as "{Date:M/d/yyyy::d+150}"
    Then I softly see field "New Obligation" as "$0"
    Then I softly see field "Cumulative Obligation" as "$1,000"
    Then I softly see field "Total Commitment" as "$1,500"
    Then I softly see field "Match this Budget Period" as "$0"
    Then I softly see field "Required Match %" as "10.00%"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$0"
    Then I softly see field "Budgeted Direct Amount" as "$0"
    Then I softly see field "Requested Indirect Amount" as "$0"
    Then I softly see field "Total Budgeted Amount" as "$0"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:fundingAccountsTableId---" :
      | Funding Account EGMS ID      | Funding Account Title                     |
      | {AUTOEnvData:fundingAccount} | {AUTOEnvData:InternalFundingAccountTitle} |
    When I navigate to "Management" sub tab
    Then I see the following rows under the following headers in table with id "---amendment:-:amendmentRequestTableId---" :
      | EGMS ID                  |
      | {SavedValue:TermsCondId} |
    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |

  @NYSED-9861 @NYSEDSprint-35 @US-NYSED-8853 @M06
  Scenario Outline: Verify that the changed budget period date is also updated at the following places in the Grant layout once the award is activated
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter value "Automation Justification " into field "BudgetPeriodComments__c"
    And I enter value "{Date:M/d/yyyy::d+160}" into field "NewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BudgetPeriodChangeId"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BudgetPeriodChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BudgetPeriodChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:BudgetPeriodChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BudgetPeriodChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved By Program Office"
    When I click on "Send to Grant Finance" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Mark as Approved" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Amend Subaward" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see field "Project Period End Date" as "{Date:M/d/yyyy::d+160}" in "Period of Performance" pageblock
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:GrantorBudgetPeriodTableId---" :
      | Budget Period | Budget Period Start Date | Budget Period End Date | Status |
      | BP01          | {Date:M/d/yyyy::d+50}    | {Date:M/d/yyyy::d+160} | Active |
    When I navigate to "Subawards" sub tab
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---amendment:-:internalRelatedAwards1---" :
      | Title                  | Budget Period | Budget Period Dates                            |
      | {SavedValue:grantName} | BP01          | {Date:M/d/yyyy::d+50} - {Date:M/d/yyyy::d+150} |
      | {SavedValue:grantName} | BP01          | {Date:M/d/yyyy::d+50} - {Date:M/d/yyyy::d+160} |
    When I navigate to "Actuals" sub tab
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---" :
      | Budget period Number | Start Date            | End Date               |
      | BP01                 | {Date:M/d/yyyy::d+50} | {Date:M/d/yyyy::d+160} |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |

  @NYSED-9833 @NYSED-9838 @NYSED-Sprint-35 @US-NYSED-9604 @M06
    @NYSED-9800 @NYSED-Sprint-35 @US-NYSED-9661 @M06
  Scenario Outline: Verify that Grantee Profile User see that 'Amendment Classification' field value updates to 'Minor' on 'Submit to Grantor' button when all budget categories Difference values is zero
  |Verify that Internal Profile User (Program Office) see a Review Amendment Request Task is moved to completed task section when one of the PM/PO user clicks on ‘Submit for PO Approval’ or ‘Send Back to Subrecipient’ action|
  |Verify that Internal Profile User see that 'Submit for PO Approval' button appears in page-level action menu when Amendment is in Submitted to grantor state|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    #@NYSED-9833
    Then I softly see field "Amendment Classification" as "Minor"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    #NYSED-9838
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---amendment:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                          | Priority | Task Type                | Subject                                                                                                 |
      | Action menu | {SavedValue:BUDGETREDIRECTIONID} | Low      | Review Amendment Request | Review Amendment Request for Subaward #{SavedValue:awardName} for Automation Permanent Nysed School Org |
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9800
    Then I softly can see top right dropdown button "Submit for PO Approval" in page detail
    When I click on "Send Back to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Under Revision"
    And I navigate to "Grants" tab
    #NYSED-9838
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:completedTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---amendment:-:completedTaskTableId---" :
      | Actions     | EGMS ID                          | Priority | Task Type                | Subject                                                                                                 |
      | Action menu | {SavedValue:BUDGETREDIRECTIONID} | Low      | Review Amendment Request | Review Amendment Request for Subaward #{SavedValue:awardName} for Automation Permanent Nysed School Org |
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-9834 @NYSED-9837 @NYSED-Sprint-35 @US-NYSED-9604 @M06
  Scenario Outline: Verify that Grantee Profile User see that Amendment Classification' remains 'Major' on 'Submit to Grantor' when at least one budget category Difference value is non-zero
  |Verify that Grantee Profile User see that 'Amendment Classification' reverts to 'Major' when amendment is sent back and Budget Categories Difference value exceeds zero|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 900              |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider        | Calculation of Cost | 100                  | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    #NYSED-9834
    Then I softly see field "Amendment Classification" as "Major"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    #NYSED-9837
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Major"
    When I click on "Send Back to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Under Revision"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Minor"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-9847 @NYSED-9848 @NYSED-10141 @Sprint-35 @US-NYSED-9587 @M06
  Scenario Outline: Verify that Internal Profile User see that 'Amendment Classification' field is defaulted with value 'Major' and this field is non editable
  |Verify that Grantee Profile User (Submit and Certify Role) see a Task is generated with Below Task Type and Task Subject when Internal User clicks 'Send to Subrecipient' button on Amendment|
  |Verify that Grantee Profile User (Submit and Certify Role) see a Submit Amendment Request Task is moved to Completed task section when one of the Submit and Certify user clicks on ‘Submit to Grantor’ or ‘Acknowledge’ action|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                                       | Field                       |
      | Newly Created Subaward Terms and Conditions | NYSED_SubTermsConditions__c |
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    #NYSED-9847
    Then I see field "Amendment Classification" is not editable
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    #NYSED-9848
    Then I see the following rows under the following headers in table with id "---amendment:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                  | Priority | Task Type                | Subject                                            |
      | Action menu | {SavedValue:TermsCondId} | Low      | Submit Amendment Request | Submit Amendment Request #{SavedValue:TermsCondId} |
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Grants" tab
    #NYSED-10141
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:completedTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---amendment:-:completedTaskTableId---" :
      | Actions     | EGMS ID                  | Priority | Task Type                | Subject                                            |
      | Action menu | {SavedValue:TermsCondId} | Low      | Submit Amendment Request | Submit Amendment Request #{SavedValue:TermsCondId} |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |

  @NYSED-9805 @NYSED-Sprint-35 @US-NYSED-9661 @M06
  Scenario Outline: Verify that Internal Profile User see that 'Submit for PO Approval' button not visible in page-level action menu when Amendment is in other than Submitted to Grantor State
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly cannot see top right dropdown button "Submit for PO Approval" in page detail

    Examples:
      | GrantName                                                 | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM           |

  @NYSED-10593 @NYSED-10594 @NYSED-10598 @NYSED-Sprint-36 @US-NYSED-8860 @M06
  Scenario Outline: Verify that the Grantee User can see that, on the et Redirection Amendment Request layout, Overview tab -> Budget Summary section below indirect cost related fields are calculated.
  |Verify that the Grantee user can see that, on the Budget Redirection Amendment Request layout, Overview tab -> Budget Summary section - Maximum Indirect Allowed is calculated based on the Subcontract Yes and No in the Purchased Service budget category|
  |Verify that the Internal user can see that, on the Budget Redirection Amendment Request layout, Overview tab -> Budget Summary section below indirect cost related fields.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PURCHASEDSERVICES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I navigate to "Overview" sub tab
    #NYSED-10593
    Then I softly see field "Maximum Indirect Allowed" as "$100" in "Budget Summary" pageblock
    Then I softly see field "Budgeted Direct Amount" as "$1,000" in "Budget Summary" pageblock
    Then I softly see field "Requested Indirect Amount" as "$0" in "Budget Summary" pageblock
    Then I softly see field "Total Budgeted Amount" as "$1,000" in "Budget Summary" pageblock
    Then I softly see fields "NYSED_MaximumIndirectAllowed__c" is in edit mode
    Then I softly see fields "NYSED_BudgetedDirectAmount__c" is in edit mode
    Then I softly see fields "NYSED_Total_IndirectCost__c" is in edit mode
    Then I softly see fields "BudgetedAmount__c" is in edit mode
    #NYSED-10594
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    And I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost     | Proposed Expenditure |
      | Purchased Services - Item 2 | No              | TestVendor      | TestCalculationofCost_2 | 500                  |
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "Edit" :
      | Description of Item/Service | Proposed Expenditure |
      | Purchased Services - Item 1 | 500                  |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Maximum Indirect Allowed" as "$50" in "Budget Summary" pageblock
    Then I softly see field "Budgeted Direct Amount" as "$1,000" in "Budget Summary" pageblock
    Then I softly see field "Requested Indirect Amount" as "$0" in "Budget Summary" pageblock
    Then I softly see field "Total Budgeted Amount" as "$1,000" in "Budget Summary" pageblock
    And I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    #NYSED-10598
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "Edit" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Maximum Indirect Allowed" as "$50" in "Budget Summary" pageblock
    Then I softly see field "Budgeted Direct Amount" as "$1,000" in "Budget Summary" pageblock
    Then I softly see field "Requested Indirect Amount" as "$0" in "Budget Summary" pageblock
    Then I softly see field "Total Budgeted Amount" as "$1,000" in "Budget Summary" pageblock
    Then I softly see fields "NYSED_MaximumIndirectAllowed__c" is in edit mode
    Then I softly see fields "NYSED_BudgetedDirectAmount__c" is in edit mode
    Then I softly see fields "NYSED_Total_IndirectCost__c" is in edit mode
    Then I softly see fields "BudgetedAmount__c" is in edit mode

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-10595 @NYSED-Sprint-36 @US-NYSED-8860 @M06
  Scenario Outline: Verify that the Grantee User cannot see the following fields on the Budget Redirection Amendment Request layout, Overview tab -> Budget Summary section, when Budget Type is Lump Sum
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "LUMPSUM_DG_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Maximum Indirect Allowed" inside page block
    Then I softly cannot see field "Budgeted Direct Amount" inside page block
    Then I softly cannot see field "Requested Indirect Amount" inside page block

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-10596 @NYSED-Sprint-36 @US-NYSED-8860 @M06
  Scenario Outline: Verify that the Grantee User can see the validation message when clicking on the Submit to Grantor button and the Requested Indirect Amount is greater than the Maximum Indirect Allowed, on the Budget Redirection Amendment Request.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PURCHASEDSERVICES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentIndirectCostLineItemsTableId---" by clicking "New" :
      | Description | Proposed Expenditure |
      | Description | 200                  |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Requested Indirect Amount" as "$200" in "Budget Summary" pageblock
    And I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Requested Indirect Amount must be less than or equal to the Maximum Indirect Allowed amount. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_CE   |

  @NYSED-10508 @NYSED-Sprint-36 @US-NYSED-9321 @M06
  Scenario Outline: Verify that the GF staff queue member sees the Revised Budget Related values correctly from the amendment to the newly created Subaward Budget and Actuals sections after clicking the Amend Subaward action - Competitive without focus area
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMPETATIVE_DIRECTED_ANN_DIRECT_GRANT_MATCH_NO_FOCUS_AREA_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 2000             |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost     | Proposed Expenditure |
      | Purchased Services - Item 1 | Yes             | TestVendor      | TestCalculationofCost_1 | 1000                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see field "New Obligation" as "$2,000" in "Budget Summary" pageblock
    Then I softly see field "Total Budgeted Amount" as "$3,000" in "Budget Summary" pageblock
    Then I softly see field "Total Commitment" as "$3,000" in "Budget Summary" pageblock
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries | 15                   | $2,000       |
      | Action menu | Support Staff Salaries      | 16                   | $0           |
      | Action menu | Purchased Services          | 40                   | $1,000       |
      | Action menu | Supplies and Materials      | 45                   | $0           |
      | Action menu | Travel Expenses             | 46                   | $0           |
      | Action menu | Employee Benefits           | 80                   | $0           |
      | Action menu | Indirect Cost               | 90                   | $0           |
      | Action menu | BOCES Purchased Services    | 49                   | $0           |
      | Action menu | Minor Remodeling            | 30                   | $0           |
      | Action menu | Equipment                   | 20                   | $0           |
      |             | Total                       |                      | $3,000       |
      |             | Grand Total                 |                      | $3,000       |
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Professional Staff Salaries - Item 1" for title "Specific Position/Title" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see value "$2,000" for title "Projected Salary" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Purchased Services - Item 1" for title "Description of Item/Service" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "$3,000" for title "Enc Life" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I navigate to "Actuals" sub tab
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account EGMS ID" inside table "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---"
    Then I softly see value "$3,000" for title "Enc Life" inside table "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---"
    Then I softly see value "$3,000" for title "Award Amount" inside table "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10512 @NYSED-Sprint-36 @US-NYSED-9321 @M06
  Scenario Outline: Verify that the GF staff queue member sees the newly created subaward retains all original details except the updated budget-related field values after activating the award - Competitive type without focus area
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMPETATIVE_DIRECTED_ANN_DIRECT_GRANT_MATCH_NO_FOCUS_AREA_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Fund Year" as "AnnFundYear"
    And I save the field labeled "Project ID Seq. No." as "ProjIDSeqNo"
    And I save the field labeled "Project ID" as "ProjID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 3000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Major"
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Overview" sub tab
    Then I softly see field "Subaward Title" as "<GrantName>"
    Then I softly see field "Grant ID" as "{SavedValue:grantName}"
    Then I softly see field "Announcement Fund Year" as "{SavedValue:AnnFundYear}"
    Then I softly see field "Project ID Seq. No." as "{SavedValue:ProjIDSeqNo}"
    Then I see the field labeled "Project ID" as "{SavedValue:ProjID}"
    Then I softly see field "Subrecipient Organization" as "{SavedValue:SubrecipientOrg}"
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Street" as "{SavedValue:Char255}"
    Then I softly see field "PO Box" as "{SavedValue:Char255}"
    Then I softly see field "City" as "{SavedValue:Char40}"
    Then I softly see field "County Code" as "12"
    Then I softly see field "State" as "AK"
    Then I softly see field "Zip Code" as "68502"
    Then I softly see field "Country" as "USA"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:associatedContactsTableId---" :
      | Project Role    | Name                             |
      | Fiscal Contact  | Automation EXE                   |
      | Program Contact | Automation PM                    |
      |                 | Automation Grantee_SubmitCertify |
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly see field "Project Period Start Date" as "{Date:M/d/yyyy::d+50}"
    Then I softly see field "Project Period End Date" as "{Date:M/d/yyyy::d+150}"
    Then I softly see field "Budget Period End Date" as "{Date:M/d/yyyy::d+150}"
    Then I softly see field "Amendment Deadline" as "{Date:M/d/yyyy::d+140}"
    And I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:awardApproversTableId---" :
      | Name          | Award | Amendment Request | Reimbursement |
      | Automation PM | NA    |                   | NA            |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subawardOwnerTableId---" :
      | Name          | Responsibility |
      | Automation PO | Owner          |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10514 @NYSED-Sprint-36 @US-NYSED-9321 @M06
  Scenario Outline: Verify that the GF staff queue member sees the Revised Budget Related values correctly from the amendment to the newly created Subaward Budget and Actuals sections after clicking the Amend Subaward action- Formula BA without a focus area
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 2000             |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost     | Proposed Expenditure |
      | Purchased Services - Item 1 | Yes             | TestVendor      | TestCalculationofCost_1 | 1000                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Then I softly see field "New Obligation" as "$2,000" in "Budget Summary" pageblock
    Then I softly see field "Total Budgeted Amount" as "$3,000" in "Budget Summary" pageblock
    Then I softly see field "Total Commitment" as "$3,000" in "Budget Summary" pageblock
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Award Amount |
      | Action menu | Professional Staff Salaries | 15                   | $2,000       |
      | Action menu | Support Staff Salaries      | 16                   | $0           |
      | Action menu | Purchased Services          | 40                   | $1,000       |
      | Action menu | Supplies and Materials      | 45                   | $0           |
      | Action menu | Travel Expenses             | 46                   | $0           |
      | Action menu | Employee Benefits           | 80                   | $0           |
      | Action menu | Indirect Cost               | 90                   | $0           |
      | Action menu | BOCES Purchased Services    | 49                   | $0           |
      | Action menu | Minor Remodeling            | 30                   | $0           |
      | Action menu | Equipment                   | 20                   | $0           |
      |             | Total                       |                      | $3,000       |
      |             | Grand Total                 |                      | $3,000       |
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Professional Staff Salaries - Item 1" for title "Specific Position/Title" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    Then I softly see value "$2,000" for title "Projected Salary" inside table "---subAwardStandAlone:-:awardProfessionalSalariesTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly see value "Purchased Services - Item 1" for title "Description of Item/Service" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" inside table "---subAwardStandAlone:-:PurchasedServicesTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "$3,000" for title "Enc Life" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I navigate to "Actuals" sub tab
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:fundingAccount}" for title "Funding Account EGMS ID" inside table "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---"
    Then I softly see value "$3,000" for title "Enc Life" inside table "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---"
    Then I softly see value "$3,000" for title "Award Amount" inside table "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10515 @NYSED-Sprint-36 @US-NYSED-9321 @M06
  Scenario Outline: Verify that the GF staff queue member sees the newly created subaward retains all original details except the updated budget-related field values after activating the award - Competitive type without focus area
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Fund Year" as "AnnFundYear"
    And I save the field labeled "Project ID Seq. No." as "ProjIDSeqNo"
    And I save the field labeled "Project ID" as "ProjID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 3000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Major"
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Overview" sub tab
    Then I softly see field "Subaward Title" as "<GrantName>"
    Then I softly see field "Grant ID" as "{SavedValue:grantName}"
    Then I softly see field "Announcement Fund Year" as "{SavedValue:AnnFundYear}"
    Then I softly see field "Project ID Seq. No." as "{SavedValue:ProjIDSeqNo}"
    Then I see the field labeled "Project ID" as "{SavedValue:ProjID}"
    Then I softly see field "Subrecipient Organization" as "{SavedValue:SubrecipientOrg}"
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Street" as "{SavedValue:Char255}"
    Then I softly see field "PO Box" as "{SavedValue:Char255}"
    Then I softly see field "City" as "{SavedValue:Char40}"
    Then I softly see field "County Code" as "12"
    Then I softly see field "State" as "AK"
    Then I softly see field "Zip Code" as "68502"
    Then I softly see field "Country" as "USA"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:associatedContactsTableId---" :
      | Project Role    | Name                             |
      | Fiscal Contact  | Automation EXE                   |
      | Program Contact | Automation PM                    |
      |                 | Automation Grantee_SubmitCertify |
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly see field "Project Period Start Date" as "{Date:M/d/yyyy::d+50}"
    Then I softly see field "Project Period End Date" as "{Date:M/d/yyyy::d+150}"
    Then I softly see field "Budget Period End Date" as "{Date:M/d/yyyy::d+150}"
    Then I softly see field "Amendment Deadline" as "{Date:M/d/yyyy::d+140}"
    And I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:awardApproversTableId---" :
      | Name          | Award | Amendment Request | Reimbursement |
      | Automation PM | NA    |                   | NA            |
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:subawardOwnerTableId---" :
      | Name          | Responsibility |
      | Automation PO | Owner          |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10619 @NYSED-Sprint-36 @US-NYSED-10353 @M06
  Scenario Outline: Verify that the Undo button is not visible to the last approver when the Amendment is in the state 'Approved' - Major Amendment
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 3000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Major"
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID     | Revised Enc Life |
      | {SavedValue:fundingAccount} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:FO Username}  | Step 1            |
      | {SavedValue:EXE Username} | Step 2            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly cannot see top right button "Undo" in page detail

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10443 @NYSED-Sprint-36 @US-NYSED-8843 @M06
  Scenario Outline: Verify that the Grantee User can see that on the Budget Redirectio Amendment Request layout, Overview tab -> Budget Summary section, the following changes and fields sequence have been made.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #NYSED-10443
    Then I softly see field "Current Obligation" inside "Budget Summary" section
    Then I softly see field "Expenditure Paid to Date" inside "Budget Summary" section
    Then I softly see field "New Obligation" inside "Budget Summary" section
    Then I softly see field "Revised Obligation" inside "Budget Summary" section
    Then I softly see field "Current Commitment" inside "Budget Summary" section
    Then I softly see field "Revised Commitment" inside "Budget Summary" section
    Then I softly see field "Budget Redirection Threshold" inside "Budget Summary" section
    Then I softly see field "Indirect Rate (%)" inside "Budget Summary" section
    Then I softly see field "Maximum Indirect Allowed" inside "Budget Summary" section
    Then I softly see field "Budgeted Direct Amount" inside "Budget Summary" section
    Then I softly see field "Requested Indirect Amount" inside "Budget Summary" section
    Then I softly see field "Total Budgeted Amount" inside "Budget Summary" section

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10497 @NYSED-Sprint-36 @US-NYSED-8843 @M06
  Scenario Outline: Verify that the Grantee can see that, on the Amendment, the indirect rate is populated from the organization’s previous year if it is lower than the maximum indirect rate specified in the announcement and the current fiscal-year rates are not available.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_INDIRECT_COST_MAX_ANN"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "AUTOMATION_PERMANENT_WITHOUT_INSTITUTION_ORG"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see field "Indirect Rate (%)" as "8.99%" in "Budget Summary" pageblock
    Then I see field "Indirect Rate (%)" is not editable

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXTERNAL_SC  |

  @NYSED-10498 @NYSED-Sprint-36 @US-NYSED-8843 @M06
  Scenario Outline: Verify that the Grantee can see that, on the Amendment, the maximum indirect rate specified in the announcement if the organization’s previous-year rate is higher than it and the current fiscal-year rates are not available.:Budget Redirection
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_INDIRECT_COST_MIN_ANN"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "AUTOMATION_PERMANENT_WITHOUT_INSTITUTION_ORG"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see field "Indirect Rate (%)" as "7.50%" in "Budget Summary" pageblock

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXTERNAL_SC  |

  @NYSED-10499 @NYSED-Sprint-36 @US-NYSED-8843 @M06
  Scenario Outline: Verify that the Grantee can see that, on the Amendment, the indirect rate populated from the organization’s previous fiscal year rate when the maximum indirect rate is not available in the announcement the current fiscal-year rates are not available.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_INDIRECT_COST_NULL_ANN"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "AUTOMATION_PERMANENT_WITHOUT_INSTITUTION_ORG"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see field "Indirect Rate (%)" as "8.99%" in "Budget Summary" pageblock

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | EXTERNAL_SC  |

  @NYSED-10503 @NYSED-Sprint-36 @US-NYSED-8843 @M06
  Scenario Outline: Verify that the Grantee User can view the indirect rate populated as 0% when the Not-for-Profit flag is set to 'No' for the related organization
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_MATCH_NO_FOCUS_AREA_NO_NOTFORPROFIT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "NOT_FOR_PROFIT_NO"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see field "Indirect Rate (%)" as "0.00%" in "Budget Summary" pageblock

    Examples:
      | GrantName                                                 | ExternalUser    |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | SUBRECIPIENT_SC |

  @NYSED-10183 @NYSED-10195 @NYSED-Sprint-36 @US-NYSED-9184 @M06
  Scenario Outline: Verify that the Internal user with PM/PO profile can see the validation on clicking the new button on the Subaward → Management tab → Amendment Request section when a Minor amendment is neither Approved nor Approved by Program Office
  |Verify that the Internal user with the FD profile can see the validation at the click of ‘Transfer’ on the Subaward layout → Actuals tab → Funding Account Information section when a minor amendment is neither Approved nor Approved by Program Office|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Minor"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - Active"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:BUDGETREDIRECTIONID} is already in progress. |
    #NYSED-10195
    And I refresh the page
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "Transfer" icon for "{SavedValue:fundingAccount}" inside flex table with id "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Transfers cannot be initiated while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10184 @NYSED-10196 @NYSED-Sprint-36 @US-NYSED-9184 @M06
  Scenario Outline: Verify that the Internal user with PM/PO profile can see the validation on clicking the new button on the Subaward → Management tab → Amendment Request section when a major amendment is neither Approved nor Approved by Program Office
  |Verify that the Internal user with the FD profile can see the validation at the click of ‘Transfer’ on the Subaward layout → Actuals tab → Funding Account Information section when a major amendment is neither Approved nor Approved by Program Office|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 900              |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Description of Item     | 1              | 1   | 100                    | 1                                                  | 100              |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Amendment Classification" as "Major"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - Active"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:BUDGETREDIRECTIONID} is already in progress. |
    #NYSED-10196
    And I refresh the page
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "Transfer" icon for "{SavedValue:fundingAccount}" inside flex table with id "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Transfers cannot be initiated while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10185 @NYSED-10187 @NYSED-10197 @NYSED-10199 @NYSED-Sprint-36 @US-NYSED-9184 @M06
  Scenario Outline: Verify that the Internal user with PM/PO profile can see the validation on clicking the new button on the Subaward → Management tab → Amendment Request section when a Minor amendment is approved, but the Issued Award has not been created yet
  |Verify that the Internal user with PM/PO profile can see the validation on clicking the new button on the Subaward → Management tab → Amendment Request section when a Minor amendment is approved, and the Issued Award is created but not activated yet|
  |Verify that the FD profile can see the validation at the click of ‘Transfer’ on the Subaward layout → Actuals tab → Funding Account Information section when a Minor amendment is approved, but the Issued Award has not been created yet.|
  |Verify that the FD profile can see the validation at the click of ‘Transfer’ on the Subaward layout → Actuals tab → Funding Account Information section when a Minor amendment is approved, and the Issued Award is created but not activated yet|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see field "Amendment Classification" as "Minor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved By Program Office"
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - Active"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    #NYSED-10185
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:BUDGETREDIRECTIONID} is already in progress. |
    And I refresh the page
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "Transfer" icon for "{SavedValue:fundingAccount}" inside flex table with id "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---" without waiting for record
    #NYSED-10197
    Then I softly see the following messages in the page details contains:
      | Transfers cannot be initiated while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |
    And I refresh the page
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Amend Subaward" in the page details
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - Active"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    #NYSED-10187
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:BUDGETREDIRECTIONID} is already in progress. |
    And I refresh the page
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
   #NYSED-10199
    And I click on "Transfer" icon for "{SavedValue:fundingAccount}" inside flex table with id "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Transfers cannot be initiated while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PO           |

  @NYSED-10201 @NYSED-10203 @NYSED-Sprint-36 @US-NYSED-9184 @M06
  Scenario Outline: Verify that the Internal user with PM/PO profile cannot see the validation on clicking the new button on the Subaward → Management tab → Amendment Request section when any type of Amendment is not in progress.
  |Verify that the Internal user with the FD profile cannot see the validation at the click of ‘Transfer’ on the Subaward layout → Actuals tab → Funding Account Information section when any type of Amendment is not in progress.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    #NYSED-10201
    And I wait for "2" seconds
    Then I softly see field on modal "Overall Justification" inside page block
    Then I softly see field on modal "Overall Impact" inside page block
    Then I see the text "Create Amendment Request" in modal
    And I click modal button "Close"
    When I click alert button "OK"
    And I wait for "2" seconds
    #NYSED-10203
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "Transfer" icon for "{SavedValue:fundingAccount}" inside flex table with id "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see the text "Transfer Details" in modal

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-10186 @NYSED-10188 @NYSED-10198 @NYSED-10200 @NYSED-Sprint-36 @US-NYSED-9184 @M06
  Scenario Outline:Verify that the Internal user with PM/PO profile can see the validation on clicking the new button on the Subaward → Management tab → Amendment Request section when a Major amendment is approved, but the Issued Award has not been created yet.
  |Verify that the Internal user with PM/PO profile can see the validation on clicking the new button on the Subaward → Management tab → Amendment Request section when a Major amendment is approved, and the Issued Award is created but not activated yet|
  |Verify that the FD profile can see the validation at the click of ‘Transfer’ on the Subaward layout → Actuals tab → Funding Account Information section when a Major amendment is approved, but the Issued Award has not been created yet.|
  |Verify that the FD profile can see the validation at the click of ‘Transfer’ on the Subaward layout → Actuals tab → Funding Account Information section when a Major amendment is approved, and the Issued Award is created but not activated yet|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    Given I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 900              |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentSupportStaffSalariesLineItemsTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Description of Item     | 1              | 1   | 100                    | 1                                                  | 100              |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see field "Amendment Classification" as "Major"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved By Program Office"
    When I click on "Send to Grant Finance" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Mark as Approved" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - Active"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    #NYSED-10186
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:BUDGETREDIRECTIONID} is already in progress. |
    And I refresh the page
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "Transfer" icon for "{SavedValue:fundingAccount}" inside flex table with id "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---" without waiting for record
    #NYSED-10198
    Then I softly see the following messages in the page details contains:
      | Transfers cannot be initiated while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |
    And I refresh the page
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Amend Subaward" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Pending Activation"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Actuals" sub tab
    And I click on "Transfer" icon for "{SavedValue:fundingAccount}" inside flex table with id "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---" without waiting for record
    #NYSED-10200
    Then I softly see the following messages in the page details contains:
      | Transfers cannot be initiated while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |
    And I refresh the page
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - Active"
    When I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    #NYSED-10188
    Then I softly see the following messages in the page details contains:
      | New amendment cannot be created as an Amendment Request {SavedValue:BUDGETREDIRECTIONID} is already in progress. |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PO           |

  @NYSED-10189 @NYSED-10191 @NYSED-10193 @NYSED-Sprint-36 @US-NYSED-9184 @M06
  Scenario Outline: Verify that the Internal user with the FD profile can see the validation at the click of ‘Release Initial Payment’ on the subaward layout when a Minor amendment is neither Approved nor Approved by the Program Office
  |Verify that the Internal user with the FD profile can see the validation at the click of ‘Release Initial Payment’ on the subaward layout when a Minor amendment is approved, but the Issued Award has not been created yet|
  |Verify that the Internal user with the FD profile can see the validation at the click of ‘Release Initial Payment’ on the subaward layout when a Minor amendment is approved, and the Issued Award is created but not activated yet|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    When I perform quick search for "{SavedValue:awardName}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see field "Amendment Classification" as "Minor"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Release Initial Payment" in the page details
    #NYSED-10189
    Then I softly see the following messages in the page details contains:
      | Initial Advance Payment cannot be created while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |
    And I refresh the page
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved By Program Office"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Release Initial Payment" in the page details
    #NYSED-10191
    Then I softly see the following messages in the page details contains:
      | Initial Advance Payment cannot be created while Amendment Request {SavedValue:BUDGETREDIRECTIONID} is in progress. |

    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PO           |

  @NYSED-10190 @NYSED-10192 @NYSED-10194 @NYSED-Sprint-36 @US-NYSED-9184 @M06
  Scenario Outline: Verify that the Internal user with the FD profile can see the validation at the click of ‘Release Initial Payment’ on the subaward layout when a major amendment is neither Approved nor Approved by Program Office
  |Verify that the Internal user with the FD profile can see the validation at the click of ‘Release Initial Payment’ on the subaward layout when a Major amendment is approved, but the Issued Award has not been created yet.|
  |Verify that the Internal user with the FD profile can see the validation at the click of ‘Release Initial Payment’ on the subaward layout when a Major amendment is approved, and the Issued Award is created but not activated yet|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                                       | Field                       |
      | Newly Created Subaward Terms and Conditions | NYSED_SubTermsConditions__c |
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    Then I softly see field "Amendment Classification" as "Major"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Release Initial Payment" in the page details
    #NYSED-10190
    Then I softly see the following messages in the page details contains:
      | Initial Advance Payment cannot be created while Amendment Request {SavedValue:TermsCondId} is in progress. |
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for PO Approval" in the page details
    And I wait for "4" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved By Program Office"
    When I click on "Send to Grant Finance" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grant Finance"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Mark as Approved" in the page details without processing
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Release Initial Payment" in the page details
    #NYSED-10192
    Then I softly see the following messages in the page details contains:
      | Initial Advance Payment cannot be created while Amendment Request {SavedValue:TermsCondId} is in progress. |
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Amend Subaward" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Release Initial Payment" in the page details
    #NYSED-10194
    Then I softly see the following messages in the page details contains:
      | Initial Advance Payment cannot be created while Amendment Request {SavedValue:TermsCondId} is in progress. |
    Examples:
      | GrantName                                                 | ExternalUser | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   | PM           |

  @NYSED-10202 @NYSED-Sprint-36 @US-NYSED-9184 @M06
  Scenario Outline: Verify that the Internal user with the FD profile cannot see the validation at the click of ‘Release Initial Payment’ on the subaward layout when any type of Amendment is not in progress.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTGRANT_YES_ABLETOPAYYES_NEWFUNDINGACCUNT_BYAPPLICANT"
    Given I created standalone grant from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "{SavedValue:Automation Runtime Announcement Direct Grant}" and properties "default"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    When I click on "Manage Holds" in the page details
    When I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Release Initial Payment" in the page details
    And I wait for "3" seconds
    Then I softly cannot see the following messages in the page details contains:
      | Initial Advance Payment cannot be created while Amendment Request |
    When I navigate to "Actuals" sub tab
    Then I softly see value "Created" for title "Status" against the value "Advance" inside table "---paymentRequest:-:grantorPaymentRequestTableId---"

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-11038 @NYSED-Sprint-37 @US-NYSED-8842 @M06
  Scenario Outline: Verify that the GF staff queue member sees the Revised Budget Related values correctly from the amendment to the newly created Subaward Budget and Actuals sections after clicking the Amend Subaward action - Competitive without focus area
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMPETATIVE_DIRECTED_ANN_DIRECT_GRANT_MATCH_NO_FOCUS_AREA_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "Yes" into field "NYSED_GSPS__c"
    And I enter value "1000" into field "NYSED_Expenditure_Cap__c"
    And I save the field labeled "Year" as "year"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter in modal value "{SavedValue:year}" into field "NYSED_Year__c"
    And I enter in modal value "1000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "fundingAccId"
    And I save the field labeled "Title" as "fundingAccTitle"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 2000             |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost     | Proposed Expenditure |
      | Purchased Services - Item 1 | Yes             | TestVendor      | TestCalculationofCost_1 | 1000                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I perform quick search for "{SavedValue:fundingAccId}" in "---amendment:-:AssociateFundingAccountTableId---" panel
    When I click "Add" after selection of "{SavedValue:fundingAccId}" by showing entries "All" in flex table with id "---amendment:-:AssociateFundingAccountTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID   | Revised Enc Life |
      | {SavedValue:fundingAccId} | 2000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-11036 @NYSED-Sprint-37 @US-NYSED-8842 @M06 @bug-NYSED-11097
  Scenario Outline: Verify Validation Message on Submit for Approval When Associated Funding Account Is Deactivated - Funding Change Amendment
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I save the field labeled "Year" as "year"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter in modal value "{SavedValue:year}" into field "NYSED_Year__c"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "fundingAccId"
    And I save the field labeled "Fund Year" as "fundingAccFundYear"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 2000             |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost     | Proposed Expenditure |
      | Purchased Services - Item 1 | Yes             | TestVendor      | TestCalculationofCost_1 | 1000                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I perform quick search for "{SavedValue:fundingAccId}" in "---amendment:-:AssociateFundingAccountTableId---" panel
    When I click "Add" after selection of "{SavedValue:fundingAccId}" by showing entries "All" in flex table with id "---amendment:-:AssociateFundingAccountTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID   | Revised Enc Life |
      | {SavedValue:fundingAccId} | 2000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:fundingAccId}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:fundingAccId}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Cannot approve as associated funding account(s) for Fund Year {SavedValue:fundingAccFundYear} are deactivated. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-11040 @NYSED-Sprint-37 @US-NYSED-8842 @M06
  Scenario Outline: Verify that the GF staff queue member sees the updated validation message on Funding Change Amendment
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I save the field labeled "Year" as "year"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter in modal value "{SavedValue:year}" into field "NYSED_Year__c"
    And I enter in modal value "1000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "fundingAccId"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 2000             |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost     | Proposed Expenditure |
      | Purchased Services - Item 1 | Yes             | TestVendor      | TestCalculationofCost_1 | 1000                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I perform quick search for "{SavedValue:fundingAccId}" in "---amendment:-:AssociateFundingAccountTableId---" panel
    When I click "Add" after selection of "{SavedValue:fundingAccId}" by showing entries "All" in flex table with id "---amendment:-:AssociateFundingAccountTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID   | Revised Enc Life |
      | {SavedValue:fundingAccId} | 2000             |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Revised Enc Life cannot be greater than Available balance. |

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-11043 @NYSED-Sprint-37 @US-NYSED-8842 @M06
  Scenario Outline: Verify Funding Account Balance Calculations for GSPS Funding Source on Amendment Approval and Subaward Activation - Funding Change Amendment
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I save the field labeled "Year" as "year"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter in modal value "{SavedValue:year}" into field "NYSED_Year__c"
    And I enter in modal value "5000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "fundingAccId"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
      | 3000  | RevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "4" seconds
    And I navigate to "Overview" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AmendmentProfessionalSalariesLineItemsTableId---" by clicking "Edit" :
      | Specific Position/Title              | Projected Salary |
      | Professional Staff Salaries - Item 1 | 2000             |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---amendment:-:BudgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:AmendmentPurchasedServicesLineItemsTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost     | Proposed Expenditure |
      | Purchased Services - Item 1 | Yes             | TestVendor      | TestCalculationofCost_1 | 1000                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:POApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I navigate to "Overview" sub tab
    And I click on "Submit for PO Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for PO Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Grant Finance" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I click on "Remove" icon for "{SavedValue:fundingAccount}" inside flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    And I click on top right button "Associate" in flex table with id "---amendment:-:amendmentFundingAccountsTableId---"
    When I perform quick search for "{SavedValue:fundingAccId}" in "---amendment:-:AssociateFundingAccountTableId---" panel
    When I click "Add" after selection of "{SavedValue:fundingAccId}" by showing entries "All" in flex table with id "---amendment:-:AssociateFundingAccountTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account EGMS ID   | Revised Enc Life |
      | {SavedValue:fundingAccId} | 3000             |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Amend Subaward" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Pending Activation"
    And I click on "Activate" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Activated"
    And I navigate to "Actuals" sub tab
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:FundingAccountActualsTableId---" :
      | Funding Account EGMS ID   | Outstanding Encumbrance |
      | {SavedValue:fundingAccId} | $3,000                  |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:fundingAccId}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:fundingAccId}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    Then I softly see field "Pre-Encumbrance" as "$0" in "Financials" pageblock
    Then I softly see field "Outstanding Encumbrance" as "$3,000" in "Financials" pageblock
    Then I softly see field "Total Obligation" as "$3,000" in "Financials" pageblock
    Then I softly see field "Available Balance" as "$2,000" in "Financials" pageblock

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |


