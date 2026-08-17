@riskAssessment @regression @orgRiskAssessment @orgRiskAssessmentWithBackground
Feature: Validate all scenarios in the Organizational Risk Assessment

  @Sprint-8-US-430590 @433089 @433090 @433091 @VaishaliD
  Scenario: To verify that question 2 of the Cost Principles section should be updated as per the following: How does the organization allocate grant awarded cost categories?
    | To verify that following 3 options should be in the dropdown of How does the organization allocate grant awarded cost categories? Question.
    | To verify that question 2 of the Property Standards section should be updated as per the following: Does the organization have a control system in place to ensure adequate safeguards to prevent loss, damage, theft or unauthorized use of the property?.
    | To verify that following 2 options should be in the dropdown of Does the organization have a control system in place to ensure adequate safeguards to prevent loss, damage, theft or unauthorized use of the property? Question
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I wait for "3" seconds
    And I refresh the page
    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    And I wait for "3" seconds
    And I enter value "checked" into field "Signature__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I navigate to "Assessment" sub tab
    And I softly see "Cost Principles (Max Score : 15)" page block displayed
    #433089
    Then I softly see field "2. How does the organization allocate grant awarded cost categories?" on page
    #433090
    Then I see only the following ordered options in dropdown field "Cost_Question2__c" :
      | --None-- | The organization does not separate costs per award. | The organization separates costs per grant award and cost categories. | The organization separates cost per grant award. |
    #433091
    And I softly see "Property Standards (Max Score : 15)" page block displayed
    Then I softly see field "2. Does the organization have a control system in place to ensure adequate safeguards to prevent loss, damage, theft or unauthorized use of the property?" inside page block
    #433092
    Then I see only the following ordered options in dropdown field "Property_Questions2__c" :
      | --None-- | Yes | No |

  @Sprint-18-US-472908 @474053 @VaishaliD
  Scenario: Verify the business license number field allows only numbers on Grantee organization (GA user)
    Given I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "474738292" in "---grantee_tableId:-:activeAccount---" panel
    When I click on "Edit" icon for "474738292" inside flex table with id "---grantee_tableId:-:activeAccount---"
    And I enter value "21@@@$#@DFdf" into field "BusinessLicenseNumber__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #474053
    Then I softly see the following messages in the page details contains:
      | Business License Number must contain only numbers. |