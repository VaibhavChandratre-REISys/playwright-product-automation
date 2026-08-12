@GranteeNonFederalProgram @GranteeNonFederalProgramPDF @GranteePreAwardRegression
Feature: Validate all scenarios for Non Federal Program for PDF

  @476632 @ValidateNon-FederalprogramPOusercancreateandActivateNonFederalprogram @PO_Grantee @P1_Grantee @GRegression1
  Scenario: Non-Federal program PO user can create and Activate Non Federal program
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Program Number" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Program Number" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:nonFederalProgramsTableId---"
    And I click toggle button to select "Non-Federal Programs - All"
    When I click on parallel lines menu bar with data target value "Non-Federal Programs - All"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Non-Federal Programs - All"
    And I wait for "8" seconds
    And I download the file
    Then I see "Non-Federal Programs - All" on page "1" of "govgrants" pdf file
    And I close the tab
    And I select "Refresh" from parallel lines dropdown of "Non-Federal Programs - All"
    Then I see table is refreshing
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Create Non Federal Program" opens in overLay window
    Then I softly see field on modal "Program Name" inside page block
    Then I softly see field on modal "Abbreviation" inside page block
    Then I softly see field on modal "Type" inside page block
    Then I softly see field on modal "NGO Organization" inside page block
    When I enter "Grantee_nonFed" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly see "Information" page block displayed
    Then I softly see "Eligibility Requirements" page block displayed
    Then I softly see "Application and Award Process" page block displayed
    Then I softly see "Assistance Consideration" page block displayed
    Then I softly see "Compliance Requirements" page block displayed
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Related Log" sub tab
    Then I softly see "Opportunities" page block displayed
    Then I softly see "Pre-Applications" page block displayed
    Then I softly see "Applications" page block displayed
    Then I softly see "Grants" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Program Files" page block displayed
    Then I softly see "Notes" page block displayed
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    When I enter "Grantee_nonFed_Edition" values from "Program_Field_Values.xlsx"
    And I generate the random digits and save as "digits"
    And I enter value "{SavedValue:digits}" into field "FederalProgramCFDA__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    And I pause execution for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
    When I click modal button "Close"
    And I pause execution for "3" seconds
    Then I softly see "Program Artifacts" has been added in "Program Files" flex table
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    And I click on "Edit" icon for "Program Artifacts" inside flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Other Artifacts" at upload file modal
    When I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Automation.pdf" for title "Classification" inside table "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly see value "Other Artifacts" for title "Classification" inside table "---grantee_tableId:-:nonFedAddFilesTableId---"
    And I click on "Download" icon for "Other Artifacts" inside flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---" without waiting for record
    And I download the file
    And I wait for "3" seconds
    Then I softly verify that the file "govgrant.pdf" is downloaded
    And I close the tab
    And I wait for "2" seconds
    And I click on "Delete" icon for "Automation.pdf" inside flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---" without waiting for record
    Then I softly do not see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:nonFedAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:nonFedNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:nonFedNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:nonFedNotesTableId---" by clicking "Edit" :
      | Created By | Description                  | Title                     |
      | Grantee PO | Automation Notes Description | Notes Record for Sarah PM |
    Then I softly see value "Notes Record for Sarah PM" for title "Title" inside table "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly see value "Automation Notes Description" for title "Description" inside table "---grantee_tableId:-:nonFedNotesTableId---"
    And I navigate to "Chatter" sub tab in split screen
    And I post the message "Automation Test" inside chatter
    Then I softly see post "Automation Test" by user "Grantee PO"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Active" for title "New Value" inside field history table
    And I softly see value "Created" for title "Original Value" inside field history table

  @477545 @ValidateNonfederalPOusershouldseeallfieldsandsectionfornonfederalcontacts @P2_Grantee @PO_Grantee @GRegression2
  Scenario Outline: Validate Non federal PO user should see all fields and section for non federal contact's
    When I login to "Grantee" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Contacts" subheader on left panel
    Then I softly see "Federal Contacts" page block displayed
    Then I softly see "Non-Federal Contacts" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:nonFedContactTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:nonFedContactTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:nonFedContactTableId---"
    When I click on parallel lines menu bar with data target value "Non-Federal Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Non-Federal Contacts"
    And I wait for "7" seconds
    And I download the file
    Then I see "Non-Federal Contacts" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Project Role is required in the Contact Information section.   |
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
    And I wait for "2" seconds
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Test With Automation PM" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
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
    When I enter in modal value "12@3" into field "MailingCity"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "County__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "te#" into field "CongressionalDistrict__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Enter 3-digit numeric value for Congressional District field |
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "*123" into field "MailingCountry"
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
    And I click on top right button "Edit" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
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
    And I click on hyperlink for modal containing value "Test With Automation PM"
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "Test With Automation PM" in the page details
    And I click on back arrow
    And I wait for "2" seconds
    And I click modal button "Close"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:nonFedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Examples:
      | User          |
      | GRANTEE PO    |


  @477546 @ValidateNonfederalPOusershouldseeallfieldsandsectionfornonfederalcontacts @EXE_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Validate Non federal EXE user should see all fields and section for non federal contact's
    When I login to "Grantee" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Contacts" subheader on left panel
    Then I softly see "Federal Contacts" page block displayed
    Then I softly see "Non-Federal Contacts" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:nonFedContactTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:nonFedContactTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:nonFedContactTableId---"
    When I click on parallel lines menu bar with data target value "Non-Federal Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Non-Federal Contacts"
    And I wait for "7" seconds
    And I download the file
    Then I see "Non-Federal Contacts" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Project Role is required in the Contact Information section.   |
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
    And I wait for "2" seconds
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Test With Automation PM" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
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
    When I enter in modal value "12@3" into field "MailingCity"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "County__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "te#" into field "CongressionalDistrict__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Enter 3-digit numeric value for Congressional District field |
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "*123" into field "MailingCountry"
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
    And I click on top right button "Edit" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
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
    And I click on hyperlink for modal containing value "Test With Automation PM"
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "Test With Automation PM" in the page details
    And I click on back arrow
    And I wait for "2" seconds
    And I click modal button "Close"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:nonFedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Examples:
      | User          |
      | GRANTEE EXE   |

  @477548 @ValidateNonfederalPOusershouldseeallfieldsandsectionfornonfederalcontacts @FO_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Validate Non federal FO user should see all fields and section for non federal contact's
    When I login to "Grantee" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Contacts" subheader on left panel
    Then I softly see "Federal Contacts" page block displayed
    Then I softly see "Non-Federal Contacts" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:nonFedContactTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:nonFedContactTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:nonFedContactTableId---"
    When I click on parallel lines menu bar with data target value "Non-Federal Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Non-Federal Contacts"
    And I wait for "7" seconds
    And I download the file
    Then I see "Non-Federal Contacts" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Project Role is required in the Contact Information section.   |
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
    And I wait for "2" seconds
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Test With Automation PM" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
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
    When I enter in modal value "12@3" into field "MailingCity"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "County__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "te#" into field "CongressionalDistrict__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Enter 3-digit numeric value for Congressional District field |
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "*123" into field "MailingCountry"
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
    And I click on top right button "Edit" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
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
    And I click on hyperlink for modal containing value "Test With Automation PM"
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "Test With Automation PM" in the page details
    And I click on back arrow
    And I wait for "2" seconds
    And I click modal button "Close"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:nonFedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Examples:
      | User          |
      | GRANTEE FO    |


  @477549 @ValidateNonfederalPOusershouldseeallfieldsandsectionfornonfederalcontacts @FD_Grantee @GRegression3 @P3_Grantee
  Scenario Outline: Validate Non federal FD user should see all fields and section for non federal contact's
    When I login to "Grantee" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Contacts" subheader on left panel
    Then I softly see "Federal Contacts" page block displayed
    Then I softly see "Non-Federal Contacts" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:nonFedContactTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:nonFedContactTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:nonFedContactTableId---"
    When I click on parallel lines menu bar with data target value "Non-Federal Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Non-Federal Contacts"
    And I wait for "7" seconds
    And I download the file
    Then I see "Non-Federal Contacts" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Project Role is required in the Contact Information section.   |
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
    And I wait for "2" seconds
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Test With Automation PM" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
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
    When I enter in modal value "12@3" into field "MailingCity"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "County__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "te#" into field "CongressionalDistrict__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Enter 3-digit numeric value for Congressional District field |
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "*123" into field "MailingCountry"
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
    And I click on top right button "Edit" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
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
    And I click on hyperlink for modal containing value "Test With Automation PM"
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "Test With Automation PM" in the page details
    And I click on back arrow
    And I wait for "2" seconds
    And I click modal button "Close"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:nonFedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Examples:
      | User          |
      | GRANTEE FD    |

  @477550 @ValidateNonfederalPOusershouldseeallfieldsandsectionfornonfederalcontacts @ADMIN_Grantee @P2_Grantee @GRegression2
  Scenario Outline: Validate Non federal ADMIN user should see all fields and section for non federal contact's
    When I login to "Grantee" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Contacts" subheader on left panel
    Then I softly see "Federal Contacts" page block displayed
    Then I softly see "Non-Federal Contacts" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Full Name" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Phone" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:nonFedContactTableId---"
    And I click on page navigation arrow "---grantee_tableId:-:nonFedContactTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:nonFedContactTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:nonFedContactTableId---"
    When I click on parallel lines menu bar with data target value "Non-Federal Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Non-Federal Contacts"
    And I wait for "7" seconds
    And I download the file
    Then I see "Non-Federal Contacts" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Project Role is required in the Contact Information section.   |
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
    And I wait for "2" seconds
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Test With Automation PM" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
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
    When I enter in modal value "12@3" into field "MailingCity"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the City field. |
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "County__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter alphabetic character in the County field. |
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "te#" into field "CongressionalDistrict__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Enter 3-digit numeric value for Congressional District field |
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "*123" into field "MailingCountry"
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
    And I click on top right button "Edit" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
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
    And I click on hyperlink for modal containing value "Test With Automation PM"
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "Test With Automation PM" in the page details
    And I click on back arrow
    And I wait for "2" seconds
    And I click modal button "Close"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:nonFedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Examples:
      | User          |
      | GRANTEE ADMIN |

  @549247 @ValidateallinternalusersfromsameOrgshouldabletoviewthcreatedstatenon-federalexternalprogram @GranteeFlexP1
  Scenario Outline: Validate all internal users from same Org should able to view the created state non-federal external program
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I click toggle button to select "Non-Federal Programs - All"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Create Non Federal Program" opens in overLay window
    When I enter "Grantee_nonFed" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly see "Information" page block displayed
    Then I softly see "Eligibility Requirements" page block displayed
    Then I softly see "Application and Award Process" page block displayed
    Then I softly see "Assistance Consideration" page block displayed
    Then I softly see "Compliance Requirements" page block displayed
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Related Log" sub tab
    Then I softly see "Opportunities" page block displayed
    Then I softly see "Pre-Applications" page block displayed
    Then I softly see "Applications" page block displayed
    Then I softly see "Grants" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Program Files" page block displayed
    Then I softly see "Notes" page block displayed
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    When I enter "Grantee_nonFed_Edition" values from "Program_Field_Values.xlsx"
    And I generate the random digits and save as "digits"
    And I enter value "{SavedValue:digits}" into field "FederalProgramCFDA__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "Program Number" as "NonFedPrgNumber"
    Then I softly see field "Program Number" as "{SavedValue:NonFedPrgNumber}"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    And I pause execution for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
    When I click modal button "Close"
    And I pause execution for "3" seconds
    Then I softly see "Program Artifacts" has been added in "Program Files" flex table
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:nonFedNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:nonFedNotesTableId---"
     And I navigate to "Chatter" sub tab in split screen
    And I post the message "Automation Test" inside chatter
    Then I softly see post "Automation Test" by user "Sarah PM"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I click toggle button to select "Non-Federal Programs - All"
    When I perform quick search for "{SavedValue:NonFedPrgNumber}" in "---grantee_tableId:-:nonFederalProgramsTableId---" panel
    And I click on "View" icon for "{SavedValue:NonFedPrgNumber}" inside flex table with id "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly see field "Program Number" as "{SavedValue:NonFedPrgNumber}"
    Then I softly see "Information" page block displayed
    Then I softly see "Eligibility Requirements" page block displayed
    Then I softly see "Application and Award Process" page block displayed
    Then I softly see "Assistance Consideration" page block displayed
    Then I softly see "Compliance Requirements" page block displayed
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Related Log" sub tab
    Then I softly see "Opportunities" page block displayed
    Then I softly see "Pre-Applications" page block displayed
    Then I softly see "Applications" page block displayed
    Then I softly see "Grants" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Program Files" page block displayed
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly see "Notes" page block displayed
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:nonFedNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:nonFedNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
       Examples:
      | User            |
      | GRANTEE PO      |
      | GRANTEE EXE     |
      | GRANTEE FO      |
      | GRANTEE FD      |
      | GRANTEE ADMIN   |
      | GRANTEE AUDITOR |