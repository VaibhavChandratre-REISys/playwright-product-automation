@GranteePreApplicationsGrantsGov @GranteePreApplicationsGrantsGovPDF
Feature: Validate all scenarios for Pre-Applications Grants Gov for PDF

  @463453 @PreAppVerifyWithPMProfilePhaselevelListviewpageasperthefilterlistgettheresult @P4_Grantee @PM_Grantee @GRegression4
  Scenario: PreApp - Verify With PM Profile , Phase level List view page as per the filter list get the result.
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    Then I softly see toggle option "Pre-Applications - All" inside flex table id "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see toggle option "Pre-Applications - Draft" inside flex table id "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see toggle option "Pre-Applications - Submitted" inside flex table id "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see toggle option "Pre-Applications - Converted to Application" inside flex table id "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see toggle option "Pre-Applications - Expired" inside flex table id "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see toggle option "Pre-Applications - My Records" inside flex table id "---grantee_tableId:-:preApplicaltionTableId---"
    And I click toggle button to select "Pre-Applications - All"
    When I perform quick search for "created" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "created" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Converted to Application" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Converted to Application" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Approved" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Approved" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Not Accepted" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Not Accepted" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:preApplicaltionTableId---"
    When I click on parallel lines menu bar with data target value "Pre-Applications - All"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Pre-Applications - All"
    And I wait for "7" seconds
    And I download the file
    Then I softly see "Pre-Applications - All" on page "1" of "govgrants" pdf file
    And I close the tab
    When I click on parallel lines menu bar with data target value "Pre-Applications - All"
    And I select "Refresh" from parallel lines dropdown of "Pre-Applications - All"
    Then I see table is refreshing
    And I click toggle button to select "Pre-Applications - Draft"
    When I perform quick search for "Created" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Approved" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Approved" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    And I wait for "2" seconds
    And I click toggle button to select "Pre-Applications - Submitted"
    When I perform quick search for "Submit to Grantor" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Not Accepted" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Not Accepted" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    When I perform quick search for "Accepted" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Accepted" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    And I wait for "2" seconds
    And I click toggle button to select "Pre-Applications - Converted to Application"
    When I perform quick search for "Converted to Application" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Converted to Application" for title "Status" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    And I wait for "2" seconds
    And I click toggle button to select "Pre-Applications - My Records"
    When I perform quick search for "Created" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    Then I softly see value "Created" for title "EGMS ID" inside table "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see "Opportunity Title" in flex table header "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see "Pre-Application Title" in flex table header "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:preApplicaltionTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:preApplicaltionTableId---"