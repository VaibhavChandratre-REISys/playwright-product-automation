@organizationRegistrationPageNysed
Feature: Validate all registration related scenarios

  @508269 @508309 @508728 @NYSED-3424 @NYSED-3426 @Sprint-06 @US-499229 @NYSEDSprint-26 @US-NYSED-2881 @M04 @M04OrgRegistration @M05
  Scenario: Verify that the Grantee user does not see 'Individual' option at subrecipient registration portal and Organization Button is placed at middle of registration box.
    Given I am on "SUBPORTAL" portal
    #508269
    Then I softly see button "Organization" on login page
    Then I softly do not see button "Individual" on login page
    #508309
    And I click on button "Organization" inside login page
    Then I softly see "Register as Organization on GFMS" opens in overLay window
    Then I softly do not see "Register As Individual on EGMS" opens in overLay window
    And I close modal by clicking the top right x button
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "EINText__c"
    When I click on "Save" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    #508728
    Then I softly see field "Institution Type" inside page block
    Then I softly see asterisk mark on "Institution Type"
    Then I see only the following ordered options in dropdown field "OrganizationTypeSInglePicklist__c" :
      | --None-- | Public School Districts | Public Schools | BOCES | Library Systems/Libraries | Local Governments | Institutions of Higher Education | Community Based Organizations | Other | Non-public Schools | Museums & Historical Societies |
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "--None--" into field "OrganizationTypeSInglePicklist__c"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Institution Type is required in the Organization Profile tab under the Organization Information section. |
    And I enter value "Public School Districts" into field "OrganizationTypeSInglePicklist__c"
    When I click on "Save" in the page details
    Then I see the sub-header is "3 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    Then I softly see "User Information" page block displayed
    And I enter "UserRegistrationStep3" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I wait for "10" seconds
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipient Organizations - Pending"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see field "EIN" as "{SavedValue:uniqueEIN}"
    #NYSED-3424 #508728
    Then I softly see field "Institution Type" as "Public School Districts"
    #NYSED-3426
    Then I softly see "Organization Information (SAM.gov)" page block displayed
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"

  @516338 @516340 @516393 @516394 @516397 @Sprint-08 @US-514904
  Scenario Outline:Verify that the Grantee user sees the Role field shows the correct value of the user role, provided during registration: at the subrecipient organization layout->Overview tab->Contacts section->Role field.
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    #516338 #516340 #516393 #516394 #516397
    Then I softly see value "<Role>" for title "Role" against the value "<FullName>" inside table "---home:-:userContactsTableId---"

    Examples:
      | UserType    | Role               | FullName                         |
      | GRANTEE_SC  | Submit and Certify | Automation Grantee_SubmitCertify |
      | GRANTEE_LEA | LEA Admin          | Automation Grantee_LeaAdmin      |
      | GRANTEE_VO  | View Only          | Automation Grantee_ViewOnly      |
      | GRANTEE_CE  | Create and Edit    | Automation Grantee_CreateEdit    |

  @516388 @516389 @516384 @Sprint-08 @US-514904
  Scenario Outline:Verify that the Grantee user sees the Role field shows the correct value of the user role, provided during registration: at the subrecipient organization layout->Overview tab->Contacts section->Role field.
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    #516388
    When I click on "Edit" icon for "<Full Name>" inside flex table with id "---home:-:userContactsTableId---"
    #516383
    Then I see only the following ordered options in dropdown field "NYSED_RecipientRole__c" :
      | --None-- | View Only | Create and Edit | Submit and Certify | LEA Admin | Non user |
    Then I softly do not see "Address Information" page block displayed on modal
    #516384
    Then I softly see field "Organization" is not editable
    And I click modal button "Close"
    And I click "OK" on modal confirmation box
    Then I softly see value "<Role>" for title "Role" against the value "<Full Name>" inside table "---home:-:userContactsTableId---"
    #516389
    When I click on "View" icon for "<Full Name>" inside flex table with id "---home:-:userContactsTableId---"
    Then I softly do not see "Address Information" page block displayed on modal
    #516335
    Then I softly see field "Role" as "<Role>"
    And I click modal button "Close"

    Examples:
      | UserType    | Role               | Full Name                        |
      | GRANTEE_SC  | Submit and Certify | Automation Grantee_SubmitCertify |
      | GRANTEE_LEA | LEA Admin          | Automation Grantee_LeaAdmin      |

  @516360 @516377 @516375 @516379 @Sprint-08 @US-514904
  Scenario Outline:Verify that the Grantee user sees the Role field shows the same value of the role, provided while adding the contact before sending the invitation at the subrecipient organization layout->Overview tab->Contacts section->Role field
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    #516377
    Then I softly see field "Organization" is not editable
    Then I softly see field "Organization" as "Automation Permanent Nysed School Org"
    #516375
    Then I see only the following ordered options in dropdown field "NYSED_RecipientRole__c" :
      | --None-- | View Only | Create and Edit | Submit and Certify | LEA Admin | Non user |
    #516379
    Then I softly do not see "Address Information" page block displayed on modal
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    When I enter in modal value "8967859036" into field "Phone"
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see value "Submit and Certify" for title "Role" against the value "{SavedValue:Automation Runtime} Contact" inside table "---home:-:userContactsTableId---"
    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_LEA |

  @516323 @Sprint-08 @US-514568
  Scenario: Verify that the Grantee user sees that during the user registration step 3 of 3, Profile Information Tab->Authorized Representative Information->User Role picklist field is added with the mentioned values
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "EINText__c"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    Then I see only the following ordered options in dropdown field "NYSED_RecipientRole__c" :
      | --None-- | Submit and Certify | LEA Admin |
    Then I softly see asterisk mark on "Role"
    When I hovering mouse on help text icon inside page block detail "Role"
    And I wait for "2" seconds
    Then I softly see "Choose the "Submit and Certify" role if you are authorized to submit work to NYSED (e.g., a superintendent, or a CEO, or an authorized designee). Choose the "LEA Admin" role if you will be managing the organization in the GFMS, but you will not be submitting work to NYSED." shown as help text
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Role is required. |
    And I enter "UserRegistrationStep3" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    Then I softly can see top right button "Submit" in page detail

  @521642 @521676 @521682 @521645 @525747 @525749 @536252 @US-525130 @US-534182 @Sprint-10 @US-519385 @NYSEDSprint-13 @M05
  Scenario Outline: Verify that user should see a button 'Update Organization Fields' is added on Pending subrecipient Organization layout.
  |Verify the help text for the field 'License Cap' and its default value '2'- Pending Subrecipient Organization|
  |Verify that user should see fields  'License Cap' are required to approve the organization  |
  |Verify that user should not see 'Update Organization Fields' button on Approved Organization Layout|
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "EINText__c"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I clear the value from field "OrganizationStreetAddress__c"
    And I clear the value from field "OrganizationStreet2Address__c"
    And I clear the value from field "OrganizationCityAddress__c"
    And I enter value "{SavedValue:Char256}" into field "OrganizationStreetAddress__c"
    And I enter value "{SavedValue:Char256}" into field "OrganizationStreet2Address__c"
    And I enter value "{SavedValue:Char42}" into field "OrganizationCityAddress__c"
    And I enter value "No" into field "SameAsOrganizationAddress__c"
    And I enter value "{SavedValue:Char256}" into field "PaymentAddressline1__c"
    And I enter value "{SavedValue:Char256}" into field "PaymentAddressLine2__c"
    And I enter value "{SavedValue:Char42}" into field "PaymentAddressCity__c"
    And I enter value "34567" into field "PaymentAddressZipCode__c"
    When I enter values into fields
      | Value | Field                    |
      | 12    | PaymentAddressCounty__c |
    And I enter value "AK" into field "PaymentAddressState__c"
    And I enter value "USA" into field "PaymentAddressCountry__c"
    When I click on "Save" in the page details
    And I enter "UserRegistrationStep3" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "<UserType>" user
    And I wait for "10" seconds
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipient Organizations - Pending"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I wait for "3" seconds
    #521642
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly can see top right button "Update Organization Fields" in page detail
    When I click on "Update Organization Fields" in the page details
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside modal "License Cap"
    #521676
    Then I softly see "This is the maximum number of GFMS users allowed for the organization" shown as help text
    And I click modal button "Close"
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "License Cap"
    #521676
    Then I softly see "This is the maximum number of GFMS users allowed for the organization" shown as help text
    Then I softly see field "License Cap" as "2"
    When I navigate to "User Profile" sub tab
    #525747
    Then I softly do not see "Authorized Representative Information" page block displayed
    Then I softly see "User Information" page block displayed
    Then I softly see field "First Name" inside page block
    Then I softly see field "Prefix" inside page block
    Then I softly see field "Last Name" inside page block
    Then I softly see field "Title" inside page block
    Then I softly see field "Email Address" inside page block
    Then I softly see field "Phone Number" inside page block
    Then I softly see field "Role" inside page block
    Then I softly cannot see field "Primary Email" inside page block
    Then I softly see that "Role" rendered in view mode only
    Then I softly cannot see field "Address Line 1" inside page block
    Then I softly cannot see field "Address Line 2" inside page block
    Then I softly cannot see field "City" inside page block
    Then I softly cannot see field "State" inside page block
    Then I softly cannot see field "Congressional District" inside page block
    Then I softly cannot see field "4-Digit Zip Code Extension" inside page block
    Then I softly cannot see field "Zip Code" inside page block
    Then I softly cannot see field "County" inside page block
    When I "Approve" in the approval decision
    #521682
    Then I softly see field "Status" as "Approved"
    #521645
    Then I cannot see top right button "Update Organization Fields" in page detail
    When I navigate to "User Profile" sub tab
    #525749
    Then I softly do not see "Authorized Representative Information" page block displayed
    Then I softly see "User Information" page block displayed
    Then I softly see field "First Name" inside page block
    Then I softly see field "Prefix" inside page block
    Then I softly see field "Last Name" inside page block
    Then I softly see field "Title" inside page block
    Then I softly see field "Email Address" inside page block
    Then I softly see field "Phone Number" inside page block
    Then I softly see field "Role" inside page block
    Then I softly cannot see field "Primary Email" inside page block
    Then I softly see that "Role" rendered in view mode only
    Then I softly cannot see field "Address Line 1" inside page block
    Then I softly cannot see field "Address Line 2" inside page block
    Then I softly cannot see field "City" inside page block
    Then I softly cannot see field "State" inside page block
    Then I softly cannot see field "Congressional District" inside page block
    Then I softly cannot see field "4-Digit Zip Code Extension" inside page block
    Then I softly cannot see field "Zip Code" inside page block
    Then I softly cannot see field "County" inside page block
    When I navigate to "Overview" sub tab
    #536252
    Then I softly see field "Street" as "{SavedValue:Char255}"
    Then I softly see field "PO Box" as "{SavedValue:Char255}"
    Then I softly see field "City" as "{SavedValue:Char40}"
    And I save the value from row "1" for column name "Address Type" as "AddressType" from flex table "---home:-:OrgAdditionalAddressTableId---"
    When I click on "View" icon for "{SavedValue:AddressType}" inside flex table with id "---home:-:OrgAdditionalAddressTableId---"
    And I wait for "3" seconds
    #536252
    Then I softly see field "Street" as "{SavedValue:Char255}"
    Then I softly see field "PO Box" as "{SavedValue:Char255}"
    Then I softly see field "City" as "{SavedValue:Char40}"

    Examples:
      | UserType |
      | PM       |
