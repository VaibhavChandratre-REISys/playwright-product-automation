@GranteeInternalOrg
Feature: Validate all scenarios for Internal Org

  @482129 @ValidatetheAuditoruserinternalOrganizationallsectionandfields
  Scenario: the Auditor user internal Organization all section and fields
    When I login to "As a Grantor" app as "GRANTEE AUDITOR" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organizations" subheader on left panel
    And I click on "View" icon for "Test Automation Organization" inside flex table with id "---grantee_tableId:-:InternalOrganizations---" without waiting for record
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Test Automation Organization" in the page details
    Then I softly see field "Parent Organization" as "GMS Administrator"
    Then I softly see field "Organization Type" as "Agency"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "UEI Numbers" page block displayed
    Then I softly see "System Information" page block displayed
    When I save the field labeled "Organization Code" as "OrganizationCode"
    Then I softly see field "Organization Code" as "{SavedValue:OrganizationCode}"
    When I save the field labeled "Abbreviation" as "Abbreviation"
    Then I softly see field "Abbreviation" as "{SavedValue:Abbreviation}"
    When I save the field labeled "EIN" as "EIN"
    Then I softly see field "EIN" as "{SavedValue:EIN}"
    When I save the field labeled "UEI" as "UEI"
    Then I softly see field "UEI" as "{SavedValue:UEI}"
    Then I softly see "Address" page block displayed
    When I save the field labeled "Street" as "Street"
    Then I softly see field "Street" as "{SavedValue:Street}"
    When I save the field labeled "City" as "City"
    Then I softly see field "City" as "{SavedValue:City}"
    When I save the field labeled "State" as "State"
    Then I softly see field "State" as "{SavedValue:State}"
    When I save the field labeled "Country" as "Country"
    Then I softly see field "Country" as "{SavedValue:Country}"
    Then I save the field labeled "Zip Code" as "ZipCode"
    Then I softly see field "Zip Code" as "{SavedValue:ZipCode}"
    When I save the field labeled "Website" as "Website"
    Then I softly see field "Website" as "{SavedValue:Website}"
    When I save the field labeled "County" as "County"
    Then I softly see field "County" as "{SavedValue:County}"
    When I "Collapse" page block contaninig value "Address"
    Then I softly do not see fields "BillingStreet" is visible
    When I "Expanded" page block contaninig value "Address"
    Then I softly see fields "BillingStreet" is visible
    When I click on parallel lines menu bar with data target value "Related Contacts"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:RelatedContacts---"
    And I perform quick search for "Automation PM" in "---grantee_tableId:-:RelatedContacts---" panel
    Then I softly cannot see row level action button "Edit" against "Automation PM" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly can see row level action button "View" against "Automation PM" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "View" icon for "Automation PM" inside table
    Then I softly see "Contact" opens in overLay window
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
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    And I save the field labeled "Title" as "Title" on modal
    And I save the field labeled "First Name" as "FirstName" on modal
    And I save the field labeled "Last Name" as "LastName" on modal
    And I save the field labeled "Phone" as "Phone" on modal
    And I save the field labeled "Mobile Phone" as "MobilePhone" on modal
    And I save the field labeled "Email" as "Email" on modal
    And I save the field labeled "Address Line 1" as "AddressLine1" on modal
    And I save the field labeled "State" as "State" on modal
    And I save the field labeled "City" as "City" on modal
    And I save the field labeled "Country" as "Country" on modal
    And I save the field labeled "Zip Code" as "ZipCode" on modal
    And I save the field labeled "Created By" as "CreatedBy" on modal
    And I save the field labeled "Created Date" as "CreatedDate" on modal
    And I save the field labeled "Last Modified By" as "LastModifiedBy" on modal
    And I save the field labeled "Last Modified Date" as "LastModifiedDate" on modal
    Then I see field "Title" as "{SavedValue:Title}" on modal
    Then I see field "First Name" as "{SavedValue:FirstName}" on modal
    Then I see field "Last Name" as "{SavedValue:LastName}" on modal
    Then I see field "Phone" as "{SavedValue:Phone}" on modal
    Then I see field "Mobile Phone" as "{SavedValue:MobilePhone}" on modal
    Then I see field "Email" as "{SavedValue:Email}" on modal
    Then I see field "Address Line 1" as "{SavedValue:AddressLine1}" on modal
    Then I see field "State" as "{SavedValue:State}" on modal
    Then I see field "City" as "{SavedValue:City}" on modal
    Then I see field "Country" as "{SavedValue:Country}" on modal
    Then I see field "Zip Code" as "{SavedValue:ZipCode}" on modal
    Then I see field "Created By" as "{SavedValue:CreatedBy}" on modal
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I see field "Created Date" as "{SavedValue:CreatedDate}" on modal
    Then I see field "Last Modified By" as "{SavedValue:LastModifiedBy}" on modal
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I see field "Last Modified Date" as "{SavedValue:LastModifiedDate}" on modal
    And I wait for "2" seconds
    When I click modal button "Close"
    When I perform quick search for "Automation PM" in "---grantee_tableId:-:RelatedContacts---" panel
    Then I softly see value "Automation PM" for title "Title" inside table "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "View" against "Automation PM" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I cannot see row level action button "Delete" against "Automation PM" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I cannot see row level action button "Edit" against "Automation PM" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on parallel lines menu bar with data target value "Related Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    When I click on "Title" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Full Name" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Ascending" for column "Full Name" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Full Name" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Descending" for column "Full Name" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Email" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Ascending" for column "Email" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Email" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Descending" for column "Email" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Phone" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Ascending" for column "Phone" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Phone" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Descending" for column "Phone" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Is User" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Ascending" for column "Is User" inside table with id "---grantee_tableId:-:RelatedContacts---"
    When I click on "Is User" column header inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see sort order "Descending" for column "Is User" inside table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:RelatedContacts---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:RelatedContacts---"
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Organization Level" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Agency Abbreviation" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Effective Until" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Budget Categories" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:indirectRateTableId---"
    When I click on parallel lines menu bar with data target value "Indirect Rates"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Title" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective from" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Effective from" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective from" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Effective from" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective Until" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Effective Until" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective Until" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Effective Until" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Approved Indirect Cost Rate(%)" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Approved Indirect Cost Rate(%)" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Approved Indirect Cost Rate(%)" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Approved Indirect Cost Rate(%)" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Indirect Cost Rate Type" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Indirect Cost Rate Type" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Indirect Cost Rate Type" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Indirect Cost Rate Type" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Budget Categories" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Budget Categories" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Budget Categories" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Budget Categories" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "UEI Numbers" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "UEI Number" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Registered Entity Name" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Location" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Child Organizations" page block displayed
    Then I softly see link "Created By" inside Page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    Then I softly see link "Last Modified By" inside Page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Related Log" sub tab
    Then I softly see "Qualified Leads" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Qualifying Organization" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "Organization Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see value "Others" for title "Classification" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    When I click on parallel lines menu bar with data target value "Organization Files"
    Then I see option "Refresh" present in parallel dropdown
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "Notes Record for PM" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record for PM" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record for PM" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    Then I see option "Refresh" present in parallel dropdown
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page

  @482124 @VerifytheinternalOrganizationallsectionandfields @PO_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Verify the PO internal Organization all section and fields
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organizations" subheader on left panel
    And I click on "View" icon for "Test Automation Organization" inside flex table with id "---grantee_tableId:-:InternalOrganizations---" without waiting for record
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Test Automation Organization" in the page details
    Then I softly see field "Parent Organization" as "GMS Administrator"
    Then I softly see field "Organization Type" as "Agency"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "UEI Numbers" page block displayed
    Then I softly see "System Information" page block displayed
    When I save the field labeled "Organization Code" as "OrganizationCode"
    Then I softly see field "Organization Code" as "{SavedValue:OrganizationCode}"
    When I save the field labeled "Abbreviation" as "Abbreviation"
    Then I softly see field "Abbreviation" as "{SavedValue:Abbreviation}"
    When I save the field labeled "EIN" as "EIN"
    Then I softly see field "EIN" as "{SavedValue:EIN}"
    When I save the field labeled "UEI" as "UEI"
    Then I softly see field "UEI" as "{SavedValue:UEI}"
    Then I softly see "Address" page block displayed
    When I save the field labeled "Street" as "Street"
    Then I softly see field "Street" as "{SavedValue:Street}"
    When I save the field labeled "City" as "City"
    Then I softly see field "City" as "{SavedValue:City}"
    When I save the field labeled "State" as "State"
    Then I softly see field "State" as "{SavedValue:State}"
    When I save the field labeled "Country" as "Country"
    Then I softly see field "Country" as "{SavedValue:Country}"
    Then I save the field labeled "Zip Code" as "ZipCode"
    Then I softly see field "Zip Code" as "{SavedValue:ZipCode}"
    When I save the field labeled "Website" as "Website"
    Then I softly see field "Website" as "{SavedValue:Website}"
    When I save the field labeled "County" as "County"
    Then I softly see field "County" as "{SavedValue:County}"
    When I "Collapse" page block contaninig value "Address"
    Then I softly do not see fields "BillingStreet" is visible
    When I "Expanded" page block contaninig value "Address"
    Then I softly see fields "BillingStreet" is visible
    When I click on parallel lines menu bar with data target value "Related Contacts"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:RelatedContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see "Create Contact" opens in overLay window
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
    And I wait for "2" seconds
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "---grantee_tableId:-:RelatedContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime}" for title "Title" inside table "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:Automation Runtime}" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "Delete" against "{SavedValue:Automation Runtime}" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "Edit" against "{SavedValue:Automation Runtime}" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Organization Level" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Agency Abbreviation" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Effective Until" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Budget Categories" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:indirectRateTableId---"
    When I click on parallel lines menu bar with data target value "Indirect Rates"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Title" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective from" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Effective from" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective from" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Effective from" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective Until" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Effective Until" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective Until" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Effective Until" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Approved Indirect Cost Rate(%)" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Approved Indirect Cost Rate(%)" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Approved Indirect Cost Rate(%)" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Approved Indirect Cost Rate(%)" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Indirect Cost Rate Type" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Indirect Cost Rate Type" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Indirect Cost Rate Type" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Indirect Cost Rate Type" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Budget Categories" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Budget Categories" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Budget Categories" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Budget Categories" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "UEI Numbers" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "UEI Number" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Registered Entity Name" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Location" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Child Organizations" page block displayed
    Then I softly see link "Created By" inside Page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    Then I softly see link "Last Modified By" inside Page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Related Log" sub tab
    Then I softly see "Qualified Leads" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Qualifying Organization" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "Organization Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Indirect Cost Rate Letter | Supporting Documents | Others |
    And I upload attachment without random number "Attachment.pdf" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I see "Attachment.pdf" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see value "Indirect Cost Rate Letter" for title "Classification" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    And I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:internalOrgFilesTableId---" without waiting for record
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    When I click on parallel lines menu bar with data target value "Organization Files"
    Then I see option "Refresh" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:internalOrgNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:internalOrgNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | <NotesRecord> | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "<NotesRecord>" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see link "<CreatedNotes>" inside Page block
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Delete" against "<NotesRecord>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Edit" against "<NotesRecord>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---" by clicking "Edit" :
      | Created By     | Title          | Description       |
      | <CreatedNotes> | <NotesRecord1> | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "<NotesRecord1>" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    And I save the value from row "1" for column name "Created By" as "CreatedBy" from flex table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "{SavedValue:CreatedBy}" for title "Created By" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Delete" against "<NotesRecord1>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Edit" against "<NotesRecord1>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    And I click on "Delete" icon for "<NotesRecord1>" inside flex table with id "---grantee_tableId:-:internalOrgNotesTableId---" without waiting for record
    Then I softly do not see value "<NotesRecord1>" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    Then I see option "Refresh" present in parallel dropdown
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page

    Examples:
      | userType   | CreatedNotes | NotesRecord     | NotesRecord1     |
      | GRANTEE PO | Grantee PO   | Notes Record PO | Notes Record PO1 |

  @482125 @VerifytheinternalOrganizationallsectionandfields @PO_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Verify the PO internal Organization all section and fields
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organizations" subheader on left panel
    And I click on "View" icon for "Test Automation Organization" inside flex table with id "---grantee_tableId:-:InternalOrganizations---" without waiting for record
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Test Automation Organization" in the page details
    Then I softly see field "Parent Organization" as "GMS Administrator"
    Then I softly see field "Organization Type" as "Agency"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "UEI Numbers" page block displayed
    Then I softly see "System Information" page block displayed
    When I save the field labeled "Organization Code" as "OrganizationCode"
    Then I softly see field "Organization Code" as "{SavedValue:OrganizationCode}"
    When I save the field labeled "Abbreviation" as "Abbreviation"
    Then I softly see field "Abbreviation" as "{SavedValue:Abbreviation}"
    When I save the field labeled "EIN" as "EIN"
    Then I softly see field "EIN" as "{SavedValue:EIN}"
    When I save the field labeled "UEI" as "UEI"
    Then I softly see field "UEI" as "{SavedValue:UEI}"
    Then I softly see "Address" page block displayed
    When I save the field labeled "Street" as "Street"
    Then I softly see field "Street" as "{SavedValue:Street}"
    When I save the field labeled "City" as "City"
    Then I softly see field "City" as "{SavedValue:City}"
    When I save the field labeled "State" as "State"
    Then I softly see field "State" as "{SavedValue:State}"
    When I save the field labeled "Country" as "Country"
    Then I softly see field "Country" as "{SavedValue:Country}"
    Then I save the field labeled "Zip Code" as "ZipCode"
    Then I softly see field "Zip Code" as "{SavedValue:ZipCode}"
    When I save the field labeled "Website" as "Website"
    Then I softly see field "Website" as "{SavedValue:Website}"
    When I save the field labeled "County" as "County"
    Then I softly see field "County" as "{SavedValue:County}"
    When I "Collapse" page block contaninig value "Address"
    Then I softly do not see fields "BillingStreet" is visible
    When I "Expanded" page block contaninig value "Address"
    Then I softly see fields "BillingStreet" is visible
    When I click on parallel lines menu bar with data target value "Related Contacts"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:RelatedContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see "Create Contact" opens in overLay window
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
    And I wait for "2" seconds
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "---grantee_tableId:-:RelatedContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime}" for title "Title" inside table "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:Automation Runtime}" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "Delete" against "{SavedValue:Automation Runtime}" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "Edit" against "{SavedValue:Automation Runtime}" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Organization Level" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Agency Abbreviation" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Effective Until" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Budget Categories" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:indirectRateTableId---"
    When I click on parallel lines menu bar with data target value "Indirect Rates"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Title" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective from" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Effective from" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective from" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Effective from" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective Until" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Effective Until" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective Until" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Effective Until" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Approved Indirect Cost Rate(%)" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Approved Indirect Cost Rate(%)" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Approved Indirect Cost Rate(%)" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Approved Indirect Cost Rate(%)" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Indirect Cost Rate Type" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Indirect Cost Rate Type" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Indirect Cost Rate Type" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Indirect Cost Rate Type" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Budget Categories" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Budget Categories" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Budget Categories" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Budget Categories" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "UEI Numbers" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "UEI Number" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Registered Entity Name" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Location" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Child Organizations" page block displayed
    Then I softly see link "Created By" inside Page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    Then I softly see link "Last Modified By" inside Page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Related Log" sub tab
    Then I softly see "Qualified Leads" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Qualifying Organization" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "Organization Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Indirect Cost Rate Letter | Supporting Documents | Others |
    And I upload attachment without random number "Attachment.pdf" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I see "Attachment.pdf" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see value "Indirect Cost Rate Letter" for title "Classification" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    And I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:internalOrgFilesTableId---" without waiting for record
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    When I click on parallel lines menu bar with data target value "Organization Files"
    Then I see option "Refresh" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:internalOrgNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:internalOrgNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | <NotesRecord> | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "<NotesRecord>" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see link "<CreatedNotes>" inside Page block
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Delete" against "<NotesRecord>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Edit" against "<NotesRecord>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---" by clicking "Edit" :
      | Created By     | Title          | Description       |
      | <CreatedNotes> | <NotesRecord1> | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "<NotesRecord1>" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    And I save the value from row "1" for column name "Created By" as "CreatedBy" from flex table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "{SavedValue:CreatedBy}" for title "Created By" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Delete" against "<NotesRecord1>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Edit" against "<NotesRecord1>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    And I click on "Delete" icon for "<NotesRecord1>" inside flex table with id "---grantee_tableId:-:internalOrgNotesTableId---" without waiting for record
    Then I softly do not see value "<NotesRecord1>" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    Then I see option "Refresh" present in parallel dropdown
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page

    Examples:
      | userType   | CreatedNotes | NotesRecord     | NotesRecord1     |
      | GRANTEE FO | David FO     | Notes Record FO | Notes Record FO1 |

  @482126 @VerifytheinternalOrganizationallsectionandfields @EXE_Grantee @P2_Grantee @GRegression2
  Scenario Outline: Verify the internal Organization all section and fields
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organizations" subheader on left panel
    And I click on "View" icon for "Test Automation Organization" inside flex table with id "---grantee_tableId:-:InternalOrganizations---" without waiting for record
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Test Automation Organization" in the page details
    Then I softly see field "Parent Organization" as "GMS Administrator"
    Then I softly see field "Organization Type" as "Agency"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "UEI Numbers" page block displayed
    Then I softly see "System Information" page block displayed
    When I save the field labeled "Organization Code" as "OrganizationCode"
    Then I softly see field "Organization Code" as "{SavedValue:OrganizationCode}"
    When I save the field labeled "Abbreviation" as "Abbreviation"
    Then I softly see field "Abbreviation" as "{SavedValue:Abbreviation}"
    When I save the field labeled "EIN" as "EIN"
    Then I softly see field "EIN" as "{SavedValue:EIN}"
    When I save the field labeled "UEI" as "UEI"
    Then I softly see field "UEI" as "{SavedValue:UEI}"
    Then I softly see "Address" page block displayed
    When I save the field labeled "Street" as "Street"
    Then I softly see field "Street" as "{SavedValue:Street}"
    When I save the field labeled "City" as "City"
    Then I softly see field "City" as "{SavedValue:City}"
    When I save the field labeled "State" as "State"
    Then I softly see field "State" as "{SavedValue:State}"
    When I save the field labeled "Country" as "Country"
    Then I softly see field "Country" as "{SavedValue:Country}"
    Then I save the field labeled "Zip Code" as "ZipCode"
    Then I softly see field "Zip Code" as "{SavedValue:ZipCode}"
    When I save the field labeled "Website" as "Website"
    Then I softly see field "Website" as "{SavedValue:Website}"
    When I save the field labeled "County" as "County"
    Then I softly see field "County" as "{SavedValue:County}"
    When I "Collapse" page block contaninig value "Address"
    Then I softly do not see fields "BillingStreet" is visible
    When I "Expanded" page block contaninig value "Address"
    Then I softly see fields "BillingStreet" is visible
    When I click on parallel lines menu bar with data target value "Related Contacts"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:RelatedContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see "Create Contact" opens in overLay window
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
    And I wait for "2" seconds
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "---grantee_tableId:-:RelatedContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime}" for title "Title" inside table "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:Automation Runtime}" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "Delete" against "{SavedValue:Automation Runtime}" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "Edit" against "{SavedValue:Automation Runtime}" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Organization Level" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Agency Abbreviation" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Effective Until" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Budget Categories" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:indirectRateTableId---"
    When I click on parallel lines menu bar with data target value "Indirect Rates"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Title" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective from" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Effective from" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective from" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Effective from" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective Until" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Effective Until" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective Until" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Effective Until" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Approved Indirect Cost Rate(%)" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Approved Indirect Cost Rate(%)" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Approved Indirect Cost Rate(%)" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Approved Indirect Cost Rate(%)" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Indirect Cost Rate Type" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Indirect Cost Rate Type" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Indirect Cost Rate Type" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Indirect Cost Rate Type" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Budget Categories" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Budget Categories" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Budget Categories" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Budget Categories" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "UEI Numbers" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "UEI Number" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Registered Entity Name" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Location" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Child Organizations" page block displayed
    Then I softly see link "Created By" inside Page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    Then I softly see link "Last Modified By" inside Page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Related Log" sub tab
    Then I softly see "Qualified Leads" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Qualifying Organization" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "Organization Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Indirect Cost Rate Letter | Supporting Documents | Others |
    And I upload attachment without random number "Attachment.pdf" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I see "Attachment.pdf" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see value "Indirect Cost Rate Letter" for title "Classification" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    And I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:internalOrgFilesTableId---" without waiting for record
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    When I click on parallel lines menu bar with data target value "Organization Files"
    Then I see option "Refresh" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:internalOrgNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:internalOrgNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | <NotesRecord> | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "<NotesRecord>" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see link "<CreatedNotes>" inside Page block
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Delete" against "<NotesRecord>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Edit" against "<NotesRecord>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---" by clicking "Edit" :
      | Created By     | Title          | Description       |
      | <CreatedNotes> | <NotesRecord1> | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "<NotesRecord1>" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    And I save the value from row "1" for column name "Created By" as "CreatedBy" from flex table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "{SavedValue:CreatedBy}" for title "Created By" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Delete" against "<NotesRecord1>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Edit" against "<NotesRecord1>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    And I click on "Delete" icon for "<NotesRecord1>" inside flex table with id "---grantee_tableId:-:internalOrgNotesTableId---" without waiting for record
    Then I softly do not see value "<NotesRecord1>" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    Then I see option "Refresh" present in parallel dropdown
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page

    Examples:
      | userType    | CreatedNotes | NotesRecord      | NotesRecord1      |
      | GRANTEE EXE | Victor EXE   | Notes Record EXE | Notes Record EXE1 |

  @482127 @VerifytheinternalOrganizationallsectionandfields @FD_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Verify the FD internal Organization all section and fields
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organizations" subheader on left panel
    And I click on "View" icon for "Test Automation Organization" inside flex table with id "---grantee_tableId:-:InternalOrganizations---" without waiting for record
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Test Automation Organization" in the page details
    Then I softly see field "Parent Organization" as "GMS Administrator"
    Then I softly see field "Organization Type" as "Agency"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Address" page block displayed
    Then I softly see "Related Contacts" page block displayed
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "UEI Numbers" page block displayed
    Then I softly see "System Information" page block displayed
    When I save the field labeled "Organization Code" as "OrganizationCode"
    Then I softly see field "Organization Code" as "{SavedValue:OrganizationCode}"
    When I save the field labeled "Abbreviation" as "Abbreviation"
    Then I softly see field "Abbreviation" as "{SavedValue:Abbreviation}"
    When I save the field labeled "EIN" as "EIN"
    Then I softly see field "EIN" as "{SavedValue:EIN}"
    When I save the field labeled "UEI" as "UEI"
    Then I softly see field "UEI" as "{SavedValue:UEI}"
    Then I softly see "Address" page block displayed
    When I save the field labeled "Street" as "Street"
    Then I softly see field "Street" as "{SavedValue:Street}"
    When I save the field labeled "City" as "City"
    Then I softly see field "City" as "{SavedValue:City}"
    When I save the field labeled "State" as "State"
    Then I softly see field "State" as "{SavedValue:State}"
    When I save the field labeled "Country" as "Country"
    Then I softly see field "Country" as "{SavedValue:Country}"
    Then I save the field labeled "Zip Code" as "ZipCode"
    Then I softly see field "Zip Code" as "{SavedValue:ZipCode}"
    When I save the field labeled "Website" as "Website"
    Then I softly see field "Website" as "{SavedValue:Website}"
    When I save the field labeled "County" as "County"
    Then I softly see field "County" as "{SavedValue:County}"
    When I "Collapse" page block contaninig value "Address"
    Then I softly do not see fields "BillingStreet" is visible
    When I "Expanded" page block contaninig value "Address"
    Then I softly see fields "BillingStreet" is visible
    When I click on parallel lines menu bar with data target value "Related Contacts"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:RelatedContacts---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see "Create Contact" opens in overLay window
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
    And I wait for "2" seconds
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "---grantee_tableId:-:RelatedContacts---" panel
    Then I softly see value "{SavedValue:Automation Runtime}" for title "Title" inside table "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "View" against "{SavedValue:Automation Runtime}" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "Delete" against "{SavedValue:Automation Runtime}" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I can see row level action button "Edit" against "{SavedValue:Automation Runtime}" in flex table with id "---grantee_tableId:-:RelatedContacts---"
    Then I softly see "Child Organizations" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Organization" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Organization Level" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Agency Abbreviation" in flex table header "---grantee_tableId:-:childOrganizationTableId---"
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Effective Until" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "Budget Categories" in flex table header "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:indirectRateTableId---"
    When I click on parallel lines menu bar with data target value "Indirect Rates"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Title" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective from" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Effective from" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective from" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Effective from" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective Until" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Effective Until" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Effective Until" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Effective Until" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Approved Indirect Cost Rate(%)" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Approved Indirect Cost Rate(%)" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Approved Indirect Cost Rate(%)" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Approved Indirect Cost Rate(%)" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Indirect Cost Rate Type" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Indirect Cost Rate Type" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Indirect Cost Rate Type" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Indirect Cost Rate Type" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Budget Categories" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Budget Categories" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    When I click on "Budget Categories" column header inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see sort order "Descending" for column "Budget Categories" inside table with id "---grantee_tableId:-:indirectRateTableId---"
    Then I softly see "UEI Numbers" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "UEI Number" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Registered Entity Name" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Location" in flex table header "---grantee_tableId:-:uieNumberTableId---"
    Then I softly see "Child Organizations" page block displayed
    Then I softly see link "Created By" inside Page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    Then I softly see link "Last Modified By" inside Page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Related Log" sub tab
    Then I softly see "Qualified Leads" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Qualifying Organization" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:relatedLogsQualifiedLeadsTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "Organization Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Indirect Cost Rate Letter | Supporting Documents | Others |
    And I upload attachment without random number "Attachment.pdf" of type "Indirect Cost Rate Letter" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I see "Attachment.pdf" has been added in "Organization Files" flex table
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see value "Indirect Cost Rate Letter" for title "Classification" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgFilesTableId---"
    And I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:internalOrgFilesTableId---" without waiting for record
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:internalOrgFilesTableId---"
    When I click on parallel lines menu bar with data target value "Organization Files"
    Then I see option "Refresh" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:internalOrgNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:internalOrgNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | <NotesRecord> | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "<NotesRecord>" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "Automation Notes" for title "Description" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see link "<CreatedNotes>" inside Page block
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Delete" against "<NotesRecord>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Edit" against "<NotesRecord>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---" by clicking "Edit" :
      | Created By     | Title          | Description       |
      | <CreatedNotes> | <NotesRecord1> | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "<NotesRecord1>" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    And I save the value from row "1" for column name "Created By" as "CreatedBy" from flex table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I softly see value "{SavedValue:CreatedBy}" for title "Created By" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Delete" against "<NotesRecord1>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    Then I can see row level action button "Edit" against "<NotesRecord1>" in flex table with id "---grantee_tableId:-:internalOrgNotesTableId---"
    And I click on "Delete" icon for "<NotesRecord1>" inside flex table with id "---grantee_tableId:-:internalOrgNotesTableId---" without waiting for record
    Then I softly do not see value "<NotesRecord1>" for title "Title" inside table "---grantee_tableId:-:internalOrgNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    Then I see option "Refresh" present in parallel dropdown
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page

    Examples:
      | userType   | CreatedNotes       | NotesRecord     | NotesRecord1     |
      | GRANTEE FD | Danielle FD Garcia | Notes Record FD | Notes Record FD1 |

  @497967 @Validateauditoruserdonotseeinlineeditbuttonforfederalinternalorginternalcontactfederalnonfederalorgandnonfederalcontactbutnotabletoedittherecord @P3_Grantee @GRegression1
  Scenario: Validate auditor user do not see inline edit button for federal, internal org, internal contact federal, non federal org and non-federal contact but not able to edit the record
    When I login to "As a Grantor" app as "GRANTEE PM" user
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
    And I wait for "1" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I save the field labeled "Organization Name" as "OrganizationName"
