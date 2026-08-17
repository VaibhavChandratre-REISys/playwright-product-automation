@AlaskaApplication @AlaskaRegression @AppUserGA
Feature: Validate all scenarios in the Application tab

  @Sprint-6-US-394161 @407386 @407389 @407391 @407392 @407393 @407397 @407395 @Sprint-19-US-475605 @477531 @477533 @477534 @477535 @477539 @477540 @477536 @477537 @477538 @477541 @VaishaliD
  Scenario: Verify that users in Grant Administrator queue are able to see 'New' button on Application module landing page
    | Verify that GA user see modal window is opened with "Funding Opportunity" and "Subrecipient Organization" fields when clicked on 'New' button on Application module landing page
    | Verify that GA user see "Funding Opportunity" lookup field shows list of all Active(Published) announcements with Title and Announcement ID
    | Verify that GA user see "Applicant Organization" lookup field shows list of all Active Subrecipient Organizations
    | Verify that GA user see 'Save and Close Modal' button on modal window and after filling data in fields when clicked Application is Created
    | Verify that GA user see 'Announcement ID' field on created application is updated with announcement selected while creating Application
    | As a GA, verify that proposal tab is hidden on application when program type is shared revenue
    | As a GA, verify that validation should not come while save the application for 'Approach/Methodology' section on proposal tab for Shared Revenue program
    | As a GA, verify that validation should not come while save the application for 'Capacity' section on proposal tab for Shared Revenue program
    | As a GA, verify that validation should not come while save the application for 'Qualifications' section on proposal tab for Shared Revenue program
    | As a GA, verify that 'Project Abstract' field on application is optional for Shared Revenue programs
    | As a GA, verify that validation should not come while save the application for 'Project Abstract' section on overview tab if this field is blank for Shared Revenue program
    | As a GA, verify that validation should not come while submitting the application for 'Approach/Methodology' section on proposal tab for Shared Revenue program
    | As a GA, verify that validation should not come while submitting the application for 'Capacity' section on proposal tab for Shared Revenue program
    | As a GA, verify that validation should not come while submitting the application for 'Qualifications' section on proposal tab for Shared Revenue program
    | As a GA, verify that validation should not come while submitting the application for 'Project Abstract' section on overview tab if this field is blank for Shared Revenue program
    Given I published "Directed" type announcement having name "Automation Runtime Shared Revenue Announcement Application" and properties "PROGRAM_TYPE_NFR_SR_CITY2"
    Given I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I wait for "4" seconds
    #407386
    Then I softly can see top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I click on top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I wait for "3" seconds
    #407389
    Then I softly see field on modal "Application Title" inside page block
    Then I softly see field on modal "Applicant Organization" inside page block
    Then I softly see field on modal "Funding Opportunity" inside page block
    #407391 #407392
    Then I softly see "Announcement__c" lookup field is displayed
    And I click on lookup field for "Announcement__c"
    Then I softly see "Announcement Name" in table header on lookup Modal
    Then I softly see "Announcement ID" in table header on lookup Modal
    Then I softly see "ExternalOrganization__c" lookup field is displayed
    And I click on lookup field for "ExternalOrganization__c"
    Then I softly see "Account Name" in table header on lookup Modal
    Then I softly see "EIN" in table header on lookup Modal
    And I enter value "Automation Direct Application" into field "Title__c"
    And I enter value "578345238" into field "ExternalOrganization__c"
    And I enter value "{SavedValue:Automation Runtime Shared Revenue Announcement Application}" into field "Announcement__c"
    And I wait for "2" seconds
    #407393
    Then I softly see "Save and Continue" button is displayed On Modal
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    And I enter value "Automation Test Data" into field "ProjectAbstract__c"
    #407397
    Then I softly see field " Announcement Title " as "{SavedValue:Automation Runtime Shared Revenue Announcement Application}"
    #477531
    Then I softly cannot see "Proposal" sub tab at view detail page
    #477539
    And I clear the value from field "ProjectAbstract__c"
   #477531 #477533 #477534 @#77535 #477540
    And I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details :
      | Proposal Tab - Provide the Approach/Methodology before submitting this Application. |
      | Proposal Tab - Provide the Capacity before submitting this Application.             |
      | Proposal Tab - Provide the Qualifications before submitting this Application.       |
      | Overview Tab - Provide the Project Abstract before submitting this Application.     |
   #477536 #477537 #477538 #477541
    And I click on "Submit Application" in the page details
    Then I softly cannot see the following messages in the page details :
      | Proposal Tab - Provide the Approach/Methodology before submitting this Application. |
      | Proposal Tab - Provide the Capacity before submitting this Application.             |
      | Proposal Tab - Provide the Qualifications before submitting this Application.       |
      | Overview Tab - Provide the Project Abstract before submitting this Application.     |
    #407395
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationsTableId---"

  @Sprint-6-US-394708 @408565 @408561 @408558 @408572 @408571 @408562 @408557 @408560 @408559 @VaishaliD
  Scenario: Verify that GA user see below fields are Editable in Overview tab on Application edit layout created by GA user
    | Verify that GA user see 'Associate' button at Contacts table on Application edit layout created by GA user
    | Verify that GA user see 'View', 'Edit' and 'Remove' icons in Actions column of Contacts table on Application view layout created by GA user
    | Verify that GA user see below fields are Editable in Budget tab on Application edit layout created by GA user
    | Verify that GA user see 'Edit' icon for each budget category in Actions column of Budget Period table on Application view layout created by GA user
    | Verify that GA user see below fields are Editable in Proposal tab on Application edit layout created by GA user
    | Verify that GA user see "Edit", "Download Excel", "Upload Excel" and "Submit Application" buttons on Application view layout created by GA user
    | Verify that GA user see 'Add Files' button for Application Files table on Application view layout created by GA user
    | Verify that GA user see 'View' and 'Edit' icons in Actions column of All Forms table on Application view layout created by GA user
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NPRA"
    Given I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I wait for "4" seconds
    And I click on top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I wait for "3" seconds
    And I enter value "Automation Direct Application" into field "Title__c"
    And I enter value "987664320" into field "ExternalOrganization__c"
    And I enter value "{SavedValue:Automation Runtime Announcement Application Intake}" into field "Announcement__c"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    When I enter values into fields
      | Value                         | Field                     |
      | RN 34, Siege Social           | Addressline1__c           |
      | Address line2                 | Addressline2__c           |
      | Anchorage                     | City__c                   |
      | Nome Census Area              | County__c                 |
      | 777                           | CongressionalDistrict1__c |
      | 12346                         | Zip4__c                   |
      | USA                           | Country__c                |
      | 4563                          | ZipCode4Extension__c      |
      | AK                            | State__c                  |
      | Automation New Application    | Title__c                  |
      | Automation Data                | ProjectAbstract__c        |
      | Checked                       | Acknowledgment4__c        |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #408557
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit Application" in page detail
    Then I softly can see top right button "Download Excel" in page detail
    Then I softly can see top right button "Upload Excel" in page detail
    #408565
    Then I softly see field "Address line 1" as "RN 34, Siege Social"
    Then I softly see field "Address line 2" as "Address line2"
    Then I softly see field "City" as "Anchorage"
    Then I softly see field "County" as "Nome Census Area"
    Then I softly see field "Congressional district" as "777"
    Then I softly see field "Zip Code" as "12346"
    Then I softly see field "Country" as "USA"
    Then I softly see field "4-Digit Zip Code Extension" as "4563"
    Then I softly see field "State" as "AK"
    Then I softly see field "Application Title" as "Automation New Application"
    Then I softly see value "Project Abstract" for the field "Automation Data"
    Then I softly see field "Acknowledgement" as "Checked"
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click "Add" after selection of "Automation City1 SPI" by showing entries "All" in flex table with id "---applicationIntake:-:selectAssociateAppContacts---"
    When I close "Associate Contacts" modal by clicking the top right x button
    And I wait for "3" seconds
    #408561
    Then I softly can see top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    #408558
    Then I can see row level action button "Edit" against "Automation City1 SPI" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I can see row level action button "View" against "Automation City1 SPI" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I can see row level action button "Remove" against "Automation City1 SPI" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact | Project Role         |
      | Automation City1 SPI       | Checked        | Authorized Signatory |
    And I wait for "2" seconds
    Then I softly see "check" symbol against the value "Automation City1 SPI" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    #408572
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    When I expand nested table containing column value "BP01"
    #408562
    Then I can see row level action button "Edit" against "Construction" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    Then I softly see value "$1,000.00" for title "Budget" inside table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see value "$100.00" for title "Cash Match" inside table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see value "$100.00" for title "Non-Cash Match" inside table "---applicationIntake:-:budgetPeriodTableId---"
    #408571
    And I click on "Edit" in the page details
    When I navigate to "Proposal" sub tab
    When I enter values into fields
      | Value                         | Field                     |
      | Automation Test Description   | ApproachMethodology__c    |
      | Automation Test Description   | Capacity__c               |
      | Automation Test Description   | Qualifications__c         |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see value "Approach/Methodology" for the field "Automation Test Description"
    Then I softly see value "Capacity" for the field "Automation Test Description"
    Then I softly see value "Qualifications" for the field "Automation Test Description"
    And I wait for "2" seconds
    And I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    #408560
    Then I softly can see top right button "Add Files" in flex table with id "---applicationIntake:-:nPRAApplicationFormFiles---"
    #408559
    Then I can see row level action button "Edit" against "NPRA Application Form" in flex table with id "---applicationIntake:-:allFormsTableId---"
    Then I can see row level action button "View" against "NPRA Application Form" in flex table with id "---applicationIntake:-:allFormsTableId---"