#      | EXE      |
#      | PO       |
#      | FO       |
#      | FD       |
#      | ADMIN    |

  @536251 @536222 @US-534182 @NYSEDSprint-13 @M05
  Scenario Outline: Verify that the internal user sees that the Popular Name displays the Organization Name associated with the provided UEI on the ‘Approved’ layout.
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "EINText__c"
    And I enter value "Z6H2RUHJED62" into field "UEISam__c"
    When I save the field labeled "Unique Entity Identifier (UEI)" as "UniqueEntityIdentifier"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    And I wait for "2" seconds
    #536222
    Then I softly see field "UEI" as "{SavedValue:UniqueEntityIdentifier}"
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I clear the value from field "OrganizationStreetAddress__c"
    And I clear the value from field "OrganizationStreet2Address__c"
    And I clear the value from field "OrganizationCityAddress__c"
    And I enter value "{SavedValue:Char256}" into field "OrganizationStreetAddress__c"
    And I enter value "{SavedValue:Char256}" into field "OrganizationStreet2Address__c"
    And I enter value "{SavedValue:Char42}" into field "OrganizationCityAddress__c"
    And I enter value "No" into field "SameAsOrganizationAddress__c"
    And I enter value "{SavedValue:Char256}" into field "PaymentAddressline1__c"
    And I enter value "{SavedValue:Char256}" into field "PaymentAddressLine2__c"
    And I enter value "{SavedValue:Char42}" into field "PaymentAddressCity__c"
    And I enter value "34567" into field "PaymentAddressZipCode__c"
    And I enter value "12" into field "PaymentAddressCountry__c"
    And I enter value "AK" into field "PaymentAddressState__c"
    And I enter value "USA" into field "PaymentAddressCountry__c"
    When I click on "Save" in the page details
    And I enter "UserRegistrationStep3" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "<UserType>" user
    And I wait for "10" seconds
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipient Organizations - Pending"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I wait for "3" seconds
    When I click on "Update Organization Fields" in the page details
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #536251
    Then I see the header is "{SavedValue:Automation Runtime}" in the page details
    Then I softly see field "UEI" as "{SavedValue:UniqueEntityIdentifier}"

    Examples:
      | UserType |
      | PM       |
#      | EXE      |
#      | PO       |
#      | FO       |
#      | FD       |
#      | ADMIN    |

  @521647 @521670 @521674 @521679 @521675 @525751 @US-525130 @Sprint-10 @US-519385 @M05
  Scenario Outline:Verify that user should not see 'Update Organization Fields' button on rejected organization layout
  |Verify that user cannot enter 0 value in 'License Cap' or can not keep field blank - Pending Organization|
  |Verify that the user cannot enter negative numbers and special characters into field 'License Cap' - Pending Organization|
  |Verify that the number entered cannot exceed the maximum number of licenses allowed for the customer.  - Pending Organization|
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "EINText__c"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "UserRegistrationStep3" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "<UserType>" user
    And I wait for "10" seconds
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipient Organizations - Pending"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I wait for "2" seconds
    When I click on "Update Organization Fields" in the page details
    And I wait for "3" seconds
    When I enter in modal value "0" into field "NYSED_LicenseCap__c"
    And I click modal button "Save and Close"
    #521670
    Then I softly see the following messages in the page details contains:
      | Lincese Cap must be greater than 0. |
    When I enter in modal value "" into field "NYSED_LicenseCap__c"
    And I click modal button "Save and Close"
    #521670
    Then I softly see the following messages in the page details contains:
      | Lincese Cap must be greater than 0. |
    When I enter in modal value "%" into field "NYSED_LicenseCap__c"
    And I click modal button "Save and Close"
    #521674
    Then I softly see the following messages in the page details contains:
      | Lincese Cap must be greater than 0. |
    When I enter in modal value "-99" into field "NYSED_LicenseCap__c"
    And I click modal button "Save and Close"
    #521674
    Then I softly see the following messages in the page details contains:
      | Lincese Cap must be greater than 0. |
    When I enter in modal value "99" into field "NYSED_LicenseCap__c"
    And I click modal button "Save and Close"
    #521679
    Then I softly see the following messages in the page details contains:
      | License Cap must be less than number of Partner community licenses available. There are 2 available Partner community licenses. |
    When I enter in modal value "10.08" into field "NYSED_LicenseCap__c"
    And I click modal button "Save and Close"
    #521675
    Then I softly see field "License Cap" as "10"
    When I click on "Update Organization Fields" in the page details
    When I enter in modal value "2" into field "NYSED_LicenseCap__c"
    And I click modal button "Save and Close"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    #521647
    Then I cannot see top right button "Update Organization Fields" in page detail
    When I navigate to "User Profile" sub tab
    #525751
    Then I softly do not see "Authorized Representative Information" page block displayed
    Then I softly see "User Information" page block displayed
    Then I softly see field "First Name" inside page block
    Then I softly see field "Prefix" inside page block
    Then I softly see field "Last Name" inside page block
    Then I softly see field "Title" inside page block
    Then I softly see field "Email Address" inside page block
    Then I softly see field "Phone Number" inside page block
    Then I softly see field "Role" inside page block
    Then I softly cannot see field "Primary Email" inside page block
    Then I softly see that "Role" rendered in view mode only
    Then I softly cannot see field "Address Line 1" inside page block
    Then I softly cannot see field "Address Line 2" inside page block
    Then I softly cannot see field "City" inside page block
    Then I softly cannot see field "State" inside page block
    Then I softly cannot see field "Congressional District" inside page block
    Then I softly cannot see field "4-Digit Zip Code Extension" inside page block
    Then I softly cannot see field "Zip Code" inside page block
    Then I softly cannot see field "County" inside page block

    Examples:
      | UserType |
      | PM       |
