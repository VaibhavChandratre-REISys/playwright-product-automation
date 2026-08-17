@AlaskaApplication @AlaskaRegression
Feature: Validate all scenarios in the Application tab

  @Sprint-12-US-443403 @448861 @448811 @448838 @448841 @448836 @448868 @448865 @448855 @448845 @448824 @448830 @448839 @448846 @448828 @VaishaliD
  Scenario: Application: Add new classification and validations for CDBG program
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "Default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachments" page block displayed
    #448811
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:cdbgApplicationFiles---"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification                   |
      | Joint Application/Cooperative Agreement      |
      | Public Notice                                |
      | Minutes of Meeting                           |
      | Map                                          |
      | Deed                                         |
      | Lease                                        |
      | Easement                                     |
      | Job Description                              |
      | Feasibility or Marketing Studies             |
      | Authority to Participate (Resolution)        |
      | Statement of Assurances and Certification    |
      | Applicant/Recipient Disclosure/Update Report |
      | ADA Certification                            |
      | Sovereign Immunity                           |
    When I click modal button "Close"
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Application Files" page block displayed
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "Certification Regarding Debarment" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    And I click on "Edit" icon for "CDBG Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Application Part 1" sub tab
    When I enter "CDBG-Form1" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 2" sub tab
    When I enter "CDBG-Form2" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 3" sub tab
    When I enter "CDBG-Form Fields 3" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Validate" in the page details
    And I wait for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "2" seconds
    #448824 #448830 #448836 #448838 #448839 #448841 #448845 #448855 #448846 #448861 #448865 #448868 #448828
    Then I softly see the following messages in the page details contains:
      | Forms and Files Tab - Upload a Public Notice file in the attachments section.                                 |
      | Forms and Files Tab - Upload a Joint Application/Cooperative Agreement file in the attachments section.       |
      | Forms and Files Tab - Upload a Minutes of Meeting file in the attachments section.                            |
      | Forms and Files Tab - Upload a Map file in the attachments section.                                           |
      | Forms and Files Tab - Upload a Deed file in the attachments section.                                          |
      | Forms and Files Tab - Upload a Lease file in the attachments section.                                         |
      | Forms and Files Tab - Upload an Easement file in the attachments section.                                     |
      | Forms and Files Tab - Upload a Feasibility or Marketing Studies file in the attachments section.              |
      | Forms and Files Tab - Upload a Job Description file in the attachments section.                               |
      | Forms and Files Tab - Upload an Authority to Participate (Resolution) file in the attachments section.        |
      | Forms and Files Tab - Upload a Statement of Assurances and Certification file in the attachments section.     |
      | Forms and Files Tab - Upload an Applicant/Recipient Disclosure/Update Report file in the attachments section. |
      | Forms and Files Tab - Upload an ADA Certification file in the attachments section.                            |

  @Sprint-19-US-475605 @477505 @477513 @477514 @477516 @477518 @477520 @477521 @477523 @477525 @477528 @VaishaliD
  Scenario:As a Grantee, verify that proposal tab is hidden on application when program type is shared revenue
  | As a Grantee, verify that validation should not come while save the application for 'Approach/Methodology' section on proposal tab for Shared Revenue program
  | As a Grantee, verify that validation should not come while save the application for 'Capacity' section on proposal tab for Shared Revenue program
  | As a Grantee, verify that validation should not come while save the application for 'Qualifications' section on proposal tab for Shared Revenue program
  | Verify that users NOT in Grant Administrator queue are NOT able to see 'New' button on Application module landing page
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SR_CITY2"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY2" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Test Data" into field "ProjectAbstract__c"
    #407397
    Then I softly see field "Announcement Title" as "{SavedValue:Automation Runtime Announcement Application Intake}"
    #477505
    Then I softly cannot see "Proposal" sub tab at view detail page
    #477523
    And I clear the value from field "ProjectAbstract__c "
    #477513 #477514 #477516 #477525
    And I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Proposal Tab - Provide the Approach/Methodology before submitting this Application. |
      | Proposal Tab - Provide the Capacity before submitting this Application.             |
      | Proposal Tab - Provide the Qualifications before submitting this Application.       |
      | Overview Tab - Provide the Project Abstract before submitting this Application.     |
   #477518 #477520 #477521 #477528
    And I click on "Submit Application" in the page details
    Then I softly cannot see the following messages in the page details :
      | Proposal Tab - Provide the Approach/Methodology before submitting this Application. |
      | Proposal Tab - Provide the Capacity before submitting this Application.             |
      | Proposal Tab - Provide the Qualifications before submitting this Application.       |
      | Overview Tab - Provide the Project Abstract before submitting this Application.     |

  @Sprint-8-US-433835 @438059 @435202 @435698 @436919 @436921 @435233 @435707 @435712 @435716 @435717 @435721 @435208 @435748 @435759 @435764 @435765 @435769 @435770 @435774 @435800 @435781 @435805 @435782 @435789 @435793 @435786 @435797 @438906 @438929 @438930 @438931 @435813 @435814 @435817 @435810 @VaishaliD
  Scenario: To verify NFR - 1st Class Municipality form in Application's All Forms section
  | To verify application form name NFR - 1st Class Municipality
  | To verify Button on NFR - 1st Class Municipality form in view mode
  | To verify Button on NFR - 1st Class Municipality form in Edit mode
  | To verify NFR - 1st Class Municipality form sections
  | To verify Operation field under Indicate amount expended on Public Schools during Accounting Report for Previous SFY Schools/Roads Payment
  | To verify Maintenance field under Indicate amount expended on Public Schools during Accounting Report for Previous SFY Schools/Roads Payment sections
  | To verify Repair field under Indicate amount expended on Public Schools during Accounting Report for Previous SFY Schools/Roads Payment sections
  | To verify Construction field under Indicate amount expended on Public Schools during Accounting Report for Previous SFY Schools/Roads Payment sections
  | To verify Unexpended field under Indicate amount expended on Public Schools during Accounting Report for Previous SFY Schools/Roads Payment sections
  | To verify Unexpended Narrative field under Indicate amount expended on Public Schools during Accounting Report for Previous SFY Schools/Roads Payment sections when Unexpended > $0
  | To verify Total Accounting Report for Previous SFY Schools field under Indicate amount expended on Public Schools during Accounting Report for Previous SFY Schools Payment sections
  | To verify Total Previous SFY Schools Expenditures field under Indicate amount expended on Public Roads during Previous SFY in Accounting Report for Previous SFY Schools/Roads Payment sections
  | To verify Operation field under Indicate amount expended on Public Roads during Previous SFY in Accounting Report for Previous SFY Schools/Roads Payment sections
  | To verify Maintenance field under Indicate amount expended on Public Roads during Previous  FY in Accounting Report for Previous  SFY  Schools/Roads Payment sections
  | To verify Repair field under Indicate amount expended on Public Roads during Previous SFY in Accounting Report for Previous SFY Schools/Roads Payment sections
  | To verify Construction field under Indicate amount expended on Public Roads during Previous SFY in Accounting Report for Previous SFY Schools/Roads Payment sections
  | To verify Unexpended field under Indicate amount expended on Public Roads during Previous SFY in Accounting Report for Previous SFY Schools/Roads Payment sections
  | To verify Unexpended Narrative field under Indicate amount expended on Public Roads during Previous SFY in Accounting Report for Previous SFY Schools/Roads Payment sections when Unexpended > $0
  | To verify Miles of City Roads approved for Previous SFY program field do not accept Alphanumeric/ Special charecters under Road Maintenance Report sections
  | To verify Miles of City Roads approved for Previous SFY program field under Road Maintenance Report sections
  | To verify Miles of new city roads maintained field do not accept Alphanumeric/ Special charecters under Road Maintenance Report sections
  | To verify Miles of new city roads maintained field under Road Maintenance Report sections
  | To verify Does the city have a road maintenance agreement with DOT to maintain State roads? field under Road Maintenance Report sections
  | To verify Total Miles field under Road Maintenance Report sections
  | To verify Miles of State roads maintained by the city field under Road Maintenance Report sections when Does the city have a road maintenance agreement with DOT to maintain State roads? field selected option No
  | To verify Miles of State roads maintained by the city field under Road Maintenance Report sections when Does the city have a road maintenance agreement with DOT to maintain State roads? field selected option Yes
  | Verify that user is able to see the below 3 fields under 'Accounting Report for Previous SFY Schools/Roads Payment' of NFR - 1st Class Municipality Form
  | Verify that 'Current SFY' values comes from 'Fiscal year from announcement' under 'Accounting Report for Previous SFY Schools/Roads Payment' section of 'NFR - 1st Class Municipality' form
  | Verify that 'Previous SFY' values comes from 'Fiscal year minus one' under 'Accounting Report for Previous SFY Schools/Roads Payment' section of 'NFR - 1st Class Municipality' form
  | Verify that 'SFY Prior' values comes from 'fiscal year minus two' under 'Accounting Report for Previous SFY Schools/Roads Payment' section of 'NFR - 1st Class Municipality' form
  | To verify an acknowledgement check box on Certification and Assurances sections of NFR - 1st Class Municipality form
  | To verify an Acknowledged Date field on Certification and Assurances sections of NFR - 1st Class Municipality form
  | To verify an Acknowledged By field on Certification and Assurances sections of NFR - 1st Class Municipality form
  | To verify note on Certification and Assurances sections of NFR - 1st Class Municipality form
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Forms and Files" sub tab
    And I wait for "3" seconds
    #438059
    Then I softly can see row level action button "Edit" against "NFR - 1st Class Municipality" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I softly can see row level action button "View" against "NFR - 1st Class Municipality" in flex table with id "---applicationReview:-:allFormsTableId---"
    And I click on "View" icon for "NFR - 1st Class Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    #435202
    Then I softly see field "Form Name" as "NFR - 1st Class Municipality"
    #436919
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Back" in page detail
    Then I softly can see top right button "Download Excel" in page detail
    Then I softly can see top right button "Upload Excel" in page detail
    #For Public Schools
    #435698 #435707 #435712 #435716 #435717 #435721 #435208
    Then I softly see field "Total Previous SFY Schools Payment" as ""
    Then I softly see field "Operation" as ""
    Then I softly see field "Maintenance" as ""
    Then I softly see field "Repair" as ""
    Then I softly see field "Construction" as ""
    Then I softly see field "Unexpended" as ""
    Then I softly see field "Unexpended Narrative" as ""
    Then I softly see field "Acknowledged Date:" as ""
    Then I softly see field "Acknowledged By:" as ""
    #Public Roads
    #Fail due to same  label name  need to retest
    #435748 #435759 #435764 #435765 #435769 #435770
    Then I softly see field "Total Previous SFY Road Payment" as ""
    Then I softly see field "Operation" as ""
    Then I softly see field "Maintenance" as ""
    Then I softly see field "Repair" as ""
    Then I softly see field "Construction" as ""
    Then I softly see field "Unexpended" as ""
    Then I softly see field "Unexpended Narrative" as ""
    Then I softly see field "Does the city have a road maintenance agreement with DOT to maintain State roads?" as "No"
    When I click on "Edit" in the page details
    #436921
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    #435233
    And I navigate to "Details" sub tab
    Then I see "Fiscal Year" page block displayed
    Then I see "Accounting Report for Previous SFY Schools/Roads Payment" page block displayed
    Then I see "Road Maintenance Report" page block displayed
    Then I see "Certification and Assurances" page block displayed
    When I enter "NFRCity1FormFields" values from "ApplicationForm_Field_Values.xlsx"
    When I click on "Save" in the page details
    #435698 #435707 #435712 #435716 #435717 #435208
    Then I softly see field "Total Previous SFY Schools Payment" as "$3,500.00"
    Then I softly see field "Operation" as "$300.00"
    Then I softly see field "Maintenance" as "$500.00"
    Then I softly see field "Repair" as "$700.00"
    Then I softly see field "Construction" as "$900.00"
    Then I softly see field "Unexpended" as "$1,100.00"
    Then I softly see field "Total Previous SFY Schools Expenditures" as "$3,500.00"
    #435786
    Then I softly see field "Total Miles" as "400.00"
    When I click on "Edit" in the page details
    Then I see field "Total Miles" is not editable
    #435698 #435707 #435712 #435716 #435717
    And I clear the value from field "Total_Previous_SFY_Schools_Payment__c"
    And I clear the value from field "Operation_PS__c"
    And I clear the value from field "Maintenance_PS__c"
    And I clear the value from field "Repair_PS__c"
    And I clear the value from field "Construction_PS__c"
    And I clear the value from field "Unexpended_PS__c"
    And I clear the value from field "UnexpendedNarrative_PS__c"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    #435698 #435707 #435712 #435716 #435717
    Then I softly see the following messages in the page details :
      | Operation is required to save.                          |
      | Maintenance is required to save.                        |
      | Repair is required to save.                             |
      | Construction is required to save.                       |
      | Unexpended is required to save.                         |
      | Total Previous SFY Schools Payment is required to save. |
    And I refresh the page
    #435208
    And I clear the value from field "UnexpendedNarrative_PS__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Unexpended Narrative under public school column is required to save if Unexpended is greater than Zero. |
    And I refresh the page
    #435721
    And I clear the value from field "UnexpendedNarrative_PS__c"
    And I enter value "Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Test Data Automation Test Test Data Automation Test Test Data Automation Test Automation Automa12" into field "UnexpendedNarrative_PS__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Unexpended Narrative" as "Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Test Data Automation Test Test Data Automation Test Test Data Automation Test Automation Automa12"
    #435748 #435759 #435764 #435765 #435769 #435770
    #Fail due to same  label name  need to retest
    Then I softly see field "Total Previous SFY Road Payment" as "$4,000.00"
    Then I softly see field "Operation" as "$400.00"
    Then I softly see field "Maintenance" as "$600.00"
    Then I softly see field "Repair" as "$800.00"
    Then I softly see field "Construction" as "$1,000.00"
    Then I softly see field "Unexpended" as "$1,200.00"
    Then I softly see field "Total Previous SFY Road Expenditures" as "$4,000.00"
     #435781 #435782 #435793
    Then I softly see field "Miles of City Roads approved for Previous SFY program" as "150.00"
    Then I softly see field "Miles of new city roads maintained" as "250.00"
    Then I softly see field "Miles of State roads maintained by the city" as "350.00"
    When I click on "Edit" in the page details
    #435748 #435759 #435764 #435765 #435769 #435770
    And I clear the value from field "Total_Previous_SFY_Road_Payment__c"
    And I clear the value from field "Operation_PR__c"
    And I clear the value from field "Maintenance_PR__c"
    And I clear the value from field "Repair_PR__c"
    And I clear the value from field "Construction_PR__c"
    And I clear the value from field "Unexpended_PR__c"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    #435748 #435759 #435764 #435765 #435769 #435770
    Then I softly see the following messages in the page details :
      | Operation is required to save.                       |
      | Maintenance is required to save.                     |
      | Repair is required to save.                          |
      | Construction is required to save.                    |
      | Unexpended is required to save.                      |
      | Total Previous SFY Road Payment is required to save. |
    And I refresh the page
    #435774
    And I clear the value from field "Unexpended_Narrative_PR__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Unexpended Narrative under Public Roads column is required to save if Unexpended is greater than Zero. |
    And I refresh the page
    #435774
    And I clear the value from field "Unexpended_Narrative_PR__c"
    And I enter value "Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Test Data Automation Test Test Data Automation Test Test Data Automation Test Automation Automa12" into field "Unexpended_Narrative_PR__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Unexpended Narrative" as "Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Test Data Automation Test Test Data Automation Test Test Data Automation Test Automation Automa12"
    #435800 #435781 #435805 #435782 #435793
    When I click on "Edit" in the page details
    Then I softly see field "Miles of City Roads approved for Previous SFY program" inside page block
    Then I softly see field "Miles of new city roads maintained" inside page block
    Then I softly see field "Total Miles" inside page block
    Then I softly see field "Does the city have a road maintenance agreement with DOT to maintain State roads?" inside page block
    Then I softly see field "Miles of State roads maintained by the city" inside page block
    And I enter value "Automation@#!$%" into field "MilesofCityRoadsApprovedForSFY__c"
    And I enter value "Automation@#!$%" into field "MilesOfNewCityRoadsMaintained__c"
    When I click on "Save" in the page details
    Then I softly see field "Miles of City Roads approved for Previous SFY program" as "0.00"
    Then I softly see field "Miles of new city roads maintained" as "0.00"
    When I click on "Edit" in the page details
    #435789
    Then I softly see field "Does the city have a road maintenance agreement with DOT to maintain State roads?" inside page block
    Then I see only the following ordered options in dropdown field "RoadMaintenanceAgreement__c" :
      | --None-- | Yes | No |
    #435797
    And I enter value "No" into field "RoadMaintenanceAgreement__c"
    And I clear the value from field "MilesOfCityAprrovedforSfY__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Road Maintenance Report: If Does the city have a road maintenance agreement with DOT to maintain State roads? is yes then Miles of State roads maintained by the city should have value updated above 0 (zero). |
    #435793
    When I click on "Edit" in the page details
    And I enter value "Yes" into field "RoadMaintenanceAgreement__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Road Maintenance Report: If Does the city have a road maintenance agreement with DOT to maintain State roads? is yes then Miles of State roads maintained by the city should have value updated above 0 (zero). |
    #438906
    Then I softly see field "Current SFY Is" inside page block
    Then I softly see field "Previous SFY" inside page block
    Then I softly see field "2 SFY Prior" inside page block
    #438929 #438930 #438931
    Then I softly see field "Current SFY Is" as "2025"
    Then I softly see field "Previous SFY" as "2024"
    Then I softly see field "2 SFY Prior" as "2023"
    #435813
    And I clear the value from field "Acknowledgement__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Acknowledgement is required to save. |
    And I enter value "Checked" into field "Acknowledgement__c"
    And I enter value "220.00" into field "MilesOfCityAprrovedforSfY__c"
    When I click on "Save" in the page details
    #435814 #435817
    Then I softly see field "Acknowledged Date:" inside page block
    Then I softly see field "Acknowledged By:" inside page block
    And I save the field labeled "Acknowledged Date:" as "AKDate"
    And I save the field labeled "Acknowledged By:" as "AKBy"
    Then I softly see field "Acknowledged Date:" as "{SavedValue:AKDate}"
    Then I softly see field "Acknowledged By:" as "{SavedValue:AKBy}"
    #435810
    Then I softly see the field "CERTIFICATION and ASSURANCES:" as "The applicant certifies that to the best of my knowledge and belief, the information in this application is true and correct and the applicant agrees to comply with the laws and regulations, which are used to administer National Forest Receipts Program funds, and must provide documentation to the department upon request. The applicant also certifies that the municipality has not been suspended or debarred from participating in federal programs." on forms

  @Sprint-8-US-433858 @435823 @435827 @435830 @435832 @435834 @435836 @435837 @435838 @435839 @435840 @435841 @435842 @435843 @435844 @435845 @435846 @435848 @435870 @435872 @436926 @436928 @438055 @438096 @438197 @439162 @439164 @439166 @439174 @440282 @435847 @VaishaliD
  Scenario: To verify NFR - 2nd Class Municipality
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SR_CITY2"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY2" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Forms and Files" sub tab
    And I wait for "3" seconds
    #438055
    Then I softly can see row level action button "Edit" against "NFR - 2nd Class Municipality" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I softly can see row level action button "View" against "NFR - 2nd Class Municipality" in flex table with id "---applicationReview:-:allFormsTableId---"
    And I click on "View" icon for "NFR - 2nd Class Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    #435823
    Then I softly see field "Form Name" as "NFR - 2nd Class Municipality"
    #436926
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Back" in page detail
    Then I softly can see top right button "Download Excel" in page detail
    Then I softly can see top right button "Upload Excel" in page detail
    #435830 #435832 #435834 #435836 #435837 #435838
    Then I softly see field "Total Previous SFY Road Payment" as ""
    Then I softly see field "Operation" as ""
    Then I softly see field "Maintenance" as ""
    Then I softly see field "Repair" as ""
    Then I softly see field "Construction" as ""
    Then I softly see field "Unexpended" as ""
    Then I softly see field "Unexpended Narrative" as ""
    Then I softly see field "Acknowledged Date:" as ""
    Then I softly see field "Acknowledged By:" as ""
    Then I softly see field "Does the city have a road maintenance agreement with DOT to maintain State roads?" as "No"
    When I click on "Edit" in the page details
    #436928
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    #435827
    And I navigate to "Details" sub tab
    Then I see "Fiscal Year" page block displayed
    Then I see "Accounting Report for Previous SFY Roads Payment" page block displayed
    Then I see "Road Maintenance Report" page block displayed
    Then I see "Certification and Assurances" page block displayed
    When I enter "NFRCity2-Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    When I click on "Save" in the page details
    #435828 #435830 #435832 #435834 #435836 #435837
    Then I softly see field "Total Previous SFY Road Payment" as "$4,000.00"
    Then I softly see field "Operation" as "$400.00"
    Then I softly see field "Maintenance" as "$600.00"
    Then I softly see field "Repair" as "$800.00"
    Then I softly see field "Construction" as "$1,000.00"
    Then I softly see field "Unexpended" as "$1,200.00"
    Then I softly see field "Total Previous SFY Road Expenditures" as "$4,000.00"
    #435841 #435839 #435840
    Then I softly see field "Total Miles" as "400.00"
    Then I softly see field "Miles of City Roads approved for Previous SFY program" as "150.00"
    Then I softly see field "Miles of new city roads maintained" as "250.00"
    Then I softly see field "Miles of State roads maintained by the city" as "350.00"
    When I click on "Edit" in the page details
    Then I see field "Total Miles" is not editable
    And I clear the value from field "Total_Previous_SFY_Road_Payment__c"
    And I clear the value from field "Operation_PR__c"
    And I clear the value from field "Maintenance_PR__c"
    And I clear the value from field "Repair_PR__c"
    And I clear the value from field "Construction_PR__c"
    And I clear the value from field "Unexpended_PR__c"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    #435830 #435832 #435834 #435836 #435837
    Then I softly see the following messages in the page details :
      | Operation is required to save.                       |
      | Maintenance is required to save.                     |
      | Repair is required to save.                          |
      | Construction is required to save.                    |
      | Unexpended is required to save.                      |
      | Total Previous SFY Road Payment is required to save. |
    And I refresh the page
    #435838 #438096
    And I clear the value from field "Unexpended_Narrative_PR__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Unexpended Narrative under Public Roads column is required to save if Unexpended is greater than Zero. |
    And I enter value "Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Test Data Automation Test Test Data Automation Test Test Data Automation Test Automation Automa12" into field "Unexpended_Narrative_PR__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Unexpended Narrative" as "Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Test Data Automation Test Test Data Automation Test Test Data Automation Test Automation Automa12"
    #435839 #435840 #435845 #435846
    When I click on "Edit" in the page details
    Then I softly see field "Miles of City Roads approved for Previous SFY program" inside page block
    Then I softly see field "Miles of new city roads maintained" inside page block
    Then I softly see field "Total Miles" inside page block
    Then I softly see field "Does the city have a road maintenance agreement with DOT to maintain State roads?" inside page block
    Then I softly see field "Miles of State roads maintained by the city" inside page block
    And I enter value "Automation@#!$%" into field "MilesofCityRoadsApprovedForSFY__c"
    And I enter value "Automation@#!$%" into field "MilesOfNewCityRoadsMaintained__c"
    When I click on "Save" in the page details
    Then I softly see field "Miles of City Roads approved for Previous SFY program" as "0.00"
    Then I softly see field "Miles of new city roads maintained" as "0.00"
    When I click on "Edit" in the page details
    #435842
    Then I softly see field "Does the city have a road maintenance agreement with DOT to maintain State roads?" inside page block
    Then I see only the following ordered options in dropdown field "RoadMaintenanceAgreement__c" :
      | --None-- | Yes | No |
    #435844
    And I enter value "No" into field "RoadMaintenanceAgreement__c"
    And I clear the value from field "MilesOfCityAprrovedforSfY__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Road Maintenance Report: If Does the city have a road maintenance agreement with DOT to maintain State roads? is yes then Miles of State roads maintained by the city should have value updated above 0 (zero). |
    #435843
    When I click on "Edit" in the page details
    And I enter value "Yes" into field "RoadMaintenanceAgreement__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Road Maintenance Report: If Does the city have a road maintenance agreement with DOT to maintain State roads? is yes then Miles of State roads maintained by the city should have value updated above 0 (zero). |
    #435848
    Then I softly see fields "Acknowledgement__c" is visible
    #439162
    Then I softly see field "Current SFY Is" inside page block
    Then I softly see field "Previous SFY" inside page block
    Then I softly see field "2 SFY Prior" inside page block
    #439164 #439166 #439174
    Then I softly see field "Current SFY Is" as "2025"
    Then I softly see field "Previous SFY" as "2024"
    Then I softly see field "2 SFY Prior" as "2023"
    #438197
    And I clear the value from field "Acknowledgement__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Acknowledgement is required to save. |
    And I enter value "Checked" into field "Acknowledgement__c"
    And I enter value "-600.00" into field "MilesOfCityAprrovedforSfY__c"
    When I click on "Save" in the page details
    #440282
    Then I softly cannot see the following messages in the page details :
      | Unexpended Narrative under Public Roads column is required to save if Unexpended is greater than Zero. |
    #435870 #435872
    Then I softly see field "Acknowledged Date:" inside page block
    Then I softly see field "Acknowledged By:" inside page block
    And I save the field labeled "Acknowledged Date:" as "AKDate"
    And I save the field labeled "Acknowledged By:" as "AKBy"
    Then I softly see field "Acknowledged Date:" as "{SavedValue:AKDate}"
    Then I softly see field "Acknowledged By:" as "{SavedValue:AKBy}"
    #435847
    Then I softly see the field "CERTIFICATION and ASSURANCES:" as "The applicant certifies that to the best of my knowledge and belief, the information in this application is true and correct and the applicant agrees to comply with the laws and regulations, which are used to administer National Forest Receipts Program funds, and must provide documentation to the department upon request. The applicant also certifies that the municipality has not been suspended or debarred from participating in federal programs." on forms

  @Sprint-8-US-433859 @434972 @434975 @435027 @437303 @437312 @434977 @434978 @434979 @434985 @434981 @434988 @435016 @435019 @435022 @435017 @434990 @434991 @434992 @435009 @438817 @438820 @435008 @435012 @VaishaliD
  Scenario: To verify Application Forms: NFR - Borough Municipality
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SR_BOROUGH"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "BOROUGH" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Forms and Files" sub tab
    And I wait for "3" seconds
    Then I softly can see row level action button "Edit" against "NFR - Borough Municipality" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I softly can see row level action button "View" against "NFR - Borough Municipality" in flex table with id "---applicationReview:-:allFormsTableId---"
    And I click on "View" icon for "NFR - Borough Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    #434972
    Then I softly see field "Form Name" as "NFR - Borough Municipality"
    #437303
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Back" in page detail
    Then I softly can see top right button "Download Excel" in page detail
    Then I softly can see top right button "Upload Excel" in page detail
    #434977
    Then I softly see field "Total Previous SFY Schools Payment" as ""
    Then I softly see field "Operation" as ""
    Then I softly see field "Maintenance" as ""
    Then I softly see field "Repair" as ""
    Then I softly see field "Construction" as ""
    Then I softly see field "Unexpended" as ""
    Then I softly see field "Unexpended Narrative" as ""
    Then I softly see field "Acknowledged Date:" as ""
    Then I softly see field "Acknowledged By:" as ""
    #Public Roads
    #Fail due to same  label name  need to retest
    #434977 #434982
    Then I softly see field "Total Previous SFY Road Payment" as ""
    Then I softly see field "Operation" as ""
    Then I softly see field "Maintenance" as ""
    Then I softly see field "Repair" as ""
    Then I softly see field "Construction" as ""
    Then I softly see field "Unexpended" as ""
    Then I softly see field "Unexpended Narrative" as ""
    Then I softly see field "Does the city have a road maintenance agreement with DOT to maintain State roads?" as "No"
    When I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I enter "NFRBorough Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Total Previous SFY Schools Payment" as "$3,500.00"
    Then I softly see field "Operation" as "$300.00"
    Then I softly see field "Maintenance" as "$500.00"
    Then I softly see field "Repair" as "$700.00"
    Then I softly see field "Construction" as "$900.00"
    Then I softly see field "Unexpended" as "$1,100.00"
    Then I softly see field "Total Previous SFY Schools Expenditures" as "$3,500.00"
    #434990
    Then I softly see field "Total Miles" as "400.00"
    When I click on "Edit" in the page details
    Then I see field "Total Miles" is not editable
    #434975 #435027 #434988 #435013
    And I navigate to "Details" sub tab
    Then I see "Fiscal Year" page block displayed
    Then I see "Accounting Report for Previous SFY Schools/Roads Payment" page block displayed
    Then I see "Road Maintenance Report" page block displayed
    Then I see "Certification and Assurances" page block displayed
    #437312
    And I clear the value from field "Total_Previous_SFY_Schools_Payment__c"
    And I clear the value from field "Operation_PS__c"
    And I clear the value from field "Maintenance_PS__c"
    And I clear the value from field "Repair_PS__c"
    And I clear the value from field "Construction_PS__c"
    And I clear the value from field "Unexpended_PS__c"
    And I clear the value from field "UnexpendedNarrative_PS__c"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    #434978
    Then I softly see the following messages in the page details :
      | Operation is required to save.                          |
      | Maintenance is required to save.                        |
      | Repair is required to save.                             |
      | Construction is required to save.                       |
      | Unexpended is required to save.                         |
      | Total Previous SFY Schools Payment is required to save. |
    And I refresh the page
    And I clear the value from field "Total_Previous_SFY_Road_Payment__c"
    And I clear the value from field "Operation_PR__c"
    And I clear the value from field "Maintenance_PR__c"
    And I clear the value from field "Repair_PR__c"
    And I clear the value from field "Construction_PR__c"
    And I clear the value from field "Unexpended_PR__c"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    #434978
    Then I softly see the following messages in the page details :
      | Operation is required to save.                       |
      | Maintenance is required to save.                     |
      | Repair is required to save.                          |
      | Construction is required to save.                    |
      | Unexpended is required to save.                      |
      | Total Previous SFY Road Payment is required to save. |
    And I refresh the page
    #434979
    Then I see field "Total Previous SFY Schools Expenditures" is not editable
    When I click on "Save" in the page details
    Then I softly see field "Total Previous SFY Schools Expenditures" as "$3,500.00"
    #434981
    When I click on "Edit" in the page details
    And I clear the value from field "UnexpendedNarrative_PS__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Unexpended Narrative under public school column is required to save if Unexpended is greater than Zero. |
    And I enter value "Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Test Data Automation Test Test Data Automation Test Test Data Automation Test Automation Automa12" into field "UnexpendedNarrative_PS__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Unexpended Narrative" as "Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Test Data Automation Test Test Data Automation Test Test Data Automation Test Automation Automa12"
    #434985
    When I click on "Edit" in the page details
    And I clear the value from field "Unexpended_Narrative_PR__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Unexpended Narrative under Public Roads column is required to save if Unexpended is greater than Zero. |
    And I enter value "Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Test Data Automation Test Test Data Automation Test Test Data Automation Test Automation Automa12" into field "Unexpended_Narrative_PR__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Unexpended Narrative" as "Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Data Automation Test Test Data Automation Test Test Data Automation Test Test Data Automation Test Automation Automa12"
     #434991 #434992 #435009 #438817 #438820
    Then I softly see field "Miles of City Roads approved for Previous SFY program" inside page block
    Then I softly see field "Miles of new city roads maintained" inside page block
    Then I softly see field "Total Miles" inside page block
    Then I softly see field "Miles of State roads maintained by the city" inside page block
    When I click on "Edit" in the page details
    And I enter value "Automation@#!$%" into field "MilesofCityRoadsApprovedForSFY__c"
    And I enter value "Automation@#!$%" into field "MilesOfNewCityRoadsMaintained__c"
    When I click on "Save" in the page details
    Then I softly see field "Miles of City Roads approved for Previous SFY program" as "0.00"
    Then I softly see field "Miles of new city roads maintained" as "0.00"
    When I click on "Edit" in the page details
    #435008
    Then I softly see field "Does the city have a road maintenance agreement with DOT to maintain State roads?" inside page block
    Then I see only the following ordered options in dropdown field "RoadMaintenanceAgreement__c" :
      | --None-- | Yes | No |
    And I enter value "No" into field "RoadMaintenanceAgreement__c"
    And I clear the value from field "MilesOfCityAprrovedforSfY__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Road Maintenance Report: If Does the city have a road maintenance agreement with DOT to maintain State roads? is yes then Miles of State roads maintained by the city should have value updated above 0 (zero). |
    #435012
    When I click on "Edit" in the page details
    And I enter value "Yes" into field "RoadMaintenanceAgreement__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Road Maintenance Report: If Does the city have a road maintenance agreement with DOT to maintain State roads? is yes then Miles of State roads maintained by the city should have value updated above 0 (zero). |
    #435017
    And I enter value "200" into field "MilesOfCityAprrovedforSfY__c"
    And I clear the value from field "Acknowledgement__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Acknowledgement is required to save. |
    #435019 #435022
    Then I softly see field "Acknowledged Date:" inside page block
    Then I softly see field "Acknowledged By:" inside page block
    And I save the field labeled "Acknowledged Date:" as "AKDate"
    And I save the field labeled "Acknowledged By:" as "AKBy"
    Then I softly see field "Acknowledged Date:" as "{SavedValue:AKDate}"
    Then I softly see field "Acknowledged By:" as "{SavedValue:AKBy}"
    #435016
    Then I softly see the field "CERTIFICATION and ASSURANCES:" as "The applicant certifies that to the best of my knowledge and belief, the information in this application is true and correct and the applicant agrees to comply with the laws and regulations, which are used to administer National Forest Receipts Program funds, and must provide documentation to the department upon request.  The applicant also certifies that the municipality has not been suspended or debarred from participating in federal programs." on forms
