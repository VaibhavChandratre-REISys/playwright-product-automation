@GranteeNonFederalOrgamization
Feature: Validate all scenarios for Non Federal Organization

  @460982 @ValidateNonFederalAuditorprofileusershouldseeallfieldsandsectiononNonfederalOrglayoutinreadonlyViewonlyAccess
  Scenario Outline: Validate Non Federal Auditor profile user should see all fields and section on Non federal Org layout in readonly View only Access
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "www.google.com" into field "Website"
    When I enter in modal value "erer" into field "AddressLine2__c"
    When I enter in modal value "1234" into field "BillingPostalCodeExtension__c"
    When I enter in modal value "vegas" into field "County__c"
    When I enter in modal value "Automation Runtime Organization" into field "Name"
    When I enter in modal value "NGO" into field "NonFederalOrganizationType__c"
    When I enter in modal value "Street 1" into field "BillingStreet"
    When I enter in modal value "New York" into field "BillingCity"
    When I enter in modal value "AL" into field "State__c"
    When I enter in modal value "USA" into field "BillingCountry"
    When I enter in modal value "45623" into field "BillingPostalCode"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field labeled "Organization Name" as "OrganizationName"
    Then I softly see field "Organization Name" as "{SavedValue:OrganizationName}"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
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
    When I enter in modal value "Other" into field "Role__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I save the field labeled "Title" as "ContactTitle" on modal
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
    And I save the field labeled "4-Digit Zip Code Extension" as "4-DigitZipCodeExtension" on modal
    And I save the field labeled "Zip Code" as "ZipCode" on modal
    And I save the field labeled "Created By" as "CreatedBy" on modal
    And I save the field labeled "Created Date" as "CreatedDate" on modal
    And I save the field labeled "Last Modified By" as "LastModifiedBy" on modal
    And I save the field labeled "Last Modified Date" as "LastModifiedDate" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Delete" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Edit" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I save the field labeled "Created By" as "CreatedByPage"
    Then I softly see field "Created By" as "{SavedValue:CreatedByPage}"
    And I save the field labeled "Created Date" as "CreatedDatePage"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDatePage}"
    And I save the field labeled "Last Modified By" as "LastModifiedByPage"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedByPage}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDatePage"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDatePage}"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "<attachment>" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    When I enter the following values into flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "New" :
      | Title   | Description      |
      | <Notes> | Automation Notes |
    And I re-login to "As a Grantee" app as "<userAuditor>" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFedOrgTableId---"
    And I perform quick search for "{SavedValue:OrganizationName}" in "---grantee_tableId:-:nonFedOrgTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:OrganizationName}" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:OrganizationName}" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    When I click on "View" icon for "{SavedValue:OrganizationName}" inside table
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:OrganizationName}" in the page details
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
    Then I softly see field "Organization Name" as "{SavedValue:OrganizationName}"
    Then I softly see field "Address Line 1" as "Street 1"
    Then I softly see field "City" as "New York"
    Then I softly see field "State" as "AL"
    Then I softly see field "Congressional District" as "123"
    When I hovering mouse on help text icon inside page block detail "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field "Country" as "USA"
    Then I softly see field "Zip Code" as "45623"
    Then I softly see field "Website" as "www.google.com"
    Then I softly see field "County" as "vegas"
    Then I softly see field "Address Line 2" as "erer"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FedOrgRelatedContacts---"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    When I click on "View" icon for "{SavedValue:ContactTitle}" inside flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I softly see "Contact" opens in overLay window
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
    Then I see field "Title" as "{SavedValue:ContactTitle}" on modal
    Then I see field "First Name" as "{SavedValue:FirstName}" on modal
    Then I see field "Last Name" as "{SavedValue:LastName}" on modal
    Then I see field "Phone" as "{SavedValue:Phone}" on modal
    Then I see field "Mobile Phone" as "{SavedValue:MobilePhone}" on modal
    Then I see field "Email" as " {SavedValue:Email}" on modal
    Then I see field "Address Line 1" as "{SavedValue:AddressLine1}" on modal
    Then I see field "Address Line 2" as "{SavedValue:AddressLine2}" on modal
    Then I see field "State" as "{SavedValue:State}" on modal
    Then I see field "Congressional District" as "{SavedValue:CongressionalDistrict}" on modal
    Then I see field "City" as "{SavedValue:City}" on modal
    Then I see field "Country" as "{SavedValue:Country}" on modal
    Then I see field "County" as "{SavedValue:County}" on modal
    Then I see field "4-Digit Zip Code Extension" as "{SavedValue:4-DigitZipCodeExtension}" on modal
    Then I see field "Zip Code" as "{SavedValue:ZipCode}" on modal
    Then I see field "Created By" as "{SavedValue:CreatedBy}" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I see field "Created Date" as "{SavedValue:CreatedDate}" on modal
    Then I see field "Last Modified By" as "{SavedValue:LastModifiedBy}" on modal
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I see field "Last Modified Date" as "{SavedValue:LastModifiedDate}" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I cannot see row level action button "Delete" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I cannot see row level action button "Edit" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I softly see field "Created By" as "{SavedValue:CreatedByPage}"
    And I save the field labeled "Created Date" as "CreatedDatePage1"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDatePage1}"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedByPage}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDatePage1"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDatePage1}"
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
    And I wait for "2" seconds
    Then I see "<attachment>" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I cannot see row level action button "Delete" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I cannot see row level action button "Edit" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "<Notes>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Delete" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Edit" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | userType   | attachment     | Notes        |  userAuditor     |
      | GRANTEE PM | Attachment.pdf | Notes Record |  GRANTEE AUDITOR |

  @461000 @NonFederalVerifyusershouldseeallfieldsandsectiononNonfederalOrg @P3_Grantee @PO_Grantee @GRegression3
  Scenario Outline: Non Federal Verify user should see all fields and section on Non federal Org
    When I login to "As a Grantor" app as "GRANTEE PM" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:nonFedOrgTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "www.google.com" into field "Website"
    When I enter in modal value "erer" into field "AddressLine2__c"
    When I enter in modal value "1234" into field "BillingPostalCodeExtension__c"
    When I enter in modal value "vegas" into field "County__c"
    When I enter in modal value "Automation Runtime Organization" into field "Name"
    When I enter in modal value "NGO" into field "NonFederalOrganizationType__c"
    When I enter in modal value "Street 1" into field "BillingStreet"
    When I enter in modal value "New York" into field "BillingCity"
    When I enter in modal value "AL" into field "State__c"
    When I enter in modal value "USA" into field "BillingCountry"
    When I enter in modal value "45623" into field "BillingPostalCode"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:federalFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Organization Files" flex table
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFedOrgTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime Organization}" in "---grantee_tableId:-:nonFedOrgTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Organization}" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Organization}" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    When I click on "View" icon for "{SavedValue:Automation Runtime Organization}" inside table
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Organization}" in the page details
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
    And I save the field labeled "Organization Name" as "OrganizationName"
    Then I softly see field "Organization Name" as "{SavedValue:OrganizationName}"
    Then I softly see field "Address Line 1" as "Street 1"
    Then I softly see field "City" as "New York"
    Then I softly see field "State" as "AL"
    Then I softly see field "Congressional District" as "123"
    When I hovering mouse on help text icon inside page block detail "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field "Country" as "USA"
    Then I softly see field "Zip Code" as "45623"
    Then I softly see field "Website" as "www.google.com"
    Then I softly see field "County" as "vegas"
    Then I softly see field "Address Line 2" as "erer"
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
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Other" into field "Role__c"
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
    And I wait for "2" seconds
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
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:nonFedChildOrgTableId---"
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
    Then I see "Attachment.pdf" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
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
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "Edit" :
      | Created By | Title   | Description     |
      | <userName> | <Title> | Grantee testing |
    Then I softly see value "<Title>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Grantee testing" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    And I save the value from row "1" for column name "Created By" as "CreatedBy" from flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "{SavedValue:CreatedBy}" for title "Created By" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Delete" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Edit" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    Examples:
      | userType    | Notes         | userName           | Title |
      | GRANTEE PO  | Notes for PO  | Grantee PO         | Test1 |

  @482144 @ValidateNonFederalFOprofileusershouldseeallfieldsandsectiononNonfederalOrglayoutinreadonlyViewonlyAccess @P3_Grantee @FO_Grantee @GRegression4
  Scenario Outline: Validate Non Federal FO profile user should see all fields and section on Non federal Org layout in readonly View only Access
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "www.google.com" into field "Website"
    When I enter in modal value "erer" into field "AddressLine2__c"
    When I enter in modal value "1234" into field "BillingPostalCodeExtension__c"
    When I enter in modal value "vegas" into field "County__c"
    When I enter in modal value "Automation Runtime Organization" into field "Name"
    When I enter in modal value "NGO" into field "NonFederalOrganizationType__c"
    When I enter in modal value "Street 1" into field "BillingStreet"
    When I enter in modal value "New York" into field "BillingCity"
    When I enter in modal value "AL" into field "State__c"
    When I enter in modal value "USA" into field "BillingCountry"
    When I enter in modal value "45623" into field "BillingPostalCode"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field labeled "Organization Name" as "OrganizationName"
    Then I softly see field "Organization Name" as "{SavedValue:OrganizationName}"
    And I save the field labeled "Created By" as "CreatedByPage"
    Then I softly see field "Created By" as "{SavedValue:CreatedByPage}"
    And I save the field labeled "Created Date" as "CreatedDatePage"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDatePage}"
    And I save the field labeled "Last Modified By" as "LastModifiedByPage"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedByPage}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDatePage"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDatePage}"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "<attachment>" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    When I enter the following values into flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "New" :
      | Title   | Description      |
      | <Notes> | Automation Notes |
    And I re-login to "As a Grantee" app as "<userProfile>" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFedOrgTableId---"
    And I perform quick search for "{SavedValue:OrganizationName}" in "---grantee_tableId:-:nonFedOrgTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:OrganizationName}" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:OrganizationName}" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    When I click on "View" icon for "{SavedValue:OrganizationName}" inside table
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:OrganizationName}" in the page details
    Then I softly see field "Parent Organization" as "NA"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Organization Name" as "{SavedValue:OrganizationName}"
    Then I softly see field "Address Line 1" as "Street 1"
    Then I softly see field "City" as "New York"
    Then I softly see field "State" as "AL"
    Then I softly see field "Congressional District" as "123"
    When I hovering mouse on help text icon inside page block detail "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field "Country" as "USA"
    Then I softly see field "Zip Code" as "45623"
    Then I softly see field "Website" as "www.google.com"
    Then I softly see field "County" as "vegas"
    Then I softly see field "Address Line 2" as "erer"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Other" into field "Role__c"
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
    And I wait for "2" seconds
    And I save the field labeled "Title" as "ContactTitle" on modal
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
    And I save the field labeled "4-Digit Zip Code Extension" as "4-DigitZipCodeExtension" on modal
    And I save the field labeled "Zip Code" as "ZipCode" on modal
    And I save the field labeled "Created By" as "CreatedBy" on modal
    And I save the field labeled "Created Date" as "CreatedDate" on modal
    And I save the field labeled "Last Modified By" as "LastModifiedBy" on modal
    And I save the field labeled "Last Modified Date" as "LastModifiedDate" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    When I click on "View" icon for "{SavedValue:ContactTitle}" inside flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I softly see "Contact" opens in overLay window
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
    Then I see field "Title" as "{SavedValue:ContactTitle}" on modal
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
    Then I see field "4-Digit Zip Code Extension" as "{SavedValue:4-DigitZipCodeExtension}" on modal
    Then I see field "Zip Code" as "{SavedValue:ZipCode}" on modal
    Then I see field "Created By" as "{SavedValue:CreatedBy}" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I see field "Created Date" as "{SavedValue:CreatedDate}" on modal
    Then I see field "Last Modified By" as "{SavedValue:LastModifiedBy}" on modal
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I see field "Last Modified Date" as "{SavedValue:LastModifiedDate}" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Delete" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Edit" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I softly see field "Created By" as "{SavedValue:CreatedByPage}"
    And I save the field labeled "Created Date" as "CreatedDatePage1"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDatePage1}"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedByPage}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDatePage1"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDatePage1}"
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
    And I wait for "2" seconds
    Then I see "<attachment>" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I cannot see row level action button "Delete" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I cannot see row level action button "Edit" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "<Notes>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Delete" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Edit" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "New" :
      | Title          | Description      |
      | <NotesProfile> | Automation Notes |
    Then I can see row level action button "Delete" against "<NotesProfile>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Edit" against "<NotesProfile>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "Edit" :
      | Created By | Title          | Description                  |
      | <userName> | <updatedTitle> | Automation Notes Description |
    Then I softly see value "<updatedTitle>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Automation Notes Description" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "<userName>" for title "Created By" inside table "---grantee_tableId:-:fedNotesTableId---"
    And I click on "Delete" icon for "<updatedTitle>" inside flex table with id "---grantee_tableId:-:fedNotesTableId---" without waiting for record
    Then I softly do not see value "<updatedTitle>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | userType   | attachment     | Notes        | userName           | userProfile | NotesProfile         | updatedTitle                        |
      | GRANTEE PM | Attachment.pdf | Notes Record | David FO           | GRANTEE FO  | Notes Record for FO  | Notes Record for David FO           |

  @482146 @ValidateNonFederalFOprofileusershouldseeallfieldsandsectiononNonfederalOrglayoutinreadonlyViewonlyAccess @P2_Grantee @FD_Grantee @GRegression4
  Scenario Outline: Validate Non Federal FD profile user should see all fields and section on Non federal Org layout in readonly View only Access
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "www.google.com" into field "Website"
    When I enter in modal value "erer" into field "AddressLine2__c"
    When I enter in modal value "1234" into field "BillingPostalCodeExtension__c"
    When I enter in modal value "vegas" into field "County__c"
    When I enter in modal value "Automation Runtime Organization" into field "Name"
    When I enter in modal value "NGO" into field "NonFederalOrganizationType__c"
    When I enter in modal value "Street 1" into field "BillingStreet"
    When I enter in modal value "New York" into field "BillingCity"
    When I enter in modal value "AL" into field "State__c"
    When I enter in modal value "USA" into field "BillingCountry"
    When I enter in modal value "45623" into field "BillingPostalCode"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field labeled "Organization Name" as "OrganizationName"
    Then I softly see field "Organization Name" as "{SavedValue:OrganizationName}"
    And I save the field labeled "Created By" as "CreatedByPage"
    Then I softly see field "Created By" as "{SavedValue:CreatedByPage}"
    And I save the field labeled "Created Date" as "CreatedDatePage"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDatePage}"
    And I save the field labeled "Last Modified By" as "LastModifiedByPage"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedByPage}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDatePage"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDatePage}"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "<attachment>" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    When I enter the following values into flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "New" :
      | Title   | Description      |
      | <Notes> | Automation Notes |
    And I re-login to "As a Grantee" app as "<userProfile>" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFedOrgTableId---"
    And I perform quick search for "{SavedValue:OrganizationName}" in "---grantee_tableId:-:nonFedOrgTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:OrganizationName}" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:OrganizationName}" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    When I click on "View" icon for "{SavedValue:OrganizationName}" inside table
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:OrganizationName}" in the page details
    Then I softly see field "Parent Organization" as "NA"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Organization Name" as "{SavedValue:OrganizationName}"
    Then I softly see field "Address Line 1" as "Street 1"
    Then I softly see field "City" as "New York"
    Then I softly see field "State" as "AL"
    Then I softly see field "Congressional District" as "123"
    When I hovering mouse on help text icon inside page block detail "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field "Country" as "USA"
    Then I softly see field "Zip Code" as "45623"
    Then I softly see field "Website" as "www.google.com"
    Then I softly see field "County" as "vegas"
    Then I softly see field "Address Line 2" as "erer"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Other" into field "Role__c"
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
    And I wait for "2" seconds
    And I save the field labeled "Title" as "ContactTitle" on modal
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
    And I save the field labeled "4-Digit Zip Code Extension" as "4-DigitZipCodeExtension" on modal
    And I save the field labeled "Zip Code" as "ZipCode" on modal
    And I save the field labeled "Created By" as "CreatedBy" on modal
    And I save the field labeled "Created Date" as "CreatedDate" on modal
    And I save the field labeled "Last Modified By" as "LastModifiedBy" on modal
    And I save the field labeled "Last Modified Date" as "LastModifiedDate" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    When I click on "View" icon for "{SavedValue:ContactTitle}" inside flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I softly see "Contact" opens in overLay window
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
    Then I see field "Title" as "{SavedValue:ContactTitle}" on modal
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
    Then I see field "4-Digit Zip Code Extension" as "{SavedValue:4-DigitZipCodeExtension}" on modal
    Then I see field "Zip Code" as "{SavedValue:ZipCode}" on modal
    Then I see field "Created By" as "{SavedValue:CreatedBy}" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I see field "Created Date" as "{SavedValue:CreatedDate}" on modal
    Then I see field "Last Modified By" as "{SavedValue:LastModifiedBy}" on modal
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I see field "Last Modified Date" as "{SavedValue:LastModifiedDate}" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Delete" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Edit" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I softly see field "Created By" as "{SavedValue:CreatedByPage}"
    And I save the field labeled "Created Date" as "CreatedDatePage1"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDatePage1}"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedByPage}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDatePage1"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDatePage1}"
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
    And I wait for "2" seconds
    Then I see "<attachment>" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I cannot see row level action button "Delete" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I cannot see row level action button "Edit" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "<Notes>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Delete" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Edit" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "New" :
      | Title          | Description      |
      | <NotesProfile> | Automation Notes |
    Then I can see row level action button "Delete" against "<NotesProfile>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Edit" against "<NotesProfile>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "Edit" :
      | Created By | Title          | Description                  |
      | <userName> | <updatedTitle> | Automation Notes Description |
    Then I softly see value "<updatedTitle>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Automation Notes Description" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "<userName>" for title "Created By" inside table "---grantee_tableId:-:fedNotesTableId---"
    And I click on "Delete" icon for "<updatedTitle>" inside flex table with id "---grantee_tableId:-:fedNotesTableId---" without waiting for record
    Then I softly do not see value "<updatedTitle>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | userType   | attachment     | Notes        | userName           | userProfile | NotesProfile         | updatedTitle                        |
      | GRANTEE PM | Attachment.pdf | Notes Record | Danielle FD Garcia | GRANTEE FD  | Notes Record for FD  | Notes Record for Danielle FD Garcia |

  @482149 @ValidateNonFederalEXEprofileusershouldseeallfieldsandsectiononNonfederalOrglayoutinreadonlyViewonlyAccess @P1_Grantee @EXE_Grantee @GRegression1
  Scenario Outline: Validate Non Federal EXE profile user should see all fields and section on Non federal Org layout in readonly View only Access
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "www.google.com" into field "Website"
    When I enter in modal value "erer" into field "AddressLine2__c"
    When I enter in modal value "1234" into field "BillingPostalCodeExtension__c"
    When I enter in modal value "vegas" into field "County__c"
    When I enter in modal value "Automation Runtime Organization" into field "Name"
    When I enter in modal value "NGO" into field "NonFederalOrganizationType__c"
    When I enter in modal value "Street 1" into field "BillingStreet"
    When I enter in modal value "New York" into field "BillingCity"
    When I enter in modal value "AL" into field "State__c"
    When I enter in modal value "USA" into field "BillingCountry"
    When I enter in modal value "45623" into field "BillingPostalCode"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field labeled "Organization Name" as "OrganizationName"
    Then I softly see field "Organization Name" as "{SavedValue:OrganizationName}"
    And I save the field labeled "Created By" as "CreatedByPage"
    Then I softly see field "Created By" as "{SavedValue:CreatedByPage}"
    And I save the field labeled "Created Date" as "CreatedDatePage"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDatePage}"
    And I save the field labeled "Last Modified By" as "LastModifiedByPage"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedByPage}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDatePage"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDatePage}"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "<attachment>" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    When I enter the following values into flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "New" :
      | Title   | Description      |
      | <Notes> | Automation Notes |
    And I re-login to "As a Grantee" app as "<userProfile>" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFedOrgTableId---"
    And I perform quick search for "{SavedValue:OrganizationName}" in "---grantee_tableId:-:nonFedOrgTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:OrganizationName}" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:OrganizationName}" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    When I click on "View" icon for "{SavedValue:OrganizationName}" inside table
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:OrganizationName}" in the page details
    Then I softly see field "Parent Organization" as "NA"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Organization Name" as "{SavedValue:OrganizationName}"
    Then I softly see field "Address Line 1" as "Street 1"
    Then I softly see field "City" as "New York"
    Then I softly see field "State" as "AL"
    Then I softly see field "Congressional District" as "123"
    When I hovering mouse on help text icon inside page block detail "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field "Country" as "USA"
    Then I softly see field "Zip Code" as "45623"
    Then I softly see field "Website" as "www.google.com"
    Then I softly see field "County" as "vegas"
    Then I softly see field "Address Line 2" as "erer"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:FedOrgRelatedContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Other" into field "Role__c"
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
    And I wait for "2" seconds
    And I save the field labeled "Title" as "ContactTitle" on modal
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
    And I save the field labeled "4-Digit Zip Code Extension" as "4-DigitZipCodeExtension" on modal
    And I save the field labeled "Zip Code" as "ZipCode" on modal
    And I save the field labeled "Created By" as "CreatedBy" on modal
    And I save the field labeled "Created Date" as "CreatedDate" on modal
    And I save the field labeled "Last Modified By" as "LastModifiedBy" on modal
    And I save the field labeled "Last Modified Date" as "LastModifiedDate" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    When I click on "View" icon for "{SavedValue:ContactTitle}" inside flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I softly see "Contact" opens in overLay window
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
    Then I see field "Title" as "{SavedValue:ContactTitle}" on modal
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
    Then I see field "4-Digit Zip Code Extension" as "{SavedValue:4-DigitZipCodeExtension}" on modal
    Then I see field "Zip Code" as "{SavedValue:ZipCode}" on modal
    Then I see field "Created By" as "{SavedValue:CreatedBy}" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I see field "Created Date" as "{SavedValue:CreatedDate}" on modal
    Then I see field "Last Modified By" as "{SavedValue:LastModifiedBy}" on modal
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I see field "Last Modified Date" as "{SavedValue:LastModifiedDate}" on modal
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:ContactTitle}" in "---grantee_tableId:-:FedOrgRelatedContacts---" panel
    Then I softly see value "{SavedValue:ContactTitle}" for title "Title" inside table "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Delete" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I can see row level action button "Edit" against "{SavedValue:ContactTitle}" in flex table with id "---grantee_tableId:-:FedOrgRelatedContacts---"
    Then I softly see field "Created By" as "{SavedValue:CreatedByPage}"
    And I save the field labeled "Created Date" as "CreatedDatePage1"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDatePage1}"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedByPage}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDatePage1"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDatePage1}"
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
    And I wait for "2" seconds
    Then I see "<attachment>" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I cannot see row level action button "Delete" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I cannot see row level action button "Edit" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "<attachment>" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "<Notes>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Delete" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I cannot see row level action button "Edit" against "<Notes>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "New" :
      | Title          | Description      |
      | <NotesProfile> | Automation Notes |
    Then I can see row level action button "Delete" against "<NotesProfile>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Edit" against "<NotesProfile>" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "Edit" :
      | Created By | Title          | Description                  |
      | <userName> | <updatedTitle> | Automation Notes Description |
    Then I softly see value "<updatedTitle>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Automation Notes Description" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "<userName>" for title "Created By" inside table "---grantee_tableId:-:fedNotesTableId---"
    And I click on "Delete" icon for "<updatedTitle>" inside flex table with id "---grantee_tableId:-:fedNotesTableId---" without waiting for record
    Then I softly do not see value "<updatedTitle>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | userType   | attachment     | Notes        | userName           | userProfile | NotesProfile         | updatedTitle                        |
      | GRANTEE PM | Attachment.pdf | Notes Record | Victor EXE         | GRANTEE EXE | Notes Record for EXE | Notes Record for Victor EXE         |

  @477510 @NonFederalVerifyusershouldseeallfieldsandsectiononNonfederalOrg
  Scenario Outline: Non Federal Verify user should see all fields and section on Non federal Org
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Organizations" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:nonFedOrgTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    Then I softly see "Create Non-Federal Organization" opens in overLay window
    Then I softly see field on modal "Organization Name" inside page block
    Then I softly see field on modal "Abbreviation" inside page block
    Then I softly see field on modal "Non-Federal Organization Type" inside page block
    Then I softly see field on modal "Website" inside page block
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
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "www.google.com" into field "Website"
    When I enter in modal value "erer" into field "AddressLine2__c"
    When I enter in modal value "1234" into field "BillingPostalCodeExtension__c"
    When I enter in modal value "vegas" into field "County__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | City is required to save.     |
      | State is required to save.    |
      | Country is required to save.  |
      | Zip Code is required to save. |
    And I wait for "2" seconds
    When I enter in modal value "Automation Runtime Organization" into field "Name"
    When I enter in modal value "NGO" into field "NonFederalOrganizationType__c"
    When I enter in modal value "Street 1" into field "BillingStreet"
    When I enter in modal value "New York" into field "BillingCity"
    When I enter in modal value "AL" into field "State__c"
    When I enter in modal value "USA" into field "BillingCountry"
    When I enter in modal value "45623" into field "BillingPostalCode"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    Then I see the header is "Non-Federal Organization" in the page details
    Then I see the sub-header is "Automation Runtime Organization" in the page details
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
    And I save the field labeled "Organization Name" as "OrganizationName"
    Then I softly see field "Organization Name" as "{SavedValue:OrganizationName}"
    Then I softly see field "Address Line 1" as "Street 1"
    Then I softly see field "City" as "New York"
    Then I softly see field "State" as "AL"
    Then I softly see field "Congressional District" as "123"
    When I hovering mouse on help text icon inside page block detail "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field "Country" as "USA"
    Then I softly see field "Zip Code" as "45623"
    Then I softly see field "Website" as "www.google.com"
    Then I softly see field "County" as "vegas"
    Then I softly see field "Address Line 2" as "erer"
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
    And I wait for "3" seconds
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
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:nonFedChildOrgTableId---"
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:nonFedChildOrgTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:nonFedChildOrgAssociateTableId---"
    When I click "Associate" after selection of "NGO" in the table "---grantee_tableId:-:nonFedChildOrgAssociateTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Organization Name" as "OrganizationName" from flex table "---grantee_tableId:-:nonFedChildOrgTableId---"
    Then I softly see value "{SavedValue:OrganizationName}" for title "Organization Name" inside table "---grantee_tableId:-:nonFedChildOrgTableId---"
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
    And I click on "Delete" icon for "<attachment>" inside flex table with id "---grantee_tableId:-:federalFilesTableId---"
    Then I do not see "<attachment>" has been added in "Organization Files" flex table
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
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:fedNotesTableId---" by clicking "Edit" :
      | Created By | Title   | Description     |
      | <userName> | <Title> | Grantee testing |
    Then I softly see value "<Title>" for title "Title" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "Grantee testing" for title "Description" inside table "---grantee_tableId:-:fedNotesTableId---"
    And I save the value from row "1" for column name "Created By" as "CreatedBy" from flex table "---grantee_tableId:-:fedNotesTableId---"
    Then I softly see value "{SavedValue:CreatedBy}" for title "Created By" inside table "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Delete" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    Then I can see row level action button "Edit" against "Grantee testing" in flex table with id "---grantee_tableId:-:fedNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | userType      | attachment     | Notes           | userName   | Title |
      | GRANTEE ADMIN | Attachment.pdf | Notes for ADMIN | Product QA | Test2 |
