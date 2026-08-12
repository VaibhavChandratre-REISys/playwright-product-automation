@GranteeGrantsAwards
Feature: Validate all scenarios for Grants & Awards

  @456238 @ValidateGrantPOFOFDthePhasewiselevellistviewforGrant @P3_Grantee @PO_Grantee @GRegression2
  Scenario: Validate Grant PO FO FD the Phase wise level list view for Grant
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see default toggle as "Grants - My Records" for table "---grantee_tableId:-:GrantsTable---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:GrantsTable---"
    When I click on parallel lines menu bar with data target value "Grants - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Grants - All" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Draft" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Active" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Rejected" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Closed" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - My Records" inside flex table id "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - All"
    And I wait for "3" seconds
    And I select value inside table "---grantee_tableId:-:GrantsTable---" is "5"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed/Completed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed/Completed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Cl" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Terminated" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Rejected"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Terminated" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Closed"
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - My Records"
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"

  @456238_1 @ValidateGrantPOFOFDthePhasewiselevellistviewforGrant @P3_Grantee @FO_Grantee @GRegression2
  Scenario: Validate Grant PO FO FD the Phase wise level list view for Grant
    When I login to "Grantee" app as "GRANTEE FO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see default toggle as "Grants - My Records" for table "---grantee_tableId:-:GrantsTable---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:GrantsTable---"
    When I click on parallel lines menu bar with data target value "Grants - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Grants - All" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Draft" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Active" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Rejected" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Closed" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - My Records" inside flex table id "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - All"
    And I wait for "2" seconds
    Then I see "10" records inside flex table id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed/Completed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed/Completed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Cl" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Terminated" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Rejected"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Terminated" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Closed"
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - My Records"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"

  @456238_2 @ValidateGrantPOFOFDthePhasewiselevellistviewforGrant @P3_Grantee @FD_Grantee @GRegression2
  Scenario: Validate Grant PO FO FD the Phase wise level list view for Grant
    When I login to "Grantee" app as "GRANTEE FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see default toggle as "Grants - My Records" for table "---grantee_tableId:-:GrantsTable---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:GrantsTable---"
    When I click on parallel lines menu bar with data target value "Grants - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Grants - All" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Draft" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Active" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Rejected" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Closed" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - My Records" inside flex table id "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - All"
    And I wait for "2" seconds
    Then I see "10" records inside flex table id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed/Completed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed/Completed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Cl" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Terminated" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Rejected"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Terminated" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Closed"
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - My Records"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"

  @456280 @ValidateAwardPOFOFDthePhasewiselevellistviewforAward @PO_Grantee @P4_Grantee @GRegression2
  Scenario: Validate Award PO FO FD the Phase wise level list view for Award
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see default toggle as "Awards - My Records" for table "---grantee_tableId:-:awardTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardTableId---"
    When I click on parallel lines menu bar with data target value "Awards - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Awards - All" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Draft" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Active" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Rejected" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Closed" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - My Records" inside flex table id "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    And I wait for "5" seconds
    And I select value inside table "---grantee_tableId:-:awardTableId---" is "5"
    When I perform quick search for "created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Amended" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Amended" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    And I click toggle button to select "Awards - Draft"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Active"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Rejected"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Closed"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I wait for "2" seconds
    And I click toggle button to select "Awards - My Records"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"

  @456280_1 @ValidateAwardPOFOFDthePhasewiselevellistviewforAward @FO_Grantee @P4_Grantee @GRegression2
  Scenario: Validate Award PO FO FD the Phase wise level list view for Award
    When I login to "Grantee" app as "GRANTEE FO" user
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see default toggle as "Awards - My Records" for table "---grantee_tableId:-:awardTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardTableId---"
    When I click on parallel lines menu bar with data target value "Awards - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Awards - All" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Draft" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Active" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Rejected" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Closed" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - My Records" inside flex table id "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    And I wait for "5" seconds
    And I select value inside table "---grantee_tableId:-:awardTableId---" is "5"
    When I perform quick search for "created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Amended" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Amended" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    And I click toggle button to select "Awards - Draft"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Active"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Rejected"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Closed"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I wait for "2" seconds
    And I click toggle button to select "Awards - My Records"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"

  @456280_2 @ValidateAwardPOFOFDthePhasewiselevellistviewforAward @FD_Grantee @P4_Grantee @GRegression2
  Scenario: Validate Award PO FO FD the Phase wise level list view for Award
    When I login to "Grantee" app as "GRANTEE FD" user
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see default toggle as "Awards - My Records" for table "---grantee_tableId:-:awardTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardTableId---"
    When I click on parallel lines menu bar with data target value "Awards - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Awards - All" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Draft" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Active" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Rejected" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Closed" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - My Records" inside flex table id "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    And I wait for "5" seconds
    And I select value inside table "---grantee_tableId:-:awardTableId---" is "5"
    When I perform quick search for "created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Amended" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Amended" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    And I click toggle button to select "Awards - Draft"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Active"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Rejected"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Closed"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    And I wait for "2" seconds
    And I click toggle button to select "Awards - My Records"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"

  @488680 @ValidatePOProfilewithnonownerNewbuttonunabletoseeonFinancialTransactionsubsection @P3_Grantee @PO_Grantee @GRegression2
  Scenario: Validate PO Profile with non owner New button unable to see on Financial Transaction sub section
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    Then I softly see "Drawdown By Award" page block displayed
    Given I expand nested table containing column value "Automation Permanent Focus Area"
    Then I softly see "Financial Transactions" page block displayed
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"

  @443849 @AwardVerifywithEXEProfileIfindirectgrantkeepsettingNOthenabletocompletetheapprovalprocessforForwardsendtoownerReject @EXE_Grantee @P2_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Award - Verify with EXE Profile ,If in direct grant keep setting NO then able to complete the approval process for Forward /send to owner/Reject
    And I "Created" standalone subaward "Automation Runtime award" with properties "ALL_SETTING_NO-<userName>"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    Then I softly do not see fields "MaintenanceOfEffortAmount__c" is visible
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                            | Start Date                         | End Date                         |
      | Automation Permanent Focus Area2 | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---grantee_tableId:-:AwardBudgetTableId---" for table id "Next"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget |
      | Construction | The narrative | 5000         |
    When I close "Award Line Items" modal by clicking the top right x button
    Then I softly do not see "Program Income" page block displayed
    Then I softly do not see "Indirect Rates" page block displayed
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "Edit" :
      | Award  | Name       |
      | Step 1 | <Approval> |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Management" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I select radio button "Forward" in the approval decision
    And I select user "<ForwardUser>" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "<User1>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I softly see the following messages in the page details contains:
      | Successfully Disapproved |
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Rejected" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SubmitForApproval.pdf" as name

    Examples:
      | userName        | User        | ForwardUser | User1      | Approval   |
      | Victor EXE user | GRANTEE EXE | Sarah PM    | GRANTEE PM | Victor EXE |

  @443839 @AwardVerifywithEXEProfileIfindirectgrantkeepsettingNOthenabletocompletetheapprovalprocessforForwardsendtoownerReject @EXE_Grantee @P2_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Award - Verify with EXE Profile ,If in direct grant keep setting NO then able to complete the approval process for Forward /send to owner/Reject
    And I "Created" standalone subaward "Automation Runtime award" with properties "ALL_SETTING_NO-<userName>"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    Then I softly do not see fields "MaintenanceOfEffortAmount__c" is visible
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                            | Start Date                         | End Date                         |
      | Automation Permanent Focus Area2 | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---grantee_tableId:-:AwardBudgetTableId---" for table id "Next"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget |
      | Construction | The narrative | 5000         |
    When I close "Award Line Items" modal by clicking the top right x button
    Then I softly do not see "Program Income" page block displayed
    Then I softly do not see "Indirect Rates" page block displayed
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "Edit" :
      | Award  | Name       |
      | Step 1 | <Approval> |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Management" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I select radio button "Forward" in the approval decision
    And I select user "<ForwardUser>" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "<User1>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I softly see the following messages in the page details contains:
      | Successfully Disapproved |
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Rejected" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SubmitForApproval.pdf" as name

    Examples:
      | userName      | User       | ForwardUser | User1       | Approval |
      | Sarah PM user | GRANTEE PM | Victor EXE  | GRANTEE EXE | Sarah PM |

  @443826 @AwardVerifywithPMProfileAfteractivatetheawardabletoseetheActualTabinpendingCloseoutclosedandamendedstateaswell @GRegression2 @GranteeTBE
  Scenario: Award - Verify with PM Profile ,After activate the award able to see the Actual Tab in pending Closeout ,closed and amended state as well
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    Then I softly can see "Actuals" sub tab at view detail page
    And I "Approved" of type "Funding Change" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly can see "Actuals" sub tab at view detail page
    And I create adhoc closeout "{SavedValue:Automation Runtime Award}" for status "Approved" with properties "default"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Closeout" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Pending Closeout"
    Then I softly can see "Actuals" sub tab at view detail page
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Complete Closeout" in the page details
    And I wait for "2" seconds
    When I enter in modal value "0" into field "FederalCloseoutDate__c"
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Completed"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Closed"
    Then I softly can see "Actuals" sub tab at view detail page

  @443791 @ValidateGrantWithPMProfileAfterclickonGrantphaseredirecttoGrantListviewpage @PM_Grantee @P2_Grantee @GRegression1
  Scenario: Validate Grant With PM Profile After click on Grant phase redirect to Grant List view page
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly see "Create Grant" opens in overLay window
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Grant Title is required.               |
      | To Save, Grant Abbreviation is required.        |
      | To Save, Grant Number is required.              |
      | To Save, Project Period Start Date is required. |
      | To Save, Project Period End Date is required.   |
      | To Save, Budget Type is required.               |
      | To Save, Total Anticipated Amount is required.  |
      | To Save, Grant Type is required.                |
      | To Save, Funding Organization is required.      |
      | To Save, Allow Indirect Costs? is required.     |
      | To Save, Match is Required? is required.        |
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see the header is "Grant" in the page details
    Then I softly see "Collapse" button for header
    Then I softly see "Resize" button for page
    Then I softly see "Collapse" button for page
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, UEI Number is required in the Overview tab under the General Information section. |
    And I navigate to "Overview" sub tab
    When I enter value "YRNMVN96JC17" into field "DUNS__c"
    When I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    When I click modal button "OK"
    Then I can see top right button "Edit" in page detail
    Then I softly see field "UEI Number" as ""
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    When I enter value "YRNMVN96JC17" into field "DUNS__c"
    And I click on "Save" in the page details
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" inside page block
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    And I save the field labeled "Internal Organization" as "InternalOrganization"
    Then I softly see field "Internal Organization" inside page block
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see field "Created by" inside page block
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    And I save the field labeled "Last Modified by" as "LastModifiedby"
    Then I softly see field "Last Modified by" inside page block
    Then I softly see link "{SavedValue:LastModifiedby}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedby}"
    And I wait for "2" seconds
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I click on back arrow
    And I wait for "2" seconds
    And I click on hyperlink containing value "{SavedValue:Createdby}"
    And I wait for "2" seconds
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I click on back arrow
    And I wait for "2" seconds
    And I click on hyperlink containing value "{SavedValue:FundingOrganization}"
    And I wait for "2" seconds
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:FundingOrganization}" in the page details
    And I click on back arrow
    And I wait for "2" seconds
    And I click on hyperlink containing value "{SavedValue:InternalOrganization}"
    And I wait for "2" seconds
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "{SavedValue:InternalOrganization}" in the page details
    And I click on back arrow
    And I wait for "2" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Awards" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Management" sub tab at view detail page
    Then I softly can see "Monitoring" sub tab at view detail page
    Then I softly cannot see "Closeout" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    When I click on parallel lines menu bar with data target value "Budget Period Details"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on parallel lines menu bar with data target value "Focus Areas"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on parallel lines menu bar with data target value "External Programs"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on parallel lines menu bar with data target value "Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I navigate to "Awards" sub tab
    When I click on parallel lines menu bar with data target value "Awards / Revisions"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Management" sub tab
    When I click on parallel lines menu bar with data target value "Change Requests"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on parallel lines menu bar with data target value "Progress Reports"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on parallel lines menu bar with data target value "Financial Reports"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I navigate to "Monitoring" sub tab
    When I click on parallel lines menu bar with data target value "Objectives"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on parallel lines menu bar with data target value "Key Performance Indicators (KPIs)"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Files" sub tab
    When I click on parallel lines menu bar with data target value "Grant Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on parallel lines menu bar with data target value "Notes"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I post the message "Automation Test1 Execution" inside chatter
    Then I softly see post "Automation Test1 Execution" by user "Sarah PM"
    Then I see "Edit" button name inside post dropdown
    Then I see "Delete" button name inside post dropdown
    Then I see "Bookmark" button name inside post dropdown

  @443858 @ValidateAwardsplconwithPMProfileIfSpecialConditionisaddedtheninawardspecialconditionmoduleafterexpandtheawardabletoseespecialconditionrecord @GRegression2 @GranteeTBE
  Scenario: Validate Award spl con with PM Profile ,If Special Condition is added then in  award special condition module after expand the award able to see special condition record
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Monitoring" sub tab
    And I save the value from row "1" for column name "Title" as "TermsTitle" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Awards Special Conditions" content inside "Monitoring" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:specialConditionPhaseLevelTableId---" panel
    And I expand nested table containing column value "{SavedValue:AwardEGMSID}"
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:specialConditionsChildTableId---"

  @443857 @ValidateAwardsplconwithEXEProfileIfSpecialConditionisnotaddedtheninawardspecialconditionmoduleafterexpandtheawardunabletoseeanyrecord @P3_Grantee @GRegression1 @GranteeTBE
  Scenario: Validate Award spl con with EXE Profile If Special Condition is not added then in award special condition module after expand the award unable to see any record
    And I "Created" standalone subaward "Automation Runtime award" with properties "ALL_SETTING_NO-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "SPECIAL_CONDITIONS_NO"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Monitoring" tab
    When I navigate to "Awards Special Conditions" content inside "Monitoring" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:specialConditionPhaseLevelTableId---" panel
    And I expand nested table containing column value "{SavedValue:AwardEGMSID}"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:specialConditionsChildTableId---"

  @447517 @ValidateGrantwithPMProfileOndirectgrantmodalunabletoseethefieldIsBudgetPeriodCloseoutRequestRequired @P2_Grantee @PM_Grantee @GRegression1
  Scenario: Validate Grant with PM Profile On direct grant modal unable to see the field Is Budget Period Closeout Request Required
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    Then I softly see "Create Grant" opens in overLay window
    Then I softly cannot see field "Is Budget Period Closeout Request Required?" inside page block

  @443804 @ValidateGrantWithEXEProfileGrantisinCreatedDraftstate @GRegression1 @GranteeTBE
  Scenario: Validate Grant With EXE Profile Grant is in Created Draft state
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I enter "Grantee_Grant_Setting_No" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    Then I softly see fields "DUNS__c" is in edit mode
    Then I softly see fields "ProjectTitle__c" is in edit mode
    Then I softly see fields "ProjectTitle__c" is in edit mode
    Then I softly see fields "GrantAbbreviation__c" is in edit mode
    Then I softly see fields "GrantNumber__c" is in edit mode
    Then I softly see fields "ExternalOrganization__c" is in edit mode
    Then I softly see fields "GrantType__c" is in edit mode
    Then I softly see that "Internal Organization" rendered in view mode only
    Then I softly see that "EIN" rendered in view mode only
    Then I softly see that "Budget Type" rendered in view mode only
    Then I softly see that "Funder Payment System" rendered in view mode only
    Then I softly see field "Internal Organization" as "Department of Product"
    And I save the field labeled "EIN" as "EIN"
    Then I softly see field "EIN" as "{SavedValue:EIN}"
    Then I softly see field "Budget Type" as "Construction"
    Then I softly see fields "GrantDescription__c" is in edit mode
    Then I softly see fields "ProjectPeriodStartDate__c" is in edit mode
    Then I softly see fields "ProjectPeriodEndDate__c" is in edit mode
    Then I softly see fields "IsMatchRequired__c" is in edit mode
    Then I softly see fields "DoesGrantAllowIndirect__c" is in edit mode
    Then I softly see fields "MaintenanceOfEffort__c" is in edit mode
    Then I softly see fields "LaverageAllowed__c" is in edit mode
    Then I softly see fields "IsProgramIncomeAnticipated__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "TotalObligatedAmount__c" is in edit mode
    Then I softly see that "Award Amount to Date" rendered in view mode only
    Then I softly see that "Spent to Date" rendered in view mode only
    Then I softly see that "Remaining Budget" rendered in view mode only
    Then I softly see that "Budgeted Match" rendered in view mode only
    Then I softly see that "Remaining Match" rendered in view mode only
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Award Documents" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly see value "Award Documents" for title "Classification" inside table "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:grantNotesTableId---" by clicking "New" :
      | Description      |
      | Automation Notes |
    Then I softly see the following messages in the page details :
      | Required Fields Missing |
    And I refresh the page
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:grantNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:grantNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    When I click on "Delete" icon for "Notes Record" inside flex table with id "---grantee_tableId:-:grantNotesTableId---"
    And I wait for "3" seconds
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:grantNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exe.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Management" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:GrantsAmendmentRequestsTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:grantProgressReportTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:GrantsFinancialReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:grantGoalsTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:grantKPITableId---"
    Then I softly cannot see "Closeout" sub tab at view detail page

  @443808 @ValidateGrantWithPOProfileOnceawardrejectedthengrantabletoseeinTerminatedstate @P3_Grantee @PO_Grantee @GRegression2
  Scenario: Validate Grant With PO Profile,Once award rejected then grant able to see in Terminated state
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "GRANTEE_PO_APPROVER"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    When I navigate to "Overview" sub tab
    Then I cannot see top right button "Edit" in page detail
    And I save the value from row "1" for column name "Title" as "TitleExternalProg" from flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleExternalProg}" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TitleExternalProg}" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    And I save the value from row "1" for column name "Name" as "NameCont" from flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:NameCont}" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:NameCont}" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    And I save the value from row "1" for column name "Title" as "focusAreaAward" from flex table "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:focusAreaAward}" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "View" against "{SavedValue:focusAreaAward}" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly cannot see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly cannot see row level action button "View" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    And I wait for "1" seconds
    And I save the value from row "1" for column name "Focus Area Name" as "FocusAreaName" from flex table "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:FocusAreaName}" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly cannot see row level action button "View" against "{SavedValue:FocusAreaName}" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    And I save the value from row "1" for column name "Title" as "TitleIndirectCost" from flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleIndirectCost}" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly cannot see row level action button "View" against "{SavedValue:TitleIndirectCost}" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    When I navigate to "Management" sub tab
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly cannot see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "View" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see "Amendments" sub tab at view detail page
    And I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I softly see field "Status" as "Terminated"
    Then I softly see status in Progress-bar is "Terminated" and is "Red"
    And I refresh the page
    And I wait for "1" seconds
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:grantExternalProgramTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:grantContactTableId---"
    Then I softly see "No Records Found" inside flex table with id "GranteeBudgetPeriods"
    Then I softly do not see "Actions" in flex table header "---grantee_tableId:-:grantFocusAreaTableId---"
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    Then I softly can see row level action button "View" against "Rejected" in flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly cannot see row level action button "Edit" against "Rejected" in flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Financials" sub tab
    Then I softly see "No Records Found" inside flex table with id "GrantBudgetCategoryFlexGridGrantee"
    And I navigate to "Management" sub tab
    Then I softly see "No Records Found" inside flex table with id "AmendmentRequestReport"
    Then I softly see "No Records Found" inside flex table with id "GranteeGrantProgressReport"
    Then I softly see "No Records Found" inside flex table with id "RelatedGranteeFinancialReportsOnGrant"
    And I navigate to "Monitoring" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:grantGoalsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:grantKPITableId---"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:grantNotesTableId---"
    Then I softly cannot see "Closeout" sub tab at view detail page

  @443819 @ValidateAwardWithPMProfileAwardPagelayoutfordirectgrant @P2_Grantee @PM_Grantee @GRegression1
  Scenario: Validate Award With PM Profile Award Page layout for direct grant
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "Edit" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see "Details" page block displayed
    Then I softly see "Description" page block displayed
    Then I softly see "External Programs" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see fields "GrantAwardName__c" is in edit mode
    Then I softly see fields "VersionNumber__c" is in edit mode
    Then I softly see fields "AwardIssueDate__c" is in edit mode
    Then I softly see fields "MaintenanceOfEffortAmount__c" is in edit mode
    Then I softly see fields "MaintenanceOfEffortReference__c" is in edit mode
    Then I softly see fields "FederalTCLink__c" is in edit mode
    Then I softly see fields "AreTCspartofNGAAttachments__c" is in edit mode
    Then I softly see fields "PaymentSystem__c" is in edit mode
    Then I softly see fields "SubAccountNumbers__c" is in edit mode
    Then I see textarea field "GrantAwardDescription__c" is editable
    Then I softly see fields "Addressline1__c" is in edit mode
    Then I softly see fields "Addressline2__c" is in edit mode
    Then I softly see fields "City__c" is in edit mode
    Then I softly see fields "County__c" is in edit mode
    Then I softly see fields "State__c" is in edit mode
    Then I softly see fields "CongressionalDistrictName__c" is in edit mode
    Then I softly see fields "Zip4__c" is in edit mode
    Then I softly see fields "Country__c" is in edit mode
    Then I softly see fields "ZipCode4Extension__c" is in edit mode
    Then I softly see that "Grant EGMS ID" rendered in view mode only
    Then I softly see that "Award Type" rendered in view mode only
    Then I softly see that "Version Number" rendered in view mode only
    Then I softly see that "Funding Organization" rendered in view mode only
    Then I softly see that "Internal Organization" rendered in view mode only
    Then I softly see that "Created by" rendered in view mode only
    Then I softly see that "Created Date" rendered in view mode only
    Then I softly see that "Last Modified by" rendered in view mode only
    Then I softly see that "Last Modified Date" rendered in view mode only
    And I navigate to "Projections" sub tab
    Then I softly see fields "BudgetRedirectionThreshhold__c" is in edit mode
    Then I softly see fields "BudgetPeriodEndDate__c" is in edit mode
    Then I softly see fields "ApprovedIndirectCostRate__c" is in edit mode
    Then I softly see fields "ProgramIncomeType__c" is in edit mode
    Then I softly see that "Project Period End Date" rendered in view mode only
    Then I softly see that "Award Amount to Date" rendered in view mode only
    Then I softly see that "Budget Period Start Date" rendered in view mode only
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Award Issue Date is required in the Overview tab under the Details section.                               |
      | To Save, Funder Payment System is required in the Overview tab under the Details section.                          |
      | To Save, Congressional District is required in the Overview tab under the Primary Place of Performance section.    |
      | To Save, Program Income Treatment Type is required in the Projections tab under the Budget Period Details section. |
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I see the header is "Grant" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:GrantEGMSID}"
    And I click on back arrow
    And I wait for "2" seconds
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    And I click on hyperlink containing value "{SavedValue:FundingOrganization}"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:FundingOrganization}" in the page details
    And I click on back arrow
    And I wait for "2" seconds
    And I save the field labeled "Internal Organization" as "InternalOrganization"
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    And I click on hyperlink containing value "{SavedValue:InternalOrganization}"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "{SavedValue:InternalOrganization}" in the page details
    And I click on back arrow
    And I wait for "3" seconds
    And I save the field labeled "Created by" as "Createdby"
    And I click on hyperlink containing value "{SavedValue:Createdby}"
    Then I softly see the text containing "Sarah PM"
    And I click on back arrow
    And I wait for "2" seconds
    And I save the field labeled "Last Modified by" as "LastModifiedby"
    And I click on hyperlink containing value "{SavedValue:LastModifiedby}"
    Then I softly see the text containing "Sarah PM"
    And I click on back arrow
    And I wait for "2" seconds
    And I navigate to "Projections" sub tab
    Then I softly see fields "BudgetRedirectionThreshhold__c" is in edit mode
    Then I softly see fields "BudgetPeriodEndDate__c" is in edit mode
    Then I softly see fields "ApprovedIndirectCostRate__c" is in edit mode
    Then I softly see fields "ProgramIncomeType__c" is in edit mode
    Then I softly see that "Project Period End Date" rendered in view mode only
    Then I softly see that "Award Amount to Date" rendered in view mode only
    Then I softly see that "Budget Period Start Date" rendered in view mode only
    And I navigate to "Overview" sub tab
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I see the header is "Grant" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:GrantEGMSID}"
    And I click on back arrow
    And I wait for "2" seconds
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:awardAssociateContactTableId---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Contacts added successfully. |
    And I click modal button "Close"
    Then I softly can see row level action button "View" against "Sarah PM" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "Remove" against "Sarah PM" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name     | Project Role    | Is Key Contact |
      | Sarah PM | Project Officer | Checked        |
    When I click on parallel lines menu bar with data target value "Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Programs associated successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    When I click on parallel lines menu bar with data target value "External Programs"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I "Collapse" page block contaninig value "Details"
    Then I softly do not see fields "Grant__c" is visible
    When I "Expanded" page block contaninig value "Details"
    Then I softly see fields "Grant__c" is visible
    And I navigate to "Projections" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Focus Areas added to subaward successfully. |
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    When I click on parallel lines menu bar with data target value "Focus Area"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    And I select value inside table "---grantee_tableId:-:AwardBudgetTableId---" is "All"
    Then I softly see value "Administrative and legal expenses" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "Architectural and engineering fees" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "Construction" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "Administrative and legal expenses" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "Contingencies" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "Equipment" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "Indirect costs" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "Land, structures, rights-of-way, appraisals, etc." for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "Miscellaneous" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "Other architectural and engineering fees" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "Project inspection fees" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "Relocation expenses and payments" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "Site work" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly can see row level action button "Add Line Items" against "Construction" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    And I wait for "2" seconds
    When I click on parallel lines menu bar with data target value "Award Budget"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see value "Automation Permanent Focus Area" for title "Focus Area Name" inside table "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see value "$1,000.00" for title "Projected Program Income ($)" inside table "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see value "Automation Test" for title "Program Income Justification" inside table "---grantee_tableId:-:awardProgramIncomeTableId---"
    When I click on parallel lines menu bar with data target value "Program Income"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see value "Rate" for title "Titlee" inside table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly can see row level action button "Edit" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    When I click on parallel lines menu bar with data target value "Indirect Rates"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    When I click on parallel lines menu bar with data target value "Approvers"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Management" sub tab
    Then I can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I can see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    When I click on parallel lines menu bar with data target value "Reports Schedule"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click on parallel lines menu bar with data target value "Objectives"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:selectAwardKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | KPIs added successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---" by clicking "Edit" :
      | Title                  | Target | Current Value | Current Value As Of |
      | Automation Runtime KPI | 10     | 10            | 0                   |
    When I click on parallel lines menu bar with data target value "Key Performance Indicators (KPIs)"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:SpecialConditionTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on parallel lines menu bar with data target value "Special Conditions"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    Then I softly cannot see "Actuals" sub tab at view detail page
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    Then I softly can see "Actuals" sub tab at view detail page
    Then I softly can see "Amendments" sub tab at view detail page
    When I navigate to "Actuals" sub tab
    Then I see "Financials Summary" page block displayed
    Then I see "Expenditure Detail" page block displayed
    Then I see "Program Income Revenue by Focus Area" page block displayed
    Then I see "Drawdown By Award" page block displayed
    Then I softly see field "Total Awarded Budget" inside page block
    Then I softly see field "Spent to Date" inside page block
    Then I softly see field "Remaining Balance" inside page block
    Then I softly see field "Total Match Expenditures to Date this Budget Period" inside page block
    Then I softly see field "Total Program Income Revenue this Budget Period" inside page block
    Then I softly see field "Total Leverage" inside page block
    Then I softly see field "Current Balance" inside page block
    Then I softly see field "Grant Balance" inside page block
    Then I softly see value "Automation Permanent Focus Area" for title "Focus Area Name" inside table "---grantee_tableId:-:actualsTabProgramIncomeTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:actualsTabProgramIncomeTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:actualsTabProgramIncomeTableId---"
    Then I softly see value "Automation Permanent Focus Area" for title "Focus Area Name" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly can see row level action button "Show Financial Transactions" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:actualsTabDrawDownTableId---"

  @443820 @AwardVerifyWithPMProfileProjectionTabofAwardPagelayoutfordirectgrant @Gregression2 @PM_Grantee @P2_Grantee
  Scenario: Award With PM Profile Projection Tab of Award Page layout for direct grant
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I navigate to "Projections" sub tab
    Then I softly see "Project Period Details" page block displayed
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    And I click on "Edit" in the page details
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see fields "BudgetPeriodEndDate__c" is in edit mode
    And I click on "Save" in the page details
    Then I softly see "Focus Area" page block displayed
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    And I click on "Remove" icon for "Automation Permanent Focus Area" inside flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award Budget" page block displayed
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Award Line Items" modal by clicking the top right x button
    Then I softly see "Program Income" page block displayed
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see "Indirect Rates" page block displayed
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "2" seconds
    Then I can see row level action button "Edit" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I can see row level action button "Delete" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"

  @443830 @AwardVerifywithPMprofileResponsiblitiesTabofAwardPagelayout @Gregression2 @PM_Grantee @P2_Grantee
  Scenario: Award with PM profile Responsiblities Tab of Award Page layout
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Sarah PM   | Step 2 |
      | Grantee PO | Step 3 |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award |
      | David FO | NA    |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Award  |
      | Step 3 |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "Edit" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same step for multiple users for Award. |
    And I refresh the page
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "Edit" :
      | Name       | Award |
      | Sarah PM   | NA    |
      | Grantee PO | NA    |
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "Edit" :
      | Name       | Award |
      | Victor EXE | NA    |
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required |
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "Edit" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "Edit" :
      | Name       | Award  |
      | Victor EXE | Step 2 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see value "Victor EXE" for title "Name" inside table "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see link "Victor EXE" inside Page block
    And I click on hyperlink containing value "Victor EXE"
    Then I softly see the text containing "victor.exe@ggp.test8.ggmergeqa2"
    And I click on back arrow
    Then I softly see link "Sarah PM" inside Page block
    And I click on hyperlink containing value "Sarah PM"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "2" seconds
    Then I softly see value "Owner" for title "Name" against the value "Sarah PM" inside table "---grantee_tableId:-:awardOwnerTableId---"
    And I click on hyperlink containing value "Sarah PM"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"

  @443833 @AwardVerifywithPMprofileFilesTabofAwardPagelayout
  Scenario:  Award  with PM profile Files Tab of AwardPagelayout
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on "View" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the image "AttachmentTesting.pdf" in page detail
    And I click on "Close" button for view files page
    And I click on "Download" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I switch to tab number "1"
    And I download the file without rename
    And I wait for "3" seconds
    Then I softly verify that the file "AttachmentTesting.pdf" is downloaded
    And I close the tab
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I wait for "2" seconds
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on "Delete" icon for "Interim Award Document" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly do not see value "Interim Award Document" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "Edit" :
      | Created By | Title         | Description       |
      | Sarah PM   | Notes Record1 | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:awardsNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"

  @443834 @AwardVerifywithPMprofileCloseoutTabofAwardPagelayout @Gregression2 @PM_Grantee @P2_Grantee
  Scenario: Award - Verify with PM profile Closeout  Tab of Award Page layout.
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly cannot see "Closeout" sub tab at view detail page

  @443835 @AwardVerifywithPMprofileHistoryTabofAwardPagelayout @P2_Grantee @PM_Grantee @Gregression2
  Scenario: Award with PM profile History Tab of Award Page layout
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "Sarah PM" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Submitted for Approval" for title "New Value" inside field history table
    Then I softly see value "Created" for title "Original Value" inside field history table
    And I click on back arrow
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I softly see the following messages in the page details contains:
      | Successfully Disapproved |
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Rejected" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SubmitForApproval.pdf" as name

  @443835_1 @AwardVerifywithPMprofileHistoryTabofAwardPagelayout
  Scenario: Award with PM profile History Tab of Award Page layout
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "GRANTEE_PM_APPROVER"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SubmitForApproval.pdf" as name
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I refresh the page
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Activated" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "ApprovalPDF.pdf" as name

  @443831 @AwardVerifywithPMprofileManagementTabofAwardPagelayout @Gregression2 @P2_Grantee @PM_Grantee @rerun1
  Scenario: Award with PM profile Management Tab of Award Page layout
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    Then I can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I can see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I can see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    And I click modal button "Save"
    Then I see the following messages in the page details contains:
      | To Save, Schedule Base is required. |
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    And I expand nested table containing column value "Financial Report"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    And I click modal button "Save"
    Then I see the following messages in the page details contains:
      | To Save, Schedule Base is required. |
    And I wait for "3" seconds
    When I click modal button "Close"
    And I expand nested table containing column value "Progress Report"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Financial Report"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Report Creation Date |
      | {SavedValue:EGMS ID1} | 0                    |
    And I wait for "180" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "Not Started" for title "Status" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    Then I softly see "Reports Schedule" opens in overLay window
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly see value "Not Started" for title "Status" inside table "---grantee_tableId:-:financialReportProgressReportSchedules---"

  @440231 @440232 @verifywithPMprofileunabletoseethedraftedfocusareatoselectinDirectGrantAward @GRegression1
  Scenario:verify with PM profile unable to see the drafted focus area to select in Direct Grant / Award.
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    And I perform quick search for "Automation Permanent Draft Focus Area" in "---grantee_tableId:-:ProjectTableId---" panel
    #@440232
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I perform quick search for "Automation Permanent Focus Area" in "---grantee_tableId:-:ProjectTableId---" panel
    #@440231
    Then I softly see "Automation Permanent Focus Area" inside flex table with id "---grantee_tableId:-:selectAwardFocusAreaTableId---"

  @443841 @AwardVerifyWithEXEProfileIfsettingkeptNOthenunabletoseethesectioninGrantAward @GRegression1
  Scenario: AwardVerifyWithEXEProfileIfsettingkeptNOthenunabletoseethesectioninGrantAward
    And I "Created" standalone subaward "Automation Runtime Award" with properties "ALL_SETTING_NO-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "SECOND_FOCUS_WITH_BUDGET"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Projections" sub tab
    #@476541
    Then I softly do not see "Program Income" page block displayed
    Then I softly do not see "Indirect Rates" page block displayed
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    And I navigate to "Projections" sub tab
    Then I softly do not see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly do not see "Other Levearage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    When I save the field labeled "Total Match Amount Required" as "TotalMatchAmountRequired"
    Then I softly see field "Total Match Amount Required" as "{SavedValue:TotalMatchAmountRequired}"
    Then I softly do not see "Cash Match" in flex table header "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly do not see "Program Income" page block displayed
    Then I softly do not see "Indirect Rates" page block displayed
    Then I softly cannot see "Financials" sub tab at view detail page
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Financials" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly do not see "Cash Match" in flex table header "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly do not see "Other Levearage" in flex table header "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly do not see "Program Income" page block displayed
    Then I softly do not see "Indirect Rates" page block displayed

  @443842 @AwardVerifyWithPMProfileIfsettingkeptYesthenabletoseethesectioninGrantAward @GRegression1 @GranteeTBE
  Scenario: Award With PM Profile ,If setting kept Yes then able to see the section in Grant/Award.
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Then I softly see field "Status" as "Activated"
    And I navigate to "Projections" sub tab
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    When I save the field labeled "Total Match Amount Required" as "TotalMatchAmountRequired"
    Then I softly see field "Total Match Amount Required" as "{SavedValue:TotalMatchAmountRequired}"
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    When I navigate to "Actuals" sub tab
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:ExpenditureDetailsTableId---"
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Financials" sub tab
    Given I expand nested table containing column value "BP01"
    And I wait for "2" seconds
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:grantBudgetCategoryTableId---"

  @443818 @ValidateAwardwithnonownerPMProfileonawardpagelayoutunabletoseeEditandSubmitforapprovalbutton @GRegression1 @GranteeTBE
  Scenario: Validate Award with non owner (PM Profile) on award page layout unable to see Edit and Submit for approval button
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Grantee PO user"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail

  @443822 @ValidateAwardwithEXEprofileIfinDirectgrantselectNOforProgramIncomeAllowed?AndAllowIndirectCosts?fieldTheninawardunabletoseetheSectionsforthatfield @GRegression1 @GranteeTBE
  Scenario: Validate Award with EXE profile If in Direct grant select NO for Program Income Allowed? And Allow Indirect Costs? field Then in award unable to see the Sections for that field
    And I "Created" standalone subaward "Automation Runtime Award" with properties "ALL_SETTING_NO-Victor EXE user"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I click on remove for lookup from field "DUNS__c"
    When I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    When I click modal button "OK"
    Then I can see top right button "Edit" in page detail
    Then I softly see field "UEI Number" as "YRNMVN96JC17"
    And I navigate to "Financials" sub tab
    Then I softly cannot see field "Budgeted Cash Match" inside page block
    Then I softly cannot see field "Budgeted Non-Cash Match" inside page block
    Then I softly cannot see field "Budgeted Non-Cash Match" inside page block
    Then I softly cannot see field "Budgeted Leverage" inside page block
    Then I softly cannot see field "Total Anticipated Program Income" inside page block
    Then I softly cannot see field "Total Program Income Expenditure" inside page block
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Projections" sub tab
    Then I softly cannot see field "Maximum Indirect Cost Rate" inside page block
    Then I softly cannot see field "Program Income Treatment Type" inside page block
    Then I softly do not see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly do not see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly do not see "Program Income" page block displayed
    Then I softly do not see "Indirect Rates" page block displayed

  @443845 @ValidateAwardWithPMProfileIfPeerreviewerFDProfilenotsubmitthereviewthenawardownernotabletoseecompletereviewbuttonontoprightcornerandrowlevelsendforreview @GRegression3 @GranteeTBE
  Scenario: Validate Award With PM Profile If Peer reviewer FD Profile not submit the review then award owner not able to see complete review button on top right corner and row level send for review
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name      | Role            | Description            | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly can see row level action button "Send for Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see top right button "Complete Review" in page detail
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PendingTask---"

  @443803 @ValidateGrantFO/FD/AuditorProfileunabletoseetheNEWbuttontocreateDirectGrant @P3_Grantee @FO_Grantee @FD_Grantee @AUDITOR_Grantee @GRegression2
  Scenario Outline: Validate Grant FO /FD /Auditor Profile unable to see the NEW button to create Direct Grant
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Examples:
      | userType        |
      | GRANTEE FO      |
      | GRANTEE AUDITOR |
      | GRANTEE FD      |

  @443846 @ValidateAwardwithPMprofileoncereviewerFDSubmitthereviewawardownerabletocompletethereview @GRegression1 @GranteeTBE
  Scenario: Validate Award with PM profile, once reviewer (FD) Submit the review award owner able to complete the review
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name      | Role            | Description            | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly can see row level action button "Send for Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    Then I softly can see top right button "Complete Review" in page detail
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Resend for Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"

  @443806 @GrantVerifyWithEXEProfilewithnoncreatedowneraccessifGrantisinActivatedState @GRegression1 @GranteeTBE
  Scenario:Grant -Verify With EXE Profile with non created owner access if Grant is in Activated State.
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:grantNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:grantNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "amendmentEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see field "Status" as "Created"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I see status in Progress-bar is "Active" and is "dark blue"
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:amendmentEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:GrantsAmendmentRequestsTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:amendmentEGMSID}" in flex table with id "---grantee_tableId:-:GrantsAmendmentRequestsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:amendmentEGMSID}" in flex table with id "---grantee_tableId:-:GrantsAmendmentRequestsTableId---"
    Then I softly see "No Records Found" inside flex table with id "GranteeGrantProgressReport"
    Then I softly see "No Records Found" inside flex table with id "RelatedGranteeFinancialReportsOnGrant"
    When I navigate to "Closeout" sub tab
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:grantNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:grantNotesTableId---"

  @482389 @ValidatePMUsertheAwardbudgetfromprojectiontabverifythevalidation @P2_Grantee @PM_Grantee @GRegression2
  Scenario: Validate PM User the Award budget from projection tab & verify the validation
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I navigate to "Projections" sub tab
    Then I softly see "Award Budget" page block displayed
    Then I softly see total records count "Total Records: 12" in flex table "---grantee_tableId:-:AwardBudgetTableId---"
    And I click on "Remove" icon for "Automation Permanent Focus Area" inside flex table with id "---grantee_tableId:-:ProjectTableId---"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see total records count "Total Records: 12" in flex table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I can see row level action button "Add Line Items" against "Administrative and legal expenses" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Administrative and legal expenses" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see "Award Line Items" opens in overLay window
    Then I softly see "Award Line Items" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Narrative" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
   #   I have commented below step due to the Bug - 532819 once resolve will uncomment
