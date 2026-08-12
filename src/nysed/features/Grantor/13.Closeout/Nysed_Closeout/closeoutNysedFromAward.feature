@closeoutNysed
Feature: Validate all scenarios in Closeout from direct grant

  @491265-DG @VerifythattheInternalUserdoesnotseetheLeverageAllowedontheCloseoutLayout @Sprint-01 @US-487975
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" on the Closeout Layout.
    Given I activated standalone subaward "Automation Runtime FDM Announcement" with properties "default-<User>" of type "Competitive"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    And I wait for "3" seconds
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I navigate to "Overview" sub tab
    Then I softly cannot see field "Leverage Allowed?" inside page block

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |
#      | ADMIN    | Automation ADMIN user |

  @491266-DG @VerifythattheSubrecipientUserdoesnotseetheLeverageAllowed?ontheCloseoutLayout @Sprint-01 @US-487975
  Scenario Outline: Verify that the Subrecipient User does not see the "Leverage Allowed?" on the Closeout Layout.
    Given I activated standalone subaward "Automation Runtime FDM Announcement" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    And I wait for "3" seconds
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    Then I softly cannot see field "Leverage Allowed?" inside page block

    Examples:
      | UserType |
      | SPI1     |
#      | SPA      |

  @493287-DG @493289-DG @493293-DG @493297-DG @493298-DG @VerifythattheInternaluserdoseeEditbuttonattheCloseoutRequestpagelayoutandcanseeotherrecordflowactionbuttonsatpagelevelactiondropdownCreatedCloseoutRequest @Sprint-01 @US-490341
  Scenario Outline: Verify that the Internal user do see 'Edit' button at the Closeout Request page layout and can see other record flow action buttons at page level action dropdown.- Created Closeout Request
    Given I activated standalone subaward "Automation Runtime FDM Announcement" with properties "default-<User>" of type "Competitive"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    And I wait for "3" seconds
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Send To Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name       | Closeout |
      | <Approver> | Step 1   |
    When I click on "Send To Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    Then I softly cannot see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---closeout:-:pendingTaskTableId---"
    #@493289
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Acknowledge" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    And I click on "Acknowledge" in the page details
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "dark blue"
    Then I cannot see top right button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Acknowledge" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    #@493293
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Override" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I can see top right button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Override" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #@493297
    Then I softly cannot see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    #@493298
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Completed"
    Then I softly cannot see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType | User               | Approver      |
      | PM       | Automation PM user | Automation PM |
#      | EXE      | Automation EXE user   |  Automation EXE |
#      | PO       | Automation PO user    |  Automation PO  |
