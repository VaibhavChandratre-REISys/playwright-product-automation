@APITESTFile
Feature: Validate all API cases

  @Award_FDM
  Scenario Outline: Award From FDM
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab

    Examples:
      | GrantName                                        | InternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | PM           |
#      | {SavedValue:Automation Runtime FDM Announcement} | PO           |

  @DG_API
  Scenario Outline: Direct Grant API
  |Verify that the Internal User (Amendment Owner) can see the Edit, Delete, and Send to Subrecipient buttons on the Terms and Conditions Change Amendment Request layout when the Amendment Request is in Created state|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "FS10F_DG_PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab

    Examples:
      | GrantName                                                 | InternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PM           |
#      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO           |