#    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Award Budget | Cash Match | Non-Cash Match |
      | Construction | 5000         | 500        | 500            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    When I click on parallel lines menu bar with data target value "Award Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Line Items"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
   #   I have commented below step due to the Bug - 532819 once resolve will uncomment
#    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    Then I softly see sort order "Ascending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    Then I softly see sort order "Descending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    Then I see the text "Showing 1 to 1 of 1 records" in modal
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
      | Cash Match | equals to | 100 |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on "Delete" icon for "Construction" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    Then I can see row level action button "Add Line Items" against "Architectural and engineering fees" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Architectural and engineering fees" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see "Award Line Items" opens in overLay window
    Then I softly see "Award Line Items" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Narrative" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
   #   I have commented below step due to the Bug - 532819 once resolve will uncomment
#    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Award Budget | Cash Match | Non-Cash Match |
      | Construction | 5000         | 500        | 500            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    When I click on parallel lines menu bar with data target value "Award Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Line Items"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
   #   I have commented below step due to the Bug - 532819 once resolve will uncomment
#    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    Then I softly see sort order "Ascending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    Then I softly see sort order "Descending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    Then I see the text "Showing 1 to 1 of 1 records" in modal
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
      | Cash Match | equals to | 100 |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    When I click on parallel lines menu bar with data target value "Award Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Line Items"
    Then I see table is refreshing
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on "Delete" icon for "Construction" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    Then I can see row level action button "Add Line Items" against "Construction" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see "Award Line Items" opens in overLay window
    Then I softly see "Award Line Items" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Narrative" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
   #   I have commented below step due to the Bug - 532819 once resolve will uncomment
