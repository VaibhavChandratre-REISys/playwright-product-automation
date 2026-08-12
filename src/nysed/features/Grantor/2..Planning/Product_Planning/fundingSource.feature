@fundingSource @planning @productplanning
Feature: Validate all scenarios in Funding Source

  @105208 @105224 @ValidateDatesOfFundingSourceAndFundingAccount
  Scenario: verify start date and end date of funding account should be same or less than funding source date
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Title" as "FundingSourceTitle"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #105224 #monu
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I see the header is "State Funding Source" in the page details
    Then I see the sub-header is "{SavedValue:FundingSourceTitle}" in the page details

  @51036 @addAttachmentToFundingSource
  Scenario: Addition of Attachment to Funding Source
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I wait for "5" seconds
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I click modal button "Close"
    Then I see "Other" has been added in "Funding Source Files" flex table

  @105223 @ValidateErrorMessageForFundingAccountEndDate @smoke
  Scenario: Verify user is able to see error message for end date while entering end date greater than funding source end date
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "5000" into field "EndDate__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Funding account dates should be within funding source dates. |

  @52666 @reactivateFundingSource
  Scenario: Verify that  user can  reactivate the deactivated  Funding Source
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "State Funding Sources - Created"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccId"
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    And I wait for "4" seconds
    And I refresh the page
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Closed"
    When I perform quick search for "{SavedValue:FundingAccId}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside table
    And I click on "Activate" in the page details
    And I wait for "4" seconds
    And I refresh the page
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Active"
    When I perform quick search for "{SavedValue:FundingAccId}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside table
    Then I softly see status in Progress-bar is "Active" and is "dark blue"

  @105225 @ValidateAppropriationAmountOnFundingSource
  Scenario: verify appropriation amount i.e. Cert Level on Active funding source is sum of all active funding accounts
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Title" as "FundingSourceTitle"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "2" seconds
    Then I softly see field "Cert Level" as "$20,000,000"

  @196552 @196555 @ValidatefilerelatedpermissionsforadminprofileduringtheworkflowStatusCreatedActivatedClosedwhenInternalFundingSourceiscreatedbyADMIN @Sprint-3-US-195048
  Scenario: Validate file related permissions for ADMIN profile during the workflow Status (Created, Activated, Closed) when Internal Funding Source is created by ADMIN
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I click on "Edit" icon for "Other" inside flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Supporting Documents" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly see value "Supporting Documents" for title "Classification" inside table "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I wait for "2" seconds
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Supporting Documents" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Edit" against "Supporting Documents" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Supporting Documents" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Delete" against "Supporting Documents" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    And I wait for "3" seconds
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Supporting Documents" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Supporting Documents" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Supporting Documents" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Supporting Documents" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    #196555
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "State Funding Sources - Closed"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Supporting Documents" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Supporting Documents" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I click on "Download" icon for "Supporting Documents" inside flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---" without waiting for record
    And I download the file
    And I wait for "8" seconds
    Then I see "Welcome to Smallpdf" on page "1" of "govgrants" pdf file

  @196553 @ValidatefilerelatedpermissionsforFDprofileduringtheworkflowStatusCreatedActivatedClosedwhenInternalFundingSourceiscreatedbyFD @Sprint-3-US-195048
  Scenario: Validate file related permissions for ADMIN profile during the workflow Status (Created, Activated, Closed) when Internal Funding Source is created by FD
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I wait for "2" seconds
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    And I pause execution for "3" seconds
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I click on "Download" icon for "Other" inside flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---" without waiting for record
    And I download the file
    And I wait for "5" seconds
    Then I see "Welcome to Smallpdf" on page "1" of "govgrants" pdf file

  @196558 @196563 @ValidatefilerelatedpermissionsforEXEprofileduringtheworkflowStatusCreatedActivatedClosedwhenExternalFundingSourceiscreatedbyEXE @Sprint-3-US-195048
  Scenario: Validate file related permissions for FD profile during the workflow Status (Created, Activated, Closed) when External Funding Source is created by FD
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I wait for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    And I wait for "2" seconds
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly cannot see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly cannot see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    #196563
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Federal Funding Sources - All"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I click on "Download" icon for "Other" inside flex table with id "---fundingSource:-:externalFundingSourceTableId---" without waiting for record
    And I download the file
    And I wait for "5" seconds
    Then I softly see "Welcome to Smallpdf" on page "1" of "govgrants" pdf file

  @196559 @196561 @ValidatefilerelatedpermissionsforADMINprofileduringtheworkflowStatusCreatedActivatedClosedwhenExternalFundingSourceiscreatedbyEXE @Sprint-3-US-195048
  Scenario: Validate file related permissions for ADMIN profile during the workflow Status (Created, Activated, Closed) when External Funding Source is created by ADMIN
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I wait for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    And I wait for "3" seconds
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly cannot see row level action button "Edit" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly cannot see row level action button "Delete" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    #196561
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Federal Funding Sources - All"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I click on "Download" icon for "Other" inside flex table with id "---fundingSource:-:externalFundingSourceTableId---" without waiting for record
    And I download the file
    And I wait for "5" seconds
    Then I see "Welcome to Smallpdf" on page "1" of "govgrants" pdf file