#      | EXE      |
#      | PO       |
#      | FO       |
#      | FD       |
#      | ADMIN    |


  @521649 @US-519385 @M05
  Scenario Outline:Verify that user should not see a button 'Update Organization Fields' is added on Active subrecipient Organization layout.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    #521649
    Then I cannot see top right button "Update Organization Fields" in page detail

    Examples:
      | UserType |
      | PM       |
#      | EXE      |
#      | PO       |
#      | FO       |
#      | FD       |
#      | ADMIN    |

  @521652 @US-519385 @M05
  Scenario Outline:Verify that Grantee user should not see a button 'Update Organization Fields' is added on active subrecipient organization layout.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    #521652
    Then I cannot see top right button "Update Organization Fields" in page detail

    Examples:
      | UserType    |
      | GRANTEE_SC  |
      | GRANTEE_LEA |
      | GRANTEE_VO  |
      | GRANTEE_CE  |

  @521160 @521164 @521167 @521155-SC @521162-SC @521166-SC @US-519387 @M05
  Scenario Outline:Verify that user can see that the new button is not visible to users with the role - Create and Edit, Non User and View Only
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "EXTERNAL_SC" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    #521155
    Then I softly see "Contact Information" page block displayed
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    When I enter in modal value "8967859036" into field "Phone"
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I click modal button "Save"
    And I select value inside table "AdditionalUser" is "All"
    #521162
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---home:-:userContactsTableId---"
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} Contact" inside flex table with id "---home:-:userContactsTableId---"
    #521166
    Then I softly see the text containing "Send"
    Then I softly see the text containing "Hello,"
    Then I softly see the text containing "You are invited to become an Enterprise Grants Management System (EGMS) user."
    Then I softly see the text containing "Please click "
    Then I softly see the text containing " to create your login account to register as a user in the EGMS."
    Then I softly see the text containing "You will be prompted to sign a Legal Disclaimer upon registration."
    Then I softly see the text containing "Please do not reply to this system-generated email. You may contact the GovGrants Support Team at. "
    Then I softly see the text containing "govgrantssupport@reisystems.com."
    Then I softly see the text containing "if you have any questions or need assistance with this task."
    Then I softly see the text containing "Thank you."
    Then I softly see the text containing "The EGMS Team"
    And I click modal button "Close"
    And I refresh the page
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    #521160
    Then I softly cannot see top right button "New" in flex table with id "---home:-:userContactsTableId---"
    #521164
    And I select value inside table "AdditionalUser" is "All"
    Then I softly see value "New" for title "Status" against the value "{SavedValue:Automation Runtime} Contact" inside table "---home:-:userContactsTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---home:-:userContactsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---home:-:userContactsTableId---"
    #521167
    Then I softly cannot see row level action button "Send Invitation" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---home:-:userContactsTableId---"

    Examples:
      | UserType    |
      | EXTERNAL_CE |
#      | EXTERNAL_NU |
#      | EXTERNAL_VO  |

  @521155-LEA @521162-LEA @521166-LEA @US-519387 @M05
  Scenario: :Verify that the user can see the new button is visible to users with the role Submit and certify or LEA admin only.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "EXTERNAL_LEA" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    #521155
    Then I softly see "Contact Information" page block displayed
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    When I enter in modal value "8967859036" into field "Phone"
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I click modal button "Save"
    And I select value inside table "AdditionalUser" is "All"
    #521162
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---home:-:userContactsTableId---"
    #521166
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} Contact" inside flex table with id "---home:-:userContactsTableId---"
    #521166
    Then I softly see the text containing "Send"
    Then I softly see the text containing "Hello,"
    Then I softly see the text containing "You are invited to become an Enterprise Grants Management System (EGMS) user."
    Then I softly see the text containing "Please click "
    Then I softly see the text containing " to create your login account to register as a user in the EGMS."
    Then I softly see the text containing "You will be prompted to sign a Legal Disclaimer upon registration."
    Then I softly see the text containing "Please do not reply to this system-generated email. You may contact the GovGrants Support Team at. "
    Then I softly see the text containing "govgrantssupport@reisystems.com."
    Then I softly see the text containing "if you have any questions or need assistance with this task."
    Then I softly see the text containing "Thank you."
    Then I softly see the text containing "The EGMS Team"

  @521445 @521465 @521461 @521468 @520527 @521462 @520732 @Sprint-09 @US-514393 @M05 @Bug-Ticket-538628
  Scenario: Verify that the Grantee user see the Address Line 1(mandatory) has been renamed as Street and is required to save also Address Line 2 has been renamed as PO Box in the Organization Profile-> Organization Address section
  |Verify that the Grantee user see the Address Line 1(mandatory) has been renamed as Street and is required to save also Address Line 2 has been renamed as PO Box in the Organization Profile->Payment Address section
  |Verify that the Grantee user see the Employer Identification Number (EIN) is marked as Required to Save field on the Organization Registration Step 1 of 3 page |
  |Verify that the Grantee user see the County rename to County Code and change data type as 2-digit whole number in the Organization Profile-> Organization Address section |
  |Verify that the Grantee user see the County rename to County Code and change data type as 2-digit whole number in the Organization Profile-> Payment Address section |
  |Verify that the Grantee user see the following fields are removed in the Organization Profile-> Organization Address section|
  |Verify that the Grantee user see the following fields are removed in the Organization Profile-> Organization Information section.|
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    Then I softly see asterisk mark on "---home:-:ein---"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Employer Identification Number (EIN) is required. |
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "---home:-:ein---"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    Then I softly see field "Street" inside page block
    Then I softly see asterisk mark on "Street"
    Then I softly see field "PO Box" inside page block
    Then I softly do not see asterisk mark on "PO Box"
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    And I clear the value from field "OrganizationStreetAddress__c"
    And I enter value "AU" into field "County__c"
    And I enter value "Public School Districts" into field "OrganizationTypeSInglePicklist__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Street is required in the Organization Profile tab under the Organization Address section. |
    Then I softly cannot see the following messages in the page details contains:
      | To save, PO Box is required in the Organization Profile tab under the Organization Address section. |
    And I enter value "P.G.Road" into field "OrganizationStreetAddress__c"
    Then I see below fields in "Organization Address" page block
      | County Code |
    And I enter value "-8" into field "---home:-:countyCode---"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits |
    And I enter value "7" into field "---home:-:countyCode---"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits |
    And I enter value "789" into field "---home:-:countyCode---"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits |
    And I enter value "*(" into field "---home:-:countyCode---"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits |
    And I enter value "9.9" into field "---home:-:countyCode---"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits |
    And I enter value "DD" into field "---home:-:countyCode---"
    #521468
    And I enter value "No" into field "SameAsOrganizationAddress__c"
    And I enter value "L.M.Road" into field "PaymentAddressline1__c"
    And I enter value "Chicago" into field "PaymentAddressCity__c"
    And I enter value "34567" into field "PaymentAddressZipCode__c"
    And I enter value "USA" into field "PaymentAddressCountry__c"
    And I enter value "-8" into field "---home:-:paymentAddressCountyCode---"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits |
    And I enter value "7" into field "---home:-:paymentAddressCountyCode---"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits |
    And I enter value "789" into field "---home:-:paymentAddressCountyCode---"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits |
    And I enter value "*(" into field "---home:-:paymentAddressCountyCode---"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "9.9" into field "---home:-:paymentAddressCountyCode---"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "AY" into field "---home:-:paymentAddressCountyCode---"
    Then I do not see below fields in "Organization Address" page block
      | Congressional District     |
      | 4-Digit Zip Code Extension |
    #520732
    Then I softly cannot see field "If Other, Please Specify" inside page block
    Then I softly cannot see field "Fax" inside page block
    Then I softly cannot see field "Website" inside page block
    Then I softly cannot see field "Organization FY End Date(MM/DD)" inside page block
    Then I softly cannot see field "Cage Code" inside page block
    #521465
    Then I see below fields in "Payment Address" page block
      | Street |
      | PO Box |
    And I enter value "--None--" into field "StateDropdownList__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly cannot see the following messages in the page details contains:
      | The County Code should consist of 2 digits |

  @521470 @521454 @520607 @520604 @Sprint-09 @US-514393 @M05 @Need_6.600Package
  Scenario: Verify that the Grantee user see the following fields are removed in the Organization Profile-> Payment Address section
  |Verify that the Grantee user see the following fields are required to save in the Organization Profile-> Organization Address section |
  |Verify that the Grantee user see the Following Fields in the Organization Profile-> Organization Information section.|
  |Verify that the Grantee user see the Organization Profile-> Organization Information section help text is updated.|
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "---home:-:ein---"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    #521470
    Then I do not see below fields in "Organization Address" page block
      | Congressional District     |
      | 4-Digit Zip Code Extension |
    #521454
    Then I softly see asterisk mark on "City"
    Then I softly see asterisk mark on "Country"
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see asterisk mark on "State"
    Then I softly see field ID "StateDropdownList__c" as "NY" in edit mode
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I wait for "3" seconds
    And I enter value "MI" into field "StateDropdownList__c"
    And I enter value "DC" into field "StateDropdownList__c"
    And I enter value "--None--" into field "StateDropdownList__c"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    #520607
    Then I softly see field "EIN" inside page block
    Then I softly see field "UEI" inside page block
    Then I softly see field "Popular Name" inside page block
    Then I softly see field "GG Institution Type" inside page block
    Then I softly see field "Phone Number" inside page block
    Then I softly see field "SAM Expiration Date (MM/DD/YYYY)" inside page block
    #520604
    And I clear the value from field "OrganizationCityAddress__c"