#    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Award Budget | Cash Match | Non-Cash Match |
      | Construction | 5000         | 500        | 500            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    When I click on parallel lines menu bar with data target value "Award Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Line Items"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
  #   I have commented below step due to the Bug - 532819 once resolve will uncomment
#    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    Then I softly see sort order "Ascending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    Then I softly see sort order "Descending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    Then I see the text "Showing 1 to 1 of 1 records" in modal
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
      | Cash Match | equals to | 100 |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on "Delete" icon for "Construction" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    Then I can see row level action button "Add Line Items" against "Contingencies" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Contingencies" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see "Award Line Items" opens in overLay window
    Then I softly see "Award Line Items" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Narrative" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    #   I have commented below step due to the Bug - 532819 once resolve will uncomment
#    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Award Budget | Cash Match | Non-Cash Match |
      | Construction | 5000         | 500        | 500            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    When I click on parallel lines menu bar with data target value "Award Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Line Items"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
   #   I have commented below step due to the Bug - 532819 once resolve will uncomment
#    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    Then I softly see sort order "Ascending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    Then I softly see sort order "Descending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    Then I see the text "Showing 1 to 1 of 1 records" in modal
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
      | Cash Match | equals to | 100 |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on "Delete" icon for "Construction" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    Then I can see row level action button "Add Line Items" against "Equipment" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Equipment" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see "Award Line Items" opens in overLay window
    Then I softly see "Award Line Items" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Narrative" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
   #   I have commented below step due to the Bug - 532819 once resolve will uncomment