#    Federal Contact
    When I navigate to "Home" tab
    And I navigate to "External" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    When I enter in modal value "Other" into field "Role__c"
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
    When I click modal button "Save"
    And I wait for "2" seconds
    And I save the field labeled "Title" as "Title" on modal
    When I click modal button "Close"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:fedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:fedContactTableId---"
#    Non-Federal Contact
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    When I enter in modal value "Automation Runtime" into field "Title"
    When I enter in modal value "Test With Automation PM" into field "AccountId"
    When I enter in modal value "Other" into field "Role__c"
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
    When I click modal button "Save"
    And I wait for "2" seconds
    And I save the field labeled "Title" as "NonFedTitle" on modal
    And I click modal button "Close"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:NonFedTitle}" in "---grantee_tableId:-:nonFedContactTableId---" panel
    Then I softly see that "{SavedValue:NonFedTitle}" has been added in flextable with Id "---grantee_tableId:-:nonFedContactTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
#    Internal Org
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organizations" subheader on left panel
    Then I softly can see row level action button "View" against "Test Automation Organization" in flex table with id "---grantee_tableId:-:InternalOrganizations---"
    Then I softly cannot see row level action button "Edit" against "Test Automation Organization" in flex table with id "---grantee_tableId:-:InternalOrganizations---"
    Then I softly can see row level action button "View" against "GMS Administrator" in flex table with id "---grantee_tableId:-:InternalOrganizations---"
    Then I softly cannot see row level action button "Edit" against "GMS Administrator" in flex table with id "---grantee_tableId:-:InternalOrganizations---"
    And I expand nested table containing column value "GMS Administrator"
    And I wait for "2" seconds
    Then I softly can see row level action button "View" against "Department of Product" in flex table with id "---grantee_tableId:-:InternalOrgDivisionTableId---"
    Then I softly cannot see row level action button "Edit" against "Department of Product" in flex table with id "---grantee_tableId:-:InternalOrgDivisionTableId---"
