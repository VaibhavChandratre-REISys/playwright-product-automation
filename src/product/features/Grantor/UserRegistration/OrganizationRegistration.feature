@organizationRegistrationPage @userRegistration @parallel-regression @regression @grantor-regression @regression
Feature: Validate all registration related scenarios

  @81962 @verifyDownloadOptionOpensInNewWindow-Organization
  Scenario:Verify if user clicks on download option inside Attachment section new tab getting opened
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
#    When I enter value as "533161380" into "Employer Identification Number (EIN)" on old form
#    When I enter value as "LZJHU2FMMQ13" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---user:-:orgRegistrationAttachmentTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---user:-:orgRegistrationAttachmentTableId---"
    And I click on "Edit" icon for "Attachment.pdf" inside flex table with id "---user:-:orgRegistrationAttachmentTableId---"
    And I wait for "2" seconds
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Resume/CSV" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---user:-:orgRegistrationAttachmentTableId---"
    And I pause execution for "3" seconds
    When I click on "Download" icon for "Automation.pdf" inside table
    And I download the file without rename
    Then I softly verify that the file "Automation.pdf" is downloaded

  @82051 @verifyEnteredValueOfPaymentAddressSection-Organization
  Scenario:Verify entered details is visible in edit mode of fields if user selected NO as in Same as organization Address field
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
#    When I enter value as "533161380" into "Employer Identification Number (EIN)" on old form
#    When I enter value as "LZJHU2FMMQ13" into "Unique Entity Identifier (UEI)" on old form
#    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter "CreationWithOnlyPaymentDetail" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "USA" into field "PaymentAddressCountry__c"
    Then I see "No" text enter in field "SameAsOrganizationAddress__c"
    Then I softly see value "1000 Defense Pentagon" for the edit mode field "PaymentAddressline1__c"
    Then I softly see value "Washington" for the edit mode field "PaymentAddressCity__c"
    Then I see "AK" text enter in field "PaymentAddressState__c"
    Then I softly see value "20301" for the edit mode field "PaymentAddressZipCode__c"
    Then I softly see value "(918) 908-9089" for the edit mode field "PaymentAddressVendorLocation__c"
    Then I softly see value "1234" for the edit mode field "PaymentAddressZipCode4__c"

  @82052 @verifyErrorMessageForPaymentAddressSectionFields-Organization
  Scenario:Verify user is able to see error message after filling all details except Payment address section
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
#    When I enter value as "533161380" into "Employer Identification Number (EIN)" on old form
#    When I enter value as "LZJHU2FMMQ13" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "No" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Address line 1 is required in the Organization Profile tab under the Payment Address section. |
      | To Save, City is required in the Organization Profile tab under the Payment Address section.           |
      | To Save, State is required in the Organization Profile tab under the Payment Address section.          |
      | To Save, Zip Code is required in the Organization Profile tab under the Payment Address section.       |
      | To Save, Country is required in the Organization Profile tab under the Payment Address section.        |

  @82053 @verifyVisibilityOfPaymentAddressFields-Organization
  Scenario:Verify user should not be able to see Expected fields of payment address if same organization address field is selected as yes
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
#    When I enter value as "533161380" into "Employer Identification Number (EIN)" on old form
#    When I enter value as "LZJHU2FMMQ13" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    Then I softly do not see fields "PaymentAddressLine1__c" is visible
    Then I softly do not see fields "PaymentAddressCity__c" is visible
    Then I softly do not see fields "PaymentAddressState__c" is visible
    Then I softly do not see fields "PaymentAddressZipCode__c" is visible

  @82787 @82790 @verifyPrimaryRepresentativeDetails-Individual
  Scenario:Verify user is able to see filled details on Primary Representative detail page while individuals registration
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    #82790
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Mr." into field "PrimaryRepPrefix__c"
    And I enter value "1234" into field "PrimaryRepZipCode4__c"
    And I enter value "VA" into field "County__c"
    And I enter value "123" into field "CongressionalDistrict__c"
    And I enter value "Sterling" into field "PrimaryRepAddress2__c"
    Then I see "Mr." text enter in field "PrimaryRepPrefix__c"
    Then I softly see value "{SavedValue:Automation Runtime}" for the edit mode field "PrimaryRepFirstName__c"
    Then I softly see value "User" for the edit mode field "PrimaryRepLastName__c"
    Then I softly see value "Automation Representative" for the edit mode field "PrimaryRepAddress1__c"
    Then I softly see value "Washington" for the edit mode field "PrimaryRepCity__c"
    Then I see "DC" text enter in field "PrimaryRepState__c"
    Then I softly see value "20301" for the edit mode field "PrimaryRepZipCode__c"
    Then I softly see value "1234" for the edit mode field "PrimaryRepZipCode4__c"
    Then I softly see value "USA" for the edit mode field "PrimaryRepCountry__c"
    Then I softly see value "VA" for the edit mode field "County__c"
    Then I softly see value "123" for the edit mode field "CongressionalDistrict__c"
    Then I softly see value "Sterling" for the edit mode field "PrimaryRepAddress2__c"

  @82797 @82784 @82780 @verifyVisibilityOfFieldsAtPaymentAddressSection-Individual
  Scenario:Verify user is not able to see any fields after selection of Same as organization fields to yes inside payment details page block
    Given I begin "Individual" registration as "Register As Individual"
    And I wait for "2" seconds
    #82780
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Step 1 of 2" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    #82784
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Step 2 of 2" in the page details
    #82797
    And I enter "Individual_PrimaryDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    And I wait for "2" seconds
    Then I softly do not see fields "PaymentAddressline1__c" is visible
    Then I softly do not see fields "PaymentAddressCity__c" is visible
    Then I softly do not see fields "PaymentAddressState__c" is visible
    Then I softly do not see fields "PaymentAddressZipCode__c" is visible
    Then I softly do not see fields "PaymentAddressCounty__c" is visible
    Then I softly do not see fields "PaymentAddressCountry__c" is visible
    Then I softly do not see fields "PaymentAddressLine2__c" is visible
    Then I softly do not see fields "PaymentAddressCongressionalDistrict__c" is visible
    Then I softly do not see fields "PaymentAddressSequenceNumber__c" is visible
    Then I softly do not see fields "PaymentAddressZipCode4__c" is visible
    Then I softly do not see fields "PaymentAddressVendorLocation__c" is visible

  @82024 @verifyFilledDetailsPopulatedAtAuthorizedDetailsSection-Organization
  Scenario:Verify user should be able to see filled details at organization address id getting populated at Authorized section
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
#    When I enter value as "533161380" into "Employer Identification Number (EIN)" on old form
#    When I enter value as "LZJHU2FMMQ13" into "Unique Entity Identifier (UEI)" on old form
#    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I see the sub-header is "Step 3 of 3" in the page details
    Then I softly see value "Vintage Plaza" for the edit mode field "PrimaryRepAddress1__c"
    Then I softly see value "Sterling" for the edit mode field "PrimaryRepCity__c"
    Then I softly see value "20171" for the edit mode field "PrimaryRepZipCode__c"

  @82025 @verifyFilledDetailsAtAuthorizedRepresentativePage-Organization
  Scenario:Verify user should be navigated to captch page after filling all details at authorised representative detail
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
#    When I enter value as "533161380" into "Employer Identification Number (EIN)" on old form
#    When I enter value as "LZJHU2FMMQ13" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see the ReCaptcha input box

  @33827 @verifySavedDetailsOfOrganizationProfileSubTab-Organization
  Scenario:Verify user should be able to see filled details at organization sub tab after redirecting back to organization profile tab while clicking on back button
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
#    When I enter value as "533161380" into "Employer Identification Number (EIN)" on old form
#    When I enter value as "LZJHU2FMMQ13" into "Unique Entity Identifier (UEI)" on old form
#    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    Then I see "Yes" text enter in field "SameAsOrganizationAddress__c"
    Then I see "For-profit organizations" text enter in field "OrganizationTypeSInglePicklist__c"
    Then I softly see value "(918) 908-9089" for the edit mode field "OrgnizationPhoneNumber__c"
    Then I softly see value "www.google.com" for the edit mode field "Website__c"
    Then I softly see value "Vintage Plaza" for the edit mode field "OrganizationStreetAddress__c"
    Then I softly see value "Prince George" for the edit mode field "County__c"
    Then I softly see value "Sterling" for the edit mode field "OrganizationCityAddress__c"
    Then I see "AL" text enter in field "StateDropdownList__c"
    Then I softly see value "USA" for the edit mode field "OrganizationsCountry__c"
    Then I softly see value "20171" for the edit mode field "OrganizationZipCode__c"

  @81954 @verifyEINNumberAndDUNSNumberAtOrganizationProfileSubTab-Organization @wip
  Scenario:Verify user should be able to see filled details of EIN Number and DUNS Number at organization sub tab
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "533161380" into "Employer Identification Number (EIN)" on old form
    When I enter value as "LZJHU2FMMQ13" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    Then I softly see field "EIN" as "533161380"
    Then I softly see field "Unique Entity Identifier (UEI)" as "LZJHU2FMMQ13"

  @81952 @verifyRecipientPortalDetailsUnderContactUS  @wip
  Scenario:Verify user should be able to see details of recipient portal details under contact us sub tab
    Given I am on "SUBPORTAL" portal
    Then I softly see the text containing :
      | Office of Management and Budget |
      | 45335 Vintage Park Plaza,       |
      | Sterling, VA 20166              |
      | Phone: (703)-480-7600           |
      | Fax: (123) 123-4567             |

  @82027 @verifyRegisteredDetailsInsidePendingTask-Organization  @wip
  Scenario:Verify if user clicks on download option inside Attachment section new tab getting opened
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "No" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details

  @82028 @verifyOrganizationDetailPageDuringApproval-Organization
  Scenario:Verify if user can see organization detail page while approval
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Organization"
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "Grantor" app as "PM" user
    And I wait for "10" seconds
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "User Profile" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page

  @82796 @83035 @verifyConfirmationMessage-Individual
  Scenario:To validate Confirmation Message, after clicking Submit button on Catcha page of Individual registration process
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    Then I see the following messages in the page details contains:
      | Confirmation Message |

  @222890 @ValidateEXEuserfromuserregistrationapprovalqueueshouldnotabletoseethereassigntaskofOrganizationRegistrationApprovalinReassignTask
  Scenario: Validate EXE user from user registration approval queue should not able to see the reassign task of Organization Registration Approval in Reassign Task
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "Review Organization User Registration" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"

  @223042 @ValidateAdminusershouldnotabletoseethereassigntaskofOrganizationRegistrationApprovalfrommytaskAsaAdmin @sprint-12-US-226646  @reassignment
  Scenario: Validate Admin user should not able to see the reassign task of Organization Registration Approval from my task As a Admin
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-source"
    And I select value "Automation EXE1" into field "input-target"
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly do not see value "Review Organization User Registration" for title "Task Type" inside table "---program:-:adminTaskReassignmentTableId---"

  @223512 @ValidatePMuserfromuserregistrationapprovalqueueshouldnotabletoseethereassigntaskofIndividualRegistrationApprovalinReassignTask @sprint-12-US-226646  @reassignment
  Scenario: Validate PM user from user registration approval queue should not able to see the reassign task of Individual Registration Approval in Reassign Task
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Confirmation Message |
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:uniqueEmailID1}" in "{grantor_tableId:SubrecipientIndRegistration}" panel
    And I save the value from row "1" for column name "Full Name" as "UserFullName" from flex table "{grantor_tableId:SubrecipientIndRegistration}"
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:UserFullName}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "Review Individual User Registration" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"

  @223616 @ValidateAdminusershouldnotabletoseethereassigntaskofIndividualRegistrationApprovalfromAllTasksAsaAdmin @sprint-12-US-226646  @reassignment
  Scenario: Validate Admin user should not able to see the reassign task of Individual Registration Approval from All Tasks As a Admin
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Confirmation Message |
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:uniqueEmailID1}" in "{grantor_tableId:SubrecipientIndRegistration}" panel
    And I save the value from row "1" for column name "Full Name" as "UserFullName" from flex table "{grantor_tableId:SubrecipientIndRegistration}"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-source"
    And I select value "Automation EXE1" into field "input-target"
    When I perform quick search for "{SavedValue:UserFullName}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly do not see value "Review Individual User Registration" for title "Task Type" inside table "---program:-:adminTaskReassignmentTableId---"

  @452446 @452447 @452448 @452449 @452450 @452451 @452452 @ValidateLoginPageabletoseeOranizationandIndividualbuttononexternalregistrationpageusingtheExternalsiteregistrationUrl @Sprint-16-US-416690 @ErrorMsgTest
  Scenario: Validate Login Page able to see Oranization and Individual button on external registration page using the External site registration Url
    When I am on "SUBPORTAL" portal
    Then I softly see button "Organization" on login page
    Then I softly see button "Individual" on login page
    And I click on button "Organization" inside login page
    #452447
    Then I softly see "Register As Organization on EGMS" opens in overLay window
    Then I softly do not see "Register As Individual on EGMS" opens in overLay window
    #452448
    And I close modal by clicking the top right x button
    And I click on button "Individual" inside login page
    Then I softly see "Register As Individual on EGMS" opens in overLay window
    #452449
    And I close modal by clicking the top right x button
    Given I begin "Individual" registration as "Register As Individual"
    And I wait for "2" seconds
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Disagree" in the page details
    Then I softly see button "Organization" on login page
    Then I softly see button "Individual" on login page
    #452450
    Given I begin "Individual" registration as "Register As Individual"
    And I wait for "2" seconds
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
    #452451
    When I click on "Disagree" in the page details
    Then I softly see button "Organization" on login page
    Then I softly see button "Individual" on login page
    #452452
    Given I begin "Individual" registration as "Register As Individual"
    And I wait for "2" seconds
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Step 1 of 2" in the page details
    Then I softly see field "Social Security Number (SSN)" inside page block
    Then I softly see asterisk mark on "Social Security Number (SSN)"
    Then I softly see field "Email" inside page block
    Then I softly see asterisk mark on "Email"
    Then I softly see field "Vendor ID" inside page block
    Then I softly do not see asterisk mark on "Vendor ID"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Social Security Number (SSN) is required. |
      | To Save, Email is required.                        |

  @452453 @INDRegVerifyfromorganizationpagewithvaliddataonclicksavebuttonredirecttoregistrationpage @sprint-16-US-416690
  Scenario: IND Reg : Verify from organization page with valid data   on click save button redirect  to registration page
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    Then I softly see fields "PrimaryRepFirstName__c" is visible
    Then I softly see fields "PrimaryRepLastName__c" is visible
    Then I softly see fields "PrimaryRepAddress1__c" is visible
    Then I softly see fields "PrimaryRepCity__c" is visible
    Then I softly see fields "PrimaryRepState__c" is visible
    Then I softly see fields "PrimaryRepZipCode__c" is visible
    Then I softly see fields "PrimaryRepCountry__c" is visible
    Then I softly see fields "PrimaryRepPhone__c" is visible
    Then I softly see fields "SameAsOrganizationAddress__c" is visible
    Then I softly see fields "PaymentAddressline1__c" is visible
    Then I softly see fields "PaymentAddressCity__c" is visible
    Then I softly see fields "PaymentAddressState__c" is visible
    Then I softly see fields "PaymentAddressZipCode__c" is visible
    Then I softly see fields "PaymentAddressCounty__c" is visible
    When I "Collapse" page block contaninig value "Primary Representative Information"
    Then I softly do not see fields "PrimaryRepFirstName__c" is visible
    When I "Expanded" page block contaninig value "Primary Representative Information"
    Then I softly see fields "PrimaryRepFirstName__c" is visible
    When I "Collapse" page block contaninig value "Profile Description"
    Then I softly do not see fields "ExternalReviewerProfileDescription__c" is visible
    When I "Expanded" page block contaninig value "Profile Description"
    Then I softly see fields "ExternalReviewerProfileDescription__c" is visible
    When I "Collapse" page block contaninig value "Payment Address"
    Then I softly do not see fields "SameAsOrganizationAddress__c" is visible
    When I "Expanded" page block contaninig value "Payment Address"
    Then I softly see fields "SameAsOrganizationAddress__c" is visible

  @452454 @INDRegVerifyinpaymentaddrresssectioninSameasPrimaryRepresentativeInformationDropdownselectYesthenfieldsunabletosee @sprint-16-US-416690
  Scenario: IND Reg : Verify in payment addrress section ,in Same as Primary Representative Information?  Drop down select Yes then fields unable to see.
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    Then I softly do not see fields "PaymentAddressLine1__c" is visible
    Then I softly do not see fields "PaymentAddressCity__c" is visible
    Then I softly do not see fields "PaymentAddressState__c" is visible
    Then I softly do not see fields "PaymentAddressZipCode__c" is visible
    Then I softly do not see fields "PaymentAddressCounty__c" is visible

  @452455 @INDRegVerifyinpaymentaddrresssectioninSameasPrimaryRepresentativeInformationDropdownselectNothenfieldsunabletosee @sprint-16-US-416690
  Scenario: IND Reg : Verify in payment addrress section ,in Same as Primary Representative Information? Drop down select No then fields unable to see.
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "No" into field "SameAsOrganizationAddress__c"
    And I wait for "3" seconds
    Then I softly see fields "PaymentAddressline1__c" is visible
    Then I softly see fields "PaymentAddressCity__c" is visible
    Then I softly see fields "PaymentAddressState__c" is visible
    Then I softly see fields "PaymentAddressZipCode__c" is visible
    Then I softly see fields "PaymentAddressCounty__c" is visible

  @452457 @INDRegVerifyonclicksavefromregistration2of2pagethenitredirecttocaptchapage @sprint-16-US-416690
  Scenario: IND Reg : Verify on click save from  registration 2 of 2 page then it redirect to captcha page.
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I can see top right button "Back" in page detail
    Then I can see top right button "Submit" in page detail

  @452464 @INDRegVerifyINDorgabletoseeinpendingIndividualsubrecipientregistration @sprint-16-US-416690
  Scenario: IND Reg : Verify IND org able to see in pending Individual subrecipient registration.
    Given I begin "Individual" registration as "Register As Individual"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    When I enter value as "{SavedValue:uniqueEmailID1}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Confirmation Message |
    And I am on "INTERNAL" portal
    And I login to "Grantor" app as "PM" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:uniqueEmailID1}" in "{grantor_tableId:SubrecipientIndRegistration}" panel
    And I save the value from row "1" for column name "Full Name" as "UserFullName" from flex table "{grantor_tableId:SubrecipientIndRegistration}"
    And I wait for "2" seconds
    When I click on "Start" icon for "{SavedValue:UserFullName}" inside flex table with id "{grantor_tableId:SubrecipientIndRegistration}"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject |

  @453423 @verifyonceloginwithINDprofilealltabsandsection @sprint-16-US-416690
  Scenario:verify once login with IND profile all tabs and section.
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "IND" user
    And I navigate to "Home" tab
    When I navigate to "Individual Profile" content inside "Organization" subheader on left panel
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Risk Assessment" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Description" page block displayed
    Then I softly see "Additional Information" page block displayed
    Then I softly see "Additional Address" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "System Information" page block displayed
    When I "Collapse" page block contaninig value "Description"
    Then I softly do not see fields "BillingCity" is visible
    When I "Expanded" page block contaninig value "Description"
    Then I softly see fields "BillingCity" is visible
    When I "Collapse" page block contaninig value "Additional Information"
    Then I softly do not see fields "PointofContactUser__c" is visible
    When I "Expanded" page block contaninig value "Additional Information"
    Then I softly see fields "PointofContactUser__c" is visible
    When I "Collapse" page block contaninig value "Additional Address"
    Then I softly do not see fields "Name" is visible