#    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Award Budget | Cash Match | Non-Cash Match |
      | Construction | 5000         | 500        | 500            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    When I click on parallel lines menu bar with data target value "Award Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Line Items"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
   #   I have commented below step due to the Bug - 532819 once resolve will uncomment
#    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    Then I softly see sort order "Ascending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    Then I softly see sort order "Descending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    Then I see the text "Showing 1 to 1 of 1 records" in modal
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
      | Cash Match | equals to | 100 |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on "Delete" icon for "Construction" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    Then I can see row level action button "Add Line Items" against "Indirect costs" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see "Award Line Items" opens in overLay window
    Then I softly see "Award Line Items" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Narrative" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
   #   I have commented below step due to the Bug - 532819 once resolve will uncomment
#    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Award Budget | Cash Match | Non-Cash Match |
      | Construction | 5000         | 500        | 500            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    When I click on parallel lines menu bar with data target value "Award Line Items"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Line Items"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 100        | 100            |
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Narrative" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Narrative" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Award Budget" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Award Budget" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Non-Cash Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Non-Cash Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
   #   I have commented below step due to the Bug - 532819 once resolve will uncomment
#    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    Then I softly see sort order "Ascending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    When I click on "Total Match" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
#    Then I softly see sort order "Descending" for column "Total Match" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Other Leverage" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Other Leverage" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Ascending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on "Total Project Cost" column header inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see sort order "Descending" for column "Total Project Cost" inside table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:awardLineItemsTableId---"
    Then I see the text "Showing 1 to 1 of 1 records" in modal
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
      | Cash Match | equals to | 500 |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:awardLineItemsTableId---" for LWC
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Projections Tab - The Match cannot be less than the given %. |
    Then I softly see "Budget Category" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
   #   I have commented below step due to the Bug - 532819 once resolve will uncomment
