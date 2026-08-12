@organizationRegistrationPageNysed @EmailNotificationOrganizationRegistration @EmailNotification @skipOnJenkins
Feature: Validate all registration related scenarios

  @538633 @538634 @539780 @536126 @NYSEDSprint-15 @US-539637 @NYSEDSprint-16 @US-537178 @NYSEDSprint-13 @US-534545 @M05 @Bug-Ticket-537350
  Scenario:Verify that the user can not proceed with organization registration if we use a duplicate Email ID (External User Email ID) from the same org
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "EINText__c"
#    And I enter value "W56KZ32MWEG5" into field "UEISam__c"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "UserRegistrationStep3" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "{SavedValue:AutomationContactEmail}" into field "PrimaryRepEmail__c"
    And I pause execution for "2" seconds
    When I click on "Save" in the page details
    #538633
    Then I softly see the following messages in the page details contains:
      | A contact, user, or organization has already registered with this email address. Enter a different address or contact the Help Desk at govgrantssupport@reisystems.com for further assistance. |
    And I wait for "2" seconds
    And I clear the value from field "PrimaryRepEmail__c"
    And I enter value "{SavedValue:QAOrgDuplicateEmailId}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    #538634
    Then I softly cannot see the following messages in the page details contains:
      | A contact, user, or organization has already registered with this email address. Enter a different address or contact the Help Desk at govgrantssupport@reisystems.com for further assistance. |
    And I wait for "2" seconds
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I wait for "10" seconds
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipient Organizations - Pending"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I wait for "2" seconds
    When I click on "Update Organization Fields" in the page details
    When I enter in modal value "2" into field "NYSED_LicenseCap__c"
    And I click modal button "Save and Close"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I pause execution for "300" seconds
    And I checkout to yopmail with mailid "{SavedValue:QAOrgDuplicateEmailId}"
    And I see the mail subject is as follows :
      """
      Sandbox: Welcome to GovGrants 3.0 Recipient Portal
      """
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    #538634
    Then I see the header is "Subrecipient Organization" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime}" in the page details
    And I pause execution for "3" seconds
    #539780
    Then I softly see field "Not For Profit" as "NA"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime}" inside table
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I pause execution for "2" seconds
    #539780 #536126
    Then I see only the following ordered options in dropdown field "NOT_FOR_PROFIT__c" :
      | --None-- | NA | Yes | No |
    And I enter value "Yes" into field "NOT_FOR_PROFIT__c"
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    #539780
    Then I softly see field "Not For Profit" as "Yes"

  @538600 @536724 @NYSEDSprint-13 @NYSEDSprint-16 @US-537178 @US-536724 @M05 @Bug-Ticket-537350
  Scenario Outline:Verify that on active organization, Submit and Certify OR LEA Admin Role user can create & activate a new User if we use a duplicate Email ID from the another org
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "2" seconds
    When I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    When I enter in modal value "8967859036" into field "Phone"
    And I enter value "{SavedValue:QAOrgContactEmailId}" into field "Email"
    And I click modal button "Save"
    #538600
    Then I softly cannot see the following messages in the page details contains:
      | Contacts must have unique email addresses. The email address entered is associated with an existing contact. |
    And I wait for "2" seconds
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} Contact" inside flex table with id "---home:-:userContactsTableId---"
    And I click modal button "Send"
    And I wait for "7" seconds
    #538600
    Then I see the text "Email Sent Successfully." in modal
    And I wait for "2" seconds
    And I click modal button "Close"
    And I refresh the page
    And I pause execution for "300" seconds
    And I checkout to yopmail with mailid "{SavedValue:QAOrgContactEmailId}"
    #536724
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Invitation to be a user of GFMS
      """
    And I click on hyperlink containing value "here"
    And I wait for "15" seconds
    And I switch to tab number "1"
    And I wait for "15" seconds
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    #536724
    Then I softly cannot see field "Organization Name" inside page block
    Then I softly see field "Popular Name" as "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}"
    Then I softly see that "Popular Name" rendered in view mode only
    Then I softly do not see "Primary Representative Information" page block displayed
    Then I softly do not see "Secondary Representative Information" page block displayed
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Confirmation Message |
    And I pause execution for "300" seconds
    And I checkout to yopmail with mailid "{SavedValue:QAOrgContactEmailId}"
    And I see the mail subject is as follows :
      """
      Sandbox: Welcome to GovGrants 3.0 Recipient Portal
      """
    And I pause execution for "5" seconds
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "3" seconds
    Then I softly see field "Status" as "Active"

    Examples:
      | UserType   |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA |

  @538582 @NYSEDSprint-16 @US-537178 @M05 @Bug-Ticket-537350
  Scenario Outline:Verify that on active organization, Internal user can create & activate a new Submit and Certify Role user if we use a duplicate Email ID from another org
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" inside table
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    When I enter in modal value "8967859036" into field "Phone"
    And I enter value "{SavedValue:QAOrgContactEmailId}" into field "Email"
    And I click modal button "Save"
    #538582
    Then I softly cannot see the following messages in the page details contains:
      | Contacts must have unique email addresses. The email address entered is associated with an existing contact. |
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "2" seconds
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} Contact" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "4" seconds
    And I click modal button "Send"
    And I wait for "7" seconds
    #538582
    Then I see the text "Email Sent Successfully." in modal
    And I wait for "2" seconds
    And I click modal button "Close"
    And I refresh the page
    And I pause execution for "300" seconds
    And I checkout to yopmail with mailid "{SavedValue:QAOrgContactEmailId}"
    #538582
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Invitation to be a user of GFMS
      """
    And I click on hyperlink containing value "here"
    And I wait for "15" seconds
    And I switch to tab number "1"
    And I wait for "15" seconds
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Confirmation Message |
    And I pause execution for "300" seconds
    And I checkout to yopmail with mailid "{SavedValue:QAOrgContactEmailId}"
    And I see the mail subject is as follows :
      """
      Sandbox: Welcome to GovGrants 3.0 Recipient Portal.
      """
    And I pause execution for "5" seconds
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    And I select "My Profile" from user dropdown
    Then I see the header is "{SavedValue:Automation Runtime} Contact" in the page details

    Examples:
      | UserType   |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA |