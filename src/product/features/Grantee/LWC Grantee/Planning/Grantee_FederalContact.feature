@GranteeFederalContact @GranteePreAwardRegression
Feature: Validate all scenarios for Federal Contact

  @482122 @ValidateFederalContactAuditorusershouldnotcreatenewfederalcontactandshouldhaveonlyviewaccessonalreadycreatedcontact @P4_Grantee @AUDITOR_Grantee @GRegression1
  Scenario: Validate Federal Contact Auditor user should not create new federal contact and should have only view access on already created contact
    When I login to "Grantee" app as "GRANTEE PM" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Department of Education" into field "AccountId"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Execution" into field "LastName"
    When I enter in modal value "8967093844" into field "Phone"
    When I enter in modal value "8967093440" into field "MobilePhone"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I enter in modal value "Mail Street" into field "MailingStreet"
    When I enter in modal value "Howard Lane" into field "Address2__c"
    When I enter in modal value "AK: Alaska" into field "State__c"
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "USA" into field "MailingCountry"
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I enter in modal value "Other" into field "Role__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I save the field labeled "Title" as "Title" on modal
    When I click modal button "Close"
    When I re-login to "Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
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
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:fedContactTableId---" panel
    When I click on "View" icon for "{SavedValue:Title}" inside flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    Then I see field "Title" as "{SavedValue:Automation Runtime}" on modal
    Then I see field "First Name" as "Automation" on modal
    Then I see field "Last Name" as "Execution" on modal
    Then I see field "Phone" as "(896) 709-3844" on modal
    Then I see field "Mobile Phone" as "(896) 709-3440" on modal
    Then I see field "Email" as "{SavedValue:uniqueEmailID}" on modal
    Then I see field "Address Line 1" as "Mail Street" on modal
    Then I see field "Address Line 2" as "Howard Lane" on modal
    Then I see field "State" as "AK: Alaska" on modal
    Then I see field "Congressional District" as "123" on modal
    Then I see field "City" as "VA" on modal
    Then I see field "Country" as "USA" on modal
    Then I see field "County" as "United" on modal
    Then I see field "4-Digit Zip Code Extension" as "1234" on modal
    Then I see field "Zip Code" as "12345" on modal
    And I click on hyperlink for modal containing value "Department of Education"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Department of Education" in the page details
    And I click on back arrow
    And I click modal button "Close"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:fedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:fedContactTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"