@StaticRecord @announcement @regression @NeedtoRevisit @wip
Feature: Validate all scenarios in the Announcement tab - Static record related

  @222259 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusisClosedthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforeawardcreation @sprint-11-US-201558  @Allocation
  Scenario: Verify if user wants update the final allocation for a given organization & if the announcement status is Closed then user should see the updated final allocation is reflected in the corresponding application (before award creation)
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicant_FDMApproved}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicant_FDMApproved}" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"

  @222301 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusisClosedthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforeawardcreation @sprint-11-US-201558  @Allocation
  Scenario: Verify if user wants update the final allocation for a given organization & if the announcement status is Closed then user should see the updated final allocation is reflected in the corresponding application (before award creation)
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicantAndFocusArea_FDMApproved}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicantAndFocusArea_FDMApproved}" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,000.00"