#    MI DC
    And I clear the value from field "OrganizationZipCode__c"
    And I clear the value from field "OrganizationsCountry__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, City is required in the Organization Profile tab under the Organization Address section.     |
      | To save, Zip Code is required in the Organization Profile tab under the Organization Address section. |
      | To save, State is required in the Organization Profile tab under the Organization Address section.    |
      | To save, Country is required in the Organization Profile tab under the Organization Address section.  |
    When I hovering mouse on help text icon inside page block detail "Organization Information"
    Then I softly see "The following fields have been pre-populated with information retrieved from SAM.gov(Only if UEI number is provided at step 1): Organization Name, SAM Expiration date, Organization Address." shown as help text

  @521467 @521467-1 @Sprint-09 @US-514393 @M05
  Scenario: Verify that the Grantee user see the following fields are required to save in the Organization Profile-> Payment Address section
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "---home:-:ein---"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    Then I softly see asterisk mark on "City"
    Then I softly see asterisk mark on "Country"
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see asterisk mark on "State"
#    Then I softly see field "State" as "NY"
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Street is required in the Organization Profile tab under the Payment Address section.   |
      | To save, City is required in the Organization Profile tab under the Payment Address section.     |
      | To save, Zip Code is required in the Organization Profile tab under the Payment Address section. |
      | To save, Country is required in the Organization Profile tab under the Payment Address section.  |

  @520536 @524746 @Sprint-09 @US-514393 @M05
  Scenario: Verify that the Grantee user see the validation if duplicate EIN number is entered (for which organization registration request is already approved or pending) on the Organization Registration Step 1 of 3 page
  |Verify that the Grantee user see the Vendor ID field is hidden on the Organization Registration Step 1 of 3 page.|
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:EINPresentOnOrg}" into field "---home:-:ein---"
    Then I softly cannot see field "Vendor ID" inside page block
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the text containing "Registration cannot proceed as organization with EIN number already present in the system."

  @521467 @521467-2 @Sprint-09 @US-514393 @M05
  Scenario: Verify that the Grantee user see the following fields are required to save in the Organization Profile-> Payment Address section
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "---home:-:ein---"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    Then I see only the following ordered options in dropdown field "OrganizationTypeSInglePicklist__c" :
      | --None-- | Public School Districts | Public Schools | BOCES | Library Systems/Libraries | Local Governments | Institutions of Higher Education | Community Based Organizations | Other | Non-public Schools | Museums & Historical Societies |
    And I enter value "--None--" into field "OrganizationTypeSInglePicklist__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Institution Type is required in the Organization Profile tab under the Organization Information section. |
    Then I softly see asterisk mark on "Institution Type"
    Then I softly see field "Institution Type" inside page block

  @521526 @521541 @521537 @Sprint-09 @US-514393 @M05
  Scenario: Verify that the Grantee user sees the Authorized Representative Information section has been renamed as User Information on the Register Step 3 of 3 page.
  |Verify that the Grantee user sees the Register Step 3 of 3 page following updates that have been made.|
  |Verify that the Grantee user sees the User Information on the Register Step 3 of 3 page following fields are removed and related validations are disabled.|
  |Verify that the Grantee user sees the User Information on the Register Step 3 of 3 page having following fields.|
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "---home:-:ein---"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    Then I see the sub-header is "3 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    Then I softly see "User Information" page block displayed
    Then I softly see "Instructions" page block displayed
    #521541
    Then I softly cannot see field "Address Line 1" inside page block
    Then I softly cannot see field "Address Line 2" inside page block
    Then I softly cannot see field "City" inside page block
    Then I softly cannot see field "State" inside page block
    Then I softly cannot see field "Congressional District" inside page block
    Then I softly cannot see field "4-Digit Zip Code Extension" inside page block
    Then I softly cannot see field "Zip Code  " inside page block
    Then I softly cannot see field "Country" inside page block
    Then I softly cannot see field "County" inside page block
    #521537
    Then I softly see field "First Name" inside page block
    Then I softly see field "Last Name" inside page block
    Then I softly see field "Title" inside page block
    Then I softly see field "Role" inside page block
    Then I softly see field "Email Address" inside page block
    Then I softly see field "Phone Number" inside page block
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, First Name is required.    |
      | To save, Last Name is required.     |
      | To save, Role is required.          |
      | To save, Email Address is required. |
      | To save, Phone Number is required.  |

  @525116 @Sprint-09 @US-514393 @M05
  Scenario: Verify that the Grantee user see the Same as Organization Address field required to save in the Organization Profile-> Payment Address section
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "---home:-:ein---"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    Then I softly see asterisk mark on "Same as Organization Address?"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Same as Organization Address? is required in the Organization Profile tab under the Payment Address section. |
    And I enter value "No" into field "SameAsOrganizationAddress__c"
    Then I see below fields in "Payment Address" page block
      | Same as Organization Address? |
      | Street                        |
      | PO Box                        |
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    Then I do not see below fields in "Payment Address" page block
      | Street |
      | PO Box |

  @521457 @521455 @521450 @521460 @521459 @521458 @Sprint-09 @US-519382 @M05
  Scenario: Verify that internal users can see the field-level changes under the Overview Tab -> Additional Addresses section on the 'Submitted for Approval' Organization page layout.
  |Verify that internal users can see the field-level changes under the Overview tab -> SAM.GOV Information section on the 'Submitted for Approval' Organization page layout.|
  |Verify that internal users can see the information entered by the Guest User during registration on the 'Submitted for Approval' Organization page layout, along with the field-level changes under the Overview tab -> Organization Profile section.|
  |Verify that internal users can see the field-level changes under the Overview Tab -> Additional Addresses section on the 'Approved' Organization page layout.|
  |Verify that internal users can see the field-level changes under the Overview tab -> SAM.GOV Information section on the 'Approved' Organization page layout.|
  |Verify that internal users can see the field-level changes under the Overview tab -> SAM.GOV Information section on the 'Approved' Organization page layout.|
  |Verify that internal users can see the information entered by the guest user during registration on the 'Approved' Organization page layout, along with the field-level changes under the Overview tab -> Organization Profile section.|
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "---home:-:ein---"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    Then I see the sub-header is "3 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    Then I softly see "User Information" page block displayed
    And I enter "UserRegistrationStep3" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I softly see the text containing "Confirmation Message"
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipient Organizations - Pending"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Overview" sub tab
    Then I see the following rows under the following headers in table with id "AdditionalAddressExternal" :
      | Actions | Address Type | Street | City | State | Country | Zip Code |
    Then I see below fields in "Organization Information (SAM.gov)" page block
      | CAGE code                  |
      | Legal Business Name        |
      | Registration Status        |
      | Fiscal Year End Close Date |
      | Street                     |
      | PO Box                     |
      | City                       |
      | State                      |
      | Zip Code                   |
      | County Code                |
      | Country                    |
    Then I do not see below fields in "SAM.GOV Information" page block
      | Congressional District     |
      | 4-digit zip code extension |
    Then I softly see field "EIN" as "{SavedValue:uniqueEIN}"
    Then I softly see field "Institution Type" as "Public School Districts"
    Then I softly see field "Phone Number" as "(123) 467-8955"
    Then I softly see field "License Cap" as "2"
    Then I softly cannot see field "Vendor ID" inside page block
    Then I softly cannot see field "Organization Type" inside page block
    Then I softly see field "Street" as "Washington"
    Then I softly see field "City" as "Sterlling"
    Then I softly see field "State" as "NY"
    Then I softly see field "Zip Code" as "20301"
    Then I softly see field "Country" as "USA"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I see the following rows under the following headers in table with id "AdditionalAddressExternal" :
      | Actions | Address Type | Street | City | State | Country | Zip Code |
    Then I see below fields in "Organization Information (SAM.gov)" page block
      | CAGE code                  |
      | Legal Business Name        |
      | Registration Status        |
      | Fiscal Year End Close Date |
      | Street                     |
      | PO Box                     |
      | City                       |
      | State                      |
      | Zip Code                   |
      | County Code                |
      | Country                    |
    Then I do not see below fields in "SAM.GOV Information" page block
      | Congressional District     |
      | 4-digit zip code extension |
    Then I softly see field "EIN" as "{SavedValue:uniqueEIN}"
    Then I softly see field "Institution Type" as "Public School Districts"
    Then I softly see field "Phone Number" as "(123) 467-8955"
    Then I softly see field "License Cap" as "2"
    Then I softly cannot see field "Vendor ID" inside page block
    Then I softly cannot see field "Organization Type" inside page block
    Then I softly see field "Street" as "Washington"
    Then I softly see field "City" as "Sterlling"
    Then I softly see field "State" as "NY"
    Then I softly see field "Zip Code" as "20301"
    Then I softly see field "Country" as "USA"

  @521518 @521517 @521516 @Sprint-09 @US-519382 @M05
  Scenario: Verify that internal users can see the field-level changes under the Overview Tab -> Additional Addresses section on the 'Rejected' Organization page layout.
  |Verify that internal users can see the field-level changes under the Overview tab -> SAM.GOV Information section on the 'Rejected' Organization page layout.|
  |Verify that internal users can see the information entered by the guest user during registration on the 'Rejected' Organization page layout, along with the field-level changes under the Overview tab -> Organization Profile section.|
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "---home:-:ein---"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    Then I see the sub-header is "3 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    Then I softly see "User Information" page block displayed
    And I enter "UserRegistrationStep3" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I softly see the text containing "Confirmation Message"
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipient Organizations - Pending"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I see the following rows under the following headers in table with id "AdditionalAddressExternal" :
      | Actions | Address Type | Street | City | State | Country | Zip Code |
    Then I see below fields in "Organization Information (SAM.gov)" page block
      | CAGE code                  |
      | Legal Business Name        |
      | Registration Status        |
      | Fiscal Year End Close Date |
      | Street                     |
      | PO Box                     |
      | City                       |
      | State                      |
      | Zip Code                   |
      | County Code                |
      | Country                    |
    Then I do not see below fields in "SAM.GOV Information" page block
      | Congressional District     |
      | 4-digit zip code extension |
    Then I softly see field "EIN" as "{SavedValue:uniqueEIN}"
    Then I softly see field "Institution Type" as "Public School Districts"
    Then I softly see field "Phone Number" as "(123) 467-8955"
    Then I softly see field "License Cap" as "2"
    Then I softly cannot see field "Vendor ID" inside page block
    Then I softly cannot see field "Organization Type" inside page block
    Then I softly see field "Street" as "Washington"
    Then I softly see field "City" as "Sterlling"
    Then I softly see field "State" as "NY"
    Then I softly see field "Zip Code" as "20301"
    Then I softly see field "Country" as "USA"

  @525867 @Sprint-10 @US-522678 @M05
  Scenario: Verify that Guest user can see following changes on the Published Opportunity Layout from the Funding Opportunities section -  Competitive Announcement - FS- 10 Type
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "PublicAnnouncements" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "PublicAnnouncements"
    Then I do not see below fields in "General Information" page block
      | Pre-Application Required? |
    Then I do not see below fields in "Key Dates" page block
      | Pre-Application Required? |
    Then I do not see below fields in "Eligibility" page block
      | Announcement Description |
    Then I see below fields in "Eligibility" page block
      | Eligibility Information  |
      | Eligible Applicant Types |
    Then I softly see the text containing "Public School District (IMF)"
    Then I softly see the text containing "Non-Public School (IMF)"
    Then I softly see the text containing "Public School (IMF)"

  @525868 @Sprint-10 @US-522678 @M05
  Scenario: Verify that Guest user can see following changes on the Published Opportunity Layout from the Funding Opportunities section -  Competitive Announcement - Lump Sum Type
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_COMPETITIVE_DIRECTED"
    Given I am on "SUBPORTAL" portal
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "PublicAnnouncements" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "PublicAnnouncements"
    Then I do not see below fields in "General Information" page block
      | Pre-Application Required? |
    Then I do not see below fields in "Key Dates" page block
      | Pre-Application Required? |
    Then I do not see below fields in "Eligibility" page block
      | Announcement Description |
    Then I see below fields in "Eligibility" page block
      | Eligibility Information  |
      | Eligible Applicant Types |
    Then I softly see the text containing "Public School District (IMF)"
    Then I softly see the text containing "Non-Public School (IMF)"
    Then I softly see the text containing "Public School (IMF)"

  @525591 @525599 @532756 @527482 @527483 @527501 @527502 @527503 @527504 @527509 @532742 @US-519408 @M05
  Scenario Outline:Verify that the grantee user sees the header section as having the following fields: EGMS ID, License Cap, Status
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    #525591
    Then I softly see field "EGMS ID" inside page block
    Then I softly see field "License Cap" inside page block
    Then I softly see field "Status" inside page block
    #525599
    Then I softly see "Organization Information" page block displayed
    Then I softly see field "SED Code" inside page block
    Then I softly see field "Institution ID" added after "SED Code"
    Then I softly see field "GG Institution Type" added after "Institution ID"
    Then I softly see field "SEDREF Institution Type" added after "GG Institution Type"
    Then I softly see field "SEDREF Institution Sub Type" added after "SEDREF Institution Type"
    #525662
    Then I softly see field "UEI" added after "Popular Name"
    Then I softly see field "Interest Eligible" added after "UEI"
    Then I softly see field "Phone Number" added after "Interest Eligible"
    Then I softly see field "SAM.Gov Expiration Date" added after "Phone Number"
    Then I softly see field "License Cap" added after "SAM.Gov Expiration Date"
    Then I softly see field "Hold Payments" added after "License Cap"
    Then I softly see field "SED NYC Public" added after "SED NYC"
    Then I softly see field "Is Parent Organization" added after "SED NYC Public"
    #532756
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    #527482
    Then I softly see fields "OrganizationDBA__c" is in edit mode
    And I enter value "$%%" into field "OrganizationDBA__c"
    When I click on "Save" in the page details
    Then I softly see field "Popular Name" as "$%%"
    When I click on "Edit" in the page details
    And I enter value "1233455" into field "OrganizationDBA__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Popular Name" as "1233455"
    When I click on "Edit" in the page details
    And I clear the value from field "OrganizationDBA__c"
    When I click on "Save" in the page details
    Then I softly see field "Popular Name" as "1233455"
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:Char255}" into field "OrganizationDBA__c"
    When I click on "Save" in the page details
    Then I softly see field "Popular Name" as "{SavedValue:Char255}"
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:Char256}" into field "OrganizationDBA__c"
    When I click on "Save" in the page details
    Then I softly see field "Popular Name" as "{SavedValue:Char255}"
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:SubrecipientOrg}" into field "OrganizationDBA__c"
    When I click on "Save" in the page details
    Then I softly see field "Popular Name" as "{SavedValue:SubrecipientOrg}"
    #527483
    When I click on "Edit" in the page details
    And I enter value "$%%" into field "Phone"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Phone Number must be exactly 10 digits and cannot contain characters. |
    And I enter value "-1233455" into field "Phone"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Phone Number must be exactly 10 digits and cannot contain characters. |
    And I clear the value from field "Phone"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Phone Number is required in the Overview tab under the Organization Information section. |
    And I enter value "-1233455" into field "Phone"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Phone Number must be exactly 10 digits and cannot contain characters. |
    And I enter value "(123) 467-8955" into field "Phone"
    When I click on "Save" in the page details
    Then I softly see field "Phone Number" as "(123) 467-8955"
    #527501
    When I click on "Edit" in the page details
    And I enter value "$%%" into field "BillingStreet"
    When I click on "Save" in the page details
    Then I softly see field "Street" as "$%%"
    When I click on "Edit" in the page details
    And I enter value "1233455" into field "BillingStreet"
    When I click on "Save" in the page details
    Then I softly see field "Street" as "1233455"
    When I click on "Edit" in the page details
    And I clear the value from field "BillingStreet"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Street is required in the Overview tab under the Physical Address section. |
    And I enter value "{SavedValue:Char255}" into field "BillingStreet"
    When I click on "Save" in the page details
    Then I softly see field "Street" as "{SavedValue:Char255}"
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:Char256}" into field "BillingStreet"
    When I click on "Save" in the page details
    Then I softly see field "Street" as "{SavedValue:Char255}"
    When I click on "Edit" in the page details
    And I enter value "Striling" into field "BillingStreet"
    When I click on "Save" in the page details
    Then I softly see field "Street" as "Striling"
    #527502
    When I click on "Edit" in the page details
    And I enter value "$%%" into field "AddressLine2__c"
    When I click on "Save" in the page details
    Then I softly see field "PO Box" as "$%%"
    When I click on "Edit" in the page details
    And I enter value "1233455" into field "AddressLine2__c"
    When I click on "Save" in the page details
    Then I softly see field "PO Box" as "1233455"
    When I click on "Edit" in the page details
    And I clear the value from field "AddressLine2__c"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:Char255}" into field "AddressLine2__c"
    When I click on "Save" in the page details
    Then I softly see field "PO Box" as "{SavedValue:Char255}"
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:Char256}" into field "AddressLine2__c"
    When I click on "Save" in the page details
    Then I softly see field "PO Box" as "{SavedValue:Char255}"
    When I click on "Edit" in the page details
    And I enter value "Automation Test" into field "AddressLine2__c"
    When I click on "Save" in the page details
    Then I softly see field "PO Box" as "Automation Test"
    #527503
    When I click on "Edit" in the page details
    And I enter value "$%%" into field "BillingCity"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    And I enter value "1233455" into field "BillingCity"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    And I clear the value from field "BillingCity"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, City is required in the Overview tab under the Physical Address section. |
    And I enter value "{SavedValue:Char42}" into field "BillingCity"
    When I click on "Save" in the page details
    Then I softly see field "City" as "{SavedValue:Char40}"
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:Char40}" into field "BillingCity"
    When I click on "Save" in the page details
    Then I softly see field "City" as "{SavedValue:Char40}"
    When I click on "Edit" in the page details
    And I enter value "LINCOLN" into field "BillingCity"
    When I click on "Save" in the page details
    Then I softly see field "City" as "LINCOLN"
    #527504
    Then I softly cannot see field "County" inside page block
    Then I softly see field "County Code" inside page block
    And I wait for "3" seconds
    When I click on "Edit" in the page details
    And I enter value "-6" into field "County__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    And I enter value "123" into field "County__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    And I enter value "#$%^" into field "County__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    And I enter value "18" into field "County__c"
    When I click on "Save" in the page details
    Then I softly see field "County Code" as "18"
    #527506
    When I click on "Edit" in the page details
    Then I softly see fields "NYSEDState__c" is in edit mode
    And I enter value "--None--" into field "NYSEDState__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, State is required in the Overview tab under the Physical Address section. |
    And I enter value "AK" into field "NYSEDState__c"
    When I click on "Save" in the page details
    Then I softly see field "State" as "AK"
    #527508
    When I click on "Edit" in the page details
    Then I softly see fields "NYSED_BuildingCode__c" is in edit mode
    And I enter value "$%%" into field "NYSED_BuildingCode__c"
    When I click on "Save" in the page details
    Then I softly see field "Building Code" as "$%%"
    When I click on "Edit" in the page details
    And I enter value "1233455" into field "NYSED_BuildingCode__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Building Code" as "1233455"
    When I click on "Edit" in the page details
    And I clear the value from field "NYSED_BuildingCode__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Building Code is required in the Overview tab under the Physical Address section. |
    And I enter value "abcdefghijk" into field "NYSED_BuildingCode__c"
    When I click on "Save" in the page details
    Then I softly see field "Building Code" as "abcdefghijk"
    When I click on "Edit" in the page details
    And I enter value "abcdefghijklm" into field "NYSED_BuildingCode__c"
    When I click on "Save" in the page details
    Then I softly see field "Building Code" as "abcdefghijkl"
    When I click on "Edit" in the page details
    And I enter value "123456789012" into field "NYSED_BuildingCode__c"
    When I click on "Save" in the page details
    Then I softly see field "Building Code" as "123456789012"
    #527509
    When I click on "Edit" in the page details
    Then I softly see fields "NYSED_AddressSequenceNumber__c" is in edit mode
    And I enter value "$%%" into field "NYSED_AddressSequenceNumber__c"
    When I click on "Save" in the page details
    Then I softly see field "Address Sequence Number" as "$%%"
    When I click on "Edit" in the page details
    And I enter value "123" into field "NYSED_AddressSequenceNumber__c"
    When I click on "Save" in the page details
    Then I softly see field "Address Sequence Number" as "123"
    When I click on "Edit" in the page details
    And I clear the value from field "NYSED_AddressSequenceNumber__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Address Sequence Number is required in the Overview tab under the Physical Address section. |
    And I enter value "12" into field "NYSED_AddressSequenceNumber__c"
    When I click on "Save" in the page details
    Then I softly see field "Address Sequence Number" as "12"
    When I click on "Edit" in the page details
    And I enter value "1234" into field "NYSED_AddressSequenceNumber__c"
    When I click on "Save" in the page details
    Then I softly see field "Address Sequence Number" as "123"
    When I click on "Edit" in the page details
    And I enter value "123" into field "NYSED_AddressSequenceNumber__c"
    When I click on "Save" in the page details
    Then I softly see field "Address Sequence Number" as "123"

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA |

  @525646 @US-519408 @M05
  Scenario: Verify that the grantee user with submit and certify role, sees the following fields with their respective help texts.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "EXTERNAL_SC" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    #525646
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "SED Code"
    Then I softly see "Local Education Agency code for the institution." shown as help text
    Then I softly see fields "LEA_CODE__c" is in edit mode
    When I hovering mouse on help text icon inside page block detail "Institution ID"
    Then I softly see "Institution ID for the institution. This is the main identifier for an institution." shown as help text
    Then I softly see field "Institution ID" is not editable
    When I hovering mouse on help text icon inside page block detail "Interest Eligible"
    Then I softly see "Interest eligible indicator associated with the payee info for this institution." shown as help text
    Then I softly see field "Interest Eligible" is not editable
    Then I softly see field "EIN" is not editable
    Then I softly see field "UEI" is not editable
    Then I softly see field "Interest Eligible" is not editable
    Then I softly see field "Bedscode" is not editable
    Then I softly see field "SAM.Gov Expiration Date" is not editable
    Then I softly see field "License Cap" is not editable
    Then I softly see field "Hold Payments" is not editable
    Then I softly see fields "OrganizationDBA__c" is in edit mode
    Then I softly see fields "Phone" is in edit mode

  @525667 @532742 @US-519408 @M05
  Scenario Outline:Verify that the other than the submit and certify or LEA admin role grantee cannot see the following fields.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly cannot see field "UEI" inside page block
    Then I softly cannot see field "EIN" inside page block
    #532742
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_NU |
#      | GRANTEE_VO  |

  @525699 @525709 @525710 @525712 @525714 @525716 @525718 @US-519408 @M05
  Scenario Outline:Verify that the grantee user see that a new section, Physical Address, is added after the Organization Information section with below fields in order:
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see "Physical Address" page block displayed
    Then I softly cannot see field "Address Line" inside page block
    Then I softly see asterisk mark on "Street"
    Then I softly see field "Street" inside page block
    Then I softly cannot see field "Address Line2" inside page block
    Then I softly see field "PO Box" inside page block
    Then I softly see asterisk mark on "City"
    Then I softly see field "City" inside page block
    Then I softly see field "County Code" inside page block
    Then I softly see asterisk mark on "State"
    Then I softly see field "State" inside page block
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see field "Zip Code" inside page block
    Then I softly see asterisk mark on "Country"
    Then I softly see field "Country" inside page block
    Then I softly do not see asterisk mark on "Building Code"
    Then I softly see field "Building Code" inside page block
    Then I softly do not see asterisk mark on "Address Sequence Number"
    Then I softly see field "Address Sequence Number" inside page block
    #525709
    Then I softly see "CSO Information" page block displayed
    Then I softly see that "CSO Title" rendered in view mode only
    Then I softly do not see asterisk mark on "CSO Title"
    Then I softly see field "CSO Title" inside page block
    Then I softly see that "CSO Name" rendered in view mode only
    Then I softly do not see asterisk mark on "CSO Name"
    Then I softly see field "CSO Salute" inside page block
    Then I softly see that "CSO Salute" rendered in view mode only
    Then I softly do not see asterisk mark on "CSO Salute"
    Then I softly see field "CSO Salute" inside page block
    Then I softly see that "CSO Phone Number" rendered in view mode only
    Then I softly do not see asterisk mark on "CSO Phone Number"
    Then I softly see field "CSO Phone Number" inside page block
    #525710
    Then I softly see "Payee Information" page block displayed
    Then I softly do not see asterisk mark on "Payee Name"
    Then I softly see that "Payee Name" rendered in view mode only
    Then I softly see field "Payee Name" inside page block
    Then I softly do not see asterisk mark on "Payee Street"
    Then I softly see that "Payee Street" rendered in view mode only
    Then I softly see field "Payee Street" inside page block
    Then I softly do not see asterisk mark on "Payee PO Box"
    Then I softly see that "Payee PO Box" rendered in view mode only
    Then I softly see field "Payee PO Box" inside page block
    Then I softly do not see asterisk mark on "Payee City"
    Then I softly see that "Payee City" rendered in view mode only
    Then I softly see field "Payee City" inside page block
    Then I softly do not see asterisk mark on "Payee State"
    Then I softly see that "Payee State" rendered in view mode only
    Then I softly see field "Payee State" inside page block
    Then I softly do not see asterisk mark on "Payee Zip Code"
    Then I softly see that "Payee Zip Code" rendered in view mode only
    Then I softly see field "Payee Zip Code" inside page block
    Then I softly do not see asterisk mark on "Payee Country"
    Then I softly see that "Payee Zip Code" rendered in view mode only
    Then I softly see field "Payee Country" inside page block
    Then I softly do not see asterisk mark on "Payee ID"
    Then I softly see that "Payee Country" rendered in view mode only
    Then I softly see field "Payee ID" inside page block
     #525710
    Then I softly see "Vendor Information" page block displayed
    Then I softly see field "Vendor ID" inside page block
    Then I softly see field "OSC Vendor Status" inside page block
    Then I softly see field "Not For Profit" inside page block
    #525712
    Then I softly see "Additional SEDREF Information" page block displayed
    Then I softly do not see asterisk mark on "Charity Reg"
    Then I softly see that "Charity Reg" rendered in view mode only
    Then I softly see field "Charity Reg" inside page block
    Then I softly do not see asterisk mark on "Municipality Code"
    Then I softly see that "Municipality Code" rendered in view mode only
    Then I softly see field "Municipality Code" inside page block
    Then I softly do not see asterisk mark on "Federal ID"
    Then I softly see that "Federal ID" rendered in view mode only
    Then I softly see field "Federal ID" inside page block
    Then I softly do not see asterisk mark on "Hist Bedscode1"
    Then I softly see that "Hist Bedscode1" rendered in view mode only
    Then I softly see field "Hist Bedscode1" inside page block
    Then I softly do not see asterisk mark on "Hist Bedscode2"
    Then I softly see that "Hist Bedscode2" rendered in view mode only
    Then I softly see field "Hist Bedscode2" inside page block
    Then I softly do not see asterisk mark on "Hist Bedscode3"
    Then I softly see field "Hist Bedscode3" inside page block
    Then I softly see that "Hist Bedscode3" rendered in view mode only
    Then I softly do not see asterisk mark on "Hist Bedscode4"
    Then I softly see that "Hist Bedscode4" rendered in view mode only
    Then I softly see field "Hist Bedscode4" inside page block
    Then I softly do not see asterisk mark on "Date Active"
    Then I softly see that "Date Active" rendered in view mode only
    Then I softly see field "Date Active" inside page block
    #525714
    Then I softly see "Contacts" page block displayed
    #525716
    Then I softly see "Indirect Cost Rate" page block displayed
    #525718
    And I navigate to "Related Log" sub tab
    Then I softly do not see "Submitted Pre-Application" page block displayed

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_LEA |
#      | GRANTEE_CE  |
#      | GRANTEE_NU |
#      | GRANTEE_VO  |

  @526742 @US-519504 @Sprint-10 @MO5
  Scenario: Verify that the Grantee User see the validation message if enter the invalid input in the username field of the Reset Password modal.
    Given I am on "SUBPORTAL" portal
    And I click on "Forgot Password" link
    And I enter value "{SavedValue:AutomationFD1Email}" in username field
    And I click on "Reset Password" link
    #526742
    Then I see the text "error occured : Please refresh page once if problem still persist contact Admin." in modal
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Forgot Password" link
    And I enter value "12345" in username field
    And I click on "Reset Password" link
    #526742
    Then I see the text "We can’t find a Username that matches what you entered. Verify that your Username is an email address (for example, Username@company.com)." in modal

  @536246 @536247 @536245 @536254 @536231 @NYSEDSprint-13 @US-534182 @Bug-Ticket-543562 @Bug-Ticket-536008 @M05
  Scenario Outline: Verify that the Grantee user sees that during the user registration step 3 of 3, Profile Information Tab->Authorized Representative Information->User Role picklist field is added with the mentioned values
  |Verify that the Grantee user sees that the following field lengths are updated as below in the Organization Address section at User registration step 2 of 3.|
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "EINText__c"
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    Then I softly see value "{SavedValue:Automation Runtime}" for the edit mode field "OrganizationName__c"
    And I clear the value from field "OrganizationName__c"
    And I enter value "{SavedValue:Char256}" into field "OrganizationName__c"
    #536231
    Then I softly see value "{SavedValue:Char255}" for the edit mode field "OrganizationName__c"
    And I clear the value from field "OrganizationName__c"
    And I enter value "Automation Runtime" into field "OrganizationName__c"
    #536246
    Then I softly see fields "OrganizationStreetAddress__c" is in edit mode
    Then I softly see fields "OrganizationStreet2Address__c" is in edit mode
    Then I softly see fields "OrganizationCityAddress__c" is in edit mode
    And I clear the value from field "OrganizationStreetAddress__c"
    And I clear the value from field "OrganizationStreet2Address__c"
    And I clear the value from field "OrganizationCityAddress__c"
    And I enter value "{SavedValue:Char256}" into field "OrganizationStreetAddress__c"
    And I enter value "{SavedValue:Char256}" into field "OrganizationStreet2Address__c"
    And I enter value "{SavedValue:Char42}" into field "OrganizationCityAddress__c"
    #536246
    Then I softly see value "{SavedValue:Char255}" for the edit mode field "OrganizationStreetAddress__c"
    Then I softly see value "{SavedValue:Char255}" for the edit mode field "OrganizationStreet2Address__c"
    Then I softly see value "{SavedValue:Char40}" for the edit mode field "OrganizationCityAddress__c"
    And I enter value "No" into field "SameAsOrganizationAddress__c"
    #536247
    Then I softly see fields "OrganizationStreetAddress__c" is in edit mode
    Then I softly see fields "OrganizationStreet2Address__c" is in edit mode
    Then I softly see fields "OrganizationCityAddress__c" is in edit mode
    And I enter value "{SavedValue:Char256}" into field "PaymentAddressline1__c"
    And I enter value "{SavedValue:Char256}" into field "PaymentAddressLine2__c"
    And I enter value "{SavedValue:Char42}" into field "PaymentAddressCity__c"
    #536247
    Then I softly see value "{SavedValue:Char255}" for the edit mode field "PaymentAddressline1__c"
    Then I softly see value "{SavedValue:Char255}" for the edit mode field "PaymentAddressLine2__c"
    Then I softly see value "{SavedValue:Char40}" for the edit mode field "PaymentAddressCity__c"
    And I enter value "34567" into field "PaymentAddressZipCode__c"
    When I enter values into fields
      | Value | Field                    |
      | 12    | PaymentAddressCounty__c |
    And I enter value "AK" into field "PaymentAddressState__c"
    And I enter value "USA" into field "PaymentAddressCountry__c"
    When I click on "Save" in the page details
    And I enter "UserRegistrationStep3" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "<UserType>" user
    And I wait for "10" seconds
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipient Organizations - Pending"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    #536245
    Then I softly see field "Street" as "{SavedValue:Char255}"
    Then I softly see field "PO Box" as "{SavedValue:Char255}"
    Then I softly see field "City" as "{SavedValue:Char40}"
    And I save the value from row "1" for column name "Address Type" as "AddressType" from flex table "---home:-:OrgAdditionalAddressTableId---"
    When I click on "View" icon for "{SavedValue:AddressType}" inside flex table with id "---home:-:OrgAdditionalAddressTableId---"
    And I wait for "3" seconds
    #536245
    Then I softly see field "Street" as "{SavedValue:Char255}"
    Then I softly see field "PO Box" as "{SavedValue:Char255}"
    Then I softly see field "City" as "{SavedValue:Char40}"
    And I click modal button "Close"
    When I click on "Update Organization Fields" in the page details
    When I enter in modal value "2" into field "NYSED_LicenseCap__c"
    And I click modal button "Save and Close"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    #536254
    Then I softly see field "Street" as "{SavedValue:Char255}"
    Then I softly see field "PO Box" as "{SavedValue:Char255}"
    Then I softly see field "City" as "{SavedValue:Char40}"
    And I save the value from row "1" for column name "Address Type" as "AddressType" from flex table "---home:-:OrgAdditionalAddressTableId---"
    When I click on "View" icon for "{SavedValue:AddressType}" inside flex table with id "---home:-:OrgAdditionalAddressTableId---"
    And I wait for "3" seconds
    #536254
    Then I softly see field "Street" as "{SavedValue:Char255}"
    Then I softly see field "PO Box" as "{SavedValue:Char255}"
    Then I softly see field "City" as "{SavedValue:Char40}"

    Examples:
      | UserType |
      | PM       |
