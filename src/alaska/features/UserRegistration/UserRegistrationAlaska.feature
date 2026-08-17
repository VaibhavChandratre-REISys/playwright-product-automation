@AlaskaRegression @OrganizationRegistrationPageAlaska @AlaskaUserRegistration
Feature: User/Organization Registration

  @Sprint-6-US-393115 @395836 @395840
  Scenario:Verify that External Guest user do not see Payment Address section and its related field on Create External Registration page
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I navigate to "Organization" sub tab
    Then I softly see fields "EINText__c" is visible
    Then I softly see fields "UEISam__c" is visible
    Then I softly see fields "SupplierID__c" is visible
    Then I softly see fields "AL_FCCRegistrationNumber__c" is visible
    Then I softly see fields "AL_UniversalServiceAdministrativeCompany__c" is visible
    Then I softly do not see fields "PaymentAddressLine1__c" is visible
    Then I softly do not see fields "PaymentAddressCity__c" is visible
    Then I softly do not see fields "PaymentAddressState__c" is visible
    Then I softly do not see fields "PaymentAddressZipCode__c" is visible
    #395840
    And I generate the random SSN and save as "EIN"
    When I enter value as "{SavedValue:EIN}" into "Employer Identification Number (EIN)" on old form
    When I enter value as "NHZLK7BJM4H3" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "8765" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationOrgProfileDetails" values from "UserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Primary Email" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on "Submit" in the page details

  @Sprint-6-US-417260 @421640 @421647 @421660 @421658 @421667
  Scenario:Organization Registration: Add fields "Business License Number" and "Corporate Entity Number"
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I navigate to "Organization" sub tab
    And I generate the random SSN and save as "EIN"
    When I enter value as "{SavedValue:EIN}" into "Employer Identification Number (EIN)" on old form
    When I enter value as "NHZLK7BJM4H3" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "8755" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I wait for "3" seconds
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationOrgProfileDetails" values from "UserRegistration_Field_Values.xlsx"
    #421640
    Then I softly see fields "BusinessLicenseNumber__c" is visible
    #421647
    Then I softly see fields "CorporateEntityNumber__c" is visible
    #421667
    When I enter value as "@#123Corp" into "Corporate Entity Number" on old form
    #421660
    When I enter value as "@utoma#tion" into "Business License Number" on old form
    When I click on "Save" in the page details
    #421658
    When I clear the value from field "BusinessLicenseNumber__c"
    When I enter value as "57463218" into "Business License Number" on old form
    When I click on "Save" in the page details

  @Sprint-6-US-411967 @422290 @422297 @422296 @422292 @422294 @422295 @471323
  Scenario:Organization Registration: Add a field "Community Name"
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I navigate to "Organization" sub tab
    And I generate the random SSN and save as "EIN"
    When I enter value as "{SavedValue:EIN}" into "Employer Identification Number (EIN)" on old form
    When I enter value as "NHZLK7BJM4H3" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "8755" into "Vendor ID" on old form
    #471323
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationOrgProfileDetails" values from "UserRegistration_Field_Values.xlsx"
    #422297
    Then I softly see fields "DUNSExpirationDate__c" is visible
    #422290 #422296
    Then I softly see "Community Population" page block displayed
    When I click on top right button "Associate" in flex table with id "---user:-:communityPopulationExternal---"
    #422292 #422294
    When I click "Associate" after selection of "Birchwood" by showing entries "All" in flex table with id "---user:-:communityPopulationExternalAdd---"
    And I wait for "2" seconds
    When I close "Community Population" modal by clicking the top right x button
    And I wait for "1" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #422295
    When I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Pending Grantee Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "AL SALAM MESSAGE FOR COMMUNITY DEVELOPMENT" in "---grantor_tableId:-:SubrecipientOrganization---" panel
    And I click on "Start" icon for "AL SALAM MESSAGE FOR COMMUNITY DEVELOPMENT" inside flex table with id "---grantor_tableId:-:SubrecipientOrganization---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    Then I softly see "Community Population" page block displayed
    Then I softly see value "Birchwood" for title "Community Name" inside table "{user:communityPopulationExternal}"

  @Sprint-6-US-433837 @435343 @435348 @435347 @435620 @449765
  Scenario:Organization Registration: Require EIN during registration
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I navigate to "Organization" sub tab
    #435343
    Then I softly see fields "EINText__c" is visible
    #435348 #435347
    When I enter value as "533910" into "Employer Identification Number (EIN)" on old form
    When I enter value as "NHZLK7BJM4H3" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "8755" into "Vendor ID" on old form
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Provide Step 1 of 3 Employer Identification Number (EIN). |
    When I clear the value from field "EINText__c"
    When I enter value as "533910659658364" into "Employer Identification Number (EIN)" on old form
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Provide Step 1 of 3 Employer Identification Number (EIN). |
    #435620
    When I clear the value from field "EINText__c"
    When I enter value as "Automation" into "Employer Identification Number (EIN)" on old form
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Provide Step 1 of 3 Employer Identification Number (EIN). |
    #449765
    When I clear the value from field "EINText__c"
    And I generate the random SSN and save as "EIN"
    When I enter value as "{SavedValue:EIN}" into "Employer Identification Number (EIN)" on old form
    Then I softly see fields "UEISam__c" is visible
    When I enter value as "8455" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Organization Profile" sub tab
    And I pause execution for "4" seconds

  @Sprint-6-US-449891 @471325 @471329 @471330 @471326 @471304 @471321 @471361 @471357 @471359 @471365 @471367 @438067 @421814 @438932
  Scenario:Organization Registration: Add FRN and USAC fields
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I navigate to "Organization" sub tab
    #438067 #438932
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | The EIN number you have entered is already registered within the system. |
    When I clear the value from field "EINText__c"
    And I generate the random SSN and save as "EIN"
    When I enter value as "{SavedValue:EIN}" into "Employer Identification Number (EIN)" on old form
    When I enter value as "NHZLK7BJM4H3" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "8755" into "Vendor ID" on old form
    #471304
    Then I softly see fields "AL_FCCRegistrationNumber__c" is visible
    #471325
    When I enter value as "8445" into "FCC Registration Number (FRN)" on old form
    When I clear the value from field "AL_FCCRegistrationNumber__c"
    #471329
    When I enter value as "8445675467" into "FCC Registration Number (FRN)" on old form
    #471321
    Then I softly see fields "AL_UniversalServiceAdministrativeCompany__c" is visible
    #471326
    When I enter value as "847876" into "Universal Service Administrative Company (USAC)" on old form
    #471330
    When I clear the value from field "AL_UniversalServiceAdministrativeCompany__c"
    When I enter value as "844567876" into "Universal Service Administrative Company (USAC)" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Organization Profile" sub tab
    #471361
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    Then I softly see "Description" page block displayed
    #471357
    Then I softly see fields "AL_FCCRegistrationNumber__c" is visible
    When I enter value as "8775457823" into "FCC Registration Number (FRN)" on old form
    #471359
    Then I softly see fields "AL_UniversalServiceAdministrativeCompany__c" is visible
    When I enter value as "877554321" into "Universal Service Administrative Company (USAC)" on old form
    And I navigate to "Home" tab
    #471365
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "COOP-CA DES AGRICULTEURS DE SYN" in "---grantee_tableId:-:activeAccount---" panel
    And I click on "View" icon for "COOP-CA DES AGRICULTEURS DE SYN" inside flex table with id "---grantee_tableId:-:activeAccount---" without waiting for record
    And I wait for "3" seconds
    Then I softly see fields "EINText__c" is visible
    #421814
    Then I softly see fields "UEISam__c" is visible
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    Then I softly see "Description" page block displayed
    Then I softly see fields "AL_FCCRegistrationNumber__c" is visible
    When I enter value as "8775457823" into "FCC Registration Number (FRN)" on old form
    Then I softly see fields "AL_UniversalServiceAdministrativeCompany__c" is visible
    When I enter value as "877554321" into "Universal Service Administrative Company (USAC)" on old form
    #471367
    And I navigate to "Home" tab
    When I navigate to "Pending Grantee Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "Regression Org" in "---grantor_tableId:-:SubrecipientOrganization---" panel
    And I click on "Start" icon for "Regression Org" inside flex table with id "---grantor_tableId:-:SubrecipientOrganization---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    Then I softly see "Organization Profile" page block displayed
    Then I softly see fields "AL_FCCRegistrationNumber__c" is visible
    Then I softly see fields "AL_UniversalServiceAdministrativeCompany__c" is visible

  @Sprint-6-US-417648 @421720 @421802 @421720 @421804 @421721 @421692 @421715 @421710 @421717
  Scenario: Organization: Add "Business License Number", "Corporate Entity Number" and related status fields
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "COOP-CA DES AGRICULTEURS DE SYN" in "---grantee_tableId:-:activeAccount---" panel
    And I click on "View" icon for "COOP-CA DES AGRICULTEURS DE SYN" inside flex table with id "---grantee_tableId:-:activeAccount---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    Then I softly see "Description" page block displayed
    #421802
    Then I see field "Business License Number" as "5577889911" on modal
    #421804
    Then I see field "Corporate Entity Number" as "876587654" on modal
    And I click on "Edit" in the page details
    Then I softly see "Description" page block displayed
    Then I softly see fields "BusinessLicenseNumber__c" is visible
    #421720
    When I clear the value from field "BusinessLicenseNumber__c"
    When I enter value as "5577889911" into "Business License Number" on old form
    Then I softly see "Description" page block displayed
    Then I softly see fields "CorporateEntityNumber__c" is visible
    #421721
    When I clear the value from field "CorporateEntityNumber__c"
    When I enter value as "876587654" into "Corporate Entity Number" on old form
    And I navigate to "Overview" sub tab
    #421692
    Then I softly see "Business License Number" page block displayed
    #421715
    Then I softly see "License Number" in flex table header "---grantee_tableId:-:businessLicenseNumber---"
    Then I softly see "Is Active?" in flex table header "---grantee_tableId:-:businessLicenseNumber---"
    Then I softly see "Business Name" in flex table header "---grantee_tableId:-:businessLicenseNumber---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:businessLicenseNumber---"
    And I navigate to "Overview" sub tab
    #421710
    Then I softly see "Corporate Entity Number" page block displayed
    #421717
    Then I softly see "Entity Name" in flex table header "---grantee_tableId:-:corporateEntityNumber---"
    Then I softly see "Entity Number" in flex table header "---grantee_tableId:-:corporateEntityNumber---"
    Then I softly see "Is Active?" in flex table header "---grantee_tableId:-:corporateEntityNumber---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:corporateEntityNumber---"
    Then I softly see "Type" in flex table header "---grantee_tableId:-:corporateEntityNumber---"

  @Sprint-6-US-411963 @447405 @421816 @447403 @447428 @421809 @421810 @447409 @421812 @421811 @421815 @422387 @422414 @421813 @422441 @421814
  Scenario: Organization Profile: Allow grantee to update Sam.Gov data
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY2" user
    When I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    Then I softly see "Description" page block displayed
    #447405
    Then I softly see fields "DUNSExpirationDate__c" is visible
    Then I softly see fields "EINText__c" is visible
    #421816
    Then I softly see fields "UEISam__c" is visible
    #447403
    And I click on "Update Sam.Gov Info" in the page details
    #447428 #421809
    Then I softly see fields "UEISam__c" is visible
    Then I softly see fields "EINText__c" is visible
    When I clear the value from field "UEISam__c"
    When I enter value as "RH9EAN346PM9" into "UEI" on old form
    #421810
    And I click modal button "Save and Close Modal"
    And I pause execution for "5" seconds
    #447409
    Then I see the following messages in the page details :
      | EIN and UEI must be verified by clicking Verify on the Sam.gov section below. |
    And I wait for "3" seconds
    Then I softly see fields "UEISam__c" is visible
    #421812
    Then I softly see "Sam.gov Verification" page block displayed
    And I click on top right button "Verify" in flex table with id "{grantee_tableId:organizationIntegrationDetail}"
    And I wait for "5" seconds
    Then I softly see "Sam.gov Verification" page block displayed
    #421811
    And I click on "Update Sam.Gov Info" in the page details
    And I click modal button "Close"
    #421815
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "GLOBAL LODGING DIS TICARET LIMITED SIRKETI" in "---grantee_tableId:-:activeAccount---" panel
    And I click on "View" icon for "GLOBAL LODGING DIS TICARET LIMITED SIRKETI" inside flex table with id "---grantee_tableId:-:activeAccount---" without waiting for record
    And I wait for "3" seconds
    Then I softly see fields "DUNSExpirationDate__c" is visible
    Then I softly see fields "EINText__c" is visible
    #421814
    Then I softly see fields "UEISam__c" is visible
    #422387
    And I click on "Update Sam.Gov Info" in the page details
    #422414
    When I clear the value from field "UEISam__c"
    When I enter value as "RH9EAN346PM9" into "UEI" on old form
    And I click modal button "Save and Close Modal"
    And I wait for "2" seconds
    #421813
    Then I see the following messages in the page details :
      | EIN and UEI must be verified by clicking Verify on the Sam.gov section below. |
    And I wait for "3" seconds
    Then I softly see fields "EINText__c" is visible
    Then I softly see fields "UEISam__c" is visible
    #422441
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "GLOBAL LODGING DIS TICARET LIMITED SIRKETI" in "---grantee_tableId:-:activeAccount---" panel
    And I click on "View" icon for "GLOBAL LODGING DIS TICARET LIMITED SIRKETI" inside flex table with id "---grantee_tableId:-:activeAccount---" without waiting for record
    And I wait for "3" seconds
    Then I softly do not see fields "Update Sam.Gov Info" is visible

  @Sprint-6-US-396463 @446748 @446762 @446750 @446756 @446765 @446752 @446769 @446772 @446768
  Scenario: Generic: Assign User to Grant Administrator Queue
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    #446748
    When I navigate to "Queue Add" content inside "Organization" subheader on left panel
    When I select radio button "Remove" in the page detail
    And I select dropdown value "Grant Administrator" for select queue
    And I perform quick search for "Automation City2 SPI" to select user
    And I click on "Next" in the page details
    And I navigate to "Home" tab
    When I navigate to "Queue Add" content inside "Organization" subheader on left panel
    #446762
    When I select radio button "Add" in the page detail
    #446750
    And I select dropdown value "Grant Administrator" for select queue
    And I perform quick search for "Automation City2 SPI" to select user
    #446756
    And I click on "Next" in the page details
    And I wait for "4" seconds
    And I see the text :
      | Successfully added user to the queue! |
    And I wait for "4" seconds
    And I refresh the page
    And I navigate to "Home" tab
    When I navigate to "Queue Add" content inside "Organization" subheader on left panel
    When I select radio button "Add" in the page detail
    And I select dropdown value "Grant Administrator" for select queue
    And I perform quick search for "Automation City1 SPI" to select user
    And I click on "Next" in the page details
    And I wait for "4" seconds
    #446765
    When I navigate to "Home" tab
    When I navigate to "Queue Add" content inside "Organization" subheader on left panel
    #446752
    When I select radio button "Remove" in the page detail
    And I select dropdown value "Grant Administrator" for select queue
    And I perform quick search for "Automation City1 SPI" to select user
    And I click on "Next" in the page details
    And I wait for "4" seconds
    And I see the text :
      | Successfully removed user from the queue! |
    And I wait for "3" seconds
    And I refresh the page
    When I navigate to "Home" tab
    When I navigate to "Queue Add" content inside "Organization" subheader on left panel
    When I select radio button "Add" in the page detail
    And I select dropdown value "Grant Administrator" for select queue
    And I perform quick search for "Automation PM" to select user
    And I click on "Next" in the page details
    And I wait for "4" seconds
    And I refresh the page
    #446769
    When I navigate to "Home" tab
    When I navigate to "Queue Add" content inside "Organization" subheader on left panel
    When I select radio button "Add" in the page detail
    And I select dropdown value "Grant Administrator" for select queue
    And I perform quick search for "Automation PM" to select user
    And I click on "Next" in the page details
    And I wait for "4" seconds
    And I see the text :
      | Selected User - Automation PM is already a member of Queue - Grant Administrator |
    And I wait for "3" seconds
    And I refresh the page
    #446772
    When I navigate to "Home" tab
    When I navigate to "Queue Add" content inside "Organization" subheader on left panel
    When I select radio button "Remove" in the page detail
    And I select dropdown value "Grant Administrator" for select queue
    And I perform quick search for "Automation Borough SPI" to select user
    And I wait for "2" seconds
    And I click on "Next" in the page details
    And I wait for "4" seconds
    And I see the text :
      | Selected User - Automation Borough SPI is NOT a member of Queue - Grant Administrator |
    And I wait for "3" seconds
    And I refresh the page
    #446768
    When I navigate to "Home" tab
    When I navigate to "Queue Add" content inside "Organization" subheader on left panel
    When I select radio button "Add" in the page detail
    And I select dropdown value "Grant Administrator" for select queue
    And I click on "Next" in the page details
    Then I see the following messages in the page details :
      | A value is required. |

  @Sprint-6-US-397424 @408548 @426877 @426866 @408551 @408549 @408552 @408553 @408555 @408554 @408556
  Scenario: Organization: Grantor - View and Edit Community Population Data
    Given I login to "As a Grantor" app as "EXE" user
    #----Automation EXE as GA User---------
    When I navigate to "Home" tab
    #408548
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "COOP-CA DES AGRICULTEURS DE SYN" in "---grantee_tableId:-:activeAccount---" panel
    And I click on "View" icon for "COOP-CA DES AGRICULTEURS DE SYN" inside flex table with id "---grantee_tableId:-:activeAccount---" without waiting for record
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    #426877 #426866 #408551
    Then I softly see "Community Population" page block displayed
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:communityPopulation---"
    #408549
    Then I softly see "Community Name" in flex table header "---grantee_tableId:-:communityPopulationAdd---"
    Then I softly see "Borough Census Area" in flex table header "---grantee_tableId:-:communityPopulationAdd---"
    Then I softly see "Population" in flex table header "---grantee_tableId:-:communityPopulationAdd---"
    Then I softly see "Population Year" in flex table header "---grantee_tableId:-:communityPopulationAdd---"
    #408552
    When I click "Associate" after selection of "Cold Bay" by showing entries "All" in flex table with id "---grantee_tableId:-:communityPopulationAdd---"
    When I close "Community Population" modal by clicking the top right x button
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see "Community Population" page block displayed
    And I click on "Remove" icon for "Cold Bay" inside flex table with id "---grantee_tableId:-:communityPopulation---" without waiting for record
    And I wait for "3" seconds
    #408553
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    Then I softly see "Community Population" page block displayed
    #408555
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:communityPopulation---"
    #408554
    Then I softly see "Community Name" in flex table header "---grantee_tableId:-:communityPopulationAdd---"
    Then I softly see "Borough Census Area" in flex table header "---grantee_tableId:-:communityPopulationAdd---"
    Then I softly see "Population" in flex table header "---grantee_tableId:-:communityPopulationAdd---"
    Then I softly see "Population Year" in flex table header "---grantee_tableId:-:communityPopulationAdd---"
    #408556
    When I click "Associate" after selection of "Cold Bay" by showing entries "All" in flex table with id "---grantee_tableId:-:communityPopulationAdd---"
    When I close "Community Population" modal by clicking the top right x button
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    Then I softly see "Community Population" page block displayed
    And I click on "Remove" icon for "Cold Bay" inside flex table with id "---grantee_tableId:-:communityPopulation---" without waiting for record
    And I wait for "3" seconds

  @Sprint-13-US-454728 @457172 @457186
  Scenario:Organization Registration: Add help text and information to registration
    Given I am on "SUBPORTAL" portal
    And I click on "Organization" in the page details
    Then I see the text "Register as Organization on DCRAGrants" in modal
    #457172
    Then I see the text "6. Corporate Entity, Business License, and Vendor ID:" in modal
    And I click on hyperlink containing value "https://www.commerce.alaska.gov/web/cbpl/BusinessLicensing.aspx"
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I see "BusinessLicensing" in current url
    #457186
    And I switch to parent tab
    And I click on hyperlink containing value "https://doa.alaska.gov/dof/vendor.html"
    Then I softly see new tab is opened
    And I switch to tab number "2"
    And I see "vendor" in current url

  @Sprint-13-US-454728-1 @457174 @457182 @457175 @457183
  Scenario:Organization Registration: Add help text and information to registration
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Home" tab
    #457182
    When I navigate to "Corporate Entity and Business License" content inside "Useful Links" subheader on left panel
    Then I softly see new tab is opened
    And I switch to tab number "1"
    #457174
    And I see "BusinessLicensing" in current url
    #457175
    And I switch to parent tab
    And I navigate to "Home" tab
    When I navigate to "IRIS Vendor Self Service" content inside "Useful Links" subheader on left panel
    Then I softly see new tab is opened
    And I switch to tab number "2"
    #457183
    And I see "vendor" in current url

  @Sprint-13-US-454728-2 @457176 @457180 @457177 @457181
  Scenario:Organization Registration: Add help text and information to registration
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    #457176
    When I navigate to "Corporate Entity and Business License" content inside "Useful Links" subheader on left panel
    Then I softly see new tab is opened
    And I switch to tab number "1"
    #457180
    And I see "BusinessLicensing" in current url
    #457177
    And I switch to parent tab
    And I navigate to "Home" tab
    When I navigate to "IRIS Vendor Self Service" content inside "Useful Links" subheader on left panel
    Then I softly see new tab is opened
    And I switch to tab number "2"
    #457181
    And I see "vendor" in current url

  @Sprint-13-US-435799 @452896 @452898 @452889 @448788 @395833 @452924 @452931
  Scenario:Generic: Relabel GovGrants/Enterprise Grants Management System to DCRAGrants
    Given I am on "SUBPORTAL" portal
    #448788
    Then I softly see the text containing "Welcome to DCRAGrants"
    #395833
    And I click on "Organization" in the page details
    #452889
    Then I see the text "Register as Organization on DCRAGrants" in modal
    And I click modal button "Register As Organization"
    And I wait for "2" seconds
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    Then I softly see "Information Disclosure" page block displayed
    #452896
    Then I softly see the text containing :
      | Grant Applicants acknowledge that all information submitted to DCRAGrants may be subject to public disclosure.  DCRAGrants will not publicly disclose or post any personally identifiable information (PII) or proprietary information unless required to do so by law or court order. DCRAGrants will treat Grant Applicant’s information that is designated as proprietary and confidential consistent with applicable federal and state law. If any Grant Application contains information or data that the Grant Applicant deems to be confidential or proprietary and it requests the information be exempt from disclosure under state open records laws or is protected under applicable state or federal privacy laws, the Grant Applicant shall specifically designate the information as privileged or confidential. Otherwise, the information may be made publicly available. In addition to applicable federal law, DCRAGrants will comply with all Alaska laws regarding disclosure, privacy and confidentiality, including but not limited to relevant provisions in the following:  the Alaska Public Records Act, AS 40.25.100 – 40.25.295 and applicable regulations at 2 AAC 96.100 – 2 AAC 96.900; the Alaska Personal Information and Protection Act, AS 45.48.010 – AS 45.48.995; and any other applicable state laws. |
    When I click on "Agree" in the page details
    #452898
    And I wait for "2" seconds
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
    Then I softly see "Confidentiality Acknowledgement" page block displayed
    Then I softly see the text containing :
      | The State of Alaska, Department of Commerce, Community, and Economic Development (State) requires all DCRAGrants Subject Matter Experts (SME) to adhere to the highest standards of confidentiality and security when reviewing and handling information submitted to the DCRAGrants System.  SMEs are those individuals, state employees, independent contractors or other third parties that are required to review, process, store or otherwise handle any information submitted to the DCRAGrants System. Each SME acknowledges that he/she will not disclose any information they received as part of the DCRAGrants System to any other person or entity without the express permission of the State. Information submitted to the DCRAGrants System includes any and all information and documents submitted by Grant Applicants and any information and documentation generated as a result of the review and processing of Grant Applications, including but not limited to written technical reviews, scoring sheets or related information, identification of review panelists and any other information pertaining to the DCRAGrants System (“Protected Information”).  Third party and independent contractor SMEs warrant that they will take all necessary safety and security safeguards to secure the Protected Information, in both electronic and physical form, and protect it from access by unauthorized parties. |
    When I click on "Agree" in the page details
    And I navigate to "Organization" sub tab
    And I generate the random SSN and save as "EIN"
    When I enter value as "{SavedValue:EIN}" into "Employer Identification Number (EIN)" on old form
    When I enter value as "NHZLK7BJM4H3" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "8765" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationOrgProfileDetails" values from "UserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Primary Email"
    When I click on "Save" in the page details
    And I pause execution for "4" seconds
    When I click on "Submit" in the page details
    #452924
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Pending Grantee Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:EIN}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:EIN}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "1" seconds
    Then I refresh the page
    #452931
    And I see the mail subject is as follows :
      """
      Sandbox: Your EGMS Registration has Been Approved
      """

  @Sprint-13-US-435799-1 @452926 @444265
  Scenario:Generic: Relabel GovGrants/Enterprise Grants Management System to DCRAGrants
    Given I am on "SUBPORTAL" portal
    And I click on "Organization" in the page details
    And I click modal button "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I navigate to "Organization" sub tab
    And I generate the random SSN and save as "EIN"
    When I enter value as "{SavedValue:EIN}" into "Employer Identification Number (EIN)" on old form
    When I enter value as "NHZLK7BJM4H3" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "8765" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationOrgProfileDetails" values from "UserRegistration_Field_Values.xlsx"
    #444265
    And I enter value "ABCD1234" into field "OrganizationFax__c"
    When I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Please provide valid Fax Number.                 |
    And I enter value "1234" into field "OrganizationFax__c"
    When I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Please provide valid Fax Number.                 |
    And I enter value "123432332134335545" into field "OrganizationFax__c"
    When I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Please provide valid Fax Number.                 |
    And I enter value "1234323321" into field "OrganizationFax__c"
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Primary Email" on old form
    When I click on "Save" in the page details
    And I pause execution for "4" seconds
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Pending Grantee Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:EIN}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:EIN}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "1" seconds
    Then I refresh the page
    #452926
    And I see the mail subject is as follows :
      """
      Sandbox: Notification From DCRAGrants: Organization Registration for External Org has Not Been Approved
      """

  @Sprint-13-US-455894 @457221 @457225 @457234 @457236 @457229 @457231
  Scenario: Add information tooltips to Business License Number and Corporate Entity Number fields
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I navigate to "Organization" sub tab
    And I generate the random SSN and save as "EIN"
    When I enter value as "{SavedValue:EIN}" into "Employer Identification Number (EIN)" on old form
    When I enter value as "NHZLK7BJM4H3" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "8765" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Organization Profile" sub tab
    #457221
    When I hovering mouse on help text icon inside page block detail "BusinessLicenseNumber__c"
    Then I softly see "Business license is required for the privilege of engaging in a business in the State of Alaska. Find information, FAQs, forms, Hot to Get Licensed, Check Your Business License Status, and online services at State Business Licenses." shown as help text for label "Business License Number"
    #457225
    When I hovering mouse on help text icon inside page block detail "CorporateEntityNumber__c"
    Then I softly see "Corporation Entity Number: a business recognized by the state as a legal entity. Find information, FAQs, forms, How To, Check Your Entity Status, and online services at Corporation Services." shown as help text for label "Corporate Entity Number"
    Then I softly see "" shown as help text
    When I click on "Save" in the page details
    #457234
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "COOP-CA DES AGRICULTEURS DE SYN" in "---grantee_tableId:-:activeAccount---" panel
    And I click on "View" icon for "COOP-CA DES AGRICULTEURS DE SYN" inside flex table with id "---grantee_tableId:-:activeAccount---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see "Description" page block displayed
    When I hovering mouse on help text icon inside page block detail "BusinessLicenseNumber__c"
    Then I softly see "Business license is required for the privilege of engaging in a business in the State of Alaska. Find information, FAQs, forms, Hot to Get Licensed, Check Your Business License Status, and online services at State Business Licenses." shown as help text for label "Business License Number"
    #457236
    When I hovering mouse on help text icon inside page block detail "CorporateEntityNumber__c"
    Then I softly see "Corporation Entity Number: a business recognized by the state as a legal entity. Find information, FAQs, forms, How To, Check Your Entity Status, and online services at Corporation Services." shown as help text for label "Corporate Entity Number"
    #457229
    And I navigate to "Home" tab
    When I navigate to "Pending Grantee Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "Regression Org" in "---grantor_tableId:-:SubrecipientOrganization---" panel
    And I click on "Start" icon for "Regression Org" inside flex table with id "---grantor_tableId:-:SubrecipientOrganization---" without waiting for record
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    Then I softly see "Organization Profile" page block displayed
    When I hovering mouse on help text icon inside page block detail "BusinessLicenseNumber__c"
    Then I softly see "Business license is required for the privilege of engaging in a business in the State of Alaska. Find information, FAQs, forms, Hot to Get Licensed, Check Your Business License Status, and online services at State Business Licenses." shown as help text for label "Business License Number"
    #457231
    When I hovering mouse on help text icon inside page block detail "CorporateEntityNumber__c"
    Then I softly see "Corporation Entity Number: a business recognized by the state as a legal entity. Find information, FAQs, forms, How To, Check Your Entity Status, and online services at Corporation Services." shown as help text for label "Corporate Entity Number"

  @Sprint-08-US-435356 @436402 @436413 @VaishaliD
  Scenario: To verify that following Organization Types should be added in the Organization Type list of Type field on step 2
    |To verify that Organization Type list should be alphabetically
    Given I am on "SUBPORTAL" portal
    And I click on "Organization" in the page details
    And I click modal button "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I navigate to "Organization" sub tab
    And I generate the random SSN and save as "EIN"
    When I enter value as "{SavedValue:EIN}" into "Employer Identification Number (EIN)" on old form
    When I enter value as "NHZLK7BJM4H3" into "Unique Entity Identifier (UEI)" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Organization Profile" sub tab
     #436402 #436413
    Then I see only the following ordered options in dropdown field "OrganizationTypeSInglePicklist__c" :
      | --None-- | 1st Class City | 2nd Class City | Alaska Native Corporations | Alaska Native Village | Alaska Native Tribes | Borough | Business or Organization | For-profit organizations | Government Agency | Government Departments | Nonprofit Organizations | Regional Education Attendance Area REAA | School District | Small Businesses | Sole-Proprietors | State Governments | Unincorporated Communities | Others |

  @Sprint-15-US-465330 @496053 @Sprint-18-US-472908 @474028 @VaishaliD
  Scenario: To Verify Internal user can edit Organization Type field
    | Verify the Business License Number field allows only numbers on Grantee organization (Grantor)
    Given I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "474738292" in "---grantee_tableId:-:activeAccount---" panel
    When I click on "Edit" icon for "474738292" inside flex table with id "---grantee_tableId:-:activeAccount---"
    And I enter value "21@@@$#@DFdf" into field "BusinessLicenseNumber__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #474028
    Then I softly see the following messages in the page details contains:
      | Business License Number must contain only numbers. |
    And I refresh the page
    And I enter value "Alaska Native Corporations" into field "ApplicantType__c"
    When I click on "Save" in the page details
    #496053
    Then I softly see field "Organization Type" as "Alaska Native Corporations"

  @Sprint-9-US-438797 @442662 @442664 @442663 @442817 @442667 @442666 @VaishaliD
  Scenario: Verify that user is able to see the 'Related Contact' section under Internal Organization Details
    | Verify that user is able to see new phone field title as a 'Fax' on contact page of internal organization
    | Verify that user is able to see new text field title as a 'Title' on related contact page of internal organization
    | Verify that user should not accept alphanumeric FAX number on Edit Related Contact of internal organization
    | Verify that user should not accept less than 10 digits FAX number on Edit Related Contact of internal organization
    | Verify that user should not accept more than 10 digits FAX number on Edit Related Contact of internal organization
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Internal" content inside "Organization" subheader on left panel
    When I click on "View" icon for "SYSTEM" inside table without waiting for record
    #442662
    Then I softly see "Related Contacts" page block displayed
    When I click on "Edit" icon for "Automation Permanent Contact" inside flex table with id "---home:-:relatedContactsTableId---"
    #442664
    Then I softly see field "Fax" inside page block
    #442663
    Then I softly see field "Title" inside page block
    #442817
    And I enter value "ABCD1234" into field "Fax__c"
    And I click modal button "Save"
    Then I see the following messages in the page details :
      | Please provide valid Fax Number.                 |
    #442667
    And I enter value "1234" into field "Fax__c"
    And I click modal button "Save"
    Then I see the following messages in the page details :
      | Please provide valid Fax Number.                 |
    #442666
    And I enter value "12344324342344" into field "Fax__c"
    And I click modal button "Save"
    Then I see the following messages in the page details :
      | Please provide valid Fax Number.                 |

  @Sprint-9-US-438797 @442669 @442674 @442670 @442836 @442737 @442729 @VaishaliD
  Scenario: Verify that user is able to see the 'Contact Information' section under Edit Internal Contact
  | Verify that user is able to see new phone field title as a 'Fax' on edit internal contact page
  | Verify that user is able to see new text field title as a 'Title' on edit internal contact page of contact information section
  | Verify that user should not accept alphanumeric digits FAX number on Edit internal Contact of contact
  | Verify that user should not accept less than 10 digits FAX number on Edit internal Contact of contact
  | Verify that user should not accept more than 10 digits FAX number on Edit internal Contact of contact
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I click on "Edit" icon for "Automation Permanent Contact" inside flex table with id "---home:-:internalContactTableId---"
    #442669
    Then I softly see "Contact Information" page block displayed
    #442674
    Then I softly see field "Fax" inside page block
    #442670
    Then I softly see field "Title" inside page block
    #442836
    And I enter value "ABCD1234" into field "Fax__c"
    And I click modal button "Save"
    Then I see the following messages in the page details :
      | Please provide valid Fax Number.                 |
    #442737
    And I enter value "1234" into field "Fax__c"
    And I click modal button "Save"
    Then I see the following messages in the page details :
      | Please provide valid Fax Number.                 |
    #442729
    And I enter value "12344324342344" into field "Fax__c"
    And I click modal button "Save"
    Then I see the following messages in the page details :
      | Please provide valid Fax Number.                 |

  @Sprint-10-US-443195 @444248 @444262 @444270 @444284 @444292 @444290 @444287 @445884 @444280 @Sprint-10-US-472908 @474061 @VaishaliD
  Scenario: Verify that grantee user is able to see the 'Description' section under External Organization Details
  | Verify that grantee user is able to see new phone field title as a 'Fax' on description section of external organization
  | Verify that grantee user should not accept incorrect FAX number on description section of External Organization
  | Verify that grantee user is able to see new phone field title as a 'Fax' on contact information section of external organization
  | Verify that grantee user should not accept alphanumeric FAX number on contact information section of external organization
  | Verify that grantee user should not accept less than 10 digits FAX number on contact information section of external organization
  | Verify that grantee user should not accept more than 10 digits FAX number on contact information section of external organization
  | Verify the business license number field allows only numbers on Grantee organization (Grantee User)
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "1" seconds
    And I navigate to "Overview" sub tab
    #444248
    Then I softly see "Description" page block displayed
    #444262 #445884
    Then I softly see field "Fax" inside page block
    #444280
    Then I softly see field "Fax" as "(123) 423-4567"
    When I click on "Edit" in the page details
    And I wait for "4" seconds
    #474061
    And I enter value "21@@@$#@DFdf" into field "BusinessLicenseNumber__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Business License Number must contain only numbers. |
    And I refresh the page
    #444270
    And I enter value "1234@#$$ASSAD" into field "OrganizationFax__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Please provide valid Fax Number.                 |
    And I click on "Edit" icon for "Automation City1 SPI" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    #444284
    Then I softly see field "Fax" inside page block
    #444292
    And I enter value "ABCD1234" into field "Fax__c"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please provide valid Fax Number.                 |
    #444290
    And I enter value "1234" into field "Fax__c"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please provide valid Fax Number.                 |
    #444287
    And I enter value "123432332134335545" into field "Fax__c"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please provide valid Fax Number.                 |

  @Sprint-6-US-420288 @421733 @421661 @421663 @421665 @421666 @421675 @VaishaliD @GAuser @EmailSuccessMessageShouldBeDisplayed
  Scenario: To verify that Grant Administrator should be able to add the Secondary users by the New button functionality of Contacts table
  | To verify that airplane icon should be visible in the actions column for the New state user.
  | To verify that airplane icon should be clickable in the actions column for the New state user
  | To verify that after clicking on airplane icon Send Invitation modal window should be open
  | To verify that To, Subject and Body should be auto filled in Send Invitation modal window
    Given I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "474738292" in "---grantee_tableId:-:activeAccount---" panel
    When I click on "Edit" icon for "474738292" inside flex table with id "---grantee_tableId:-:activeAccount---"
   #421733
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Full Name" as "Automation Runtime Contact" from flex table "---home:-:userContactsTableId---"
   #421661
    Then I softly can see row level action button "Send Invitation" against "{SavedValue:Automation Runtime Contact}" in flex table with id "---home:-:userContactsTableId---"
    #421663
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    #421665
    And I wait for "2" seconds
    Then I see modal box with body "Send Invitation" is displayed
    And I wait for "2" seconds
    #421666
    And I click "Send" button in modal
    And I wait for "3" seconds
    Then I see the following messages in the page details :
      | Email Sent Successfully. |
    When I click modal button "Close"
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "1" seconds
    Then I refresh the page
    And I wait for "2" seconds
    #421675 #WIP #step not developed in LWC
    And I see the mail subject is as follows :
      """
      Sandbox: Notification from DCRAGrants: Invitation to be a User of DCRAGrants
      """
    Then I see the mail text is as follows :
      """
      Hello,

      You are invited to become an DCRAGrants user.

      Please click here to create your login account to register as a user in the DCRAGrants.

      You will be prompted to sign a Legal Disclaimer upon registration.

      Please do not reply to this system-generated email. You may contact the DCRAGrants Support Team at CAA@Alaska.Gov if you have any questions or need assistance with this task.

      Thank you,
      DCRA Grants and Funding
      """
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "474738292" in "---grantee_tableId:-:activeAccount---" panel
    When I click on "View" icon for "474738292" inside flex table with id "---grantee_tableId:-:activeAccount---"
    And I wait for "2" seconds
    #422202
    Then I softly cannot see row level action button "Send Invitation" against "{SavedValue:Automation Runtime Contact}" in flex table with id "---home:-:userContactsTableId---"
    And I click on "Delete" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:userContactsTableId---" without waiting for record

  @Sprint-6-US-420288 @421727 @421761 @422202 @VaishaliD @GAuser
  Scenario: To verify that Grant Administrator should be able to add the Secondary users by the New button functionality of Contacts table
    Given I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "474738292" in "---grantee_tableId:-:activeAccount---" panel
    When I click on "Edit" icon for "474738292" inside flex table with id "---grantee_tableId:-:activeAccount---"
   #421727
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Primary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Full Name" as "Automation Runtime Contact" from flex table "---home:-:userContactsTableId---"
    Then I softly see value "Primary" for title "Role" against the value "{SavedValue:Automation Runtime Contact} Contact" inside table "---home:-:userContactsTableId---"
   #421761
    Then I softly cannot see row level action button "Send Invitation" against "Active" in flex table with id "---home:-:userContactsTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "474738292" in "---grantee_tableId:-:activeAccount---" panel
    When I click on "View" icon for "474738292" inside flex table with id "---grantee_tableId:-:activeAccount---"
    And I wait for "2" seconds
    #422202
    Then I softly cannot see row level action button "Send Invitation" against "{SavedValue:Automation Runtime Contact} Contact" in flex table with id "---home:-:userContactsTableId---"
    And I click on "Delete" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
