@preApplicationExecution @preApplication @grantor-regression @grantor-parallel-regression @app @ApplicationAndPre-App
Feature: Validate all scenarios in the Pre-Application

  @Sprint-12-US-475605 @477596 @477604 @477597 @477605 @477598 @VaishaliD
  Scenario: As a Grantee, verify that, Proposal tab should be hide on Pre-application for shared revenue program
    | As a Grantee, verify that validation should not come while save the pre-application for 'Approach/Methodology, Capacity, Qualifications' sections on proposals tab for shared revenue program
    | As a Grantee, verify that 'Project Abstract' field on Pre-application is optional for Shared Revenue programs
    | As a Grantee, verify that validation should not come while save and submit the Pre-application for 'Project Abstract' section on overview tab if this field is blank for Shared Revenue program
    | As a Grantee, verify that validation should not come while submitting the pre-application for 'Approach/Methodology, Capacity, Qualifications' sections on proposals tab for shared revenue program
    Given I published "Directed" type announcement having name "Automation Runtime SR Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "CITY1" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime SR Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime SR Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I get the "EGMS ID"
    #477596
    Then I softly cannot see "Proposal" sub tab at view detail page
    #477604
    And I clear the value from field "ProjectAbstract__c"
    #477597 #477605
    And I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Proposal Tab - Provide the Approach/Methodology before submitting this Pre-Application. |
      | Proposal Tab - Provide the Capacity before submitting this Pre-Application.             |
      | Proposal Tab - Provide the Qualifications before submitting this Pre-Application.       |
      | Overview Tab - Provide the Project Abstract before submitting this Pre-Application.     |
    #477598
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly cannot see the following messages in the page details :
      | Proposal Tab - Provide the Approach/Methodology before submitting this Pre-Application. |
      | Proposal Tab - Provide the Capacity before submitting this Pre-Application.             |
      | Proposal Tab - Provide the Qualifications before submitting this Pre-Application.       |
      | Overview Tab - Provide the Project Abstract before submitting this Pre-Application.     |