#      | EXE      |
#      | PO       |
#      | FO       |
#      | FD       |
#      | ADMIN    |

  @536241 @536253 @NYSEDSprint-13 @US-534182
  Scenario Outline: Verify that the internal user sees that the Popular Name displays the Organization Name associated with the provided UEI on the ‘Submitted for Approval’ layout.
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "EINText__c"
    And I enter value "EE47YZNY2B49" into field "UEISam__c"
    When I save the field labeled "Unique Entity Identifier (UEI)" as "UniqueEntityIdentifier"
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    And I clear the value from field "OrganizationName__c"
    And I enter value "{SavedValue:Char256}" into field "OrganizationName__c"
    And I clear the value from field "OrganizationName__c"
    And I enter value "Automation Runtime" into field "OrganizationName__c"
    And I clear the value from field "OrganizationStreetAddress__c"
    And I clear the value from field "OrganizationStreet2Address__c"
    And I clear the value from field "OrganizationCityAddress__c"
    And I enter value "{SavedValue:Char256}" into field "OrganizationStreetAddress__c"
    And I enter value "{SavedValue:Char256}" into field "OrganizationStreet2Address__c"
    And I enter value "{SavedValue:Char42}" into field "OrganizationCityAddress__c"
    And I enter value "No" into field "SameAsOrganizationAddress__c"
    And I enter value "{SavedValue:Char256}" into field "PaymentAddressline1__c"
    And I enter value "{SavedValue:Char256}" into field "PaymentAddressLine2__c"
    And I enter value "{SavedValue:Char42}" into field "PaymentAddressCity__c"
    And I enter value "34567" into field "PaymentAddressZipCode__c"
    And I enter value "12" into field "PaymentAddressCountry__c"
    And I enter value "AK" into field "PaymentAddressState__c"
    And I enter value "USA" into field "PaymentAddressCountry__c"
    When I click on "Save" in the page details
    And I enter "UserRegistrationStep3" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "<UserType>" user
    And I wait for "10" seconds
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipient Organizations - Pending"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    #536241
    Then I see the header is "{SavedValue:Automation Runtime}" in the page details
    Then I softly see field "UEI" as "EE47YZNY2B49"
    When I click on "Update Organization Fields" in the page details
    When I enter in modal value "2" into field "NYSED_LicenseCap__c"
    And I click modal button "Save and Close"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    #536253
    Then I see the header is "{SavedValue:Automation Runtime}" in the page details
    Then I softly see field "UEI" as "EE47YZNY2B49"

    Examples:
      | UserType |
      | PM       |
