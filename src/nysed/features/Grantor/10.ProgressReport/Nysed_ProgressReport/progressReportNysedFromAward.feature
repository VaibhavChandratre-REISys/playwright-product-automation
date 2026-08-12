@progressRequestNysed
Feature: Validate all scenarios in Payment Request from award

  @491088-DG @491094-DG @VerifythattheSubrecipientuserseeonlyEditactionbuttonattheProgressReportpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownProgressReportCreated @Sprint-01 @US-490341
  Scenario Outline: Verify that the Subrecipient user see only 'Edit' action button at the Progress Report page layout and other record flow action buttons at page level action dropdown.: Progress Report: Created
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "<Filter>" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    #@491094_1
    Then I softly can see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly cannot see top right dropdown button "Send Back to Subrecipient" in page detail
    Then I softly cannot see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit to Grantor" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

    Examples:
      | UserType | Filter             |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user |