#    Then I softly see "Total Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:AwardBudgetTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:AwardBudgetTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:AwardBudgetTableId---" for LWC
      | Budget Category | contains | Construction |
    Then I softly see value "Construction" for title "Budget Category" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:AwardBudgetTableId---" for LWC
    And I select value inside table "---grantee_tableId:-:AwardBudgetTableId---" is "All"
    Then I softly see the text containing "Showing 1 to 12 of 12 records"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Budget"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Budget"
    Then I see table is refreshing

  @443840 @443848 @443844 @443847 @ValidatewithPMProfileIfindirectgrantkeepsettingYESthenInApprovedActivestateabletoseetheaccessofsection @GRegression1 @P2_Grantee @PM_Grantee @GRegression2
  Scenario: Validate with PM Profile in direct grant keep setting YES then In Approved Active state able to see the access of section
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field labeled "Maintenance Of Effort Amount" as "MaintenanceOfEffortAmount"
    Then I softly see field "Maintenance Of Effort Amount" as "{SavedValue:MaintenanceOfEffortAmount}"
    And I click on "Edit" in the page details
    Then I softly see fields "Addressline1__c" is in edit mode
    Then I softly see fields "Addressline2__c" is in edit mode
    Then I softly see fields "City__c" is in edit mode
    Then I softly see fields "County__c" is in edit mode
    Then I softly see fields "State__c" is in edit mode
    Then I softly see fields "CongressionalDistrictName__c" is in edit mode
    Then I softly see fields "Zip4__c" is in edit mode
    Then I softly see fields "Country__c" is in edit mode
    Then I softly see fields "ZipCode4Extension__c" is in edit mode
    And I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AwardBudgetTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Award Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    Then I can see row level action button "Edit" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I can see row level action button "Delete" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I cannot see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    And I navigate to "Projections" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:ProjectTableId---"
    Then I cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I cannot see row level action button "Delete" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I cannot see row level action button "View" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I cannot see row level action button "Edit" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I cannot see row level action button "Delete" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly do not see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    And I navigate to "Management" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    And I wait for "3" seconds
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Submitted for Review" for title "New Value" inside field history table
    Then I softly see value "Created" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    And I navigate to "Projections" sub tab
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:ProjectTableId---"
    Then I cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I cannot see row level action button "Delete" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I cannot see row level action button "View" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I can see row level action button "Edit" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I can see row level action button "Delete" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly do not see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    And I navigate to "Management" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    And I wait for "3" seconds
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Submitted for Review" for title "New Value" inside field history table
    Then I softly see value "Created" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "3" seconds
    And I click on "Complete Review" in the page details
    And I wait for "3" seconds
    And I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Victor EXE | Step 2 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name     | Award  |
      | David FO | Step 3 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Grantee PO | Step 4 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I navigate to "Overview" sub tab
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    And I navigate to "Projections" sub tab
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:ProjectTableId---"
    Then I cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AwardBudgetTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    Then I cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I cannot see row level action button "Delete" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I cannot see row level action button "View" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I can see row level action button "Edit" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I can see row level action button "Delete" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    And I navigate to "Management" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added successfully. |
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---" by clicking "Edit" :
      | Title                  | Target | Current Value | Current Value As Of |
      | Automation Runtime KPI | 10     | 10            | 0                   |
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I cannot see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    And I navigate to "Projections" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:ProjectTableId---"
    Then I cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I cannot see row level action button "Delete" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I cannot see row level action button "View" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I cannot see row level action button "Edit" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I cannot see row level action button "Delete" against "Rate" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    And I navigate to "Management" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    And I wait for "3" seconds
    Then I cannot see row level action button "View" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I cannot see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I cannot see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I can see row level action button "View" against "Automation.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Edit" against "Automation.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Download" against "Automation.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Delete" against "Automation.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I cannot see row level action button "View" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Submitted for Approval" for title "New Value" inside field history table
    Then I softly see value "Reviewed" for title "Original Value" inside field history table
    And I click on back arrow
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SubmitForApproval.pdf" as name
    Then I softly see snapshot with name containing "Complete Review.pdf" as name

  @488675 @ValidatePMProfileDrawntoDatefieldonactualtabinFinancialSummarysection @P2_Grantee @GRegression1
  Scenario: Validate PM Profile Drawn to Date field on actual tab in Financial Summary section
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    Then I softly see field "Drawn to Date" as "$0.00"
    Then I softly see that "Drawn to Date" rendered in view mode only
    Given I expand nested table containing column value "Automation Permanent Focus Area"
    When I enter the following values into flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---" by clicking "New" :
      | Reference ID | Drawdown Date | Amount |
      | Focus        | 1             | 1500   |
    And I wait for "1" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see field "Drawn to Date" as "$1,500.00"
    When I hovering mouse on help text icon inside page block detail "Drawn to Date"
    Then I softly see "Drawn amount ($) given to Grantee till Date." shown as help text

  @456309 @456303 @ValidateGrantPOFOFDwhenchangethelistviewfilterafterrefreshagainitshowsMyrecordinfilter @P4_Grantee @PO_Grantee @FO_Grantee @FD_Grantee @Gregression1
  Scenario Outline: Validate Grant PO FO FD when change the list view filter after refresh again it shows My record in filter
    When I login to "Grantee" app as "<user>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    Then I softly see toggle option "Grants - All" inside flex table id "---grantee_tableId:-:GrantsTable---"
    And I perform quick search for "Test" in "---grantee_tableId:-:GrantsTable---" panel
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly see default toggle as "Grants - My Records" for table "---grantee_tableId:-:GrantsTable---"
    #456303
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    Then I softly see toggle option "Awards - All" inside flex table id "---grantee_tableId:-:awardTableId---"
    And I perform quick search for "Test" in "---grantee_tableId:-:awardTableId---" panel
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I softly see default toggle as "Awards - My Records" for table "---grantee_tableId:-:awardTableId---"
    Examples:
      | user       |
      | GRANTEE PO |
      | GRANTEE FO |
      | GRANTEE FD |

  @488679 @ValidatePMProfileShowRIFANSTransactionsabletoreplacewithShowFinancialTransactions @P3_Grantee @PM_Grantee @GRegression1
  Scenario: Validate PM Profile Show RIFANS Transactions able to replace with Show Financial Transactions
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    Then I softly can see row level action button "Show Financial Transactions" against "Construction" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly cannot see row level action button "Show RIFANS Transactions" against "Construction" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    And I click on "Show Financial Transactions" icon for "Construction" inside flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see "Fiscal Year" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Fund" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Agency" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Line Sequence" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Natural Account" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Project" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Cash Date" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Date Posted" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Invoice Hold Flag" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Invoice Due Date" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Document Status" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Document ID" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Transaction Amount" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Vendor Number" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Vendor Name" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly do not see "Check Number" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Cheque Number" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Handling Code" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Date Entered" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Purchase Order Number" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Release Number" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Account Source" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "User Notes" in flex table header "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    Then I softly see "Fiscal Year" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Fund" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Agency" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Line Sequence" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Natural Account" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Project" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Cash Date" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Date Posted" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Invoice Hold Flag" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Invoice Due Date" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Document Status" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Document ID" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Transaction Amount" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Vendor Number" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Vendor Name" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly do not see "Check Number" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Cheque Number" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Handling Code" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Date Entered" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Purchase Order Number" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Release Number" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Account Source" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "User Notes" in flex table header "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    Then I softly see "Fiscal Year" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Fund" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Agency" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Line Sequence" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Natural Account" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Project" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Cash Date" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Date Posted" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Invoice Hold Flag" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Invoice Due Date" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Document Status" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Document ID" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Transaction Amount" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Vendor Number" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Vendor Name" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly do not see "Check Number" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Cheque Number" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Handling Code" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Date Entered" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Purchase Order Number" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Release Number" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "Account Source" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    Then I softly see "User Notes" in flex table header "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see row level action button "Show Financial Transactions" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly cannot see row level action button "Show RIFANS Transactions" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:actualsTabDrawDownTableId---"
    And I click on "Show Financial Transactions" icon for "Automation Permanent Focus Area" inside flex table with id "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see "Fiscal Year" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Fund" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Agency" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Line Sequence" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Natural Account" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Project" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Date Posted" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Invoice Hold Flag" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Invoice Due Date" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Document Status" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Document ID" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Transaction Amount" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Vendor Number" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Vendor Name" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly do not see "Check Number" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Cheque Number" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Handling Code" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Date Entered" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Purchase Order Number" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Release Number" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "Account Source" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    Then I softly see "User Notes" in flex table header "---grantee_tableId:-:DrawdownByAwardModalTableId---"

  @491708 @ValidatePMProfileimpactofdrawdownByAwardAwardwhichiscreatedthroughCombinationofamendmentNonConstructionWithdrawdownWithoutSpent @PM_Grantee @P3_Grantee @GRegression1
  Scenario: Validate PM Profile impact of drawdown By Award, Award which is created through Combination of amendment Non Construction With drawdown Without Spent
    And I "Created" standalone subaward "Automation Runtime Award" with properties "NON_CONSTRUCTION"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "SECOND_FOCUS_WITH_BUDGET"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Award Title" as "AwardTitle"
    When I navigate to "Actuals" sub tab
    Given I expand nested table containing column value "Automation Permanent Focus Area"
    When I enter the following values into flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---" by clicking "New" :
      | Reference ID | Drawdown Date | Amount |
      | Focus        | 1             | 1500   |
      | Focus1       | 1             | 1500   |
    Then I softly can see row level action button "Edit" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Delete" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Edit" against "Focus1" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Delete" against "Focus1" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    And I collapse nested table containing column value "Automation Permanent Focus Area"
    Given I expand nested table containing column value "Automation Permanent Focus Area2"
    When I enter the following values into flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---" by clicking "New" :
      | Reference ID | Drawdown Date | Amount |
      | Focus2       | 1             | 500    |
      | Focus3       | 1             | 200    |
    Then I softly can see row level action button "Edit" against "Focus2" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Delete" against "Focus2" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Edit" against "Focus3" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Delete" against "Focus3" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see field "Drawn to Date" as "$3,700.00"
    Then I softly see field "Current Balance" as "$3,700.00"
    Then I softly see field "Grant Balance" as "$96,300.00"
    Then I softly see value "$3,000.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$700.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$3,000.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$700.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    When I click on "Delete" icon for "Focus3" inside flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see field "Drawn to Date" as "$3,500.00"
    Then I softly see field "Current Balance" as "$3,500.00"
    Then I softly see field "Grant Balance" as "$96,500.00"
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_Combination_Creation2" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_Combination_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I save the value from row "1" for column name "Title" as "Terms1" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:Terms1}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate1 | 15             | 30              | 10                             | Final                   |
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Awarded Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 2000           | 200        | 200            |
    When I close "Amendment Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I save the field labeled "New Budget Period End Date" as "NewBudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---" by clicking "Edit" :
      | Title                           | End Date                            |
      | Automation Permanent Focus Area | {SavedValue:NewBudgetPeriodEndDate} |
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:amendmentFocusAreaTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 1            |
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Terms and Conditions" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Terms and Conditions" has been added in "Amendment Files" flex table
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    When I navigate to "Responsibilities" sub tab
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    When I navigate to "Actuals" sub tab
    Then I softly see field "Drawn to Date" as "$3,500.00"
    Then I softly see field "Current Balance" as "$3,500.00"
    Then I softly see field "Grant Balance" as "$96,500.00"
    Then I softly see value "$3,000.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$500.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$3,000.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$500.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Given I expand nested table containing column value "Automation Permanent Focus Area"
    When I enter the following values into flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---" by clicking "New" :
      | Reference ID | Drawdown Date | Amount |
      | Focus4       | 1             | 500    |
    Then I softly can see row level action button "Edit" against "Focus4" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Delete" against "Focus4" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    And I collapse nested table containing column value "Automation Permanent Focus Area"
    Given I expand nested table containing column value "Automation Permanent Focus Area2"
    When I enter the following values into flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---" by clicking "New" :
      | Reference ID | Drawdown Date | Amount |
      | Focus5       | 1             | 500    |
    Then I softly can see row level action button "Edit" against "Focus5" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Delete" against "Focus5" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see field "Spent to Date" as "$0.00"
    Then I softly see field "Drawn to Date" as "$4,500.00"
    Then I softly see field "Current Balance" as "$4,500.00"
    Then I softly see field "Grant Balance" as "$95,500.00"
    Then I softly see value "$3,500.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$1,000.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$3,500.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$1,000.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Amended"
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent to Date" as "$0.00"
    Then I softly see field "Drawn to Date" as "$3,500.00"
    Then I softly see field "Current Balance" as "$3,500.00"
    Then I softly see field "Grant Balance" as "$96,500.00"
    Then I softly see value "$3,000.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$500.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$3,000.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$500.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"

  @491696 @ValidatePMProfileimpactofdrawdownByAwardAwardwhichiscreatedthroughKeyPersonalchangeamendmentNonConstructionWithdrawdownWithSpent @PM_Grantee @P4_Grantee @GRegression1
  Scenario: Validate PM Profile impact of drawdown By Award, Award which is created through Key Personal change amendment Non Construction With drawdown With
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{grantee_testData:GrantsForNonConstructionAndSpent}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{grantee_testData:GrantsForNonConstructionAndSpent}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Award Title" as "AwardTitle"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    Then I softly see field "Drawn to Date" as "$4,500.00"
    Then I softly see field "Current Balance" as "$0.00"
    Then I softly see field "Grant Balance" as "$95,500.00"
    Then I softly see field "Spent to Date" as "$4,500.00"
    When I perform quick search for "Construction" in "---grantee_tableId:-:ExpenditureDetailsTableId---" panel
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$2,000.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:ExpenditureDetailsTableId---" for table id "Next"
    Then I softly see value "$2,500.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$2,000.00" for title "Amount Spent to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$2,500.00" for title "Amount Spent to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    And I refresh the page
    And I wait for "2" seconds
    And I "Approved" of type "Key Personnel Change" amendment request for title "{grantee_testData:GrantsForNonConstructionAndSpent}" with properties "NON_CASH_MATCH_BUDGET"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    When I navigate to "Actuals" sub tab
    Then I softly see field "Drawn to Date" as "$4,500.00"
    Then I softly see field "Current Balance" as "$0.00"
    Then I softly see field "Grant Balance" as "$95,500.00"
    Then I softly see field "Spent to Date" as "$4,500.00"
    When I perform quick search for "Construction" in "---grantee_tableId:-:ExpenditureDetailsTableId---" panel
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$2,000.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:ExpenditureDetailsTableId---" for table id "Next"
    Then I softly see value "$2,500.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$2,000.00" for title "Amount Spent to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$2,500.00" for title "Amount Spent to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Amended"
    When I navigate to "Actuals" sub tab
    Then I softly see field "Drawn to Date" as "$4,500.00"
    Then I softly see field "Current Balance" as "$0.00"
    Then I softly see field "Grant Balance" as "$95,500.00"
    Then I softly see field "Spent to Date" as "$4,500.00"
    When I perform quick search for "Construction" in "---grantee_tableId:-:ExpenditureDetailsTableId---" panel
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$2,000.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:ExpenditureDetailsTableId---" for table id "Next"
    Then I softly see value "$2,500.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$2,000.00" for title "Amount Spent to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$2,500.00" for title "Amount Spent to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"

  @490305 @ValidateGrantwithPMProfileabletocreatedirectgrantandseealltabsandsection @PM_Grantee @GRegression1 @P1_Grantee
  Scenario Outline: Validate Grant with PM Profile, able to create direct grant and see all tabs and section
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly see "Create Grant" opens in overLay window
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Grant Title is required.               |
      | To Save, Grant Abbreviation is required.        |
      | To Save, Grant Number is required.              |
      | To Save, Project Period Start Date is required. |
      | To Save, Project Period End Date is required.   |
      | To Save, Budget Type is required.               |
      | To Save, Total Anticipated Amount is required.  |
      | To Save, Grant Type is required.                |
      | To Save, Funding Organization is required.      |
      | To Save, Allow Indirect Costs? is required.     |
      | To Save, Match is Required? is required.        |
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see the header is "Grant" in the page details
    Then I softly see "Collapse" button for header
    Then I softly see "Resize" button for page
    Then I softly see "Collapse" button for page
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, UEI Number is required in the Overview tab under the General Information section. |
    And I navigate to "Overview" sub tab
    When I enter value "<UEI>" into field "DUNS__c"
    When I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    When I click modal button "OK"
    Then I can see top right button "Edit" in page detail
    Then I softly see field "UEI Number" as ""
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    When I enter value "<UEI>" into field "DUNS__c"
    And I click on "Save" in the page details
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" inside page block
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    And I save the field labeled "Internal Organization" as "InternalOrganization"
    Then I softly see field "Internal Organization" inside page block
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see field "Created by" inside page block
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    And I save the field labeled "Last Modified by" as "LastModifiedby"
    Then I softly see field "Last Modified by" inside page block
    Then I softly see link "{SavedValue:LastModifiedby}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedby}"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:Createdby}"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:FundingOrganization}"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:FundingOrganization}" in the page details
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:InternalOrganization}"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "{SavedValue:InternalOrganization}" in the page details
    And I click on back arrow
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Awards" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Management" sub tab at view detail page
    Then I softly can see "Monitoring" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    And I navigate to "Financials" sub tab
    Then I softly see field "Budgeted Cash Match" inside page block
    Then I softly see field "Budgeted Non-Cash Match" inside page block
    Then I softly see field "Budgeted Match" inside page block
    Then I softly see field "Remaining Match" inside page block
    Then I softly see field "Remaining Match" inside page block
    Then I softly see field "Budgeted Leverage" inside page block
    Then I softly see field "Total Anticipated Program Income" inside page block
    Then I softly see field "Total Program Income Expenditure" inside page block
    And I navigate to "Awards" sub tab
    Then I can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I cannot see row level action button "Delete" against "Created" in flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Projections" sub tab
    Then I softly see field "Maximum Indirect Cost Rate" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "{SavedValue:GrantEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:GrantsTable---"
    Then I can see row level action button "View" against "{SavedValue:GrantEGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I can see row level action button "Edit" against "{SavedValue:GrantEGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I cannot see row level action button "Delete" against "{SavedValue:GrantEGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"

    Examples:
      | userType   | UEI          |
      | GRANTEE PM | YRNMVN96JC17 |

  @443838 @ValidateAwardWithEXEProfileIfinFocusareasectionstartdateandenddateislessthanorgreaterthanbudgetperioddatethenabletoseetheValidationmessage @P1_Grantee @EXE_Grantee @GRegression1
  Scenario: Validate Award With EXE Profile If in Focus area section start date and end date is less than or greater than budget period date then able to see the Validation message
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Victor EXE user"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Projections Tab - At least one focus area must be in place at all times during the budget period. Adjust the focus area dates accordingly. |
      | Projections Tab - Enter the Focus Area Start Date and Focus Area End Date to all focus areas to submit for approval.                       |
      | Projections Tab - You must associate a budget to all focus areas before submitting this award for approval.                                |

  @482615 @validatesectionsdisplayedtopouseronawardwhenallsettingsareno @P1_Grantee @PO_Grantee @GRegression1 @sprint15
  Scenario: Validate sections displayed to PO user on award when all settings are No
    And I "Created" standalone subaward "Automation Runtime Award" with properties "ALL_SETTING_NO-Grantee PO user"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I click on remove for lookup from field "DUNS__c"
    When I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    When I click modal button "OK"
    Then I can see top right button "Edit" in page detail
    Then I softly see field "UEI Number" as "YRNMVN96JC17"
    And I navigate to "Financials" sub tab
    Then I softly cannot see field "Budgeted Cash Match" inside page block
    Then I softly cannot see field "Budgeted Non-Cash Match" inside page block
    Then I softly cannot see field "Budgeted Non-Cash Match" inside page block
    Then I softly cannot see field "Budgeted Leverage" inside page block
    Then I softly cannot see field "Total Anticipated Program Income" inside page block
    Then I softly cannot see field "Total Program Income Expenditure" inside page block
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    Then I softly do not see fields "MaintenanceOfEffortAmount__c" is visible
    And I navigate to "Projections" sub tab
    Then I softly cannot see field "Maximum Indirect Cost Rate" inside page block
    Then I softly cannot see field "Program Income Treatment Type" inside page block
    Then I softly do not see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly do not see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly do not see "Program Income" page block displayed
    Then I softly do not see "Indirect Rates" page block displayed
    And I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    And I navigate to "Management" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I save the field labeled "Title" as "termstitle"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "{SavedValue:termstitle}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"

  @443837 @validatewithEXEProfile,OnEditClickabletoredirecttoawardpagelayout,onawardlayoutabletoseealltabsandsectionwhichiscreatedthroughdirectwithsettingNO  @P1_Grantee @EXE_Grantee @GRegression1 @sprint15
  Scenario: Validate with EXE Profile,On Edit Click able to redirect to award page layout,on award layout able to see all tabs and section which is created through direct with setting NO
    And I "Created" standalone subaward "Automation Runtime Award" with properties "ALL_SETTING_NO-Victor EXE user"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I click on remove for lookup from field "DUNS__c"
    When I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    When I click modal button "OK"
    Then I can see top right button "Edit" in page detail
    Then I softly see field "UEI Number" as "YRNMVN96JC17"
    And I navigate to "Financials" sub tab
    Then I softly cannot see field "Budgeted Cash Match" inside page block
    Then I softly cannot see field "Budgeted Non-Cash Match" inside page block
    Then I softly cannot see field "Budgeted Non-Cash Match" inside page block
    Then I softly cannot see field "Budgeted Leverage" inside page block
    Then I softly cannot see field "Total Anticipated Program Income" inside page block
    Then I softly cannot see field "Total Program Income Expenditure" inside page block
    And I navigate to "Awards" sub tab
    And I click on "Edit" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I click on "Save" in the page details
    And I wait for "1" seconds
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Validate" in page detail
    Then I can see top right button "Submit For Approval" in page detail
    And I navigate to "Overview" sub tab
    Then I softly do not see fields "MaintenanceOfEffortAmount__c" is visible
    And I navigate to "Projections" sub tab
    Then I softly cannot see field "Maximum Indirect Cost Rate" inside page block
    Then I softly cannot see field "Program Income Treatment Type" inside page block
    Then I softly do not see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly do not see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly do not see "Program Income" page block displayed
    Then I softly do not see "Indirect Rates" page block displayed
    And I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    And I navigate to "Management" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I save the field labeled "Title" as "termstitle"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "{SavedValue:termstitle}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"

  @443817 @validatePMprofile,awardpagelayoutofdirectgrant @Gregression2 @P2_Grantee @PM_Grantee
  Scenario: Validate PM Profile, award page layout of direct grant
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see "Collapse" button for header
    Then I softly see "Resize" button for page
    Then I softly see "Collapse" button for page
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Validate" in page detail
    Then I can see top right button "Submit For Approval" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Projections" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Management" sub tab at view detail page
    Then I softly can see "Monitoring" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly see "Details" page block displayed
    Then I softly see field "Award Title" inside page block
    Then I softly see field "Grant EGMS ID" inside page block
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I see the header is "Grant" in the page details
    When I navigate to "Overview" sub tab
    When I navigate to "Awards" sub tab
    And I click on "Edit" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

  @488678 @ValidatePMProfilenewbuttononFinancialTransactionwithreocrdowneronly. @P2_Grantee @Gregression2 @PM_Grantee
  Scenario: Validate for PM Profile New button on Financial Transaction with reocrd owner only.
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "SECOND_FOCUS_WITH_BUDGET"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    Then I softly see field "Drawn to Date" as "$0.00"
    Then I softly see field "Spent to Date" as "$0.00"
    Then I softly see field "Current Balance" as "$0.00"
    Then I softly see field "Grant Balance" as "$100,000.00"
    Then I softly see "Drawdown By Award" page block displayed
    Then I softly can see row level action button "Show Financial Transactions" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "Automation Permanent Focus Area" for title "Focus Area Name" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Focus Area Name" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    And I click on "Show Financial Transactions" icon for "Automation Permanent Focus Area" inside flex table with id "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see "Drawdown By  Award" opens in overLay window
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    And I click modal button "Close"
    And I click on "Show Financial Transactions" icon for "Automation Permanent Focus Area2" inside flex table with id "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see "Drawdown By  Award" opens in overLay window
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    And I click modal button "Close"
    And I wait for "1" seconds
    Given I expand nested table containing column value "Automation Permanent Focus Area"
    Then I softly see "Financial Transactions" page block displayed
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly see "Reference ID" in flex table header "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly see "Drawdown Date" in flex table header "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly see "Amount" in flex table header "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    And I collapse nested table containing column value "Automation Permanent Focus Area"
    And I wait for "1" seconds
    Given I expand nested table containing column value "Automation Permanent Focus Area2"
    Then I softly see "Financial Transactions" page block displayed
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly see "Reference ID" in flex table header "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly see "Drawdown Date" in flex table header "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly see "Amount" in flex table header "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    And I wait for "2" seconds
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:actualsTabDrawDownTableId---"
    And I wait for "1" seconds
    Then I softly see the following messages in the page details contains:
      | Required fields missing |

  @461011 @validateifNONcashmatchisselectedYestheninReportnoncashmatchlineitemmodalabletoseeNewbutton. @Gregression2 @P2_Grantee @PO_Grantee
  Scenario: Validate if NON cash match is selected Yes then in Report non cash match line item modal able to see New button.
    And I "Created" standalone subaward "Automation Runtime award" with properties "CASH_MATCH_NON_CASH_MATCH_PO_OWNER"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    Then I softly see "Financials Summary" page block displayed
    Then I softly see "Expenditure Detail" page block displayed
    Then I softly see field "Total Awarded Budget" inside page block
    Then I softly see field "Spent to Date" inside page block
    Then I softly see field "Remaining Balance" inside page block
    Then I softly see field "Total Match Expenditures to Date this Budget Period" inside page block
    Then I softly can see row level action button "Show Financial Transactions" against "Construction" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly can see row level action button "Report Non-Cash Match Line Item" against "Construction" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    And I click on "Report Non-Cash Match Line Item" icon for "Construction" inside flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see "Add Non-Cash Match" opens in overLay window
    Then I softly see "Report Non Cash Match" page block displayed on modal
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsMoalNonCashMatchTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AwardActualsMoalNonCashMatchTableId---"
    And I close "Add Non-Cash Match" modal by clicking the top right x button
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I create adhoc closeout "{SavedValue:Automation Runtime Award}" for status "Completed" with properties "default-Grantee PO user"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    Then I softly see field "Status" as "Closed/Completed"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Closed" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Closed"
    And I wait for "2" seconds
    Then I softly can see "Actuals" sub tab at view detail page
    When I navigate to "Actuals" sub tab
    Then I softly see "Financials Summary" page block displayed
    Then I softly see "Expenditure Detail" page block displayed
    Then I softly see field "Total Awarded Budget" inside page block
    Then I softly see field "Spent to Date" inside page block
    Then I softly see field "Remaining Balance" inside page block
    Then I softly see field "Total Match Expenditures to Date this Budget Period" inside page block
    Then I softly can see row level action button "Show Financial Transactions" against "Construction" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly can see row level action button "Report Non-Cash Match Line Item" against "Construction" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    And I click on "Report Non-Cash Match Line Item" icon for "Construction" inside flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see "Add Non-Cash Match" opens in overLay window
    Then I softly see "Report Non Cash Match" page block displayed on modal
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsMoalNonCashMatchTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AwardActualsMoalNonCashMatchTableId---"

  @443799 @validateWithPMProfileHistoryTabofGrantpagelayout @P2_Grantee @PM_Grantee @Gregression2
  Scenario: Validate With PM Profile History Tab of Grant page layout.
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    Then I softly see field "Status" as "Draft"
    And I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    Then I softly see "No Records Found" inside snapshot history
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    Then I softly see "No Records Found" inside snapshot history
    And I "Created" standalone subaward "Automation Runtime Award2" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award2}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award2}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award2}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Files" sub tab
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Reject" in the approval decision
    And I wait for "2" seconds
    And I refresh the page
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Terminated"
    And I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    Then I softly see "No Records Found" inside snapshot history

  @443809 @ValidateWithPMProfileaccessofGrantwhenisinClosedCompletedState @GRegression5 @PM_Grantee @P3_Grantee
  Scenario: Validate With PM Profile access of Grant when is in Closed/Completed State
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:grantNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I create adhoc closeout "{SavedValue:Automation Runtime Award}" for status "Approved" with properties "default"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Closeout" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Complete Closeout" in the page details
    And I wait for "2" seconds
    When I enter in modal value "0" into field "FederalCloseoutDate__c"
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Completed"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Award}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Award}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Closed/Completed"
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Closeout" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:closeoutID}" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:grantNotesTableId---"

  @443851 @ValidateAwardwithPMProfileIfamendmentiscreatedtheninawardabletoseeamendedstateandcheckaccess @GRegression5 @PM_Grantee @P3_Grantee
  Scenario: Validate Award with PM Profile If amendment is created then in award able to see amended state and check access
    And I "Created" standalone subaward "Automation Runtime award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    And I wait for "2" seconds
    And I "Approved" of type "Scope of Work Change" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "KPCID"
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I click on "View" icon for "Amended" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Amended"
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see value "Victor EXE" for title "Title" inside table "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly can see row level action button "Show Financial Transactions" against "Construction" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramRevenueTableId---"
    Then I softly can see row level action button "Show Financial Transactions" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:actualsTabDrawDownTableId---"
    And I navigate to "Management" sub tab
    Then I softly can see row level action button "View" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly cannot see row level action button "Edit" against "Progress Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly can see row level action button "View" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly cannot see row level action button "Edit" against "Financial Report" in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see row level action button "View" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly can see row level action button "View" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Interim Award Document" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"

  @495278 @ValidateOnGrantpagelayoutExpenditurestoDatereplacewithSpenttoDateandtherolledupamountabletosee @GRegression3 @PM_Grantee @P3_Grantee
  Scenario: Validate On Grant page layout ‘Expenditures to Date’ replace with  ‘Spent to Date’ and the rolled up amount able to see
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{grantee_testData:GrantsForNonConstructionAndSpent}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{grantee_testData:GrantsForNonConstructionAndSpent}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Financials" sub tab
    Then I softly see field "Spent to Date" inside page block
    Then I softly cannot see field "Expenditures to Date" inside page block
    Then I softly see field "Spent to Date" as "$4,500.00"

  @488687 @ValidateFOProfileimpactofDrawdownbyAwardwithFOProfile @GRegression3 @FO_Grantee @P3_Grantee
  Scenario: Validate FO Profile impact of Drawdown by Award with FO Profile
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Award Title" as "AwardTitle"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    Given I expand nested table containing column value "Automation Permanent Focus Area"
    When I enter the following values into flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---" by clicking "New" :
      | Reference ID | Drawdown Date | Amount |
      | Focus        | 1             | 3000   |
    Then I softly can see row level action button "Edit" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Delete" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly see value "$3,000.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$3,000.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    When I navigate to "Actuals" sub tab
    Then I softly see "Drawdown By Award" page block displayed
    Given I expand nested table containing column value "Automation Permanent Focus Area"
    Then I softly see "Financial Transactions" page block displayed
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly cannot see row level action button "Edit" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly cannot see row level action button "Delete" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly see value "$3,000.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$3,000.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"

  @488689 @ValidateAdminProfileimpactofDrawdownbyAwardwithAdminProfile @GRegression3 @ADMIN_Grantee @P3_Grantee
  Scenario: Validate Admin Profile impact of Drawdown by Award with Admin Profile
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Award Title" as "AwardTitle"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    Given I expand nested table containing column value "Automation Permanent Focus Area"
    When I enter the following values into flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---" by clicking "New" :
      | Reference ID | Drawdown Date | Amount |
      | Focus        | 1             | 3000   |
    Then I softly can see row level action button "Edit" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Delete" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly see value "$3,000.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$3,000.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    When I re-login to "Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    When I navigate to "Actuals" sub tab
    Then I softly see "Drawdown By Award" page block displayed
    Given I expand nested table containing column value "Automation Permanent Focus Area"
    Then I softly see "Financial Transactions" page block displayed
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly cannot see row level action button "Edit" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly cannot see row level action button "Delete" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly see value "$3,000.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$3,000.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I "Approved" of type "Budget Period Change" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "default-Victor EXE user"
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendEGMSID"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardId1"
    When I re-login to "Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Amended"
    When I navigate to "Actuals" sub tab
    Then I softly see "Drawdown By Award" page block displayed
    Given I expand nested table containing column value "Automation Permanent Focus Area"
    Then I softly see "Financial Transactions" page block displayed
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly cannot see row level action button "Edit" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly cannot see row level action button "Delete" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly see value "$3,000.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$3,000.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"

  @464088 @ValidatePOuserARownercanseeabletoseeAnyrecordProgressReportFinancialReportifitisinflightinstateotherthanApprovedwillgetreparentedpointtonewawardidNewAwardIdwillshowonrecordsPRFR @P2_Grantee @PO_Grantee @GRegression5
  Scenario: Validate PO user AR owner can see able to see Any record Progress Report Financial Report if it is in flight in state other than Approved will get reparented point to new award id & New Award Id will show on records PR & FR\
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I "Created" the "Progress Report" for title "{SavedValue:Automation Runtime award}" with properties "PO_OWNER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I save the field labeled "EGMS ID" as "progressEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    When I perform quick search for "{SavedValue:progressEGMSID}" in "---grantee_tableId:-:ProgressReports---" panel
    When I click on "View" icon for "{SavedValue:progressEGMSID}" inside flex table with id "---grantee_tableId:-:ProgressReports---"
    When I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Reviewed"
    And I "Created" the "Progress Report" for title "{SavedValue:Automation Runtime award}" with properties "PO_OWNER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I save the field labeled "EGMS ID" as "progressEGMSID1"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    And I "Created" the "Progress Report" for title "{SavedValue:Automation Runtime award}" with properties "PO_OWNER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I save the field labeled "EGMS ID" as "progressEGMSID2"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:progressReportApprovers---" by clicking "New" :
      | Name     | Progress Report |
      | Sarah PM | Step 1          |
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:progressReportFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Progress Report" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:KPIOnProgressReport---" by clicking "Edit" :
      | EGMS ID                | Reported Value | Reported Value As Of |
      | Automation Runtime KPI | 10             | 1                    |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approved" the "Progress Report" for title "{SavedValue:Automation Runtime award}" with properties "PO_OWNER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I save the field labeled "EGMS ID" as "progressEGMSID3"
    Then I softly see field "Status" as "Approved"
    And I "Created" the "Progress Report" for title "{SavedValue:Automation Runtime award}" with properties "PO_OWNER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:ProgressReportTableId---"
    And I save the field labeled "EGMS ID" as "progressEGMSID4"
    Then I softly see field "Status" as "Created"
    And I "Created" the "Financial Report" for title "{SavedValue:Automation Runtime award}" with properties "PO_OWNER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I save the field labeled "EGMS ID" as "financialEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:financialReportPeerReviewTableId---"
    And I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Financial Reports" content inside "Monitoring" subheader on left panel
    And I click toggle button to select "Financial Reports - All"
    And I perform quick search for "{SavedValue:financialEGMSID}" in "---grantee_tableId:-:FinancialReportsOnMonitoring---" panel
    When I click on "View" icon for "{SavedValue:financialEGMSID}" inside flex table with id "---grantee_tableId:-:FinancialReportsOnMonitoring---"
    When I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Reviewed"
    And I "Created" the "Financial Report" for title "{SavedValue:Automation Runtime award}" with properties "PO_OWNER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I save the field labeled "EGMS ID" as "financialEGMSID1"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:financialReportPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    And I "Created" the "Financial Report" for title "{SavedValue:Automation Runtime award}" with properties "PO_OWNER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I save the field labeled "EGMS ID" as "financialEGMSID2"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportApproverTableId---" by clicking "New" :
      | Name     | Financial Report |
      | Sarah PM | Step 1           |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approved" the "Financial Report" for title "{SavedValue:Automation Runtime award}" with properties "PO_OWNER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I save the field labeled "EGMS ID" as "financialEGMSID3"
    Then I softly see field "Status" as "Approved"
    And I "Created" the "Financial Report" for title "{SavedValue:Automation Runtime award}" with properties "PO_OWNER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I save the field labeled "EGMS ID" as "financialEGMSID4"
    Then I softly see field "Status" as "Created"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:financialEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:financialEGMSID1}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:financialEGMSID2}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:financialEGMSID3}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:financialEGMSID4}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:progressEGMSID1}" for title "EGMS ID" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:progressEGMSID2}" for title "EGMS ID" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:progressEGMSID3}" for title "EGMS ID" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:progressEGMSID4}" for title "EGMS ID" inside table "---grantee_tableId:-:ProgressReportTableId---"
    And I "Approved" of type "Budget Period Change" amendment request for title "{SavedValue:Automation Runtime award}" with properties "default-Grantee PO user"
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardId1"
    And I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:financialEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:AwardId1}" for title "Award EGMS ID" against the value "{SavedValue:financialEGMSID}" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:financialEGMSID1}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:AwardId1}" for title "Award EGMS ID" against the value "{SavedValue:financialEGMSID1}" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:financialEGMSID2}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:AwardId1}" for title "Award EGMS ID" against the value "{SavedValue:financialEGMSID2}" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:financialEGMSID3}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Award EGMS ID" against the value "{SavedValue:financialEGMSID3}" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:financialEGMSID4}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:AwardId1}" for title "Award EGMS ID" against the value "{SavedValue:financialEGMSID4}" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:progressEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:AwardId1}" for title "Award EGMS ID" against the value "{SavedValue:progressEGMSID}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:progressEGMSID1}" for title "EGMS ID" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:AwardId1}" for title "Award EGMS ID" against the value "{SavedValue:progressEGMSID1}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:progressEGMSID2}" for title "EGMS ID" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:AwardId1}" for title "Award EGMS ID" against the value "{SavedValue:progressEGMSID2}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:progressEGMSID3}" for title "EGMS ID" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Award EGMS ID" against the value "{SavedValue:progressEGMSID3}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:progressEGMSID4}" for title "EGMS ID" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:AwardId1}" for title "Award EGMS ID" against the value "{SavedValue:progressEGMSID4}" inside table "---grantee_tableId:-:ProgressReportTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:financialEGMSID3}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Award EGMS ID" against the value "{SavedValue:financialEGMSID3}" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:progressEGMSID3}" for title "EGMS ID" inside table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Award EGMS ID" against the value "{SavedValue:progressEGMSID3}" inside table "---grantee_tableId:-:ProgressReportTableId---"

  @463657 @463588 @ValidateOtherTypeARtheReparentingthefinancialreportfromothertypeofamendmentrequest @PO_Grantee @P2_Grantee @GRegression5
  Scenario: Validate Other Type AR the Reparenting the financial report from other type of amendment request
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I "Created" the "Financial Report" for title "{SavedValue:Automation Runtime award}" with properties "PO_OWNER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I save the field labeled "EGMS ID" as "financialEGMSID2"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:financialReportApproverTableId---" by clicking "New" :
      | Name       | Financial Report |
      | Grantee PO | Step 1           |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Submitted to Grantor" the "Financial Report" for title "{SavedValue:Automation Runtime award}" with properties "PO_OWNER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I save the field labeled "EGMS ID" as "financialEGMSID3"
    Then I softly see field "Status" as "Submitted to Grantor"
    And I "Created" the "Financial Report" for title "{SavedValue:Automation Runtime award}" with properties "PO_OWNER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:FinancialsReportTableId---"
    And I save the field labeled "EGMS ID" as "financialEGMSID4"
    Then I softly see field "Status" as "Created"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:financialEGMSID2}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:financialEGMSID3}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:financialEGMSID4}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    And I "Approved" of type "Other" amendment request for title "{SavedValue:Automation Runtime award}" with properties "default-Grantee PO user"
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardId1"
    And I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:financialEGMSID2}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:AwardId1}" for title "Award EGMS ID" against the value "{SavedValue:financialEGMSID2}" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:financialEGMSID3}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Award EGMS ID" against the value "{SavedValue:financialEGMSID3}" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:financialEGMSID4}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:AwardId1}" for title "Award EGMS ID" against the value "{SavedValue:financialEGMSID4}" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I softly see value "{SavedValue:financialEGMSID3}" for title "EGMS ID" inside table "---grantee_tableId:-:FinancialsReportTableId---"
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Award EGMS ID" against the value "{SavedValue:financialEGMSID3}" inside table "---grantee_tableId:-:FinancialsReportTableId---"

   @443799 @validateWithPMProfileHistoryTabofGrantpagelayout @P2_Grantee @PM_Grantee @Gregression2
   Scenario: Validate With PM Profile History Tab of Grant page layout.
     And I "Created" standalone subaward "Automation Runtime award" with properties "default"
     And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
     When I login to "Grantee" app as "GRANTEE PM" user
     And I navigate to "Grants" tab
     When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
     And I click toggle button to select "Grants - All"
     When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
     And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
     And I save the field labeled "EGMS ID" as "GrantEGMSID"
     And I save the field labeled "Grant Number" as "GrantNumber"
     Then I softly see field "Status" as "Draft"
     And I navigate to "History" sub tab
     Then I softly see "Snapshot History" page block displayed
     Then I softly see "No Records Found" inside snapshot history
     And I activate the award for title "{SavedValue:Automation Runtime award}"
     And I navigate to "Grants" tab
     When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
     And I click toggle button to select "Grants - All"
     When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
     And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
     Then I softly see field "Status" as "Active"
     And I navigate to "History" sub tab
     Then I softly see "Snapshot History" page block displayed
     Then I softly see "No Records Found" inside snapshot history
     And I "Created" standalone subaward "Automation Runtime Award2" with properties "default"
     And I updated direct grant award for title "{SavedValue:Automation Runtime Award2}" with properties "default"
     And I navigate to "Grants" tab
     When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
     And I click toggle button to select "Grants - All"
     When I perform quick search for "{SavedValue:Automation Runtime Award2}" in "---grantee_tableId:-:GrantsTable---" panel
     And I click on "View" icon for "{SavedValue:Automation Runtime Award2}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
     And I save the field labeled "EGMS ID" as "GrantEGMSID"
     Then I softly see field "Status" as "Draft"
     When I navigate to "Awards" sub tab
     And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
     Then I softly see field "Status" as "Created"
     And I save the field labeled "EGMS ID" as "AwardEGMSID"
     When I navigate to "Files" sub tab
     When I navigate to "Files" sub tab
     And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
     And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
     And I wait for "2" seconds
     When I click modal button "Close"
     And I wait for "2" seconds
     When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
       | Title        | Description      |
       | Notes Record | Automation Notes |
     When I click on "Validate" in the page details
     And I wait for "2" seconds
     Then I softly see the following messages in the page details contains:
       | The award has been validated successfully. |
     And I click on "Submit For Approval" in the page details
     Then I softly see field "Status" as "Submitted for Approval"
     Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
     When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
     And I navigate to "Grants" tab
     When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
     And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
     When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
     When I "Reject" in the approval decision
     And I wait for "2" seconds
     And I refresh the page
     Then I softly see field "Status" as "Rejected"
     Then I softly see status in Progress-bar is "Rejected" and is "Red"
     When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
     And I navigate to "Grants" tab
     When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
     And I click toggle button to select "Grants - All"
     When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
     And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
     Then I softly see field "Status" as "Terminated"
     And I navigate to "History" sub tab
     Then I softly see "Snapshot History" page block displayed
     Then I softly see "No Records Found" inside snapshot history

  @482329 @AwardVerifywithPOProfiletheawardstates
  Scenario: Award - Verify with PO Profile ,the award states
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name      | Role            | Description            | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly can see row level action button "Send for Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I "Approved" of type "Funding Change" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "default-Grantee PO user"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I wait for "2" seconds
    And I create adhoc closeout "{SavedValue:Automation Runtime Award}" for status "Approved" with properties "default-Grantee PO user"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Closeout" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Pending Closeout"
    Then I softly can see "Actuals" sub tab at view detail page
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Complete Closeout" in the page details
    And I wait for "2" seconds
    When I enter in modal value "0" into field "FederalCloseoutDate__c"
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Completed"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Closed"

  @482622 @validatePMusercansubmitawardforapprovalafteradding3stepapprovers @Gregression2 @P2_Grantee @PM_Grantee
  Scenario: Validate PM user can submit award for approval after adding 3 step approvers
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award             |
      | Victor EXE| Step 1             |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award          |
      | David FO | Step 2            |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award           |
      | Sarah PM | Step 3            |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    
    @488674 @488676 @488677 @488681 @488674 @491450 @validateGrantAmountfieldonactualtabinFinancialSummarysection @P2_Grantee @Gregression2 @PM_Grantee
    Scenario: Validate Grant Amount field on actual tab in Financial Summary section.
    And I "Created" standalone subaward "Automation Runtime Award" with properties "NON_CONSTRUCTION"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "SECOND_FOCUS_WITH_BUDGET"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Award Title" as "AwardTitle"
    When I navigate to "Actuals" sub tab
    When I save the field labeled "Grant Amount" as "GrantAmount"
    Then I softly see field "Grant Amount" as "{SavedValue:GrantAmount}"
    When I save the field labeled "Total Awarded Budget" as "TotalAwardedBudget"
    Then I softly see field "Total Awarded Budget" as "{SavedValue:TotalAwardedBudget}"
    When I save the field labeled "Drawn to Date" as "DrawntoDate"
    Then I softly see field "Drawn to Date" as "{SavedValue:DrawntoDate}"
    When I save the field labeled "Spent to Date" as "SpenttoDate"
    Then I softly see field "Spent to Date" as "{SavedValue:SpenttoDate}"
    When I save the field labeled "Remaining Balance" as "RemainingBalance"
    Then I softly see field "Remaining Balance" as "{SavedValue:RemainingBalance}"
    When I save the field labeled "Total Match Expenditures to Date this Budget Period" as "TotalMatchExpenditurestoDatethisBudgetPeriod"
    Then I softly see field "Total Match Expenditures to Date this Budget Period" as "{SavedValue:TotalMatchExpenditurestoDatethisBudgetPeriod}"
    When I save the field labeled "Total Program Income Revenue this Budget Period" as "TotalProgramIncomeRevenuethisBudgetPeriod"
    Then I softly see field "Total Program Income Revenue this Budget Period" as "{SavedValue:TotalProgramIncomeRevenuethisBudgetPeriod}"
    When I save the field labeled "Total Leverage" as "TotalLeverage"
    Then I softly see field "Total Leverage" as "{SavedValue:TotalLeverage}"
    Given I expand nested table containing column value "Automation Permanent Focus Area"
    When I enter the following values into flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---" by clicking "New" :
      | Reference ID | Drawdown Date | Amount |
      | Focus        | 1             | 1500   |
      | Focus1       | 1             | 1500   |
    Then I softly can see row level action button "Edit" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Delete" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Edit" against "Focus1" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Delete" against "Focus1" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    And I collapse nested table containing column value "Automation Permanent Focus Area"
    Given I expand nested table containing column value "Automation Permanent Focus Area2"
    When I enter the following values into flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---" by clicking "New" :
      | Reference ID | Drawdown Date | Amount |
      | Focus2       | 1             | 500    |
      | Focus3       | 1             | 200    |
    Then I softly can see row level action button "Edit" against "Focus2" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Delete" against "Focus2" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Edit" against "Focus3" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    Then I softly can see row level action button "Delete" against "Focus3" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see field "Drawn to Date" as "$3,700.00"
    Then I softly see field "Current Balance" as "$3,700.00"
    Then I softly see field "Grant Balance" as "$96,300.00"
    Then I softly see value "$3,000.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$700.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$3,000.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see value "$700.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
    When I click on "Delete" icon for "Focus3" inside flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see field "Drawn to Date" as "$3,500.00"
    Then I softly see field "Current Balance" as "$3,500.00"
    Then I softly see field "Grant Balance" as "$96,500.00"

   @488683 @ValidateusingpmprofileforsinglefocusareaforTypeNonconstructionWithDrawdownandwithoutSpent @Gregression2 @PM_Grantee @P2_Grantee
   Scenario: Validate using PM profile For single focus area for Type Non construction With Drawdown and without Spent
     And I "Created" standalone subaward "Automation Runtime Award" with properties "NON_CONSTRUCTION"
     And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "Default"
     And I activate the award for title "{SavedValue:Automation Runtime Award}"
     When I login to "Grantee" app as "GRANTEE PM" user
     And I navigate to "Grants" tab
     When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
     And I click toggle button to select "Grants - All"
     When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
     And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
     And I save the field labeled "EGMS ID" as "GrantEGMSID"
     When I navigate to "Awards" sub tab
     And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
     And I navigate to "Overview" sub tab
     And I save the field labeled "Award Issue Date" as "AwardIssueDate"
     And I save the field labeled "Award Title" as "AwardTitle"
     When I navigate to "Actuals" sub tab
     Given I expand nested table containing column value "Automation Permanent Focus Area"
     When I enter the following values into flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---" by clicking "New" :
       | Reference ID | Drawdown Date | Amount |
       | Focus        | 1             | 1500   |
       | Focus1       | 1             | 1500   |
     Then I softly can see row level action button "Edit" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
     Then I softly can see row level action button "Delete" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
     Then I softly can see row level action button "Edit" against "Focus1" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
     Then I softly can see row level action button "Delete" against "Focus1" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
     And I refresh the page
     Then I softly see field "Drawn to Date" as "$3,000.00"
     Then I softly see field "Current Balance" as "$3,000.00"
     Then I softly see field "Grant Balance" as "$97,000.00"
     Then I softly see value "$3,000.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
     Then I softly see value "$3,000.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
     Then I softly see value "$0.00" for title "Amount Spent to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"

     @488684 @ValidatewithexeprofileForMultipleFocusareafortypeConstruction @Gregression2 @EXE_Grantee @P2_Grantee
     Scenario Outline: Validate with EXE profile For Multiple Focus area for type Construction
     And I "Created" standalone subaward "Automation Runtime Award" with properties "default-<Username>"
     And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "SECOND_FOCUS_WITH_BUDGET"
     And I activate the award for title "{SavedValue:Automation Runtime Award}"
     When I login to "Grantee" app as "GRANTEE EXE" user
     And I navigate to "Grants" tab
     When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
     And I click toggle button to select "Grants - All"
     When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
     And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
     And I save the field labeled "EGMS ID" as "GrantEGMSID"
     When I navigate to "Awards" sub tab
     And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
     And I navigate to "Overview" sub tab
     And I save the field labeled "Award Issue Date" as "AwardIssueDate"
     And I save the field labeled "Award Title" as "AwardTitle"
     And I save the field labeled "EGMS ID" as "AwardEGMSID"
     When I navigate to "Actuals" sub tab
     Given I expand nested table containing column value "Automation Permanent Focus Area"
     When I enter the following values into flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---" by clicking "New" :
       | Reference ID | Drawdown Date | Amount |
       | Focus        | 1             | 1500   |
       | Focus1       | 1             | 1500   |
     Then I softly can see row level action button "Edit" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
     Then I softly can see row level action button "Delete" against "Focus" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
     Then I softly can see row level action button "Edit" against "Focus1" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
     Then I softly can see row level action button "Delete" against "Focus1" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
     And I collapse nested table containing column value "Automation Permanent Focus Area"
     Given I expand nested table containing column value "Automation Permanent Focus Area2"
     When I enter the following values into flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---" by clicking "New" :
       | Reference ID | Drawdown Date | Amount |
       | Focus2       | 1             | 500    |
       | Focus3       | 1             | 200    |
     Then I softly can see row level action button "Edit" against "Focus2" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
     Then I softly can see row level action button "Delete" against "Focus2" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
     Then I softly can see row level action button "Edit" against "Focus3" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
     Then I softly can see row level action button "Delete" against "Focus3" in flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
     And I refresh the page
     And I wait for "2" seconds
     Then I softly see field "Drawn to Date" as "$3,700.00"
     Then I softly see field "Current Balance" as "$3,700.00"
     Then I softly see field "Grant Balance" as "$96,300.00"
     Then I softly see value "$3,000.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
     Then I softly see value "$700.00" for title "Balance Amount" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
     Then I softly see value "$3,000.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
     Then I softly see value "$700.00" for title "Amount Drawn to Date" inside table "---grantee_tableId:-:actualsTabDrawDownTableId---"
     When I click on "Delete" icon for "Focus3" inside flex table with id "---grantee_tableId:-:DrawDownFinancialTransactionTableId---"
     And I wait for "2" seconds
     And I refresh the page
     And I wait for "2" seconds
     Then I softly see field "Drawn to Date" as "$3,500.00"
     Then I softly see field "Current Balance" as "$3,500.00"
     Then I softly see field "Grant Balance" as "$96,500.00"
    Examples:
       | Username        |
       | Victor EXE user |

    @483598 @validateifsearchthereportthroughglobalsearchthenselectedreportabletosee"ActiveGrantSummarybyAgency".
    Scenario: Validate if search the report through global search then selected report able to see "Active Grant Summary by Agency".
      When I login to "Grantee" app as "GRANTEE ADMIN" user
      And I perform quick search inside global search "Active Grant Summary by Agency"
      Then I softly can see row level action button "Run" against "Active Grant Summary by Agency" in global search with id "Reports"
      And I click on row level action button "Run" against "Active Grant Summary by Agency" in global search with id "Reports"
      Then I see the header is "Report: Grant with Funding Agency" in the page details
      Then I see the header is "Active Grant Summary by Agency" in the page details
      Then I see the sub-header is "This report provides a consolidated view of all active grants associated with each Funding Organization." in the page details

      @459803 @VerifyforNotesection"Add"isReplacewith"New"button.
      Scenario: Verify for Note section "Add" is Replace with "New" button.
      When I login to "Grantee" app as "GRANTEE PM" user
      And I navigate to "Grants" tab
      When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
      And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
      And I enter "Grantee_Grant_Setting_No" values from "Award_Field_Values.xlsx"
      When I click modal button "Save and Continue"
      And I save the field labeled "EGMS ID" as "GrantEGMSID"
      Then I softly see field "Status" as "Draft"
      Then I softly see status in Progress-bar is "Created" and is "dark blue"
      Then I softly can see top right button "Save" in page detail
      Then I softly can see top right button "Cancel" in page detail
      And I navigate to "Files" sub tab
      Then I cannot see top right button "Add" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
      Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
      When I enter the following values into flex table with id "---grantee_tableId:-:grantNotesTableId---" by clicking "New" :
        | Title        | Description      |
        | Notes Record | Automation Notes |
      Then I softly see the following messages in the page details contains:
          | Saved Successfully! |

  @459814 @VerifyforAwardsNotesection"Add"isReplacewith"New"button.
  Scenario: Verify for Award Note section "Add" is Replace with "New" button.
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I enter "Grantee_Grant_Setting_No" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I click on "Save" in the page details
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |

 @485913 @validatethatpmprojectroleismandatoryincontacttable
 Scenario: Validate that PM Project Role is mandatory in Contact table
   And I "Created" standalone subaward "Automation Runtime award" with properties "default"
   And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
   When I login to "Grantee" app as "GRANTEE PM" user
   And I navigate to "Grants" tab
   When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
   And I click toggle button to select "Grants - All"
   When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
   And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
   Then I softly see field "Status" as "Draft"
   Then I softly see status in Progress-bar is "Created" and is "dark blue"
   And I save the field labeled "EGMS ID" as "GrantEGMSID"
   When I navigate to "Awards" sub tab
   And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
   Then I softly see field "Status" as "Created"
   And I get the "EGMS ID"
   And I save the field labeled "EGMS ID" as "AwardEGMSID"
   Then I can see top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
   And I click on top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
   Then I softly see "Create Contact" opens in overLay window
   Then I softly see field on modal "Organization" inside page block
   Then I softly see field on modal "Project Role" inside page block
   Then I softly see field on modal "Title" inside page block
   Then I softly see field on modal "First Name" inside page block
   Then I softly see field on modal "Last Name" inside page block
   Then I softly see field on modal "Phone" inside page block
   Then I softly see field on modal "Mobile Phone" inside page block
   Then I softly see field on modal "Email" inside page block
   Then I softly see field on modal "Address Line 1" inside page block
   Then I softly see field on modal "Address Line 2" inside page block
   Then I softly see field on modal "State" inside page block
   Then I softly see field on modal "Congressional District" inside page block
   Then I softly see field on modal "City" inside page block
   Then I softly see field on modal "Country" inside page block
   Then I softly see field on modal "County" inside page block
   Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
   Then I softly see field on modal "Zip Code" inside page block
   When I enter in modal value "Automation Runtime Title" into field "Title"
   When I enter in modal value "Automation Runtime" into field "FirstName"
   When I enter in modal value "Execution" into field "LastName"
   When I enter in modal value "8967093890" into field "Phone"
   When I enter in modal value "8967093440" into field "MobilePhone"
   And I generate the random EmailID and save as "uniqueEmailID"
   And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
   When I enter in modal value "Mail Street" into field "MailingStreet"
   When I enter in modal value "Howard Lane" into field "Address2__c"
   When I enter in modal value "AK: Alaska" into field "State__c"
   When I enter in modal value "VA" into field "MailingCity"
   When I enter in modal value "123" into field "CongressionalDistrict__c"
   When I enter in modal value "USA" into field "MailingCountry"
   When I enter in modal value "United" into field "County__c"
   When I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
   When I enter in modal value "12345" into field "MailingPostalCode"
   When I click modal button "Save"
   Then I softly see the following messages in the page details contains:
     | To Save, Project Role is required in the Contact Information section.   |