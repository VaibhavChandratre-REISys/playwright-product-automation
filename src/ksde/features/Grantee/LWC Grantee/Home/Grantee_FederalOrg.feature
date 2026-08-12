@GranteeFederalOrgamization
Feature: Validate all scenarios for Federal Organization

  @460983 @ValidateFederalOrgAuditorprofileusershouldseeallfieldsandsectionreadonlyonfederalOrglayoutViewonlyaccess @P4_Grantee @AUDITOR_Grantee @GRegression2
  Scenario: Validate Federal Org Auditor profile user should see all fields and section readonly on federal Org layout Viewonly access
    When I login to "As a Grantor" app as "GRANTEE AUDITOR" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    And I click on advance filter of table id "---grantee_tableId:-:fedOrgTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:fedOrgTableId---" for LWC
      | Organization Name | contains | Agency For International Development |
    And I click on "View" icon for "Agency For International Development" inside flex table with id "---grantee_tableId:-:fedOrgTableId---" without waiting for record
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Agency For International Development" in the page details
    Then I softly see field "Parent Organization" as "NA"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Organization Name" as "Agency For International Development"
    Then I softly see field "Abbreviation" as "USAID"
    Then I softly see field "Address Line 1" as "1300 Pennsylvania Ave NW"
    Then I softly see field "City" as "Washington"
    Then I softly see field "State" as "DC"
    Then I softly see field "Congressional District" inside page block
    When I hovering mouse on help text icon inside page block detail "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field "Country" as "USA"
    Then I softly see field "Zip Code" as "20004"
    Then I softly see field "Website" as "www.usaid.gov"
    Then I softly see field "Address Line 2" inside page block
    Then I softly see field "4-digit Zip Code Extension" inside page block
    Then I softly see field "County" inside page block
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I save the value from row "1" for column name "Title" as "ContactTitle" from flex table "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I cannot see row level action button "Delete" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I cannot see row level action button "Edit" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I click on "View" icon for "{SavedValue:ContactTitle}" inside flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---" without waiting for record
    Then I softly see "Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Type" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    When I hovering mouse on help text icon inside modal "Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    When I hovering mouse on help text icon inside modal "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    And I save the field labeled "Title" as "Title" on modal
    Then I see field "Title" as "{SavedValue:Title}" on modal
    And I save the field labeled "First Name" as "FirstName" on modal
    Then I see field "First Name" as "{SavedValue:FirstName}" on modal
    And I save the field labeled "Last Name" as "LastName" on modal
    Then I see field "Last Name" as "{SavedValue:LastName}" on modal
    And I save the field labeled "Phone" as "Phone" on modal
    Then I see field "Phone" as "{SavedValue:Phone}" on modal
    And I save the field labeled "Mobile Phone" as "MobilePhone" on modal
    Then I see field "Mobile Phone" as "{SavedValue:MobilePhone}" on modal
    And I save the field labeled "Email" as "Email" on modal
    Then I see field "Email" as " {SavedValue:Email}" on modal
    And I save the field labeled "Address Line 1" as "AddressLine1" on modal
    Then I see field "Address Line 1" as "{SavedValue:AddressLine1}" on modal
    And I save the field labeled "Address Line 2" as "AddressLine2" on modal
    Then I see field "Address Line 2" as "{SavedValue:AddressLine2}" on modal
    And I save the field labeled "State" as "State" on modal
    Then I see field "State" as "{SavedValue:State}" on modal
    And I save the field labeled "Congressional District" as "CongressionalDistrict" on modal
    Then I see field "Congressional District" as "{SavedValue:CongressionalDistrict}" on modal
    And I save the field labeled "City" as "City" on modal
    Then I see field "City" as "{SavedValue:City}" on modal
    And I save the field labeled "Country" as "Country" on modal
    Then I see field "Country" as "{SavedValue:Country}" on modal
    And I save the field labeled "County" as "County" on modal
    Then I see field "County" as "{SavedValue:County}" on modal
    And I save the field labeled "4-Digit Zip Code Extension" as "4-DigitZipCodeExtension" on modal
    Then I see field "4-Digit Zip Code Extension" as "{SavedValue:4-DigitZipCodeExtension}" on modal
    And I save the field labeled "Zip Code" as "ZipCode" on modal
    Then I see field "Zip Code" as "{SavedValue:ZipCode}" on modal
    And I save the field labeled "Created By" as "CreatedBy" on modal
    Then I see field "Created By" as "{SavedValue:CreatedBy}" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    And I save the field labeled "Created Date" as "CreatedDate" on modal
    Then I see field "Created Date" as "{SavedValue:CreatedDate}" on modal
    And I save the field labeled "Last Modified By" as "LastModifiedBy" on modal
    Then I see field "Last Modified By" as "{SavedValue:LastModifiedBy}" on modal
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I save the field labeled "Last Modified Date" as "LastModifiedDate" on modal
    Then I see field "Last Modified Date" as "{SavedValue:LastModifiedDate}" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I save the field labeled "Created By" as "CreatedByPage"
    Then I softly see field "Created By" as "{SavedValue:CreatedByPage}"
    Then I softly see link "{SavedValue:CreatedByPage}" inside Page block
    And I save the field labeled "Created Date" as "CreatedDatePage"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDatePage}"
    And I save the field labeled "Last Modified By" as "LastModifiedByPage"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedByPage}"
    Then I softly see link "{SavedValue:LastModifiedByPage}" inside Page block
    And I save the field labeled "Last Modified Date" as "LastModifiedDatePage"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDatePage}"
    And I navigate to "Related Log" sub tab
    Then I softly see "Active Leads" page block displayed
    Then I softly see "Opportunities" page block displayed
    Then I softly see "Applications" page block displayed
    Then I softly see "Grants" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "# of Organizations Qualified" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Project Period" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "# of Awards" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Total Awarded budget" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Total Spent" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Remaining Balance" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    And I navigate to "Files" sub tab
    Then I softly see "Organization Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:federalFilesTableId---"
    Then I see "Indirect Cost Rate Letter" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "Indirect Cost Rate Letter" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I cannot see row level action button "Delete" against "Indirect Cost Rate Letter" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I cannot see row level action button "Edit" against "Indirect Cost Rate Letter" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "Indirect Cost Rate Letter" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Test" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Grantee testing" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    And I save the value from row "2" for column name "Created By" as "CreatedBy" from flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "{SavedValue:CreatedBy}" for title "Created By" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Delete" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Edit" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

  @461002 @ValidateFederalusershouldseeallfieldsandsectiononfederalOrg @P3_Grantee @PO_Grantee @GRegression3
  Scenario Outline: Validate Federal PO user should see all fields and section on federal Org
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    And I click on advance filter of table id "---grantee_tableId:-:fedOrgTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:fedOrgTableId---" for LWC
      | Organization Name | contains | Agency For International Development |
    And I click on "View" icon for "Agency For International Development" inside flex table with id "---grantee_tableId:-:fedOrgTableId---" without waiting for record
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Agency For International Development" in the page details
    Then I softly see field "Parent Organization" as "NA"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Organization Name" as "Agency For International Development"
    Then I softly see field "Abbreviation" as "USAID"
    Then I softly see field "Address Line 1" as "1300 Pennsylvania Ave NW"
    Then I softly see field "City" as "Washington"
    Then I softly see field "State" as "DC"
    Then I softly see field "Congressional District" inside page block
    When I hovering mouse on help text icon inside page block detail "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field "Country" as "USA"
    Then I softly see field "Zip Code" as "20004"
    Then I softly see field "Website" as "www.usaid.gov"
    Then I softly see field "Address Line 2" inside page block
    Then I softly see field "4-digit Zip Code Extension" inside page block
    Then I softly see field "County" inside page block
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    When I hovering mouse on help text icon inside modal "Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    When I hovering mouse on help text icon inside modal "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
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
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Execution" into field "LastName"
    When I enter in modal value "8967093890" into field "Phone"
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
    When I click modal button "Save"
    And I wait for "4" seconds
    And I save the field labeled "Title" as "ContactTitle" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Delete" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Edit" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Related Log" sub tab
    Then I softly see "Active Leads" page block displayed
    Then I softly see "Opportunities" page block displayed
    Then I softly see "Applications" page block displayed
    Then I softly see "Grants" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "# of Organizations Qualified" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Project Period" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "# of Awards" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Total Awarded budget" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Total Spent" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Remaining Balance" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    And I navigate to "Files" sub tab
    Then I softly see "Organization Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:federalFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "<attachment>" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "<attachment>" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Delete" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Edit" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I click on "Delete" icon for "<attachment>" inside flex table with id "---grantee_tableId:-:federalFilesTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see the following messages in the page details :
      | File <attachment> deleted successfully. |
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:fedNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "New" :
      | Title   | Description      |
      | <Notes> | Automation Notes |
    Then I softly see value "<Notes>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Delete" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Edit" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    And I click on "Delete" icon for "<Notes>" inside flex table with id "---grantee_tableId:-:fedNotesTableId---" without waiting for record
    Then I softly do not see value "<Notes>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Test" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Grantee testing" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    And I save the value from row "2" for column name "Created By" as "CreatedBy" from flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "{SavedValue:CreatedBy}" for title "Created By" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Delete" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Edit" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | userType   | attachment            | Notes        |
      | GRANTEE PO | AttachmentTesting.pdf | Notes for PO |

  @482151 @ValidateFederalusershouldseeallfieldsandsectiononfederalOrg
  Scenario Outline: Validate Federal FO user should see all fields and section on federal Org
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    And I click on advance filter of table id "---grantee_tableId:-:fedOrgTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:fedOrgTableId---" for LWC
      | Organization Name | contains | Agency For International Development |
    And I click on "View" icon for "Agency For International Development" inside flex table with id "---grantee_tableId:-:fedOrgTableId---" without waiting for record
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Agency For International Development" in the page details
    Then I softly see field "Parent Organization" as "NA"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download As PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Organization Name" as "Agency For International Development"
    Then I softly see field "Abbreviation" as "USAID"
    Then I softly see field "Address Line 1" as "1300 Pennsylvania Ave NW"
    Then I softly see field "City" as "Washington"
    Then I softly see field "State" as "DC"
    Then I softly see field "Congressional District" inside page block
    When I hovering mouse on help text icon inside page block detail "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field "Country" as "USA"
    Then I softly see field "Zip Code" as "20004"
    Then I softly see field "Website" as "www.usaid.gov"
    Then I softly see field "Address Line 2" inside page block
    Then I softly see field "4-digit Zip Code Extension" inside page block
    Then I softly see field "County" inside page block
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    When I hovering mouse on help text icon inside modal "Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    When I hovering mouse on help text icon inside modal "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
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
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Execution" into field "LastName"
    When I enter in modal value "8967093890" into field "Phone"
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
    When I click modal button "Save"
    And I wait for "4" seconds
    And I save the field labeled "Title" as "ContactTitle" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Delete" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Edit" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Related Log" sub tab
    Then I softly see "Active Leads" page block displayed
    Then I softly see "Opportunities" page block displayed
    Then I softly see "Applications" page block displayed
    Then I softly see "Grants" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "# of Organizations Qualified" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Project Period" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "# of Awards" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Total Awarded budget" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Total Spent" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Remaining Balance" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    And I navigate to "Files" sub tab
    Then I softly see "Organization Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:federalFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "<attachment>" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "<attachment>" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Delete" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Edit" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I click on "Delete" icon for "<attachment>" inside flex table with id "---grantee_tableId:-:federalFilesTableId---" without waiting for record
    Then I see the following messages in the page details :
      | File <attachment> deleted successfully. |
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:fedNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "New" :
      | Title   | Description      |
      | <Notes> | Automation Notes |
    Then I softly see value "<Notes>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Delete" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Edit" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    And I click on "Delete" icon for "<Notes>" inside flex table with id "---grantee_tableId:-:fedNotesTableId---" without waiting for record
    Then I softly do not see value "<Notes>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Test" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Grantee testing" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    And I save the value from row "2" for column name "Created By" as "CreatedBy" from flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "{SavedValue:CreatedBy}" for title "Created By" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Delete" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Edit" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | userType   | attachment            | Notes        |
      | GRANTEE FO | AttachmentTesting.pdf | Notes for FO |

  @482152 @ValidateFederalusershouldseeallfieldsandsectiononfederalOrg
  Scenario Outline: Validate Federal FD user should see all fields and section on federal Org
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    And I click on advance filter of table id "---grantee_tableId:-:fedOrgTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:fedOrgTableId---" for LWC
      | Organization Name | contains | Agency For International Development |
    And I click on "View" icon for "Agency For International Development" inside flex table with id "---grantee_tableId:-:fedOrgTableId---" without waiting for record
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Agency For International Development" in the page details
    Then I softly see field "Parent Organization" as "NA"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download As PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Organization Name" as "Agency For International Development"
    Then I softly see field "Abbreviation" as "USAID"
    Then I softly see field "Address Line 1" as "1300 Pennsylvania Ave NW"
    Then I softly see field "City" as "Washington"
    Then I softly see field "State" as "DC"
    Then I softly see field "Congressional District" inside page block
    When I hovering mouse on help text icon inside page block detail "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field "Country" as "USA"
    Then I softly see field "Zip Code" as "20004"
    Then I softly see field "Website" as "www.usaid.gov"
    Then I softly see field "Address Line 2" inside page block
    Then I softly see field "4-digit Zip Code Extension" inside page block
    Then I softly see field "County" inside page block
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    When I hovering mouse on help text icon inside modal "Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    When I hovering mouse on help text icon inside modal "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
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
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Execution" into field "LastName"
    When I enter in modal value "8967093890" into field "Phone"
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
    When I click modal button "Save"
    And I wait for "4" seconds
    And I save the field labeled "Title" as "ContactTitle" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Delete" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Edit" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Related Log" sub tab
    Then I softly see "Active Leads" page block displayed
    Then I softly see "Opportunities" page block displayed
    Then I softly see "Applications" page block displayed
    Then I softly see "Grants" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "# of Organizations Qualified" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Project Period" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "# of Awards" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Total Awarded budget" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Total Spent" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Remaining Balance" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    And I navigate to "Files" sub tab
    Then I softly see "Organization Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:federalFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "<attachment>" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "<attachment>" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Delete" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Edit" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I click on "Delete" icon for "<attachment>" inside flex table with id "---grantee_tableId:-:federalFilesTableId---" without waiting for record
    Then I see the following messages in the page details :
      | File <attachment> deleted successfully. |
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:fedNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "New" :
      | Title   | Description      |
      | <Notes> | Automation Notes |
    Then I softly see value "<Notes>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Delete" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Edit" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    And I click on "Delete" icon for "<Notes>" inside flex table with id "---grantee_tableId:-:fedNotesTableId---" without waiting for record
    Then I softly do not see value "<Notes>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Test" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Grantee testing" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    And I save the value from row "2" for column name "Created By" as "CreatedBy" from flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "{SavedValue:CreatedBy}" for title "Created By" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Delete" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Edit" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | userType    | attachment            | Notes         |
      | GRANTEE FD  | AttachmentTesting.pdf | Notes for FD  |

  @482153 @ValidateFederalusershouldseeallfieldsandsectiononfederalOrg
  Scenario Outline: Validate Federal EXE user should see all fields and section on federal Org
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    And I click on advance filter of table id "---grantee_tableId:-:fedOrgTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:fedOrgTableId---" for LWC
      | Organization Name | contains | Agency For International Development |
    And I click on "View" icon for "Agency For International Development" inside flex table with id "---grantee_tableId:-:fedOrgTableId---" without waiting for record
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Agency For International Development" in the page details
    Then I softly see field "Parent Organization" as "NA"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download As PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Organization Name" as "Agency For International Development"
    Then I softly see field "Abbreviation" as "USAID"
    Then I softly see field "Address Line 1" as "1300 Pennsylvania Ave NW"
    Then I softly see field "City" as "Washington"
    Then I softly see field "State" as "DC"
    Then I softly see field "Congressional District" inside page block
    When I hovering mouse on help text icon inside page block detail "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field "Country" as "USA"
    Then I softly see field "Zip Code" as "20004"
    Then I softly see field "Website" as "www.usaid.gov"
    Then I softly see field "Address Line 2" inside page block
    Then I softly see field "4-digit Zip Code Extension" inside page block
    Then I softly see field "County" inside page block
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    When I hovering mouse on help text icon inside modal "Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    When I hovering mouse on help text icon inside modal "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
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
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Automation" into field "FirstName"
    When I enter in modal value "Execution" into field "LastName"
    When I enter in modal value "8967093890" into field "Phone"
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
    When I click modal button "Save"
    And I wait for "4" seconds
    And I save the field labeled "Title" as "ContactTitle" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Delete" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Edit" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Related Log" sub tab
    Then I softly see "Active Leads" page block displayed
    Then I softly see "Opportunities" page block displayed
    Then I softly see "Applications" page block displayed
    Then I softly see "Grants" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "# of Organizations Qualified" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogActiveLeads---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedOpportunity---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedLogApplications---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Project Period" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "# of Awards" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Total Awarded budget" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Total Spent" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Remaining Balance" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:relatedLogGrants---"
    And I navigate to "Files" sub tab
    Then I softly see "Organization Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:federalFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "<attachment>" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "<attachment>" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Delete" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Edit" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I click on "Delete" icon for "<attachment>" inside flex table with id "---grantee_tableId:-:federalFilesTableId---" without waiting for record
    Then I see the following messages in the page details :
      | File <attachment> deleted successfully. |
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:fedNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "New" :
      | Title   | Description      |
      | <Notes> | Automation Notes |
    Then I softly see value "<Notes>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Delete" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Edit" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    And I click on "Delete" icon for "<Notes>" inside flex table with id "---grantee_tableId:-:fedNotesTableId---" without waiting for record
    Then I softly do not see value "<Notes>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Test" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Grantee testing" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    And I save the value from row "2" for column name "Created By" as "CreatedBy" from flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "{SavedValue:CreatedBy}" for title "Created By" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Delete" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Edit" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | userType    | attachment            | Notes         |
      | GRANTEE EXE | AttachmentTesting.pdf | Notes for EXE |