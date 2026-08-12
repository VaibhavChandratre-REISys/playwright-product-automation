@GranteeInternalContact @GranteePreAwardRegression
Feature: Validate all scenarios for Internal Contact

  @482136 @ValidateAuditorusershouldhaveonlyviewaccess @P4_Grantee @AUDITOR_Grantee @GRegression1
  Scenario Outline: Validate Auditor user should have only view access
    When I login to "Grantee" app as "GRANTEE PM" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I click toggle button to select "All Contacts"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:InternalContacts---"
    When I enter in modal value "Department of Product" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "FirstName"
    And I enter in modal value "Contact" into field "LastName"
    And I enter in modal value "8967894567" into field "Phone"
    And I enter in modal value "9580378904" into field "MobilePhone"
    And I enter in modal value "VA Street" into field "MailingStreet"
    And I enter in modal value "Jordan Road" into field "Address2__c"
    And I enter in modal value "AK: Alaska" into field "State__c"
    And I enter in modal value "123" into field "CongressionalDistrict__c"
    And I enter in modal value "Calif" into field "MailingCity"
    And I enter in modal value "USA" into field "MailingCountry"
    And I enter in modal value "California" into field "County__c"
    And I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    And I enter in modal value "12345" into field "MailingPostalCode"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I save the field labeled "Organization" as "Organization" on modal
    And I save the field labeled "Type" as "Type" on modal
    And I save the field labeled "First Name" as "FirstName" on modal
    And I save the field labeled "Last Name" as "LastName" on modal
    And I save the field labeled "Phone" as "Phone" on modal
    And I save the field labeled "Mobile Phone" as "MobilePhone" on modal
    And I save the field labeled "Email" as "Email" on modal
    And I save the field labeled "Address Line 1" as "AddressLine1" on modal
    And I save the field labeled "Address Line 2" as "AddressLine2" on modal
    And I save the field labeled "State" as "State" on modal
    And I save the field labeled "Congressional District" as "CongressionalDistrict" on modal
    And I save the field labeled "City" as "City" on modal
    And I save the field labeled "Country" as "Country" on modal
    And I save the field labeled "County" as "County" on modal
    And I save the field labeled "4-Digit Zip Code Extension" as "4DigitZipCodeExtension" on modal
    And I save the field labeled "Zip Code" as "ZipCode" on modal
    When I close "Create Contact" modal by clicking the top right x button
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---grantee_tableId:-:InternalContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime} Contact" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    And I re-login to "Grantee" app as "<userAuditor>" user on "INTERNAL" portal
    When I navigate to "Home" tab
    Then I see "External" inside "Contacts" is displayed
    Then I see "Internal" inside "Contacts" is displayed
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "All Contacts" inside flex table id "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "My Organization’s Contact" inside flex table id "---grantee_tableId:-:InternalContacts---"
    And I click toggle button to select "All Contacts"
    When I click on parallel lines menu bar with data target value "All Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I click on page navigation arrow "---grantee_tableId:-:InternalContacts---" for table id "Next"
    Then I see table "---grantee_tableId:-:InternalContacts---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:InternalContacts---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:InternalContacts---"
    And I click on advance filter of table id "---grantee_tableId:-:InternalContacts---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:InternalContacts---" for LWC
      | Full Name | contains | Grantee PO |
    Then I softly see value "Grantee PO" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    And I click on top right button "Clear" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:InternalContacts---"
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---grantee_tableId:-:InternalContacts---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime} Contact" inside table
    Then I softly see "Contact View" opens in overLay window
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Address Information" page block displayed
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    Then I softly see field on modal "Organization" inside page block
    Then I softly see link "{SavedValue:Organization}" inside Page block
    Then I see field "Organization" as "{SavedValue:Organization}" on modal
    And I click on hyperlink for modal containing value "{SavedValue:Organization}"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "{SavedValue:Organization}" in the page details
    And I click on back arrow
    Then I softly see field on modal "Type" inside page block
    Then I see field "Type" as "{SavedValue:Type}" on modal
    Then I see field "First Name" as "{SavedValue:FirstName}" on modal
    Then I see field "Last Name" as "{SavedValue:LastName}" on modal
    Then I see field "Phone" as "{SavedValue:Phone}" on modal
    Then I see field "Mobile Phone" as "{SavedValue:MobilePhone}" on modal
    Then I see field "Email" as "{SavedValue:Email}" on modal
    Then I see field "Address Line 1" as "{SavedValue:AddressLine1}" on modal
    Then I see field "Address Line 2" as "{SavedValue:AddressLine2}" on modal
    Then I see field "State" as "{SavedValue:State}" on modal
    Then I see field "Congressional District" as "{SavedValue:CongressionalDistrict}" on modal
    Then I see field "City" as "{SavedValue:City}" on modal
    Then I see field "Country" as "{SavedValue:Country}" on modal
    Then I see field "County" as "{SavedValue:County}" on modal
    Then I see field "4-Digit Zip Code Extension" as "{SavedValue:4DigitZipCodeExtension}" on modal
    Then I see field "Zip Code" as "{SavedValue:ZipCode}" on modal
    And I save the field labeled "Created By" as "CreatedBy" on modal
    And I save the field labeled "Created Date" as "CreatedDate" on modal
    And I save the field labeled "Last Modified By" as "LastModifiedBy" on modal
    And I save the field labeled "Last Modified Date" as "LastModifiedDate" on modal
    Then I see field "Created By" as "{SavedValue:CreatedBy}" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I see field "Created Date" as "{SavedValue:CreatedDate}" on modal
    Then I see field "Last Modified By" as "{SavedValue:LastModifiedBy}" on modal
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I see field "Last Modified Date" as "{SavedValue:LastModifiedDate}" on modal
    Then I cannot see top right button "Edit" in page detail
    When I close "Contact View" modal by clicking the top right x button
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---grantee_tableId:-:InternalContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime} Contact" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"

    Examples:
      | userAuditor     |
      | GRANTEE AUDITOR |

  @482130 @ValidatePMusershouldabletosaveandcreateinternalcontact @PO_Grantee @P2_Grantee @GRegression2
  Scenario Outline: Validate PO/FO/EXE/FD/ADMIN user should able to save and create internal contact
    When I login to "Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    Then I see "External" inside "Contacts" is displayed
    Then I see "Internal" inside "Contacts" is displayed
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I click toggle button to select "All Contacts"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "All Contacts" inside flex table id "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "My Organization’s Contact" inside flex table id "---grantee_tableId:-:InternalContacts---"
    When I click on parallel lines menu bar with data target value "All Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I click on page navigation arrow "---grantee_tableId:-:InternalContacts---" for table id "Next"
    Then I see table "---grantee_tableId:-:InternalContacts---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:InternalContacts---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:InternalContacts---"
    And I click on advance filter of table id "---grantee_tableId:-:InternalContacts---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:InternalContacts---" for LWC
      | Full Name | contains | Grantee PO |
    Then I softly see value "Grantee PO" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Create Contact" opens in overLay window
    And I wait for "2" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Address Information" page block displayed
    Then I softly see field on modal "Organization" inside page block
    Then I softly see asterisk mark on "Organization"
    Then I softly see field on modal "Title" inside page block
    Then I softly do not see asterisk mark on "Title"
    Then I softly see fields "Title" is in edit mode
    Then I softly see field on modal "First Name" inside page block
    Then I softly see asterisk mark on "First Name"
    Then I softly see fields "FirstName" is in edit mode
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see asterisk mark on "Last Name"
    Then I softly see fields "LastName" is in edit mode
    Then I softly see field on modal "Phone" inside page block
    Then I softly see asterisk mark on "Phone"
    Then I softly see fields "Phone" is in edit mode
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly do not see asterisk mark on "Mobile Phone"
    Then I softly see fields "MobilePhone" is in edit mode
    Then I softly see asterisk mark on "Email"
    Then I softly see field on modal "Email" inside page block
    Then I softly see fields "Email" is in edit mode
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see asterisk mark on "Address Line 1"
    Then I softly see fields "MailingStreet" is in edit mode
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly do not see asterisk mark on "Address Line 2"
    Then I softly see fields "Address2__c" is in edit mode
    Then I softly see field on modal "State" inside page block
    Then I softly see asterisk mark on "State"
    Then I softly see fields "State__c" is in edit mode
    Then I softly see field on modal "Congressional District" inside page block
    Then I softly do not see asterisk mark on "Congressional District"
    Then I softly see fields "CongressionalDistrict__c" is in edit mode
    Then I softly see field on modal "City" inside page block
    Then I softly see asterisk mark on "City"
    Then I softly see fields "MailingCity" is in edit mode
    Then I softly see asterisk mark on "Country"
    Then I softly see field on modal "Country" inside page block
    Then I softly see fields "MailingCountry" is in edit mode
    Then I softly do not see asterisk mark on "County"
    Then I softly see field on modal "County" inside page block
    Then I softly see fields "County__c" is in edit mode
    Then I softly do not see asterisk mark on "4-Digit Zip Code Extension"
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see fields "X4DigitZipCodeExtension__c" is in edit mode
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see field on modal "Zip Code" inside page block
    Then I softly see fields "MailingPostalCode" is in edit mode
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Organization is required in the Contact Information section.   |
      | To Save, Project Role is required in the Contact Information section.   |
      | To Save, First Name is required in the Contact Information section.     |
      | To Save, Last Name is required in the Contact Information section.      |
      | To Save, Phone is required in the Contact Information section.          |
      | To Save, Email is required in the Contact Information section.          |
      | To Save, Address Line 1 is required in the Address Information section. |
      | To Save, State is required in the Address Information section.          |
      | To Save, City is required in the Address Information section.           |
      | To Save, Country is required in the Address Information section.        |
      | To Save, Zip Code is required in the Address Information section.       |
    When I enter in modal value "Department of Product" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "FirstName"
    And I enter in modal value "Contact" into field "LastName"
    And I enter in modal value "67895678" into field "Phone"
    And I enter in modal value "8978968909" into field "MobilePhone"
    And I enter in modal value "Automation Test" into field "Email"
    And I enter in modal value "VA Street" into field "MailingStreet"
    And I enter in modal value "Jordan Road" into field "Address2__c"
    And I enter in modal value "AK: Alaska" into field "State__c"
    And I enter in modal value "123" into field "CongressionalDistrict__c"
    And I enter in modal value "56" into field "MailingCity"
    And I enter in modal value "USA" into field "MailingCountry"
    And I enter in modal value "California" into field "County__c"
    And I enter in modal value "123" into field "X4DigitZipCodeExtension__c"
    And I enter in modal value "1234" into field "MailingPostalCode"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Email: invalid email address: Automation Test |
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    And I enter in modal value "Calif" into field "MailingCity"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Phone Number. |
    And I enter in modal value "8967894567" into field "Phone"
    And I enter in modal value "897" into field "MobilePhone"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Mobile Phone Number. |
    And I enter in modal value "9580378904" into field "MobilePhone"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 5 Digit Zip Code |
    And I enter in modal value "12345" into field "MailingPostalCode"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 4 Digit Zip Code Extension. |
    And I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    Then I can softly see modal button "Save"
    And I click modal button "Save"
    Then I softly see field on modal "Organization" inside page block
    Then I softly see link "Department of Product" inside Page block
    Then I see field "Organization" as "Department of Product" on modal
    And I click on hyperlink for modal containing value "Department of Product"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Department of Product" in the page details
    And I click on back arrow
    Then I softly see field on modal "Type" inside page block
    Then I see field "Type" as "Grantee" on modal
    Then I softly see field on modal "Created By" inside page block
    And I save the field labeled "Created By" as "CreatedBy" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I softly see field on modal "Created Date" inside page block
    Then I softly see field on modal "Last Modified By" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly see field on modal "Last Modified Date" inside page block
    Then I can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter in modal value "20171" into field "MailingPostalCode"
    And I click modal button "Save"
    And I wait for "4" seconds
    Then I see field "Zip Code" as "20171" on modal
    When I close "Create Contact" modal by clicking the top right x button
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---grantee_tableId:-:InternalContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime} Contact" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Examples:
      | userType   |
      | GRANTEE PO |

  @482131 @ValidatePMusershouldabletosaveandcreateinternalcontact @EXE_Grantee @P1_Grantee @GRegression1
  Scenario Outline: Validate EXE user should able to save and create internal contact
    When I login to "Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    Then I see "External" inside "Contacts" is displayed
    Then I see "Internal" inside "Contacts" is displayed
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I click toggle button to select "All Contacts"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "All Contacts" inside flex table id "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "My Organization’s Contact" inside flex table id "---grantee_tableId:-:InternalContacts---"
    When I click on parallel lines menu bar with data target value "All Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I click on page navigation arrow "---grantee_tableId:-:InternalContacts---" for table id "Next"
    Then I see table "---grantee_tableId:-:InternalContacts---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:InternalContacts---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:InternalContacts---"
    And I click on advance filter of table id "---grantee_tableId:-:InternalContacts---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:InternalContacts---" for LWC
      | Full Name | contains | Grantee PO |
    Then I softly see value "Grantee PO" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Create Contact" opens in overLay window
    And I wait for "2" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Address Information" page block displayed
    Then I softly see field on modal "Organization" inside page block
    Then I softly see asterisk mark on "Organization"
    Then I softly see field on modal "Title" inside page block
    Then I softly do not see asterisk mark on "Title"
    Then I softly see fields "Title" is in edit mode
    Then I softly see field on modal "First Name" inside page block
    Then I softly see asterisk mark on "First Name"
    Then I softly see fields "FirstName" is in edit mode
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see asterisk mark on "Last Name"
    Then I softly see fields "LastName" is in edit mode
    Then I softly see field on modal "Phone" inside page block
    Then I softly see asterisk mark on "Phone"
    Then I softly see fields "Phone" is in edit mode
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly do not see asterisk mark on "Mobile Phone"
    Then I softly see fields "MobilePhone" is in edit mode
    Then I softly see asterisk mark on "Email"
    Then I softly see field on modal "Email" inside page block
    Then I softly see fields "Email" is in edit mode
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see asterisk mark on "Address Line 1"
    Then I softly see fields "MailingStreet" is in edit mode
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly do not see asterisk mark on "Address Line 2"
    Then I softly see fields "Address2__c" is in edit mode
    Then I softly see field on modal "State" inside page block
    Then I softly see asterisk mark on "State"
    Then I softly see fields "State__c" is in edit mode
    Then I softly see field on modal "Congressional District" inside page block
    Then I softly do not see asterisk mark on "Congressional District"
    Then I softly see fields "CongressionalDistrict__c" is in edit mode
    Then I softly see field on modal "City" inside page block
    Then I softly see asterisk mark on "City"
    Then I softly see fields "MailingCity" is in edit mode
    Then I softly see asterisk mark on "Country"
    Then I softly see field on modal "Country" inside page block
    Then I softly see fields "MailingCountry" is in edit mode
    Then I softly do not see asterisk mark on "County"
    Then I softly see field on modal "County" inside page block
    Then I softly see fields "County__c" is in edit mode
    Then I softly do not see asterisk mark on "4-Digit Zip Code Extension"
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see fields "X4DigitZipCodeExtension__c" is in edit mode
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see field on modal "Zip Code" inside page block
    Then I softly see fields "MailingPostalCode" is in edit mode
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Organization is required in the Contact Information section.   |
      | To Save, Project Role is required in the Contact Information section.   |
      | To Save, First Name is required in the Contact Information section.     |
      | To Save, Last Name is required in the Contact Information section.      |
      | To Save, Phone is required in the Contact Information section.          |
      | To Save, Email is required in the Contact Information section.          |
      | To Save, Address Line 1 is required in the Address Information section. |
      | To Save, State is required in the Address Information section.          |
      | To Save, City is required in the Address Information section.           |
      | To Save, Country is required in the Address Information section.        |
      | To Save, Zip Code is required in the Address Information section.       |
    When I enter in modal value "Department of Product" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "FirstName"
    And I enter in modal value "Contact" into field "LastName"
    And I enter in modal value "67895678" into field "Phone"
    And I enter in modal value "8978968909" into field "MobilePhone"
    And I enter in modal value "Automation Test" into field "Email"
    And I enter in modal value "VA Street" into field "MailingStreet"
    And I enter in modal value "Jordan Road" into field "Address2__c"
    And I enter in modal value "AK: Alaska" into field "State__c"
    And I enter in modal value "123" into field "CongressionalDistrict__c"
    And I enter in modal value "56" into field "MailingCity"
    And I enter in modal value "USA" into field "MailingCountry"
    And I enter in modal value "California" into field "County__c"
    And I enter in modal value "123" into field "X4DigitZipCodeExtension__c"
    And I enter in modal value "1234" into field "MailingPostalCode"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Email: invalid email address: Automation Test |
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    And I enter in modal value "Calif" into field "MailingCity"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Phone Number. |
    And I enter in modal value "8967894567" into field "Phone"
    And I enter in modal value "897" into field "MobilePhone"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Mobile Phone Number. |
    And I enter in modal value "9580378904" into field "MobilePhone"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 5 Digit Zip Code |
    And I enter in modal value "12345" into field "MailingPostalCode"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 4 Digit Zip Code Extension. |
    And I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    Then I can softly see modal button "Save"
    And I click modal button "Save"
    Then I softly see field on modal "Organization" inside page block
    Then I softly see link "Department of Product" inside Page block
    Then I see field "Organization" as "Department of Product" on modal
    And I click on hyperlink for modal containing value "Department of Product"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Department of Product" in the page details
    And I click on back arrow
    Then I softly see field on modal "Type" inside page block
    Then I see field "Type" as "Grantee" on modal
    Then I softly see field on modal "Created By" inside page block
    And I save the field labeled "Created By" as "CreatedBy" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I softly see field on modal "Created Date" inside page block
    Then I softly see field on modal "Last Modified By" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly see field on modal "Last Modified Date" inside page block
    Then I can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter in modal value "20171" into field "MailingPostalCode"
    And I click modal button "Save"
    And I wait for "4" seconds
    Then I see field "Zip Code" as "20171" on modal
    When I close "Create Contact" modal by clicking the top right x button
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---grantee_tableId:-:InternalContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime} Contact" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Examples:
      | userType    |
      | GRANTEE EXE |

  @482132 @ValidatePMusershouldabletosaveandcreateinternalcontact @FO_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Validate FO user should able to save and create internal contact
    When I login to "Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    Then I see "External" inside "Contacts" is displayed
    Then I see "Internal" inside "Contacts" is displayed
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I click toggle button to select "All Contacts"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "All Contacts" inside flex table id "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "My Organization’s Contact" inside flex table id "---grantee_tableId:-:InternalContacts---"
    When I click on parallel lines menu bar with data target value "All Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I click on page navigation arrow "---grantee_tableId:-:InternalContacts---" for table id "Next"
    Then I see table "---grantee_tableId:-:InternalContacts---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:InternalContacts---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:InternalContacts---"
    And I click on advance filter of table id "---grantee_tableId:-:InternalContacts---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:InternalContacts---" for LWC
      | Full Name | contains | Grantee PO |
    Then I softly see value "Grantee PO" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Create Contact" opens in overLay window
    And I wait for "2" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Address Information" page block displayed
    Then I softly see field on modal "Organization" inside page block
    Then I softly see asterisk mark on "Organization"
    Then I softly see field on modal "Title" inside page block
    Then I softly do not see asterisk mark on "Title"
    Then I softly see fields "Title" is in edit mode
    Then I softly see field on modal "First Name" inside page block
    Then I softly see asterisk mark on "First Name"
    Then I softly see fields "FirstName" is in edit mode
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see asterisk mark on "Last Name"
    Then I softly see fields "LastName" is in edit mode
    Then I softly see field on modal "Phone" inside page block
    Then I softly see asterisk mark on "Phone"
    Then I softly see fields "Phone" is in edit mode
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly do not see asterisk mark on "Mobile Phone"
    Then I softly see fields "MobilePhone" is in edit mode
    Then I softly see asterisk mark on "Email"
    Then I softly see field on modal "Email" inside page block
    Then I softly see fields "Email" is in edit mode
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see asterisk mark on "Address Line 1"
    Then I softly see fields "MailingStreet" is in edit mode
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly do not see asterisk mark on "Address Line 2"
    Then I softly see fields "Address2__c" is in edit mode
    Then I softly see field on modal "State" inside page block
    Then I softly see asterisk mark on "State"
    Then I softly see fields "State__c" is in edit mode
    Then I softly see field on modal "Congressional District" inside page block
    Then I softly do not see asterisk mark on "Congressional District"
    Then I softly see fields "CongressionalDistrict__c" is in edit mode
    Then I softly see field on modal "City" inside page block
    Then I softly see asterisk mark on "City"
    Then I softly see fields "MailingCity" is in edit mode
    Then I softly see asterisk mark on "Country"
    Then I softly see field on modal "Country" inside page block
    Then I softly see fields "MailingCountry" is in edit mode
    Then I softly do not see asterisk mark on "County"
    Then I softly see field on modal "County" inside page block
    Then I softly see fields "County__c" is in edit mode
    Then I softly do not see asterisk mark on "4-Digit Zip Code Extension"
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see fields "X4DigitZipCodeExtension__c" is in edit mode
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see field on modal "Zip Code" inside page block
    Then I softly see fields "MailingPostalCode" is in edit mode
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Organization is required in the Contact Information section.   |
      | To Save, Project Role is required in the Contact Information section.   |
      | To Save, First Name is required in the Contact Information section.     |
      | To Save, Last Name is required in the Contact Information section.      |
      | To Save, Phone is required in the Contact Information section.          |
      | To Save, Email is required in the Contact Information section.          |
      | To Save, Address Line 1 is required in the Address Information section. |
      | To Save, State is required in the Address Information section.          |
      | To Save, City is required in the Address Information section.           |
      | To Save, Country is required in the Address Information section.        |
      | To Save, Zip Code is required in the Address Information section.       |
    When I enter in modal value "Department of Product" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "FirstName"
    And I enter in modal value "Contact" into field "LastName"
    And I enter in modal value "67895678" into field "Phone"
    And I enter in modal value "8978968909" into field "MobilePhone"
    And I enter in modal value "Automation Test" into field "Email"
    And I enter in modal value "VA Street" into field "MailingStreet"
    And I enter in modal value "Jordan Road" into field "Address2__c"
    And I enter in modal value "AK: Alaska" into field "State__c"
    And I enter in modal value "123" into field "CongressionalDistrict__c"
    And I enter in modal value "56" into field "MailingCity"
    And I enter in modal value "USA" into field "MailingCountry"
    And I enter in modal value "California" into field "County__c"
    And I enter in modal value "123" into field "X4DigitZipCodeExtension__c"
    And I enter in modal value "1234" into field "MailingPostalCode"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Email: invalid email address: Automation Test |
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    And I enter in modal value "Calif" into field "MailingCity"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Phone Number. |
    And I enter in modal value "8967894567" into field "Phone"
    And I enter in modal value "897" into field "MobilePhone"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Mobile Phone Number. |
    And I enter in modal value "9580378904" into field "MobilePhone"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 5 Digit Zip Code |
    And I enter in modal value "12345" into field "MailingPostalCode"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 4 Digit Zip Code Extension. |
    And I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    Then I can softly see modal button "Save"
    And I click modal button "Save"
    Then I softly see field on modal "Organization" inside page block
    Then I softly see link "Department of Product" inside Page block
    Then I see field "Organization" as "Department of Product" on modal
    And I click on hyperlink for modal containing value "Department of Product"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Department of Product" in the page details
    And I click on back arrow
    Then I softly see field on modal "Type" inside page block
    Then I see field "Type" as "Grantee" on modal
    Then I softly see field on modal "Created By" inside page block
    And I save the field labeled "Created By" as "CreatedBy" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I softly see field on modal "Created Date" inside page block
    Then I softly see field on modal "Last Modified By" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly see field on modal "Last Modified Date" inside page block
    Then I can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter in modal value "20171" into field "MailingPostalCode"
    And I click modal button "Save"
    And I wait for "4" seconds
    Then I see field "Zip Code" as "20171" on modal
    When I close "Create Contact" modal by clicking the top right x button
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---grantee_tableId:-:InternalContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime} Contact" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Examples:
      | userType   |
      | GRANTEE FO |

  @482133 @ValidatePMusershouldabletosaveandcreateinternalcontact @P3_Grantee @FD_Grantee @GRegression3
  Scenario Outline: Validate FD user should able to save and create internal contact
    When I login to "Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    Then I see "External" inside "Contacts" is displayed
    Then I see "Internal" inside "Contacts" is displayed
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I click toggle button to select "All Contacts"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "All Contacts" inside flex table id "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "My Organization’s Contact" inside flex table id "---grantee_tableId:-:InternalContacts---"
    When I click on parallel lines menu bar with data target value "All Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I click on page navigation arrow "---grantee_tableId:-:InternalContacts---" for table id "Next"
    Then I see table "---grantee_tableId:-:InternalContacts---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:InternalContacts---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:InternalContacts---"
    And I click on advance filter of table id "---grantee_tableId:-:InternalContacts---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:InternalContacts---" for LWC
      | Full Name | contains | Grantee PO |
    Then I softly see value "Grantee PO" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Create Contact" opens in overLay window
    And I wait for "2" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Address Information" page block displayed
    Then I softly see field on modal "Organization" inside page block
    Then I softly see asterisk mark on "Organization"
    Then I softly see field on modal "Title" inside page block
    Then I softly do not see asterisk mark on "Title"
    Then I softly see fields "Title" is in edit mode
    Then I softly see field on modal "First Name" inside page block
    Then I softly see asterisk mark on "First Name"
    Then I softly see fields "FirstName" is in edit mode
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see asterisk mark on "Last Name"
    Then I softly see fields "LastName" is in edit mode
    Then I softly see field on modal "Phone" inside page block
    Then I softly see asterisk mark on "Phone"
    Then I softly see fields "Phone" is in edit mode
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly do not see asterisk mark on "Mobile Phone"
    Then I softly see fields "MobilePhone" is in edit mode
    Then I softly see asterisk mark on "Email"
    Then I softly see field on modal "Email" inside page block
    Then I softly see fields "Email" is in edit mode
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see asterisk mark on "Address Line 1"
    Then I softly see fields "MailingStreet" is in edit mode
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly do not see asterisk mark on "Address Line 2"
    Then I softly see fields "Address2__c" is in edit mode
    Then I softly see field on modal "State" inside page block
    Then I softly see asterisk mark on "State"
    Then I softly see fields "State__c" is in edit mode
    Then I softly see field on modal "Congressional District" inside page block
    Then I softly do not see asterisk mark on "Congressional District"
    Then I softly see fields "CongressionalDistrict__c" is in edit mode
    Then I softly see field on modal "City" inside page block
    Then I softly see asterisk mark on "City"
    Then I softly see fields "MailingCity" is in edit mode
    Then I softly see asterisk mark on "Country"
    Then I softly see field on modal "Country" inside page block
    Then I softly see fields "MailingCountry" is in edit mode
    Then I softly do not see asterisk mark on "County"
    Then I softly see field on modal "County" inside page block
    Then I softly see fields "County__c" is in edit mode
    Then I softly do not see asterisk mark on "4-Digit Zip Code Extension"
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see fields "X4DigitZipCodeExtension__c" is in edit mode
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see field on modal "Zip Code" inside page block
    Then I softly see fields "MailingPostalCode" is in edit mode
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Organization is required in the Contact Information section.   |
      | To Save, Project Role is required in the Contact Information section.   |
      | To Save, First Name is required in the Contact Information section.     |
      | To Save, Last Name is required in the Contact Information section.      |
      | To Save, Phone is required in the Contact Information section.          |
      | To Save, Email is required in the Contact Information section.          |
      | To Save, Address Line 1 is required in the Address Information section. |
      | To Save, State is required in the Address Information section.          |
      | To Save, City is required in the Address Information section.           |
      | To Save, Country is required in the Address Information section.        |
      | To Save, Zip Code is required in the Address Information section.       |
    When I enter in modal value "Department of Product" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "FirstName"
    And I enter in modal value "Contact" into field "LastName"
    And I enter in modal value "67895678" into field "Phone"
    And I enter in modal value "8978968909" into field "MobilePhone"
    And I enter in modal value "Automation Test" into field "Email"
    And I enter in modal value "VA Street" into field "MailingStreet"
    And I enter in modal value "Jordan Road" into field "Address2__c"
    And I enter in modal value "AK: Alaska" into field "State__c"
    And I enter in modal value "123" into field "CongressionalDistrict__c"
    And I enter in modal value "56" into field "MailingCity"
    And I enter in modal value "USA" into field "MailingCountry"
    And I enter in modal value "California" into field "County__c"
    And I enter in modal value "123" into field "X4DigitZipCodeExtension__c"
    And I enter in modal value "1234" into field "MailingPostalCode"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Email: invalid email address: Automation Test |
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    And I enter in modal value "Calif" into field "MailingCity"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Phone Number. |
    And I enter in modal value "8967894567" into field "Phone"
    And I enter in modal value "897" into field "MobilePhone"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Mobile Phone Number. |
    And I enter in modal value "9580378904" into field "MobilePhone"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 5 Digit Zip Code |
    And I enter in modal value "12345" into field "MailingPostalCode"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 4 Digit Zip Code Extension. |
    And I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    Then I can softly see modal button "Save"
    And I click modal button "Save"
    Then I softly see field on modal "Organization" inside page block
    Then I softly see link "Department of Product" inside Page block
    Then I see field "Organization" as "Department of Product" on modal
    And I click on hyperlink for modal containing value "Department of Product"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Department of Product" in the page details
    And I click on back arrow
    Then I softly see field on modal "Type" inside page block
    Then I see field "Type" as "Grantee" on modal
    Then I softly see field on modal "Created By" inside page block
    And I save the field labeled "Created By" as "CreatedBy" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I softly see field on modal "Created Date" inside page block
    Then I softly see field on modal "Last Modified By" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly see field on modal "Last Modified Date" inside page block
    Then I can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter in modal value "20171" into field "MailingPostalCode"
    And I click modal button "Save"
    And I wait for "4" seconds
    Then I see field "Zip Code" as "20171" on modal
    When I close "Create Contact" modal by clicking the top right x button
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---grantee_tableId:-:InternalContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime} Contact" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Examples:
      | userType   |
      | GRANTEE FD |

  @482134 @ValidatePMusershouldabletosaveandcreateinternalcontact @P2_Grantee @ADMIN_Grantee @GRegression2
  Scenario Outline: Validate ADMIN user should able to save and create internal contact
    When I login to "Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    Then I see "External" inside "Contacts" is displayed
    Then I see "Internal" inside "Contacts" is displayed
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I click toggle button to select "All Contacts"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "All Contacts" inside flex table id "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "My Organization’s Contact" inside flex table id "---grantee_tableId:-:InternalContacts---"
    When I click on parallel lines menu bar with data target value "All Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I click on page navigation arrow "---grantee_tableId:-:InternalContacts---" for table id "Next"
    Then I see table "---grantee_tableId:-:InternalContacts---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:InternalContacts---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:InternalContacts---"
    And I click on advance filter of table id "---grantee_tableId:-:InternalContacts---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:InternalContacts---" for LWC
      | Full Name | contains | Grantee PO |
    Then I softly see value "Grantee PO" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Create Contact" opens in overLay window
    And I wait for "2" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Address Information" page block displayed
    Then I softly see field on modal "Organization" inside page block
    Then I softly see asterisk mark on "Organization"
    Then I softly see field on modal "Title" inside page block
    Then I softly do not see asterisk mark on "Title"
    Then I softly see fields "Title" is in edit mode
    Then I softly see field on modal "First Name" inside page block
    Then I softly see asterisk mark on "First Name"
    Then I softly see fields "FirstName" is in edit mode
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see asterisk mark on "Last Name"
    Then I softly see fields "LastName" is in edit mode
    Then I softly see field on modal "Phone" inside page block
    Then I softly see asterisk mark on "Phone"
    Then I softly see fields "Phone" is in edit mode
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly do not see asterisk mark on "Mobile Phone"
    Then I softly see fields "MobilePhone" is in edit mode
    Then I softly see asterisk mark on "Email"
    Then I softly see field on modal "Email" inside page block
    Then I softly see fields "Email" is in edit mode
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see asterisk mark on "Address Line 1"
    Then I softly see fields "MailingStreet" is in edit mode
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly do not see asterisk mark on "Address Line 2"
    Then I softly see fields "Address2__c" is in edit mode
    Then I softly see field on modal "State" inside page block
    Then I softly see asterisk mark on "State"
    Then I softly see fields "State__c" is in edit mode
    Then I softly see field on modal "Congressional District" inside page block
    Then I softly do not see asterisk mark on "Congressional District"
    Then I softly see fields "CongressionalDistrict__c" is in edit mode
    Then I softly see field on modal "City" inside page block
    Then I softly see asterisk mark on "City"
    Then I softly see fields "MailingCity" is in edit mode
    Then I softly see asterisk mark on "Country"
    Then I softly see field on modal "Country" inside page block
    Then I softly see fields "MailingCountry" is in edit mode
    Then I softly do not see asterisk mark on "County"
    Then I softly see field on modal "County" inside page block
    Then I softly see fields "County__c" is in edit mode
    Then I softly do not see asterisk mark on "4-Digit Zip Code Extension"
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see fields "X4DigitZipCodeExtension__c" is in edit mode
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see field on modal "Zip Code" inside page block
    Then I softly see fields "MailingPostalCode" is in edit mode
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Organization is required in the Contact Information section.   |
      | To Save, Project Role is required in the Contact Information section.   |
      | To Save, First Name is required in the Contact Information section.     |
      | To Save, Last Name is required in the Contact Information section.      |
      | To Save, Phone is required in the Contact Information section.          |
      | To Save, Email is required in the Contact Information section.          |
      | To Save, Address Line 1 is required in the Address Information section. |
      | To Save, State is required in the Address Information section.          |
      | To Save, City is required in the Address Information section.           |
      | To Save, Country is required in the Address Information section.        |
      | To Save, Zip Code is required in the Address Information section.       |
    When I enter in modal value "Department of Product" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "FirstName"
    And I enter in modal value "Contact" into field "LastName"
    And I enter in modal value "67895678" into field "Phone"
    And I enter in modal value "8978968909" into field "MobilePhone"
    And I enter in modal value "Automation Test" into field "Email"
    And I enter in modal value "VA Street" into field "MailingStreet"
    And I enter in modal value "Jordan Road" into field "Address2__c"
    And I enter in modal value "AK: Alaska" into field "State__c"
    And I enter in modal value "123" into field "CongressionalDistrict__c"
    And I enter in modal value "56" into field "MailingCity"
    And I enter in modal value "USA" into field "MailingCountry"
    And I enter in modal value "California" into field "County__c"
    And I enter in modal value "123" into field "X4DigitZipCodeExtension__c"
    And I enter in modal value "1234" into field "MailingPostalCode"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Email: invalid email address: Automation Test |
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    And I enter in modal value "Calif" into field "MailingCity"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Phone Number. |
    And I enter in modal value "8967894567" into field "Phone"
    And I enter in modal value "897" into field "MobilePhone"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Mobile Phone Number. |
    And I enter in modal value "9580378904" into field "MobilePhone"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 5 Digit Zip Code |
    And I enter in modal value "12345" into field "MailingPostalCode"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 4 Digit Zip Code Extension. |
    And I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    Then I can softly see modal button "Save"
    And I click modal button "Save"
    Then I softly see field on modal "Organization" inside page block
    Then I softly see link "Department of Product" inside Page block
    Then I see field "Organization" as "Department of Product" on modal
    And I click on hyperlink for modal containing value "Department of Product"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Department of Product" in the page details
    And I click on back arrow
    Then I softly see field on modal "Type" inside page block
    Then I see field "Type" as "Grantee" on modal
    Then I softly see field on modal "Created By" inside page block
    And I save the field labeled "Created By" as "CreatedBy" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I softly see field on modal "Created Date" inside page block
    Then I softly see field on modal "Last Modified By" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly see field on modal "Last Modified Date" inside page block
    Then I can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter in modal value "20171" into field "MailingPostalCode"
    And I click modal button "Save"
    And I wait for "4" seconds
    Then I see field "Zip Code" as "20171" on modal
    When I close "Create Contact" modal by clicking the top right x button
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---grantee_tableId:-:InternalContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime} Contact" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Examples:
      | userType      |
      | GRANTEE ADMIN |

  @443496 @Validateusershouldcreateandseeallfieldsoninternalcontact @P2_Grantee @PM_Grantee @GRegression2
  Scenario Outline: Validate user should create and see all fields on internal contact
    When I login to "Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    Then I see "External" inside "Contacts" is displayed
    Then I see "Internal" inside "Contacts" is displayed
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I click toggle button to select "All Contacts"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "All Contacts" inside flex table id "---grantee_tableId:-:InternalContacts---"
    Then I softly see toggle option "My Organization’s Contact" inside flex table id "---grantee_tableId:-:InternalContacts---"
    When I click on parallel lines menu bar with data target value "All Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I click on page navigation arrow "---grantee_tableId:-:InternalContacts---" for table id "Next"
    Then I see table "---grantee_tableId:-:InternalContacts---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:InternalContacts---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:InternalContacts---"
    And I click on advance filter of table id "---grantee_tableId:-:InternalContacts---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:InternalContacts---" for LWC
      | Full Name | contains | Grantee PO |
    Then I softly see value "Grantee PO" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly see "Create Contact" opens in overLay window
    And I wait for "2" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Address Information" page block displayed
    Then I softly see field on modal "Organization" inside page block
    Then I softly see asterisk mark on "Organization"
    Then I softly see field on modal "Title" inside page block
    Then I softly do not see asterisk mark on "Title"
    Then I softly see fields "Title" is in edit mode
    Then I softly see field on modal "First Name" inside page block
    Then I softly see asterisk mark on "First Name"
    Then I softly see fields "FirstName" is in edit mode
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see asterisk mark on "Last Name"
    Then I softly see fields "LastName" is in edit mode
    Then I softly see field on modal "Phone" inside page block
    Then I softly see asterisk mark on "Phone"
    Then I softly see fields "Phone" is in edit mode
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly do not see asterisk mark on "Mobile Phone"
    Then I softly see fields "MobilePhone" is in edit mode
    Then I softly see asterisk mark on "Email"
    Then I softly see field on modal "Email" inside page block
    Then I softly see fields "Email" is in edit mode
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see asterisk mark on "Address Line 1"
    Then I softly see fields "MailingStreet" is in edit mode
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly do not see asterisk mark on "Address Line 2"
    Then I softly see fields "Address2__c" is in edit mode
    Then I softly see field on modal "State" inside page block
    Then I softly see asterisk mark on "State"
    Then I softly see fields "State__c" is in edit mode
    Then I softly see field on modal "Congressional District" inside page block
    Then I softly do not see asterisk mark on "Congressional District"
    Then I softly see fields "CongressionalDistrict__c" is in edit mode
    Then I softly see field on modal "City" inside page block
    Then I softly see asterisk mark on "City"
    Then I softly see fields "MailingCity" is in edit mode
    Then I softly see asterisk mark on "Country"
    Then I softly see field on modal "Country" inside page block
    Then I softly see fields "MailingCountry" is in edit mode
    Then I softly do not see asterisk mark on "County"
    Then I softly see field on modal "County" inside page block
    Then I softly see fields "County__c" is in edit mode
    Then I softly do not see asterisk mark on "4-Digit Zip Code Extension"
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see fields "X4DigitZipCodeExtension__c" is in edit mode
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see field on modal "Zip Code" inside page block
    Then I softly see fields "MailingPostalCode" is in edit mode
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Organization is required in the Contact Information section.   |
      | To Save, Project Role is required in the Contact Information section.   |
      | To Save, First Name is required in the Contact Information section.     |
      | To Save, Last Name is required in the Contact Information section.      |
      | To Save, Phone is required in the Contact Information section.          |
      | To Save, Email is required in the Contact Information section.          |
      | To Save, Address Line 1 is required in the Address Information section. |
      | To Save, State is required in the Address Information section.          |
      | To Save, City is required in the Address Information section.           |
      | To Save, Country is required in the Address Information section.        |
      | To Save, Zip Code is required in the Address Information section.       |
    When I enter in modal value "Department of Product" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "FirstName"
    And I enter in modal value "Contact" into field "LastName"
    And I enter in modal value "67895678" into field "Phone"
    And I enter in modal value "8978968909" into field "MobilePhone"
    And I enter in modal value "Automation Test" into field "Email"
    And I enter in modal value "VA Street" into field "MailingStreet"
    And I enter in modal value "Jordan Road" into field "Address2__c"
    And I enter in modal value "AK: Alaska" into field "State__c"
    And I enter in modal value "123" into field "CongressionalDistrict__c"
    And I enter in modal value "56" into field "MailingCity"
    And I enter in modal value "USA" into field "MailingCountry"
    And I enter in modal value "California" into field "County__c"
    And I enter in modal value "123" into field "X4DigitZipCodeExtension__c"
    And I enter in modal value "1234" into field "MailingPostalCode"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Email: invalid email address: Automation Test |
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    And I enter in modal value "Calif" into field "MailingCity"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Phone Number. |
    And I enter in modal value "8967894567" into field "Phone"
    And I enter in modal value "897" into field "MobilePhone"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Mobile Phone Number. |
    And I enter in modal value "9580378904" into field "MobilePhone"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 5 Digit Zip Code |
    And I enter in modal value "12345" into field "MailingPostalCode"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 4 Digit Zip Code Extension. |
    And I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    Then I can softly see modal button "Save"
    And I click modal button "Save"
    Then I softly see field on modal "Organization" inside page block
    Then I softly see link "Department of Product" inside Page block
    Then I see field "Organization" as "Department of Product" on modal
    And I click on hyperlink for modal containing value "Department of Product"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Department of Product" in the page details
    And I click on back arrow
    Then I softly see field on modal "Type" inside page block
    Then I see field "Type" as "Grantee" on modal
    Then I softly see field on modal "Created By" inside page block
    And I save the field labeled "Created By" as "CreatedBy" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I softly see field on modal "Created Date" inside page block
    Then I softly see field on modal "Last Modified By" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly see field on modal "Last Modified Date" inside page block
    Then I can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter in modal value "20171" into field "MailingPostalCode"
    And I click modal button "Save"
    And I wait for "4" seconds
    Then I see field "Zip Code" as "20171" on modal
    When I close "Create Contact" modal by clicking the top right x button
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---grantee_tableId:-:InternalContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime} Contact" for title "Full Name" inside table "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Examples:
      | userType   |
      | GRANTEE PM |