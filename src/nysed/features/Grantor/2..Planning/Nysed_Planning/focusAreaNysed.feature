@focusAreaNysed @planningNysed @planning
Feature: Validate all scenarios in Focus Area.

  @492816 @Sprint-01 @US-490341 @M04 @M04Planning @sanitysuite
  Scenario Outline: Verify that the Internal user see only Edit button at the Focus Area page layout and other record flow action buttons at page level action dropdown
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I enter value "Automation Test Description" into field "Description__c"
    And I click on "Save" in the page details
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Activate" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---focusarea:-:FocusAreaFilesTableId---"
    And I wait for "5" seconds
    When I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    Then I softly can see top right dropdown button "Deactivate" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Closed" and is "dark blue"
    Then I cannot see top right button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Activate" in page detail
    Then I softly cannot see top right dropdown button "Deactivate" in page detail

    Examples:
      | UserType |
      | PM       |
#      | EXE      |
#      | ADMIN    |