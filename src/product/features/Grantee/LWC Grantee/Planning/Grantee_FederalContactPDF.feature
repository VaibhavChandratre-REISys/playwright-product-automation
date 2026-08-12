@GranteeFederalContact @GranteeFederalContactPDF @GranteePreAwardRegression
Feature: Validate all scenarios for Federal Contact for PDF

  @477592 @ValidateFederalContactAdminusershouldcreatenewfederalcontact @P3_Grantee @ADMIN_Grantee @GRegression3
  Scenario Outline: Validate Federal Contact Admin user should create new federal contact
    When I login to "Grantee" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Contacts" subheader on left panel
    Then I softly see "Federal Contacts" page block displayed
    Then I softly see "Non-Federal Contacts" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:fedContactTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:fedContactTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:fedContactTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:fedContactTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:fedContactTableId---"
    When I click on parallel lines menu bar with data target value "Federal Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Federal Contacts"
    And I wait for "7" seconds
    And I download the file
    Then I see "Federal Contacts" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Project Role" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Project Role is required in the Contact Information section.   |
      | To Save, Organization is required in the Contact Information section.   |
      | To Save, First Name is required in the Contact Information section.     |
      | To Save, Last Name is required in the Contact Information section.      |
      | To Save, Phone is required in the Contact Information section.          |
      | To Save, Email is required in the Contact Information section.          |
      | To Save, Address Line 1 is required in the Address Information section. |
      | To Save, State is required in the Address Information section.          |
      | To Save, City is required in the Address Information section.           |
      | To Save, Country is required in the Address Information section.        |
      | To Save, Zip Code is required in the Address Information section.       |
    And I wait for "2" seconds
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Department of Education" into field "AccountId"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Execution" into field "LastName"
    When I enter in modal value "8967093844" into field "Phone"
    When I enter in modal value "8967093440" into field "MobilePhone"
    And I enter in modal value "123" into field "Email"
    When I enter in modal value "Mail Street" into field "MailingStreet"
    When I enter in modal value "Howard Lane" into field "Address2__c"
    When I enter in modal value "AK: Alaska" into field "State__c"
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "USA" into field "MailingCountry"
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Email: invalid email address: 123 |
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I enter in modal value "123" into field "MailingPostalCode"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 5 Digit Zip Code |
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I enter in modal value "896" into field "Phone"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Phone Number. |
    When I enter in modal value "8967093844" into field "Phone"
    When I enter in modal value "896709" into field "MobilePhone"
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Mobile Phone Number. |
    When I enter in modal value "8967093440" into field "MobilePhone"
    When I enter in modal value "123" into field "MailingCity"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "County__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "tes" into field "CongressionalDistrict__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Enter 3-digit numeric value for Congressional District field |
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "123" into field "MailingCountry"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the Country field. |
    When I enter in modal value "USA" into field "MailingCountry"
    When I click modal button "Save"
    Then I see field "Title" as "{SavedValue:Automation Runtime}" on modal
    Then I see field "First Name" as "Automation" on modal
    Then I see field "Last Name" as "Execution" on modal
    Then I see field "Phone" as "(896) 709-3844" on modal
    Then I see field "Mobile Phone" as "(896) 709-3440" on modal
    Then I see field "Email" as "{SavedValue:uniqueEmailID}" on modal
    And I click on top right button "Edit" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    When I enter in modal value "Automation Runtime Test" into field "Title"
    When I enter in modal value "Automation1" into field "FirstName"
    When I enter in modal value "Execution1" into field "LastName"
    When I enter in modal value "8967093855" into field "Phone"
    When I enter in modal value "8967093455" into field "MobilePhone"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I save the field labeled "Title" as "Title" on modal
    Then I see field "Title" as "{SavedValue:Automation Runtime Test}" on modal
    Then I see field "First Name" as "Automation1" on modal
    Then I see field "Last Name" as "Execution1" on modal
    Then I see field "Phone" as "(896) 709-3855" on modal
    Then I see field "Mobile Phone" as "(896) 709-3455" on modal
    Then I see field "Email" as "{SavedValue:uniqueEmailID}" on modal
    And I click on hyperlink for modal containing value "Department of Education"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Department of Education" in the page details
    And I click on back arrow
    And I click modal button "Close"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:fedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Examples:
      | User          |
      | GRANTEE ADMIN |

  @477554 @ValidateFederalContactEXEusershouldcreatenewfederalcontact @P2_Grantee @EXE_Grantee @GRegression2
  Scenario Outline: Validate Federal Contact EXE user should create new federal contact
    When I login to "Grantee" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Contacts" subheader on left panel
    Then I softly see "Federal Contacts" page block displayed
    Then I softly see "Non-Federal Contacts" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:fedContactTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:fedContactTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:fedContactTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:fedContactTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:fedContactTableId---"
    When I click on parallel lines menu bar with data target value "Federal Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Federal Contacts"
    And I wait for "7" seconds
    And I download the file
    Then I see "Federal Contacts" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Project Role" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Project Role is required in the Contact Information section.   |
      | To Save, Organization is required in the Contact Information section.   |
      | To Save, First Name is required in the Contact Information section.     |
      | To Save, Last Name is required in the Contact Information section.      |
      | To Save, Phone is required in the Contact Information section.          |
      | To Save, Email is required in the Contact Information section.          |
      | To Save, Address Line 1 is required in the Address Information section. |
      | To Save, State is required in the Address Information section.          |
      | To Save, City is required in the Address Information section.           |
      | To Save, Country is required in the Address Information section.        |
      | To Save, Zip Code is required in the Address Information section.       |
    And I wait for "2" seconds
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Department of Education" into field "AccountId"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Execution" into field "LastName"
    When I enter in modal value "8967093844" into field "Phone"
    When I enter in modal value "8967093440" into field "MobilePhone"
    And I enter in modal value "123" into field "Email"
    When I enter in modal value "Mail Street" into field "MailingStreet"
    When I enter in modal value "Howard Lane" into field "Address2__c"
    When I enter in modal value "AK: Alaska" into field "State__c"
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "USA" into field "MailingCountry"
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Email: invalid email address: 123 |
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I enter in modal value "123" into field "MailingPostalCode"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 5 Digit Zip Code |
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I enter in modal value "896" into field "Phone"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Phone Number. |
    When I enter in modal value "8967093844" into field "Phone"
    When I enter in modal value "896709" into field "MobilePhone"
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Mobile Phone Number. |
    When I enter in modal value "8967093440" into field "MobilePhone"
    When I enter in modal value "123" into field "MailingCity"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "County__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "tes" into field "CongressionalDistrict__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Enter 3-digit numeric value for Congressional District field |
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "123" into field "MailingCountry"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the Country field. |
    When I enter in modal value "USA" into field "MailingCountry"
    When I click modal button "Save"
    Then I see field "Title" as "{SavedValue:Automation Runtime}" on modal
    Then I see field "First Name" as "Automation" on modal
    Then I see field "Last Name" as "Execution" on modal
    Then I see field "Phone" as "(896) 709-3844" on modal
    Then I see field "Mobile Phone" as "(896) 709-3440" on modal
    Then I see field "Email" as "{SavedValue:uniqueEmailID}" on modal
    And I click on top right button "Edit" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    When I enter in modal value "Automation Runtime Test" into field "Title"
    When I enter in modal value "Automation1" into field "FirstName"
    When I enter in modal value "Execution1" into field "LastName"
    When I enter in modal value "8967093855" into field "Phone"
    When I enter in modal value "8967093455" into field "MobilePhone"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I save the field labeled "Title" as "Title" on modal
    Then I see field "Title" as "{SavedValue:Automation Runtime Test}" on modal
    Then I see field "First Name" as "Automation1" on modal
    Then I see field "Last Name" as "Execution1" on modal
    Then I see field "Phone" as "(896) 709-3855" on modal
    Then I see field "Mobile Phone" as "(896) 709-3455" on modal
    Then I see field "Email" as "{SavedValue:uniqueEmailID}" on modal
    And I click on hyperlink for modal containing value "Department of Education"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Department of Education" in the page details
    And I click on back arrow
    And I click modal button "Close"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:fedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Examples:
      | User          |
      | GRANTEE EXE   |

  @477556 @ValidateFederalContactFOusershouldcreatenewfederalcontact @P3_Grantee @FO_Grantee @GRegression3
  Scenario Outline: Validate Federal Contact FO user should create new federal contact
    When I login to "Grantee" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Contacts" subheader on left panel
    Then I softly see "Federal Contacts" page block displayed
    Then I softly see "Non-Federal Contacts" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:fedContactTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:fedContactTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:fedContactTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:fedContactTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:fedContactTableId---"
    When I click on parallel lines menu bar with data target value "Federal Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Federal Contacts"
    And I wait for "7" seconds
    And I download the file
    Then I see "Federal Contacts" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Project Role" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Project Role is required in the Contact Information section.   |
      | To Save, Organization is required in the Contact Information section.   |
      | To Save, First Name is required in the Contact Information section.     |
      | To Save, Last Name is required in the Contact Information section.      |
      | To Save, Phone is required in the Contact Information section.          |
      | To Save, Email is required in the Contact Information section.          |
      | To Save, Address Line 1 is required in the Address Information section. |
      | To Save, State is required in the Address Information section.          |
      | To Save, City is required in the Address Information section.           |
      | To Save, Country is required in the Address Information section.        |
      | To Save, Zip Code is required in the Address Information section.       |
    And I wait for "2" seconds
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Department of Education" into field "AccountId"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Execution" into field "LastName"
    When I enter in modal value "8967093844" into field "Phone"
    When I enter in modal value "8967093440" into field "MobilePhone"
    And I enter in modal value "123" into field "Email"
    When I enter in modal value "Mail Street" into field "MailingStreet"
    When I enter in modal value "Howard Lane" into field "Address2__c"
    When I enter in modal value "AK: Alaska" into field "State__c"
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "USA" into field "MailingCountry"
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Email: invalid email address: 123 |
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I enter in modal value "123" into field "MailingPostalCode"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 5 Digit Zip Code |
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I enter in modal value "896" into field "Phone"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Phone Number. |
    When I enter in modal value "8967093844" into field "Phone"
    When I enter in modal value "896709" into field "MobilePhone"
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Mobile Phone Number. |
    When I enter in modal value "8967093440" into field "MobilePhone"
    When I enter in modal value "123" into field "MailingCity"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "County__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "tes" into field "CongressionalDistrict__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Enter 3-digit numeric value for Congressional District field |
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "123" into field "MailingCountry"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the Country field. |
    When I enter in modal value "USA" into field "MailingCountry"
    When I click modal button "Save"
    Then I see field "Title" as "{SavedValue:Automation Runtime}" on modal
    Then I see field "First Name" as "Automation" on modal
    Then I see field "Last Name" as "Execution" on modal
    Then I see field "Phone" as "(896) 709-3844" on modal
    Then I see field "Mobile Phone" as "(896) 709-3440" on modal
    Then I see field "Email" as "{SavedValue:uniqueEmailID}" on modal
    And I click on top right button "Edit" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    When I enter in modal value "Automation Runtime Test" into field "Title"
    When I enter in modal value "Automation1" into field "FirstName"
    When I enter in modal value "Execution1" into field "LastName"
    When I enter in modal value "8967093855" into field "Phone"
    When I enter in modal value "8967093455" into field "MobilePhone"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I save the field labeled "Title" as "Title" on modal
    Then I see field "Title" as "{SavedValue:Automation Runtime Test}" on modal
    Then I see field "First Name" as "Automation1" on modal
    Then I see field "Last Name" as "Execution1" on modal
    Then I see field "Phone" as "(896) 709-3855" on modal
    Then I see field "Mobile Phone" as "(896) 709-3455" on modal
    Then I see field "Email" as "{SavedValue:uniqueEmailID}" on modal
    And I click on hyperlink for modal containing value "Department of Education"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Department of Education" in the page details
    And I click on back arrow
    And I click modal button "Close"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:fedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Examples:
      | User          |
      | GRANTEE FO    |

  @477564 @ValidateFederalContactFDusershouldcreatenewfederalcontact @P3_Grantee @FD_Grantee @GRegression3
  Scenario Outline: Validate Federal Contact FD user should create new federal contact
    When I login to "Grantee" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Contacts" subheader on left panel
    Then I softly see "Federal Contacts" page block displayed
    Then I softly see "Non-Federal Contacts" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:fedContactTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:fedContactTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:fedContactTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:fedContactTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:fedContactTableId---"
    When I click on parallel lines menu bar with data target value "Federal Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Federal Contacts"
    And I wait for "7" seconds
    And I download the file
    Then I see "Federal Contacts" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Project Role" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Project Role is required in the Contact Information section.   |
      | To Save, Organization is required in the Contact Information section.   |
      | To Save, First Name is required in the Contact Information section.     |
      | To Save, Last Name is required in the Contact Information section.      |
      | To Save, Phone is required in the Contact Information section.          |
      | To Save, Email is required in the Contact Information section.          |
      | To Save, Address Line 1 is required in the Address Information section. |
      | To Save, State is required in the Address Information section.          |
      | To Save, City is required in the Address Information section.           |
      | To Save, Country is required in the Address Information section.        |
      | To Save, Zip Code is required in the Address Information section.       |
    And I wait for "2" seconds
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Department of Education" into field "AccountId"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Execution" into field "LastName"
    When I enter in modal value "8967093844" into field "Phone"
    When I enter in modal value "8967093440" into field "MobilePhone"
    And I enter in modal value "123" into field "Email"
    When I enter in modal value "Mail Street" into field "MailingStreet"
    When I enter in modal value "Howard Lane" into field "Address2__c"
    When I enter in modal value "AK: Alaska" into field "State__c"
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "USA" into field "MailingCountry"
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Email: invalid email address: 123 |
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I enter in modal value "123" into field "MailingPostalCode"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please Enter 5 Digit Zip Code |
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I enter in modal value "896" into field "Phone"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Phone Number. |
    When I enter in modal value "8967093844" into field "Phone"
    When I enter in modal value "896709" into field "MobilePhone"
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Mobile Phone Number. |
    When I enter in modal value "8967093440" into field "MobilePhone"
    When I enter in modal value "123" into field "MailingCity"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "County__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "tes" into field "CongressionalDistrict__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Enter 3-digit numeric value for Congressional District field |
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "123" into field "MailingCountry"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the Country field. |
    When I enter in modal value "USA" into field "MailingCountry"
    When I click modal button "Save"
    Then I see field "Title" as "{SavedValue:Automation Runtime}" on modal
    Then I see field "First Name" as "Automation" on modal
    Then I see field "Last Name" as "Execution" on modal
    Then I see field "Phone" as "(896) 709-3844" on modal
    Then I see field "Mobile Phone" as "(896) 709-3440" on modal
    Then I see field "Email" as "{SavedValue:uniqueEmailID}" on modal
    And I click on top right button "Edit" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    When I enter in modal value "Automation Runtime Test" into field "Title"
    When I enter in modal value "Automation1" into field "FirstName"
    When I enter in modal value "Execution1" into field "LastName"
    When I enter in modal value "8967093855" into field "Phone"
    When I enter in modal value "8967093455" into field "MobilePhone"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I save the field labeled "Title" as "Title" on modal
    Then I see field "Title" as "{SavedValue:Automation Runtime Test}" on modal
    Then I see field "First Name" as "Automation1" on modal
    Then I see field "Last Name" as "Execution1" on modal
    Then I see field "Phone" as "(896) 709-3855" on modal
    Then I see field "Mobile Phone" as "(896) 709-3455" on modal
    Then I see field "Email" as "{SavedValue:uniqueEmailID}" on modal
    And I click on hyperlink for modal containing value "Department of Education"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Department of Education" in the page details
    And I click on back arrow
    And I click modal button "Close"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:fedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Examples:
      | User          |
      | GRANTEE FD    |