#      | EXE      |
#      | PO       |
#      | FO       |
#      | FD       |
#      | ADMIN    |

  @NYSED-3428 @NYSED-3430 @US-NYSED-2233 @ChandratateV @M05
  Scenario: Verify that the guest user can see updated picklist values on the Institution Type field at Register Step 2 of 3 page
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "EINText__c"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    #NYSED-3428
    Then I see only the following ordered options in dropdown field "OrganizationTypeSInglePicklist__c" :
      | --None-- | Public School Districts | Public Schools | BOCES | Library Systems/Libraries | Local Governments | Institutions of Higher Education | Community Based Organizations | Other | Non-public Schools | Museums & Historical Societies |
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    And I clear the value from field "---home:-:countyCode---"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #NYSED-3430
    Then I softly see the following messages in the page details contains:
      | To save, County Code is required in the Organization Profile tab under the Organization Address section. |
    And I enter value "789" into field "---home:-:countyCode---"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "FF" into field "---home:-:countyCode---"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "2.2" into field "---home:-:countyCode---"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "2" into field "---home:-:countyCode---"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "22" into field "---home:-:countyCode---"
    When I click on "Save" in the page details
    Then I see the sub-header is "3 of 3" in the page details

  @NYSED-3433 @NYSED-3432 @US-NYSED-2233 @ChandratateV @M05
  Scenario: Verify that the guest user can see that the County Code field is marked required to save at Register Step 2 of 3 page Organization Profile tab Payment Address section
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "EINText__c"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    #NYSED-3433
    When I hovering mouse on help text icon inside page block detail "Organization Address"
    Then I softly see "The following fields have been pre-populated with information retrieved from SAM.gov(Only if UEI number is provided at step 1): Organization Name, SAM Expiration date, Organization Address." shown as help text
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "No" into field "SameAsOrganizationAddress__c"
    And I enter value "L.M.Road" into field "PaymentAddressline1__c"
    And I enter value "Chicago" into field "PaymentAddressCity__c"
    And I enter value "34567" into field "PaymentAddressZipCode__c"
    And I enter value "USA" into field "PaymentAddressCountry__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #NYSED-3432
    Then I softly see the following messages in the page details contains:
      | To save, County Code is required in the Organization Profile tab under the Payment Address section. |
    And I enter value "789" into field "---home:-:paymentAddressCountyCode---"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "FF" into field "---home:-:paymentAddressCountyCode---"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "2.2" into field "---home:-:paymentAddressCountyCode---"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "2" into field "---home:-:paymentAddressCountyCode---"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "22" into field "---home:-:paymentAddressCountyCode---"
    When I click on "Save" in the page details
    Then I see the sub-header is "3 of 3" in the page details

  @NYSED-3434 @US-NYSED-2233 @ChandratateV @M05
  Scenario: Verify that when a guest user tries to register with the existing UEI number with a valid EIN, they can see the updated validation message
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "EINText__c"
    And I enter value "{SavedValue:ExistUEIInOrg}" into field "UEISam__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | This organization has already registered in the GFMS. Please contact the administrator for your organization to request an invitation to access the GFMS system. |

  @NYSED-7931 @US-NYSED-5203 @M05 @NYSED-Sprint-31
  Scenario: Verify user is able to view two sections on navigating to Grantee Portal URL
    Given I am on "SUBPORTAL" portal without Login to GFMS/Register button click
    And I wait for "2" seconds
    Then I softly see the text containing "If your organization is already in SEDREF and you have a user account in SEDDAS, please use the button below to sign into the GFMS with your SEDDAS account."
    Then I softly see the text containing "If your organization is not in SEDREF or you do not have a SEDDAS account, please use the link below to register or login to GFMS."
    Then I can see top right button "Login using Single Sign-On" in page detail
    Then I can see top right button "Login to GFMS/Register" in page detail

  @NYSED-7934 @US-NYSED-5203 @M05 @NYSED-Sprint-31
  Scenario: Verify that when the user clicks on the ‘Login to GFMS/Register’ button, the page will redirect the user to the GFMS login page, having below changes
    Given I am on "SUBPORTAL" portal without Login to GFMS/Register button click
    And I wait for "2" seconds
    When I click on "Login to GFMS/Register" in the page details
    And I wait for "2" seconds
    Then I softly see the text containing "Welcome to GovGrants, a Grants Financial Management System (GFMS)"
    Then I softly see the text containing "A “one-stop-shop” for managing your entire grant process."
    Then I softly see the text containing "You can view open opportunities, self-register, and gain access to the GFMS portal."
    Then I softly see the text containing "Within the GFMS portal, you can submit fiscal information/documentation, view grant awards,"
    Then I softly see the text containing "monitor reviews, track payments, and communicate/collaborate with stakeholders."
    Then I softly see button "Organization" on login page
    Then I softly see button "Sign In" on login page
    Then I softly see fields "username" is in edit mode
    Then I softly see fields "password" is in edit mode
    Then I softly see the text containing "Opportunities"
    Then I see the following headers in table with id "---announcement:-:publishAnnouncementTableId---" :
      | Actions | Funding Opportunity | Estimated Total Funding | Published Date | Application Due Date |
