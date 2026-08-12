@progressRequestNysed
Feature: Validate all scenarios in Payment Request from fdm

  @490102 @490099 @VerifythattheInternalusercanseeformssequencingisupdatedifwechangesequencingafterProgressReportSubmissionProgressReport @Sprint-00 @US-487276
  Scenario Outline: Verify that the Internal user can see forms sequencing is updated, if we change sequencing after Progress Report Submission: Progress Report
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "<User>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "progressId"
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
    And I pause execution for "3" seconds
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I see field "Status" as "Submitted to Grantor"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Grantor Progress Report Forms" in "---program:-:packagesTableId---" panel
    And I click on "View" icon for "Grantor Progress Report Forms" inside flex table with id "---program:-:packagesTableId---" without waiting for record
    And I select value inside table "---program:-:packagesFormsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name                                                                                   | Sequence Number | Is Mandatory? |
      | Community Initiative Progress Report                                                        | 1               | Checked       |
      | Tangible Personal Property Report - SF-428                                                  | 2               | Checked       |
      | Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A                      | 3               | Checked       |
      | Tangible Personal Property Report - Supplemental Sheet - SF-428-S                           | 4               | Checked       |
      | Tangible Personal Property Report - Disposition Request/Report - SF-428-C                   | 5               | Checked       |
      | Tangible Personal Property Report - Annual Report - SF-428-A                                | 6               | Checked       |
      | Real Property Status Report (Cover Page) - SF-429                                           | 7               | Unchecked     |
      | Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B | 8               | Unchecked     |
      | Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C      | 9               | Unchecked     |
      | Federal Financial Report - SF-425                                                           | 10              | Unchecked     |
      | Tangible Personal Property Report - Final Report - SF-428-B                                 | 11              | Unchecked     |
      | Federal Financial Report Attachment - SF-425A                                               | 12              | Unchecked     |
      | Outlay Report and Request for Reimbursement for Construction Programs-SF-271                | 13              | Unchecked     |
    And I save the value from row "1" for column name "Is Mandatory?" as "Mandatory1" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "2" for column name "Is Mandatory?" as "Mandatory2" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "3" for column name "Is Mandatory?" as "Mandatory3" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "4" for column name "Is Mandatory?" as "Mandatory4" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "5" for column name "Is Mandatory?" as "Mandatory5" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "6" for column name "Is Mandatory?" as "Mandatory6" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "7" for column name "Is Mandatory?" as "Mandatory7" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "8" for column name "Is Mandatory?" as "Mandatory8" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "9" for column name "Is Mandatory?" as "Mandatory9" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "10" for column name "Is Mandatory?" as "Mandatory10" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "11" for column name "Is Mandatory?" as "Mandatory11" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "12" for column name "Is Mandatory?" as "Mandatory12" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "13" for column name "Is Mandatory?" as "Mandatory13" from flex table "---program:-:packagesFormsTableId---"
    And I click modal button "Close"
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    When I perform quick search for "Record Id" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---progressReport:-:internalProgressReportFlexTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I see only the following headers in table with id "---progressReport:-:formTableId---" :
      | Actions | Sequence Number | Form Name | Report Type | Mandatory | Percentage | Last Modified By | Last Modified Date |
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    Then I softly see value "1" for title "Sequence Number" against the value "Community Initiative Progress Report" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory1}" for title "Mandatory" against the value "Community Initiative Progress Report" inside table "---progressReport:-:formTableId---"
    Then I softly see value "2" for title "Sequence Number" against the value "Tangible Personal Property Report - SF-428" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory2}" for title "Mandatory" against the value "Tangible Personal Property Report - SF-428" inside table "---progressReport:-:formTableId---"
    Then I softly see value "3" for title "Sequence Number" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory3}" for title "Mandatory" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "4" for title "Sequence Number" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory4}" for title "Mandatory" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---progressReport:-:formTableId---"
    Then I softly see value "5" for title "Sequence Number" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory5}" for title "Mandatory" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "6" for title "Sequence Number" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory6}" for title "Mandatory" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "7" for title "Sequence Number" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory7}" for title "Mandatory" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---progressReport:-:formTableId---"
    Then I softly see value "8" for title "Sequence Number" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory8}" for title "Mandatory" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "9" for title "Sequence Number" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory9}" for title "Mandatory" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "10" for title "Sequence Number" against the value "Federal Financial Report - SF-425" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory10}" for title "Mandatory" against the value "Federal Financial Report - SF-425" inside table "---progressReport:-:formTableId---"
    Then I softly see value "11" for title "Sequence Number" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory11}" for title "Mandatory" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "12" for title "Sequence Number" against the value "Federal Financial Report Attachment - SF-425A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory12}" for title "Mandatory" against the value "Federal Financial Report Attachment - SF-425A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "13" for title "Sequence Number" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory13}" for title "Mandatory" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---progressReport:-:formTableId---"
    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user |

  @491088 @491094 @VerifythattheSubrecipientuserseeonlyEditactionbuttonattheProgressReportpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownProgressReportCreated @Sprint-01 @US-490341
  Scenario Outline: Verify that the Subrecipient user see only 'Edit' action button at the Progress Report page layout and other record flow action buttons at page level action dropdown.: Progress Report: Created
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-<Filter>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "<Filter>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
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
    #@491094
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

  @490098 @490100 @VerifythattheSubrecipientusercanseeaSequenceNumbercolumnaddedtotheFormssectionandformsarelistedintheascendingorderofthesequencenumberslistedontheProgressReportFormspackageProgressReport @Sprint-00 @US-487276
  Scenario Outline: Verify that the Subrecipient user can see a 'Sequence Number' column added to the Forms section and forms are listed in the ascending order of the sequence numbers listed on the 'Progress Report Forms' package. - Progress Report
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Grantor Progress Report Forms" in "---program:-:packagesTableId---" panel
    And I click on "View" icon for "Grantor Progress Report Forms" inside flex table with id "---program:-:packagesTableId---" without waiting for record
    And I select value inside table "---program:-:packagesFormsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name                                                                                   | Sequence Number | Is Mandatory? |
      | Community Initiative Progress Report                                                        | 1               | Checked       |
      | Tangible Personal Property Report - SF-428                                                  | 2               | Checked       |
      | Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A                      | 3               | Checked       |
      | Tangible Personal Property Report - Supplemental Sheet - SF-428-S                           | 4               | Checked       |
      | Tangible Personal Property Report - Disposition Request/Report - SF-428-C                   | 5               | Checked       |
      | Tangible Personal Property Report - Annual Report - SF-428-A                                | 6               | Checked       |
      | Real Property Status Report (Cover Page) - SF-429                                           | 7               | Unchecked     |
      | Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B | 8               | Unchecked     |
      | Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C      | 9               | Unchecked     |
      | Federal Financial Report - SF-425                                                           | 10              | Unchecked     |
      | Tangible Personal Property Report - Final Report - SF-428-B                                 | 11              | Unchecked     |
      | Federal Financial Report Attachment - SF-425A                                               | 12              | Unchecked     |
      | Outlay Report and Request for Reimbursement for Construction Programs-SF-271                | 13              | Unchecked     |
    And I save the value from row "1" for column name "Is Mandatory?" as "Mandatory1" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "2" for column name "Is Mandatory?" as "Mandatory2" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "3" for column name "Is Mandatory?" as "Mandatory3" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "4" for column name "Is Mandatory?" as "Mandatory4" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "5" for column name "Is Mandatory?" as "Mandatory5" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "6" for column name "Is Mandatory?" as "Mandatory6" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "7" for column name "Is Mandatory?" as "Mandatory7" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "8" for column name "Is Mandatory?" as "Mandatory8" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "9" for column name "Is Mandatory?" as "Mandatory9" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "10" for column name "Is Mandatory?" as "Mandatory10" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "11" for column name "Is Mandatory?" as "Mandatory11" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "12" for column name "Is Mandatory?" as "Mandatory12" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "13" for column name "Is Mandatory?" as "Mandatory13" from flex table "---program:-:packagesFormsTableId---"
    And I click modal button "Close"
    And I wait for "5" seconds
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "default"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "Payment Request"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime FDM Announcement}" having object api name as "ProgressReports__c"
    When I re-login to "Grants Portal" app as "<SubUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I see only the following headers in table with id "---progressReport:-:formTableId---" :
      | Actions | Sequence Number | Form Name | Report Type | Mandatory | Percentage | Last Modified By | Last Modified Date |
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    Then I softly see value "1" for title "Sequence Number" against the value "Community Initiative Progress Report" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory1}" for title "Mandatory" against the value "Community Initiative Progress Report" inside table "---progressReport:-:formTableId---"
    Then I softly see value "2" for title "Sequence Number" against the value "Tangible Personal Property Report - SF-428" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory2}" for title "Mandatory" against the value "Tangible Personal Property Report - SF-428" inside table "---progressReport:-:formTableId---"
    Then I softly see value "3" for title "Sequence Number" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory3}" for title "Mandatory" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "4" for title "Sequence Number" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory4}" for title "Mandatory" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---progressReport:-:formTableId---"
    Then I softly see value "5" for title "Sequence Number" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory5}" for title "Mandatory" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "6" for title "Sequence Number" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory6}" for title "Mandatory" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "7" for title "Sequence Number" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory7}" for title "Mandatory" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---progressReport:-:formTableId---"
    Then I softly see value "8" for title "Sequence Number" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory8}" for title "Mandatory" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "9" for title "Sequence Number" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory9}" for title "Mandatory" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "10" for title "Sequence Number" against the value "Federal Financial Report - SF-425" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory10}" for title "Mandatory" against the value "Federal Financial Report - SF-425" inside table "---progressReport:-:formTableId---"
    Then I softly see value "11" for title "Sequence Number" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory11}" for title "Mandatory" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "12" for title "Sequence Number" against the value "Federal Financial Report Attachment - SF-425A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory12}" for title "Mandatory" against the value "Federal Financial Report Attachment - SF-425A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "13" for title "Sequence Number" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory13}" for title "Mandatory" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---progressReport:-:formTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Grantor Progress Report Forms" in "---program:-:packagesTableId---" panel
    And I click on "View" icon for "Grantor Progress Report Forms" inside flex table with id "---program:-:packagesTableId---" without waiting for record
    And I select value inside table "---program:-:packagesFormsTableId---" is "All"
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name                                                                                   | Sequence Number | Is Mandatory? |
      | Community Initiative Progress Report                                                        | 1               | Checked       |
      | Tangible Personal Property Report - SF-428                                                  | 2               | Checked       |
      | Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A                      | 3               | Checked       |
      | Tangible Personal Property Report - Supplemental Sheet - SF-428-S                           | 4               | Checked       |
      | Tangible Personal Property Report - Disposition Request/Report - SF-428-C                   | 5               | Checked       |
      | Tangible Personal Property Report - Annual Report - SF-428-A                                | 6               | Checked       |
      | Real Property Status Report (Cover Page) - SF-429                                           | 7               | Unchecked     |
      | Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B | 8               | Unchecked     |
      | Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C      | 9               | Unchecked     |
      | Federal Financial Report - SF-425                                                           | 10              | Unchecked     |
      | Tangible Personal Property Report - Final Report - SF-428-B                                 | 11              | Unchecked     |
      | Federal Financial Report Attachment - SF-425A                                               | 12              | Unchecked     |
      | Outlay Report and Request for Reimbursement for Construction Programs-SF-271                | 13              | Unchecked     |
    And I save the value from row "1" for column name "Is Mandatory?" as "Mandatory1" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "2" for column name "Is Mandatory?" as "Mandatory2" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "3" for column name "Is Mandatory?" as "Mandatory3" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "4" for column name "Is Mandatory?" as "Mandatory4" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "5" for column name "Is Mandatory?" as "Mandatory5" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "6" for column name "Is Mandatory?" as "Mandatory6" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "7" for column name "Is Mandatory?" as "Mandatory7" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "8" for column name "Is Mandatory?" as "Mandatory8" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "9" for column name "Is Mandatory?" as "Mandatory9" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "10" for column name "Is Mandatory?" as "Mandatory10" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "11" for column name "Is Mandatory?" as "Mandatory11" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "12" for column name "Is Mandatory?" as "Mandatory12" from flex table "---program:-:packagesFormsTableId---"
    And I save the value from row "13" for column name "Is Mandatory?" as "Mandatory13" from flex table "---program:-:packagesFormsTableId---"
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<SubUser>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    And I navigate to "Forms and Files" sub tab
    Then I see only the following headers in table with id "---progressReport:-:formTableId---" :
      | Actions | Sequence Number | Form Name | Report Type | Mandatory | Percentage | Last Modified By | Last Modified Date |
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    Then I softly see value "1" for title "Sequence Number" against the value "Community Initiative Progress Report" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory1}" for title "Mandatory" against the value "Community Initiative Progress Report" inside table "---progressReport:-:formTableId---"
    Then I softly see value "2" for title "Sequence Number" against the value "Tangible Personal Property Report - SF-428" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory2}" for title "Mandatory" against the value "Tangible Personal Property Report - SF-428" inside table "---progressReport:-:formTableId---"
    Then I softly see value "3" for title "Sequence Number" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory3}" for title "Mandatory" against the value "Real Property Status Report ATTACHMENT A (General Reporting)- SF-429-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "4" for title "Sequence Number" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory4}" for title "Mandatory" against the value "Tangible Personal Property Report - Supplemental Sheet - SF-428-S" inside table "---progressReport:-:formTableId---"
    Then I softly see value "5" for title "Sequence Number" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory5}" for title "Mandatory" against the value "Tangible Personal Property Report - Disposition Request/Report - SF-428-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "6" for title "Sequence Number" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory6}" for title "Mandatory" against the value "Tangible Personal Property Report - Annual Report - SF-428-A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "7" for title "Sequence Number" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory7}" for title "Mandatory" against the value "Real Property Status Report (Cover Page) - SF-429" inside table "---progressReport:-:formTableId---"
    Then I softly see value "8" for title "Sequence Number" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory8}" for title "Mandatory" against the value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "9" for title "Sequence Number" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory9}" for title "Mandatory" against the value "Real Property Status Report ATTACHMENT C (Disposition or Encumbrance Request)-SF-429-C" inside table "---progressReport:-:formTableId---"
    Then I softly see value "10" for title "Sequence Number" against the value "Federal Financial Report - SF-425" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory10}" for title "Mandatory" against the value "Federal Financial Report - SF-425" inside table "---progressReport:-:formTableId---"
    Then I softly see value "11" for title "Sequence Number" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory11}" for title "Mandatory" against the value "Tangible Personal Property Report - Final Report - SF-428-B" inside table "---progressReport:-:formTableId---"
    Then I softly see value "12" for title "Sequence Number" against the value "Federal Financial Report Attachment - SF-425A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory12}" for title "Mandatory" against the value "Federal Financial Report Attachment - SF-425A" inside table "---progressReport:-:formTableId---"
    Then I softly see value "13" for title "Sequence Number" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---progressReport:-:formTableId---"
    Then I softly see value "{SavedValue:Mandatory13}" for title "Mandatory" against the value "Outlay Report and Request for Reimbursement for Construction Programs-SF-271" inside table "---progressReport:-:formTableId---"

    Examples:
      | SubUser |
      | SPI1    |
#      | SPA      |