#   Federal Org
    And I navigate to "External" content inside "Organizations" subheader on left panel
    When I perform quick search for "Agency For International Development" in "---grantee_tableId:-:fedOrgTableId---" panel
    Then I softly can see row level action button "View" against "Agency For International Development" in flex table with id "---grantee_tableId:-:fedOrgTableId---"
    Then I softly cannot see row level action button "Edit" against "Agency For International Development" in flex table with id "---grantee_tableId:-:fedOrgTableId---"
#    Non-Federal Org
    When I perform quick search for "{SavedValue:OrganizationName}" in "---grantee_tableId:-:nonFedOrgTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OrganizationName}" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:OrganizationName}" in flex table with id "---grantee_tableId:-:nonFedOrgTableId---"
#    Internal Contact
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I perform quick search for "Sarah PM" in "---grantee_tableId:-:InternalContacts---" panel
    Then I softly can see row level action button "View" against "Sarah PM" in flex table with id "---grantee_tableId:-:InternalContacts---"
    Then I softly cannot see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:InternalContacts---"
#    Federal Contact
    And I navigate to "External" content inside "Contacts" subheader on left panel
    When I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:fedContactTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:fedContactTableId---"
#    Non-Federal Contact
    And I perform quick search for "{SavedValue:NonFedTitle}" in "---grantee_tableId:-:nonFedContactTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:NonFedTitle}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:NonFedTitle}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"


