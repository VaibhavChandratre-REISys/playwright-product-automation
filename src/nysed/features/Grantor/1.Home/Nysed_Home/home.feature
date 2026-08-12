@homeNysed
Feature: Validate all scenarios in the home tab

  @501982 @502008 @502010 @502013 @502018 @502015 @502016 @502331 @Sprint-05 @US-500132 @M04
  Scenario Outline: Verify that the Internal user see the SED Code field is added on Organization Profile->Overview Tab->Description Section
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    #501982
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "SED Code" inside page block
    Then I softly see field "SED Code" is not editable
    When I hovering mouse on help text icon inside page block detail "SED Code"
    Then I softly see "Local Education Agency code for the institution." shown as help text
    #502008
    Then I softly see field "Institution ID" inside page block
    Then I softly see field "Institution ID" added after "SED Code"
    Then I softly see field "Institution ID" is not editable
    When I hovering mouse on help text icon inside page block detail "Institution ID"
    Then I softly see "Institution ID for the institution. This is the main identifier for an institution." shown as help text
    #502010
    Then I softly see field "GG Institution Type" inside page block
    Then I softly see field "GG Institution Type" added after "Institution ID"
    Then I softly see field "GG Institution Type" is not editable
    #502013
    Then I softly see field "County Code" inside page block
    Then I softly see field "County Code" is not editable
    #502018
    Then I softly see field "Municipality Code" inside page block
    Then I softly see field "Municipality Code" is not editable
    #502015
    Then I softly see field "Federal ID" inside page block
    Then I softly see field "Federal ID" added after "Municipality Code"
    Then I softly see field "Federal ID" is not editable
    #502016
    Then I softly see field "Interest Eligible" inside page block
    Then I softly see field "Interest Eligible" is not editable
    When I hovering mouse on help text icon inside page block detail "Interest Eligible"
    Then I softly see "Interest eligible indicator associated with the payee info for this institution." shown as help text
    #502331
    Then I softly see field "Vendor ID" inside page block
    Then I softly see field "Vendor ID" is not editable
    When I hovering mouse on help text icon inside page block detail "Vendor ID"
    Then I softly see "A Vendor ID is a State-provided identification number." shown as help text
    Then I softly see field "OSC Vendor Status" inside page block
    Then I softly see field "OSC Vendor Status" is not editable
    When I hovering mouse on help text icon inside page block detail "OSC Vendor Status"
    Then I softly see "OSC (Office of State Comptroller) vendor status Active/Inactive flag. Used with payments." shown as help text
    Then I softly see field "Payee Name" inside page block
    Then I softly see field "Payee Name" is not editable
    Then I softly see field "Not For Profit" inside page block
    Then I softly see field "Not For Profit" is not editable
    When I hovering mouse on help text icon inside page block detail "Not For Profit"
    Then I softly see "Not for profit Yes/No flag. Used with payments." shown as help text

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |

  @502354 @502355 @502357 @502360 @502378 @502380 @502383 @502384 @Sprint-05 @US-501033 @M04
  Scenario Outline: Verify that the Grantee user see the SED Code field is added on Organization Profile->Overview Tab->Description Section
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    #502354
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "SED Code" inside page block
    Then I softly see field "SED Code" is not editable
    When I hovering mouse on help text icon inside page block detail "SED Code"
    Then I softly see "Local Education Agency code for the institution." shown as help text
    #502355
    Then I softly see field "Institution ID" inside page block
    Then I softly see field "Institution ID" added after "SED Code"
    Then I softly see field "Institution ID" is not editable
    When I hovering mouse on help text icon inside page block detail "Institution ID"
    Then I softly see "Institution ID for the institution. This is the main identifier for an institution." shown as help text
    #502357
    Then I softly see field "GG Institution Type" inside page block
    Then I softly see field "GG Institution Type" added after "Institution ID"
    Then I softly see field "GG Institution Type" is not editable
    #502360
    Then I softly see field "County Code" inside page block
    Then I softly see field "County Code" is not editable
    #502378
    Then I softly see field "Municipality Code" inside page block
    Then I softly see field "Municipality Code" is not editable
    #502380
    Then I softly see field "Federal ID" inside page block
    Then I softly see field "Federal ID" added after "Municipality Code"
    Then I softly see field "Federal ID" is not editable
    #502383
    Then I softly see field "Interest Eligible" inside page block
    Then I softly see field "Interest Eligible" is not editable
    When I hovering mouse on help text icon inside page block detail "Interest Eligible"
    Then I softly see "Interest eligible indicator associated with the payee info for this institution." shown as help text
    #502384
    Then I softly see field "Vendor ID" inside page block
    Then I softly see field "Vendor ID" is not editable
    When I hovering mouse on help text icon inside page block detail "Vendor ID"
    Then I softly see "A Vendor ID is a State-provided identification number." shown as help text
    Then I softly see field "OSC Vendor Status" inside page block
    Then I softly see field "OSC Vendor Status" is not editable
    When I hovering mouse on help text icon inside page block detail "OSC Vendor Status"
    Then I softly see "OSC (Office of State Comptroller) vendor status Active/Inactive flag. Used with payments." shown as help text
    Then I softly see field "Payee Name" inside page block
    Then I softly see field "Payee Name" is not editable
    Then I softly see field "Not For Profit" inside page block
    Then I softly see field "Not For Profit" is not editable
    When I hovering mouse on help text icon inside page block detail "Not For Profit"
    Then I softly see "Not for profit Yes/No flag. Used with payments." shown as help text

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @504559 @Sprint-05 @US-500133 @M04
  Scenario Outline: Verify that the Internal user see the SED Code field is added on Organization Profile->Overview Tab->Description Section
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    #504559
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Hold Payments" inside page block
    Then I softly see field "Hold Payments" is not editable
    Then I softly see field "Hold Payments" as "No"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |
#      | FO       |
#      | FD       |

  @504582 @Sprint-05 @US-500133 @bug_Id_511097 @M04
    @NYSED-4860 @NYSEDSprint-28 @US-NYSED-3904
  Scenario Outline: Verify that 'Hold Payments' field under Organization layout->Overview tab->Description section is not editable to Admin user and default value is 'N'
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    #504559 #NYSED-4860
    Then I softly can see top right button "Edit" in page detail
    Then I softly see field "Institution ID" as "{SavedValue:InstitutionIDForAutomationPermanentNysedSchoolOrg}"
    Then I softly see field "Hold Payments" inside page block
    When I click on "Edit" in the page details
    Then I softly see field "Hold Payments" is not editable
    Then I softly see field "Hold Payments" as "No"
    And I enter value "1236" into field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    #NYSED-4860
    Then I softly see field "4-Digit Zip Code Extension" as "1236"

    Examples:
      | UserType |
      | ADMIN    |

  @504564 @Sprint-05 @US-500133 @M04
  Scenario Outline: Verify that other internal users except Admin and FD users cannot see Manage Holds button on organization Profile page layout
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    #504564
    Then I softly cannot see top right button "Manage Holds" in page detail

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |
#      | FO       |

  @504563 @Sprint-05 @US-500133 @M04
  Scenario Outline: Verify that other internal users except Admin and FD users cannot see Manage Holds button on organization Profile page layout
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    #504563
    Then I softly can see top right button "Manage Holds" in page detail

    Examples:
      | UserType |
      | FD       |
#      | ADMIN    |

  @504568 @Sprint-05 @US-500133 @bug_id_511097 @M04
  Scenario Outline: Verify that the Hold payments field is editable when clicked on Manage holds button and it is a picklist field with 'Y' and 'N' options
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    #504568
    Then I softly can see top right button "Manage Holds" in page detail
    When I click on "Manage Holds" in the page details
    Then I softly see fields "Hold_Payments__c" is in edit mode
    Then I see only the following ordered options in dropdown field "Hold_Payments__c" :
      | --None-- | Yes | No |
    And I enter in modal value "Yes" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Hold Payments" as "Yes"
    When I click on "Manage Holds" in the page details
    And I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Hold Payments" as "No"

    Examples:
      | UserType |
      | FD       |
      | ADMIN    |

  @504560 @504580 @511512 @Sprint-05 @US-501033 @M04
  Scenario Outline: Verify that Grantee user see 'Hold Payments' field is added on the External Organization layout → Overview tab → Description section, is not editable and default value is 'N'
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    #504560
    Then I softly can see top right button "Edit" in page detail
    Then I softly see field "Hold Payments" inside page block
    Then I softly see field "Hold Payments" is not editable
    Then I softly see field "Hold Payments" as "No"
    #504580
    Then I softly cannot see top right button "Manage Holds" in page detail
     #511512
    Then I softly see field "GG Institution Type" as "Public School Districts"
    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_CE |

  @504610 @Sprint-05 @US-501033 @M04
  Scenario Outline:Verify that the Grantee user see updated value of 'Hold Payment' field
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Manage Holds" in page detail
    When I click on "Manage Holds" in the page details
    And I enter in modal value "Yes" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
     #504610
    Then I softly see field "Hold Payments" as "Yes"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Manage Holds" in page detail
    When I click on "Manage Holds" in the page details
    And I enter in modal value "No" into field "Hold_Payments__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Overview" sub tab
     #504610
    Then I softly see field "Hold Payments" as "No"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      |GRANTEE_CE |

  @506221 @Sprint-06 @US-503093 @M04
  Scenario Outline:Verify that an internal user does not see the 'Active individual Subrecipients' list view on Home->Organizations->Subrecipients and 'Individual Subrecipients-Pending' list view on Home->Organizations->Pending Subrecipients registration
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    Then I softly see "Subrecipients Organization - All" page block displayed
    Then I softly do not see "Active individual Subrecipients" page block displayed
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    Then I softly do not see "Active individual Subrecipients" page block displayed

    Examples:
      | UserType |
      | FD       |
      | FO       |
      | PM       |
      | PO       |
      | EXE      |

  @506232 @Sprint-06 @US-503093 @M04
  Scenario Outline:Verify that an internal user does not see the 'Active individual Subrecipients' list view on Home->Organizations->Subrecipients and 'Individual Subrecipients-Pending' list view on Home->Organizations->Pending Subrecipients registration
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    Then I see only the following headers in table with id "ActiveAccount" :
      | Actions | SED Code | Institution ID | Name | UEI | Type | Approved Date | Status |

    Examples:
      | UserType |
      | FD       |
      | FO       |
      | PM       |
      | PO       |
      | EXE      |

  @506235 @Sprint-06 @US-503093 @M04
  Scenario Outline:Verify that the mentioned list filters are added at Home->Organization->Subrecipients list view
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    Then I softly see toggle option "Subrecipients Organization - All" inside flex table id "ActiveAccount"
    Then I softly see toggle option "Subrecipients Organization - Active" inside flex table id "ActiveAccount"
    Then I softly see toggle option "Subrecipients Organization - Inactive" inside flex table id "ActiveAccount"
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    Then I softly see toggle option "Subrecipients Organization - All" inside flex table id "ActiveAccount"
    When I perform quick search for "Active" in "ActiveAccount" panel
    Then I softly see value "Active" for title "Status" inside table "ActiveAccount"
    When I perform quick search for "Inactive" in "ActiveAccount" panel
    Then I softly see value "Inactive" for title "Status" inside table "ActiveAccount"
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    Then I softly see toggle option "Subrecipients Organization - Active" inside flex table id "ActiveAccount"
    And I click toggle button to select "Subrecipients Organization - Active"
    When I perform quick search for "Active" in "ActiveAccount" panel
    Then I softly see value "Active" for title "Status" inside table "ActiveAccount"
    When I perform quick search for "Inactive" in "ActiveAccount" panel
    Then I softly see "No Records Found" inside flex table with id "ActiveAccount"
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipients Organization - Inactive"
    Then I softly see toggle option "Subrecipients Organization - Inactive" inside flex table id "ActiveAccount"
    When I perform quick search for "Inactive" in "ActiveAccount" panel
    Then I softly see value "Inactive" for title "Status" inside table "ActiveAccount"
    When I perform quick search for "Active" in "ActiveAccount" panel
    Then I softly see "No Records Found" inside flex table with id "ActiveAccount"

    Examples:
      | UserType |
      | FD       |
#      | FO       |
#      | PM       |
#      | PO       |
#      | EXE      |

  @510166 @510301 @510303 @510306 @529688 @529690 @529693 @US-527259 @Sprint-11 @Sprint-7 @US-503307 @M04 @M05
  Scenario Outline:Verify that internal users see that 'Office' as a new field is added in the Contact Information section after the 'Mobile Phone' field on the 'Create Internal Contact' modal under Home-->Contacts-->Internal-->New.
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I pause execution for "3" seconds
    When I click on top right button "New" in flex table with id "---home:-:internalContactTableId---"
    #529688
    Then I softly see field "Organization" as "{SavedValue:ProgramOrganization}"
    Then I softly see that "Organization" rendered in view mode only
    Then I softly do not see "Address Information" page block displayed
    Then I softly see field "Office" added after "Mobile Phone"
    And I enter "Creation" values from "InternalContact_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB3" into field "NYSEDOffice__c"
    And I click modal button "Save"
    #529688
    Then I softly see value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB" for title "Office" against the value "{SavedValue:Automation Runtime Contact} Contact" inside table "---home:-:internalContactTableId---"
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:internalContactTableId---"
     #529690
    Then I softly see field "Organization" as "{SavedValue:ProgramOrganization}"
    Then I softly see that "Organization" rendered in view mode only
    Then I softly do not see "Address Information" page block displayed
    And I enter value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB" into field "NYSEDOffice__c"
    And I click modal button "Save"
    #529690
    Then I softly see value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB" for title "Office" against the value "{SavedValue:Automation Runtime Contact} Contact" inside table "---home:-:internalContactTableId---"
    And I wait for "2" seconds
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:internalContactTableId---"
    #510301
    Then I softly see "Edit Internal Contacts" opens in overLay window
    Then I softly see field "Office" added after "Mobile Phone"
    And I clear the value from field "NYSEDOffice__c"
#    And I clear in modal the value from table field "NYSEDOffice__c"
    And I click modal button "Save"
    Then I softly see value "" for title "Office" against the value "{SavedValue:Automation Runtime Contact} Contact" inside table "---home:-:internalContactTableId---"
    #510303
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:internalContactTableId---"
    Then I softly see "Edit Internal Contacts" opens in overLay window
    Then I softly see field "Office" added after "Mobile Phone"
    And I enter value "Automation Office" into field "NYSEDOffice__c"
    And I click modal button "Save"
    When I click on "View" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:internalContactTableId---"
    Then I softly see "View Internal Contacts" opens in overLay window
    Then I softly see field "Office" added after "Mobile Phone"
    Then I softly see field "Office" as "Automation Office"
    #529693
    Then I softly do not see "Address Information" page block displayed
    Then I softly do not see "System Information" page block displayed
    And I click modal button "Edit"
    And I wait for "2" seconds
    #529693
    Then I softly see field "Organization" as "{SavedValue:ProgramOrganization}"
    Then I softly see that "Organization" rendered in view mode only
    Then I softly do not see "Address Information" page block displayed
    Then I softly do not see "System Information" page block displayed
    And I click modal button "Close"
    #510306
    Then I see the following rows under the following headers in table with id "---home:-:internalContactTableId---" :
      | Name                                            | Office            |
      | {SavedValue:Automation Runtime Contact} Contact | Automation Office |

    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |
      | PO    |
      | FO    |
      | FD    |

  @521631 @Sprint-09 @US-518565 @M04
  Scenario Outline: Verify that the Internal User see that Contact Us information is updated to below NYSED related information in Home module-->Technical Support-->Contact Us
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Contact Us" content inside "Technical Support" subheader on left panel
    Then I softly see the text containing "Address:"
    Then I softly see the text containing "New York State Education Department"
    Then I softly see the text containing "Phone:"
    Then I softly see the text containing "(518) 474-4815"
    Then I softly see the text containing "Email:"
    Then I softly see the text containing "Grants Financial Management System (GFMS) Team"
    Then I softly see the text containing "Grantsweb@nysed.gov"
    Then I softly see the text containing "510W EB, 89 Washington Ave,"
    Then I softly see the text containing "Albany, NY 12234"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |
#      | EXE      |

  @521635 @Sprint-09 @US-518565 @M04
  Scenario Outline: Verify that the Grantee User see that Contact Us information is updated to below NYSED related information in Home module-->Technical Support-->Contact Us
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Contact Us" content inside "Technical Support" subheader on left panel
    Then I softly see the text containing "Address:"
    Then I softly see the text containing "New York State Education Department"
    Then I softly see the text containing "Phone:"
    Then I softly see the text containing "(518) 474-4815"
    Then I softly see the text containing "Email:"
    Then I softly see the text containing "Grants Financial Management System (GFMS) Team"
    Then I softly see the text containing "Grantsweb@nysed.gov"
    Then I softly see the text containing "510W EB, 89 Washington Ave,"
    Then I softly see the text containing "Albany, NY 12234"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_LEA |
#      | GRANTEE_VO  |
#      | GRANTEE_CE  |
#      | GRANTEE_NU  |

  @521626 @Sprint-09 @US-518565 @M04
  Scenario: Verify that the Grantee User see that Contact Us information is updated to below NYSED related information in Home module-->Technical Support-->Contact Us
    When I am on "SUBPORTAL" portal
    And I click "NYSED Home" footer link
    And I wait for "2" seconds
    And I switch to tab number "1"
    And I see "https://www.nysed.gov/" in current url
    And I close the tab
    And I click "Contact Us" footer link
    And I wait for "2" seconds
    And I switch to tab number "1"
    And I see "https://www.oms.nysed.gov/cafe/" in current url
    And I close the tab
    And I click "Internet Privacy Policy" footer link
    And I wait for "2" seconds
    And I switch to tab number "1"
    And I see "https://www.nysed.gov/internet-privacy-policy" in current url
    And I close the tab
    And I click "Terms of Use" footer link
    And I wait for "2" seconds
    And I switch to tab number "1"
    And I see "https://www.nysed.gov/terms-of-use" in current url
    And I close the tab
    And I click "Diversity & Access" footer link
    And I wait for "2" seconds
    And I switch to tab number "1"
    And I see "https://www.nysed.gov/office-diversity-and-access" in current url
    And I close the tab
    And I click "Accessibility" footer link
    And I wait for "2" seconds
    And I switch to tab number "1"
    And I see "https://www.nysed.gov/terms-of-use#Accessibility" in current url
    And I close the tab
    And I click "Disclaimer" footer link
    And I wait for "2" seconds
    And I switch to tab number "1"
    And I see "https://www.nysed.gov/terms-of-use#Disclaimers" in current url

  @527903 @527905 @525745 @525777 @525761 @525740 @Sprint-10 @US-519469 @M05
  Scenario: Verify that the Admin user can see the Validation Message and cannot add the already added Fiscal year if try to save the details on Create Indirect Cost Rate modal window with duplicate Fiscal Year
  |Verify that the Admin user can see the Validation Message and cannot add the already added Fiscal year if try to save the details on Edit Indirect Cost Rate modal window with duplicate Fiscal Year|
  |Verify that the Admin user can Edit and Delete the Indirect Cost Rate added in the 'Indirect Rates' section on the Subrecipient Organization page.|
  |Verify that the Admin user can see the 'Create Indirect Cost Rate' modal has fields- A. Fiscal Year. B. Restricted Indirect Cost Rate (%). C. Unrestricted Indirect Cost Rate (%).|
  |Verify that the Admin user can see the New button in the 'Indirect Cost Rate' section on the Subrecipient Organization page.|
  |Verify that the Admin user sees the 'Indirect Cost Rate' section and that the section contains a table with the following columns on the Subrecipient Organization page.|
#    Use year 1995, 1996, 1997
    When I login to "As a Grantor" app as "ADMIN" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" inside table
    And I navigate to "Overview" sub tab
    Then I softly see "Indirect Cost Rate" page block displayed
    Then I see only the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
    And I click on top right button "New" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    Then I softly see "Create Indirect Cost Rate" opens in overLay window
    Then I softly see field "Fiscal Year" inside page block
    Then I softly see field "Restricted Indirect Cost Rate (%)" inside page block
    Then I softly see field "Unrestricted Indirect Cost Rate (%)" inside page block
    When I enter value "20.88" into field "---home:-:RestrictedindirectCostRate---"
    When I enter value "20.88" into field "---home:-:UnrestrictedindirectCostRate---"
    When I enter value "1995" into field "---home:-:FiscalYear---"
    And I click modal button "Save"
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    Then I see the following rows under the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions     | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
      | Action menu | 1994 - 1995 | 20.88%                            | 20.88%                              |
    #User should not add duplicate type per fiscal year
    And I click on top right button "New" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    When I enter value "20.88" into field "---home:-:RestrictedindirectCostRate---"
    When I enter value "20.88" into field "---home:-:UnrestrictedindirectCostRate---"
    When I enter value "1995" into field "---home:-:FiscalYear---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Duplicate entries are not allowed for Indirect Cost Rate for same Fiscal Year. |
    And I click modal button "Close"
    And I click "OK" on modal confirmation box
    #User should not edit duplicate fiscal year
    #adding new record for editing it later
    And I navigate to "Overview" sub tab
    Then I softly see "Indirect Cost Rate" page block displayed
    And I click on top right button "New" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    And I wait for "3" seconds
    When I enter value "20.88" into field "---home:-:RestrictedindirectCostRate---"
    When I enter value "20.88" into field "---home:-:UnrestrictedindirectCostRate---"
    When I enter value "1996" into field "---home:-:FiscalYear---"
    And I click modal button "Save"
    When I perform quick search for "1995 - 1996" in "---home:-:orgnizationIndirectRateTable---" panel
    And I click on "Edit" icon for "1995 - 1996" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see "Edit Indirect Cost Rate" opens in overLay window
    And I wait for "3" seconds
    When I enter value "1995" into field "---home:-:FiscalYear---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Duplicate entries are not allowed for Indirect Cost Rate for same Fiscal Year. |
    When I enter value "1997" into field "---home:-:FiscalYear---"
    And I click modal button "Save"
    When I perform quick search for "1996 - 1997" in "---home:-:orgnizationIndirectRateTable---" panel
      #deleting the created records
    And I click on "Delete" icon for "1996 - 1997" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    When I perform quick search for "1996 - 1997" in "---home:-:orgnizationIndirectRateTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---home:-:orgnizationIndirectRateTable---"
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
      #deleting the created records
    And I click on "Delete" icon for "1994 - 1995" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

  @525831 @525738 @535732 @535731 @NYSEDSprint-10 @Sprint-10 @US-519469 @US-532445 @M05
  Scenario: Verify that the Admin user can see the 'Create Indirect Cost Rate' modal has a required field 'Fiscal Year' and this is picklist field with YYYY-YYYY format on save
    When I login to "As a Grantor" app as "ADMIN" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" inside table
    And I navigate to "Overview" sub tab
    Then I softly see "Indirect Cost Rate" page block displayed
    And I click on top right button "New" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    Then I softly see "Create Indirect Cost Rate" opens in overLay window
    Then I softly see asterisk mark on "Fiscal Year"
    #535732 #535731
    Then I see only the following ordered options in dropdown field "---home:-:FiscalYear---" :
      | --None-- | 1990 | 1991 | 1992 | 1993 | 1994 | 1995 | 1996 | 1997 | 1998 | 1999 | 2000 | 2001 | 2002 | 2003 | 2004 | 2005 | 2006 | 2007 | 2008 | 2009 | 2010 | 2011 | 2012 | 2013 | 2014 | 2015 | 2016 | 2017 | 2018 | 2019 | 2020 | 2021 | 2022 | 2023 | 2024 | 2025 | 2026 | 2027 | 2028 | 2029 | 2030 | 2031 | 2032 | 2033 | 2034 | 2035 | 2036 | 2037 | 2038 | 2039 | 2040 | 2041 | 2042 | 2043 | 2044 | 2045 | 2046 | 2047 | 2048 | 2049 | 2050 | 2051 | 2052 | 2053 | 2054 | 2055 | 2056 | 2057 | 2058 | 2059 | 2060 | 2061 | 2062 | 2063 | 2064 | 2065 | 2066 | 2067 | 2068 | 2069 | 2070 | 2071 | 2072 | 2073 | 2074 | 2075 |
    When I enter value "20.88" into field "---home:-:RestrictedindirectCostRate---"
    When I enter value "20.88" into field "---home:-:UnrestrictedindirectCostRate---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To save, Fiscal Year is required. |
    When I enter value "1995" into field "---home:-:FiscalYear---"
    And I click modal button "Save"
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    #535732 #535731
    Then I see the following rows under the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions     | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
      | Action menu | 1994 - 1995 | 20.88%                            | 20.88%                              |
    And I click on "Edit" icon for "1994 - 1995" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see "Edit Indirect Cost Rate" opens in overLay window
    When I enter value "--None--" into field "---home:-:FiscalYear---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To save, Fiscal Year is required. |
    When I enter value "1995" into field "---home:-:FiscalYear---"
    And I click modal button "Save"
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    Then I see the following rows under the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions     | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
      | Action menu | 1994 - 1995 | 20.88%                            | 20.88%                              |
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
      #deleting the created records
    And I click on "Delete" icon for "1994 - 1995" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

  @525858 @Sprint-10 @US-519469 @M05
  Scenario: Verify that the Admin user can see the 'Create Indirect Cost Rate' modal has a required percentage field 'Restricted Indirect Cost Rate (%)' and decimal allowed upto 2
    When I login to "As a Grantor" app as "ADMIN" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" inside table
    And I navigate to "Overview" sub tab
    Then I softly see "Indirect Cost Rate" page block displayed
    And I click on top right button "New" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    Then I softly see "Create Indirect Cost Rate" opens in overLay window
    Then I softly see asterisk mark on "Restricted Indirect Cost Rate (%)"
    When I enter value "20.88" into field "---home:-:UnrestrictedindirectCostRate---"
    When I enter value "1995" into field "---home:-:FiscalYear---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To save, Restricted Indirect Cost Rate (%) is required. |
    When I enter value "-99" into field "---home:-:RestrictedindirectCostRate---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Restricted Indirect Cost Rate cannot be negative. |
    When I enter value "101" into field "---home:-:RestrictedindirectCostRate---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Restricted Indirect Cost Rate cannot be more than 100%. |
    When I enter value "20.8889" into field "---home:-:RestrictedindirectCostRate---"
    And I click modal button "Save"
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    Then I see the following rows under the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions     | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
      | Action menu | 1994 - 1995 | 20.88%                            | 20.88%                              |
    And I click on "Edit" icon for "1994 - 1995" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see "Edit Indirect Cost Rate" opens in overLay window
    And I wait for "3" seconds
    When I enter value "0" into field "---home:-:RestrictedindirectCostRate---"
    And I click modal button "Save"
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    Then I see the following rows under the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions     | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
      | Action menu | 1994 - 1995 | 0.00%                             | 20.88%                              |
    And I click on "Edit" icon for "1994 - 1995" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see "Edit Indirect Cost Rate" opens in overLay window
    And I clear the value from field "---home:-:RestrictedindirectCostRate---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To save, Restricted Indirect Cost Rate (%) is required. |
    When I enter value "21.88" into field "---home:-:RestrictedindirectCostRate---"
    And I click modal button "Save"
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    Then I see the following rows under the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions     | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
      | Action menu | 1994 - 1995 | 21.88%                            | 20.88%                              |
    And I click on "Delete" icon for "1994 - 1995" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

  @HomeExe @525860 @Sprint-10 @US-519469 @M05
  Scenario: Verify that the Admin user can see the 'Create Indirect Cost Rate' modal has a required percentage field 'Unrestricted Indirect Cost Rate (%)' and 2 digit decimal allowed
    When I login to "As a Grantor" app as "ADMIN" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" inside table
    And I navigate to "Overview" sub tab
    Then I softly see "Indirect Cost Rate" page block displayed
    And I click on top right button "New" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    Then I softly see "Create Indirect Cost Rate" opens in overLay window
    Then I softly see asterisk mark on "Unrestricted Indirect Cost Rate (%)"
    When I enter value "20.88" into field "---home:-:RestrictedindirectCostRate---"
    When I enter value "1995" into field "---home:-:FiscalYear---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To save, Unrestricted Indirect Cost Rate (%) is required. |
    When I enter value "-89" into field "---home:-:UnrestrictedindirectCostRate---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Unrestricted Indirect Cost Rate cannot be negative. |
    When I enter value "101" into field "---home:-:UnrestrictedindirectCostRate---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Unrestricted Indirect Cost Rate cannot be more than 100%. |
    When I enter value "20.8889" into field "---home:-:UnrestrictedindirectCostRate---"
    And I click modal button "Save"
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    Then I see the following rows under the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions     | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
      | Action menu | 1994 - 1995 | 20.88%                            | 20.88%                              |
    And I click on "Edit" icon for "1994 - 1995" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see "Edit Indirect Cost Rate" opens in overLay window
    When I enter value "0" into field "---home:-:UnrestrictedindirectCostRate---"
    And I click modal button "Save"
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    Then I see the following rows under the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions     | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
      | Action menu | 1994 - 1995 | 20.88%                            | 0.00%                               |
    And I click on "Edit" icon for "1994 - 1995" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see "Edit Indirect Cost Rate" opens in overLay window
    And I clear the value from field "---home:-:UnrestrictedindirectCostRate---"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To save, Unrestricted Indirect Cost Rate (%) is required. |
    When I enter value "21.88" into field "---home:-:UnrestrictedindirectCostRate---"
    And I click modal button "Save"
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    Then I see the following rows under the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions     | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
      | Action menu | 1994 - 1995 | 20.88%                            | 21.88%                              |
    And I click on "Delete" icon for "1994 - 1995" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

  @HomeExe @525755 @Sprint-10 @US-519469 @M05
  Scenario Outline: Verify that the Other than Admin user cannot Edit and Delete the Indirect Cost Rate added in the 'Indirect Cost Rate' section on the Subrecipient Organization page.
    When I login to "As a Grantor" app as "ADMIN" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    And I navigate to "Overview" sub tab
    Then I softly see "Indirect Cost Rate" page block displayed
    And I click on top right button "New" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    Then I softly see "Create Indirect Cost Rate" opens in overLay window
    When I enter value "20.88" into field "---home:-:RestrictedindirectCostRate---"
    When I enter value "20.88" into field "---home:-:UnrestrictedindirectCostRate---"
    When I enter value "1995" into field "---home:-:FiscalYear---"
    And I click modal button "Save"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    And I navigate to "Overview" sub tab
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    Then I see the following rows under the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions     | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
      | Action menu | 1994 - 1995 | 20.88%                            | 20.88%                              |
    Then I softly cannot see row level action button "Edit" against "1994 - 1995" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    Then I softly cannot see row level action button "Delete" against "1994 - 1995" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    And I navigate to "Overview" sub tab
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    And I click on "Delete" icon for "1994 - 1995" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | UserType |
      | FO       |
#      | EXE      |
#      | PM       |
#      | PO       |

  @525769 @525771 @526001 @530138 @530142 @532477 @Sprint-11 @US-530578 @US-525136 @Sprint-10 @US-523505 @M05
  Scenario Outline: Verify that the grantee user sees on the Subrecipient Organization details layout -> Overview tab -> the Indirect Rate section name changes to Indirect Cost Rate.
  |Verify that the grantee user sees the Indirect Cost Rate section has a table with the following columns on the Subrecipient Organization details layout|
  |Verify that the grantee user sees the Restricted Indirect Cost Rate (%) and Unrestricted Indirect Cost Rate (%) fiscal years updated if it is change by the Admin and newly added Fiscal Year in the Indirect Cost Rate section.|
  |Verify that the Admin user see "Indirect Cost Rate" section is located after the Contacts section and the Indirect Rate section name changes to Indirect Cost Rate on the Subrecipient organization page.|
    When I login to "As a Grantor" app as "ADMIN" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    #532477
    Then I softly do not see "SME Reviewers" content inside "Contacts" subheader on left panel
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" inside table
    And I navigate to "Overview" sub tab
    Then I softly see "Indirect Cost Rate" page block displayed
    And I click on top right button "New" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    Then I softly see "Create Indirect Cost Rate" opens in overLay window
    When I enter value "20.88" into field "---home:-:RestrictedindirectCostRate---"
    When I enter value "20.88" into field "---home:-:UnrestrictedindirectCostRate---"
    When I enter value "1995" into field "---home:-:FiscalYear---"
    And I click modal button "Save"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
   #530142
    Then I softly do not see "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    #530138
    Then I softly cannot see "Risk Assessment" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Indirect Cost Rate" page block displayed
    Then I see only the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    Then I softly cannot see top right button "New" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    Then I softly cannot see row level action button "Edit" against "1994 - 1995" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    Then I softly cannot see row level action button "Delete" against "1994 - 1995" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    Then I softly can see row level action button "No Actions Available" against "1994 - 1995" in flex table with id "---home:-:orgnizationIndirectRateTable---"
    Then I see the following rows under the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions     | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
      | Action menu | 1994 - 1995 | 20.88%                            | 20.88%                              |
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" inside table
    And I navigate to "Overview" sub tab
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    And I click on "Edit" icon for "1994 - 1995" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see "Edit Indirect Cost Rate" opens in overLay window
    When I enter value "21.88" into field "---home:-:UnrestrictedindirectCostRate---"
    When I enter value "21.88" into field "---home:-:RestrictedindirectCostRate---"
    And I click modal button "Save"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I navigate to "Overview" sub tab
    Then I softly see "Indirect Cost Rate" page block displayed
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    Then I see the following rows under the following headers in table with id "---home:-:orgnizationIndirectRateTable---" :
      | Actions     | Fiscal Year | Restricted Indirect Cost Rate (%) | Unrestricted Indirect Cost Rate (%) |
      | Action menu | 1994 - 1995 | 21.88%                            | 21.88%                              |
#    Delete the record
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" inside table
    And I navigate to "Overview" sub tab
    When I perform quick search for "1994 - 1995" in "---home:-:orgnizationIndirectRateTable---" panel
    And I click on "Delete" icon for "1994 - 1995" inside flex table with id "---home:-:orgnizationIndirectRateTable---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA       |
#      | EXTERNAL_VO        |
#      | EXTERNAL_CE        |

  @525865 @525884 @525886 @525887 @Sprint-10 @US-519409 @M05 @bug-ID-538080
  Scenario Outline: Verify that internal users other than FD users cannot see the following fields under the Overview tab -> Organization Information section: EIN.
  |Verify that internal users see that a new section, Vendor Information, is added after the Payee Information section with the below fields in order.|
  |Verify that internal users see that the Contacts section is placed after the Additional SEDREF Information section.|
  |Verify that internal users see that the Indirect Cost Rate section is placed after the Contacts section.|
    When I login to "As a Grantor" app as "<UserType>" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    And I navigate to "Overview" sub tab
    Then I do not see below fields in "Organization Information" page block
      | EIN |
    Then I see only the following ordered page blocks :
      | Organization Information      |
      | Physical Address              |
      | CSO Information               |
      | Payee Information             |
      | Vendor Information            |
      | Additional SEDREF Information |
      | Contacts                      |
      | Indirect Cost Rate            |
      | Third-Party Verification      |
      | System Information            |
    Then I see below fields in "Vendor Information" page block
      | Vendor ID         |
      | OSC Vendor Status |
      | Not For Profit    |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | EXE      |
#      | ADMIN    |

  @526019 @525863 @Sprint-10 @US-519409 @M05
  Scenario Outline:  Verify that the internal users other than the admin user cannot edit the following fields under the Overview tab -> Organization Information section.
  |Verify that FD users see that under the Overview tab, the 'Description' section name has been changed to 'Organization Information', and that the following fields appear in the specified order with their respective help texts.|
    When I login to "As a Grantor" app as "<UserType>" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    And I navigate to "Overview" sub tab
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "Popular Name" is not editable
    Then I softly see field "SED Code" is not editable
    Then I softly see field "Phone Number" is not editable
    Then I softly see field "License Cap" is not editable
    Then I do not see below fields in "Organization Information" page block
      | EIN |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    And I navigate to "Overview" sub tab
    Then I see below fields in "Organization Information" page block
      | EIN |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | EXE      |
#      | FD    |

  @526021 @Sprint-10 @US-519409 @M05 @BugTicket-NYSED-9948
  Scenario Outline:  Verify that only the admin user can edit the following fields under the Overview tab -> Organization Information section: j. Phone Number
    When I login to "As a Grantor" app as "<UserType>" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    And I navigate to "Overview" sub tab
    Then I can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see fields "---home:-:phone---" is in edit mode
    And I clear the value from field "---home:-:phone---"
    And I enter value "$%^&" into field "---home:-:phone---"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Phone Number must be exactly 10 digits and cannot contain characters. |
    And I clear the value from field "---home:-:phone---"
    And I enter value "-89" into field "---home:-:phone---"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Phone Number must be exactly 10 digits and cannot contain characters. |
    And I clear the value from field "---home:-:phone---"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Phone Number is required in the Overview tab under the Organization Information section. |
    And I enter value "78989878" into field "---home:-:phone---"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Phone Number must be exactly 10 digits and cannot contain characters. |
    And I enter value "7898987898789" into field "---home:-:phone---"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Phone Number must be exactly 10 digits and cannot contain characters. |
    And I enter value "7889898987" into field "---home:-:phone---"
    And I click on "Save" in the page details
    Then I softly see field "Phone Number" as "(788) 989-8987"

    Examples:
      | UserType |
      | ADMIN    |

  @526020 @525890 @Sprint-10 @US-519409 @M05
  Scenario Outline:  Verify that only the admin user can edit the following fields under the Overview tab -> Organization Information section: e. Popular Name
  |Verify that internal users see that the Related Log tab -> Submitted Pre-Application section is hidden.|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" inside table
    And I click on "Edit" in the page details
    And I navigate to "Related Log" sub tab
    Then I softly do not see "Submitted Pre-Applications" page block displayed
    And I navigate to "Overview" sub tab
    Then I softly see fields "---home:-:popularName---" is in edit mode
    And I clear the value from field "---home:-:popularName---"
    And I enter value "$%^&" into field "---home:-:popularName---"
    And I click on "Save" in the page details
    Then I softly see field "Popular Name" as "$%^&"
    And I click on "Edit" in the page details
    And I clear the value from field "---home:-:popularName---"
    And I enter value "12456" into field "---home:-:popularName---"
    And I click on "Save" in the page details
    Then I softly see field "Popular Name" as "12456"
    And I click on "Edit" in the page details
    And I clear the value from field "---home:-:popularName---"
    And I enter value "---AUTOEnvData:-:Char256---" into field "---home:-:popularName---"
    And I click on "Save" in the page details
    Then I softly see field "Popular Name" as "---AUTOEnvData:-:Char255---"
    And I click on "Edit" in the page details
    And I clear the value from field "---home:-:popularName---"
    And I enter value "---AUTOEnvData:-:Char255---" into field "---home:-:popularName---"
    And I click on "Save" in the page details
    Then I softly see field "Popular Name" as "---AUTOEnvData:-:Char255---"
    And I click on "Edit" in the page details
    And I clear the value from field "---home:-:popularName---"
    And I enter value "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" into field "---home:-:popularName---"
    And I click on "Save" in the page details
    Then I softly see field "Popular Name" as "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---"

    Examples:
      | UserType |
      | ADMIN    |

  @526018 @525830 @525832 @Sprint-10 @US-519409 @M05
  Scenario Outline:  Verify that only the admin user can edit the following fields under the Overview tab -> Organization Information section: a. SED Code
  |Verify that internal users see the following fields in the organization details -> the header section: EGMS ID, License Cap, and Status.|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    When I hovering mouse on help text icon inside page block detail "SED Code"
    Then I softly see "Local Education Agency code for the institution." shown as help text
    Then I softly see fields "---home:-:sedCode---" is in edit mode
    And I enter value "$%^&" into field "---home:-:sedCode---"
    And I click on "Save" in the page details
    Then I softly see field "SED Code" as "$%^&"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "45398" into field "---home:-:sedCode---"
    And I click on "Save" in the page details
    Then I softly see field "SED Code" as "45398"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I clear the value from field "---home:-:sedCode---"
    And I click on "Save" in the page details
    Then I softly see field "SED Code" as ""
    And I click on "Edit" in the page details
    And I enter value "ABCD^&*678987" into field "---home:-:sedCode---"
    And I click on "Save" in the page details
    Then I softly see field "SED Code" as "ABCD^&*67898"
    And I click on "Edit" in the page details
    And I enter value "ABCD^&*67898" into field "---home:-:sedCode---"
    And I click on "Save" in the page details
    Then I softly see field "SED Code" as "ABCD^&*67898"
    Then I see the following fields in the page detail header :
      | EGMS ID | Status |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see "Organization Information" page block displayed
    Then I softly see field "Institution ID" is not editable
    When I hovering mouse on help text icon inside page block detail "Institution ID"
    Then I softly see "Institution ID for the institution. This is the main identifier for an institution." shown as help text
    Then I softly see field "GG Institution Type" is not editable
    Then I softly see field "GG Institution Type" as "Public School Districts"
    Then I softly see field "UEI" is not editable
    Then I softly see field "Interest Eligible" is not editable
    Then I softly see field "Bedscode" is not editable
    Then I softly see field "SAM.Gov Expiration Date" is not editable
    Then I softly see field "Hold Payments" is not editable

    Examples:
      | UserType |
      | ADMIN    |

  @527759 @Sprint-10 @US-519409 @M05 @bug-id-538080
  Scenario Outline:  Verify that the grantee users see the updated details by grantor are reflecting properly in the Organization Information section under the Overview tab.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" inside table
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "1234" into field "---home:-:sedCode---"
    And I enter value "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" into field "---home:-:popularName---"
    And I enter value "7889898987" into field "---home:-:phone---"
    And I click on "Save" in the page details
    Then I softly see field "Phone Number" as "(788) 989-8987"
    And I navigate to "Related Log" sub tab
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    Then I softly see field "Phone Number" as "(788) 989-8987"
    Then I softly see field "SED Code" as "1234"
    Then I softly see field "Popular Name" as "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---"

    Examples:
      | UserType |
      | ADMIN    |

  @536004 @535985 @535987 @535986 @536003 @535982 @535981 @Sprint-13 @US-533843 @M05
  Scenario Outline:Verify that on the Subrecipient Organization layout -> Files tab -> Notes section -> section button 'New' is hidden, for 'Create and Edit' or 'View Only' role.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---home:-:ExternalNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    #536003
    Then I softly see value "Notes Record" for title "Title" inside table "---home:-:ExternalNotesTableId---"
    And I click on top right button "Add Files" in flex table with id "---home:-:OrganizationAddfile---"
    And I upload attachment "AttachmentTesting.pdf" of type "DAI proof" from computer
    When I click modal button "Close"
    And I wait for "3" seconds
    #535987 #535986
    Then I softly can see row level action button "Edit" against "DAI proof" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly can see row level action button "View" against "DAI proof" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly can see row level action button "Download" against "DAI proof" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly can see row level action button "Delete" against "DAI proof" in flex table with id "---home:-:OrganizationAddfile---"
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:AdditionalAddressTableId---"
    And I enter "External_Additional_Address" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I enter in modal value "Automation Test" into field "AddressLine2__c"
    When I click modal button "Save"
    #535982
    Then I softly can see row level action button "Edit" against "Backup" in flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly can see row level action button "View" against "Backup" in flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly can see row level action button "Delete" against "Backup" in flex table with id "---home:-:AdditionalAddressTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Files" sub tab
    #536004
    Then I softly do not see top right button "New" inside flex table "---home:-:ExternalNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---home:-:ExternalNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---home:-:ExternalNotesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Notes Record" in flex table with id "---home:-:ExternalNotesTableId---"
    #535985
    Then I softly can see row level action button "No Actions Available" against "Optional" in flex table with id "---orgRiskAssessment:-:orgriskSupportingDocTableId---"
    #535987
    Then I softly do not see top right button "Add Files" inside flex table "---home:-:OrganizationAddfile---"
    Then I softly cannot see row level action button "Edit" against "DAI proof" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly can see row level action button "View" against "DAI proof" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly cannot see row level action button "Download" against "DAI proof" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly cannot see row level action button "Delete" against "DAI proof" in flex table with id "---home:-:OrganizationAddfile---"
    And I navigate to "Overview" sub tab
    #535981
    Then I softly do not see top right button "New" inside flex table "---home:-:AdditionalAddressTableId---"
    Then I softly cannot see row level action button "Edit" against "Backup" in flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly cannot see row level action button "Delete" against "Backup" in flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly can see row level action button "View" against "Backup" in flex table with id "---home:-:AdditionalAddressTableId---"
    When I click on "View" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    #535981
    Then I softly cannot see "Edit" modal button
    When I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Files" sub tab
    #536004
    Then I softly do not see top right button "New" inside flex table "---home:-:ExternalNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---home:-:ExternalNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---home:-:ExternalNotesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Notes Record" in flex table with id "---home:-:ExternalNotesTableId---"
    #535985
    Then I softly can see row level action button "No Actions Available" against "Optional" in flex table with id "---orgRiskAssessment:-:orgriskSupportingDocTableId---"
    #535987
    Then I softly do not see top right button "Add Files" inside flex table "---home:-:OrganizationAddfile---"
    Then I softly cannot see row level action button "Edit" against "DAI proof" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly can see row level action button "View" against "DAI proof" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly cannot see row level action button "Download" against "DAI proof" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly cannot see row level action button "Delete" against "DAI proof" in flex table with id "---home:-:OrganizationAddfile---"
    And I navigate to "Overview" sub tab
    #535981
    Then I softly do not see top right button "New" inside flex table "---home:-:AdditionalAddressTableId---"
    Then I softly cannot see row level action button "Edit" against "Backup" in flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly cannot see row level action button "Delete" against "Backup" in flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly can see row level action button "View" against "Backup" in flex table with id "---home:-:AdditionalAddressTableId---"
    When I click on "View" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    #535981
    Then I softly cannot see "Edit" modal button
    When I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Files" sub tab
    And I click on "Edit" icon for "DAI proof" inside flex table with id "---home:-:OrganizationAddfile---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Financial Artifacts" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    #535986
    Then I softly see top right button "Add Files" inside flex table "---home:-:OrganizationAddfile---"
    Then I softly see value "Financial Artifacts" for title "Classification" inside table "---home:-:OrganizationAddfile---"
    And I wait for "3" seconds
    When I click on "Delete" icon for "Financial Artifacts" inside flex table with id "---home:-:OrganizationAddfile---"
    #535986
    Then I softly see "No Records Found" inside flex table with id "---home:-:OrganizationAddfile---"
    #536003
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---home:-:ExternalNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---home:-:ExternalNotesTableId---"
    And I edit the following rows inline in flex table with id "---home:-:ExternalNotesTableId---" by clicking "Edit" :
      | Title        | Description |
      | Notes Record | Description |
    And I wait for "2" seconds
    When I click on "Delete" icon for "Description" inside flex table with id "---home:-:ExternalNotesTableId---"
    #536003
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---home:-:ExternalNotesTableId---"
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    And I enter in modal value "Business" into field "AddressType__c"
    When I click modal button "Save"
    #535982
    Then I softly see value "Business" for title "Address Type" inside table "---home:-:AdditionalAddressTableId---"
    Then I softly see top right button "New" inside flex table "---home:-:AdditionalAddressTableId---"
    When I click on "Delete" icon for "Business" inside flex table with id "---home:-:AdditionalAddressTableId---"
    #535982
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_LEA |


  @536128 @536133 @536126 @536137 @536139 @536138 @NYSEDSprint-13 @US-534545 @M05 @Bug-Ticket-542237
  Scenario Outline:Verify that the inline action 'Send Invitation' is not visible to the user with the 'LEA Admin' or 'Submit and Certify' role if the organization has an 'Institution ID' for it.
  |Verify that 'Submit and Certify' or 'LEA Admin' users, see on the Subrecipient Organization layout -> Overview tab -> Additional Address section, below changes have been made on the Create Additional Address modal |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "3" seconds
    #536133
    Then I see only the following ordered page blocks :
      | Organization Information      |
      | Physical Address              |
      | CSO Information               |
      | Payee Information             |
      | Vendor Information            |
      | Additional SEDREF Information |
      | Contacts                      |
      | Indirect Cost Rate            |
      | System Information            |
    #536137
    Then I softly see top right button "New" inside flex table "---home:-:AdditionalAddressTableId---"
    When I click on top right button "New" in flex table with id "---home:-:AdditionalAddressTableId---"
    #536137
    Then I softly see field "Address Type" inside page block
    Then I softly see field "Street" inside page block
    Then I softly cannot see field "Address Line 1" inside page block
    Then I softly cannot see field "Address Line 2" inside page block
    Then I softly see field "PO Box" inside page block
    Then I softly see field "City" inside page block
    Then I softly see field "State" inside page block
    Then I softly cannot see field "Congressional district" inside page block
    Then I softly cannot see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field "Zip Code" inside page block
    Then I softly see field "County Code" inside page block
    Then I softly see field "Country" inside page block
    And I click modal button "Save"
    #536137
    Then I softly see the following messages in the page details contains:
      | To save, Address Type is required. |
      | To save, Street is required.       |
      | To save, City is required.         |
      | To save, State is required.        |
      | To save, Zip Code is required.     |
      | To save, Country is required.      |
    And I enter "External_Additional_Address" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I enter in modal value "Automation Test" into field "AddressLine2__c"
    When I click modal button "Save"
    #536137
    Then I softly see value "Backup" for title "Address Type" inside table "---home:-:AdditionalAddressTableId---"
    When I click on "View" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    #536137
    Then I see field "Street" as "NYC" on modal
    Then I see field "Address Type" as "Backup" on modal
    Then I see field "PO Box" as "Automation Test" on modal
    Then I see field "City" as "Chicago" on modal
    Then I see field "State" as "AK" on modal
    Then I see field "Zip Code" as "12345" on modal
    Then I see field "County Code" as "12" on modal
    Then I see field "Country" as "USA" on modal
    #536139
    Then I softly see field "Address Type" inside page block
    Then I softly see field "Street" inside page block
    Then I softly cannot see field "Address Line 1" inside page block
    Then I softly cannot see field "Address Line 2" inside page block
    Then I softly see field "PO Box" inside page block
    Then I softly see field "City" inside page block
    Then I softly see field "State" inside page block
    Then I softly cannot see field "Congressional district" inside page block
    Then I softly cannot see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field "Zip Code" inside page block
    Then I softly see field "County Code" inside page block
    Then I softly see field "Country" inside page block
    And I click modal button "Close"
    When I click on "Edit" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    When I enter in modal value "Business" into field "AddressType__c"
    And I click modal button "Save"
    #536138
    Then I softly see value "Business" for title "Address Type" inside table "---home:-:AdditionalAddressTableId---"
    When I click on "Delete" icon for "Business" inside flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    When I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    When I enter in modal value "8967859036" into field "Phone"
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I click modal button "Save"
    #536128
    Then I softly cannot see row level action button "Send Invitation" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---home:-:userContactsTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    #536126
    Then I softly see that "Vendor ID" rendered in view mode only
    Then I softly see that "OSC Vendor Status" rendered in view mode only
    Then I softly see that "NOT_FOR_PROFIT__c" rendered in view mode only
    When I hovering mouse on help text icon inside page block detail "Vendor ID"
    #536126
    Then I softly see "A Vendor ID is a State-provided identification number." shown as help text
    When I hovering mouse on help text icon inside page block detail "OSC Vendor Status"
    #536126
    Then I softly see "OSC (Office of State Comptroller) vendor status Active/Inactive flag. Used with payments." shown as help text
    When I hovering mouse on help text icon inside page block detail "Not For Profit"
    #536126
    Then I softly see "Not for profit Yes/No flag. Used with payments." shown as help text

    Examples:
      | UserType   | ExternalUser |
      | GRANTEE_SC | EXTERNAL_SC  |
#      | GRANTEE_LEA | EXTERNAL_LEA |

  @536131 @536130 @525995 @525620 @535729 @NYSEDSprint-13 @US-534545 @US-515007 @US-532445 @M05 @withoutInstitutionId
  Scenario Outline:Verify that the inline action 'Send Invitation' is not visible to the View Only and Create and Edit Role users.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "2" seconds
    When I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    When I enter in modal value "8967859036" into field "Phone"
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I click modal button "Save"
    When I re-login to "Grants Portal" app as "EXTERNAL_VO" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "2" seconds
    #536131
    Then I softly cannot see row level action button "Send Invitation" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---home:-:userContactsTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---home:-:userContactsTableId---"
    When I re-login to "Grants Portal" app as "EXTERNAL_CE" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "2" seconds
    #536131
    Then I softly cannot see row level action button "Send Invitation" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---home:-:userContactsTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---home:-:userContactsTableId---"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "2" seconds
    #536130
    Then I softly can see row level action button "Send Invitation" against "{SavedValue:Automation Runtime} Contact" in flex table with id "---home:-:userContactsTableId---"
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} Contact" inside flex table with id "---home:-:userContactsTableId---"
    #525995 #525620
    Then I see the text "Send" in modal
    Then I softly see the text containing "Hello First Last, "
    Then I softly see the text containing "You have been invited to register as a user in the Grants Finance Management System (GFMS) for Automation Permanent Nysed School Org with the role of Submit and Certify."
    Then I softly see the text containing "Please click "
    Then I softly see the text containing "here"
    Then I softly see the text containing "to register and create your account. "
    Then I softly see the text containing "Please do not reply to this email. If you have any questions or need further assistance, please reach out to Automation Grantee_SubmitCertify at automation.grantee_submitcertify1@yopmail.com ."
    Then I softly see the text containing "Thank you."
    Then I softly see the text containing "or contact them at "
    Then I softly see the text containing "(989) 898-5858.  "
    Then I softly see the text containing "Sincerely, "
    Then I softly see the text containing "New York State Education Department"
    And I click modal button "Send"
    And I wait for "5" seconds
    #536130
    Then I see the text "Email Sent Successfully." in modal
    And I click modal button "Close"
    And I refresh the page
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" inside table
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "dfgh^&&*" into field "INST_ID__c"
    And I click on "Save" in the page details
    #535729
    Then I softly see field "Institution ID" as ""
    And I click on "Edit" in the page details
    And I enter value "166485411256.55" into field "INST_ID__c"
    And I click on "Save" in the page details
    #535729
    Then I softly see field "Institution ID" as "166485411256"
    And I click on "Edit" in the page details
    And I enter value "-16648541125" into field "INST_ID__c"
    And I click on "Save" in the page details
    #535729
    Then I softly see the following messages in the page details contains:
      | Overview tab - Institution ID must be a 12-digit positive number. |
    And I enter value "1664854112" into field "INST_ID__c"
    And I click on "Save" in the page details
    #535729
    Then I softly see the following messages in the page details contains:
      | Overview tab - Institution ID must be a 12-digit positive number. |
    And I enter value "16648541125655" into field "INST_ID__c"
    And I click on "Save" in the page details
    #535729
    Then I softly see field "Institution ID" as "166,485,411,255"
    And I click on "Edit" in the page details
    And I enter value "166485411256" into field "INST_ID__c"
    And I click on "Save" in the page details
    And I wait for "5" seconds

    Examples:
      | UserType     |
      | EXTERNAL_LEA |
#      | EXTERNAL_SC  |

  @535984 @536926 @536048 @536051 @NYSEDSprint-13 @US-533843 @US-519161 @M05 @needtochangeuseraftercreationofneworg
  Scenario Outline: Verify that on the Subrecipient Organization layout -> Files tab -> Supporting Documents Checklist section ->Inline action 'Attach' is available, for 'Submit and Certify' or 'LEA Admin' role.
  |Verify that on the Subrecipient Organization layout -> Files tab -> Notes section -> Inline action buttons are visible to the note owner only even if roles are changed.|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "3" seconds
    And I navigate to "Files" sub tab
    And I click on "Attach" icon for "Optional" inside flex table with id "---orgRiskAssessment:-:orgriskSupportingDocTableId---"
    And I wait for "4" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I click modal button "Close"
    #535984
    Then I softly see value "View" for title "Subrecipient Document Link" inside table "---orgRiskAssessment:-:orgriskSupportingDocTableId---"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---home:-:ExternalNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    #536926
    Then I softly see value "Notes Record" for title "Title" inside table "---home:-:ExternalNotesTableId---"
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_LEA Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "6" seconds
    And I enter in modal value "Create and Edit" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    #536048 #536051
    Then I softly see value "Create and Edit" for title "Role" against the value "{SavedValue:EXTERNAL_LEA Username}" inside table "---home:-:userContactsTableId---"
    And I navigate to "Files" sub tab
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---home:-:ExternalNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---home:-:ExternalNotesTableId---"
    And I edit the following rows inline in flex table with id "---home:-:ExternalNotesTableId---" by clicking "Edit" :
      | Title        | Description |
      | Notes Record | Description |
    And I wait for "2" seconds
    Then I softly see value "Description" for title "Description" inside table "---home:-:ExternalNotesTableId---"
    When I click on "Delete" icon for "Description" inside flex table with id "---home:-:ExternalNotesTableId---"
    #536926
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    When I re-login to "Grants Portal" app as "EXTERNAL_SC" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "3" seconds
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_LEA Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "7" seconds
    And I enter in modal value "LEA Admin" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    #536048 #536051
    Then I softly see value "LEA Admin" for title "Role" against the value "{SavedValue:EXTERNAL_LEA Username}" inside table "---home:-:userContactsTableId---"

    Examples:
      | UserType     |
      | EXTERNAL_LEA |
#      | EXTERNAL_SC  |

  @536005 @536007 @Sprint-13 @US-533843 @M05 @Bug-Ticket-542601 @Bug-Ticket-NYSED-9995
  Scenario Outline:Verify that on the Subrecipient Organization layout -> Messages tab -> Messages section -> section button 'Send Email' is available, for 'Submit and Certify' or 'LEA Admin' role.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Messages" sub tab
    #536005
    Then I softly see top right button "Send Email" inside flex table "---announcement:-:collabMessages---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I wait for "7" seconds
    And I send the email under collab tab with following details:
      | To                       | Subject         | Body                       |
      | {SavedValue:PMYopmailId} | Automation Test | Automation Test Email Body |
    And I wait for "7" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    And I refresh the page
    #536005
    Then I softly can see row level action button "Reply" against "Automation Test" in flex table with id "---announcement:-:collabMessages---"
    Then I softly can see row level action button "View" against "Automation Test" in flex table with id "---announcement:-:collabMessages---"
    When I click on "Reply" icon for "Automation Test" inside flex table with id "---announcement:-:collabMessages---"
    And I wait for "7" seconds
    And I send the email under collab tab with following details:
      | To                        | Subject             | Body                       |
      | {SavedValue:FO1YopmailId} | RE: Automation Test | Automation Test Email Body |
    And I wait for "7" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    #536005
    Then I softly can see row level action button "Reply" against "RE: Automation Test" in flex table with id "---announcement:-:collabMessages---"
    Then I softly can see row level action button "View" against "RE: Automation Test" in flex table with id "---announcement:-:collabMessages---"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Messages" sub tab
    #536007
    Then I softly cannot see top right button "Send Email" for "---announcement:-:collabMessages---" flex table
    Then I softly cannot see row level action button "Reply" against "RE: Automation Test" in flex table with id "---announcement:-:collabMessages---"
    Then I softly can see row level action button "View" against "RE: Automation Test" in flex table with id "---announcement:-:collabMessages---"
    When I click on "View" icon for "RE: Automation Test" inside flex table with id "---announcement:-:collabMessages---"
    #536007
    Then I see the text "RE: Automation Test" in modal
    And I refresh the page
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Messages" sub tab
    #536007
    Then I softly cannot see top right button "Send Email" for "---announcement:-:collabMessages---" flex table
    Then I softly cannot see row level action button "Reply" against "RE: Automation Test" in flex table with id "---announcement:-:collabMessages---"
    Then I softly can see row level action button "View" against "RE: Automation Test" in flex table with id "---announcement:-:collabMessages---"
    When I click on "View" icon for "RE: Automation Test" inside flex table with id "---announcement:-:collabMessages---"
    #536007
    Then I see the text "RE: Automation Test" in modal

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_LEA |

  @535942 @535939 @536297 @535764 @NYSEDSprint-13 @US-534185 @M05 @Bug-Ticket-543144
  Scenario Outline: Verify that internal users do not see the Additional Addresses section under the Overview tab on the Internal Organization layout, as it is hidden.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Internal" content inside "Organization" subheader on left panel
    When I click on "View" icon for "{SavedValue:ProgramOrganization}" inside flex table with id "---home:-:internalOrganizationId---" with wait for record
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #535942
    Then I see only the following ordered page blocks :
      | Description              |
      | Primary Address          |
      | Organization Description |
      | Related Contacts         |
      | UEI Numbers              |
      | System Information       |
    Then I softly do not see "Additional Addresses" page block displayed
    #535764
    Then I softly cannot see top right button "Enter Message" in page detail
    #535939
    Then I see below fields in "Primary Address" page block
      | Street | PO Box | City | County Code | State | Zip Code | Country |
    Then I softly cannot see field "Address Line 1" inside page block
    Then I softly cannot see field "Address Line 2" inside page block
    Then I softly cannot see field "Congressional district" inside page block
    Then I softly cannot see field "4-Digit Zip Code Extension" inside page block
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Internal" content inside "Organization" subheader on left panel
    When I click on "View" icon for "{SavedValue:ProgramOrganization}" inside flex table with id "---home:-:internalOrganizationId---" with wait for record
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    #536297
    Then I softly see fields "BillingStreet" is in edit mode
    Then I softly see fields "AddressLine2__c" is in edit mode
    Then I softly see fields "BillingCity" is in edit mode
    Then I softly see fields "County__c" is in edit mode
    Then I softly see fields "State__c" is in edit mode
    Then I softly see fields "BillingPostalCode" is in edit mode
    Then I softly see fields "BillingCountry" is in edit mode
    And I enter value "--None--" into field "State__c"
    And I clear the value from field "BillingStreet"
    And I clear the value from field "AddressLine2__c"
    And I clear the value from field "County__c"
    And I clear the value from field "BillingPostalCode"
    And I clear the value from field "BillingCountry"
    And I clear the value from field "BillingCity"
    And I click on "Save" in the page details
    #536297
    Then I softly see the following messages in the page details contains:
      | To save, Street is required in the Overview tab under the Primary Address section.   |
      | To save, City is required in the Overview tab under the Primary Address section.     |
      | To save, State is required in the Overview tab under the Primary Address section.    |
      | To save, Zip Code is required in the Overview tab under the Primary Address section. |
      | To save, Country is required in the Overview tab under the Primary Address section.  |
    And I enter value "Automation" into field "BillingStreet"
    And I enter value "Testing" into field "AddressLine2__c"
    And I enter value "NYC" into field "BillingCity"
    And I enter value "12" into field "County__c"
    And I enter value "AK" into field "State__c"
    And I enter value "12345" into field "BillingPostalCode"
    And I enter value "America" into field "BillingCountry"
    And I enter value "AA" into field "Abbreviation__c"
    And I click on "Save" in the page details
    #536297
    Then I softly see field "Street" as "Automation"
    Then I softly see field "PO Box" as "Testing"
    Then I softly see field "City" as "NYC"
    Then I softly see field "County Code" as "12"
    Then I softly see field "State" as "AK"
    Then I softly see field "Zip Code" as "12345"
    Then I softly see field "Country" as "America"

    Examples:
      | UserType |
      | EXE      |
#      | FD       |
#      | PO       |
#      | FO       |
#      | PM      |
#      | ADMIN    |

  @535730 @535737 @535735 @535769 @535753 @535737 @NYSEDSprint-13 @US-532445 @M05 @Bug-Ticket-NYSED-9951
  Scenario Outline:Verify that the internal users other than the admin user cannot edit the Institution ID field under the Overview tab -> Organization Information section.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I navigate to "Overview" sub tab
    #535730
    Then I softly cannot see top right button "Edit" in page detail
    #535769
    Then I see only the following ordered page blocks :
      | Organization Information      |
      | Physical Address              |
      | CSO Information               |
      | Payee Information             |
      | Vendor Information            |
      | Additional SEDREF Information |
      | Contacts                      |
      | Indirect Cost Rate            |
      | Third-Party Verification      |
      | System Information            |
    Then I softly do not see "Additional Information" page block displayed
    Then I softly see that "Institution ID" rendered in view mode only
    #535737
    Then I softly do not see top right button "Verify" inside flex table "---home:-:ThirdPartyVerificationTableId---"
    #535735
    Then I softly do not see top right button "New" inside flex table "---home:-:AdditionalAddressTableId---"
    Then I softly cannot see row level action button "Edit" against "Billing Address" in flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly cannot see row level action button "Delete" against "Billing Address" in flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly can see row level action button "View" against "Billing Address" in flex table with id "---home:-:AdditionalAddressTableId---"
    When I click on "View" icon for "Billing Address" inside flex table with id "---home:-:AdditionalAddressTableId---"
    #535733
    Then I see field "Street" as "Test" on modal
    Then I see field "Address Type" as "Billing Address" on modal
    Then I see field "PO Box" as "Automation Test" on modal
    Then I see field "City" as "Tser" on modal
    Then I see field "State" as "CA" on modal
    Then I see field "Zip Code" as "18273" on modal
    Then I see field "County Code" as "12" on modal
    Then I see field "Country" as "YDA" on modal

    Examples:
      | UserType |
      | PM       |
      | FD       |
      | PO       |
      | FO       |
      | EXE      |

  @536863 @536060 @536052 @NYSEDSprint-13 @US-532445 @US-519161 @M05 @Bug-Ticket-542237 @Bug-Ticket-NYSED-9994
  Scenario Outline:Verify that the grantee user can see the updated value in the Institution ID field under the Overview tab -> Organization Information section.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    #536863
    Then I softly see that "Institution ID" rendered in view mode only
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_VO Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "5" seconds
    And I enter in modal value "Non user" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    #536060
    Then I softly see the following messages in the page details contains:
      | An active system user cannot be converted into 'Non user' role. |
    And I click modal button "Close"
    When I click alert button "OK"
    And I wait for "4" seconds
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_CE Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "5" seconds
    And I enter in modal value "Non user" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    #536060
    Then I softly see the following messages in the page details contains:
      | An active system user cannot be converted into 'Non user' role. |
    And I click modal button "Close"
    When I click alert button "OK"
    And I wait for "4" seconds
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_CE Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "5" seconds
    And I enter in modal value "Non user" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    #536060
    Then I softly see the following messages in the page details contains:
      | An active system user cannot be converted into 'Non user' role. |
    And I click modal button "Close"
    When I click alert button "OK"
    And I wait for "4" seconds
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_LEA Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "5" seconds
    And I enter in modal value "Non user" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    #536060
    Then I softly see the following messages in the page details contains:
      | An active system user cannot be converted into 'Non user' role. |
    And I click modal button "Close"
    When I click alert button "OK"
    And I wait for "4" seconds
    When I re-login to "Grants Portal" app as "EXTERNAL_CE" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "3" seconds
    #536052
    Then I softly can see row level action button "View" against "{SavedValue:EXTERNAL_VO Username}" in flex table with id "---home:-:userContactsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EXTERNAL_VO Username}" in flex table with id "---home:-:userContactsTableId---"
    When I click on "View" icon for "{SavedValue:EXTERNAL_VO Username}" inside flex table with id "---home:-:userContactsTableId---"
    #536052
    Then I softly cannot see "Edit" modal button
    And I click modal button "Close"
    When I re-login to "Grants Portal" app as "EXTERNAL_VO" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "3" seconds
    #536052
    Then I softly can see row level action button "View" against "{SavedValue:EXTERNAL_VO Username}" in flex table with id "---home:-:userContactsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EXTERNAL_VO Username}" in flex table with id "---home:-:userContactsTableId---"
    When I click on "View" icon for "{SavedValue:EXTERNAL_VO Username}" inside flex table with id "---home:-:userContactsTableId---"
    #536052
    Then I softly cannot see "Edit" modal button


    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA |

  @535882 @535733 @535883 @535769 @535764 @535736 @NYSEDSprint-13 @US-532445 @M05 @Bug-Ticket-NYSED-9975
  Scenario:Verify that the admin profile users see that the below changes have been made on the Create Additional Address modal under the Overview tab -> Additional Address section.
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I navigate to "Overview" sub tab
    #535769
    Then I see only the following ordered page blocks :
      | Organization Information      |
      | Physical Address              |
      | CSO Information               |
      | Payee Information             |
      | Vendor Information            |
      | Additional SEDREF Information |
      | Contacts                      |
      | Indirect Cost Rate            |
      | Third-Party Verification      |
      | System Information            |
    Then I softly do not see "Additional Information" page block displayed
    #535764
    Then I softly cannot see top right button "Enter Message" in page detail
    #535733
    Then I softly see top right button "New" inside flex table "---home:-:AdditionalAddressTableId---"
    When I click on top right button "New" in flex table with id "---home:-:AdditionalAddressTableId---"
    #535882
    Then I softly see field "Address Type" inside page block
    Then I softly see field "Street" inside page block
    Then I softly cannot see field "Address Line 1" inside page block
    Then I softly cannot see field "Address Line 2" inside page block
    Then I softly see field "PO Box" inside page block
    Then I softly see field "City" inside page block
    Then I softly see field "State" inside page block
    Then I softly cannot see field "Congressional district" inside page block
    Then I softly cannot see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field "Zip Code" inside page block
    Then I softly see field "County Code" inside page block
    Then I softly see field "Country" inside page block
    And I click modal button "Save"
    #535882
    Then I softly see the following messages in the page details contains:
      | To save, Address Type is required. |
      | To save, Street is required.       |
      | To save, City is required.         |
      | To save, State is required.        |
      | To save, Zip Code is required.     |
      | To save, Country is required.      |
    And I refresh the page
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---home:-:AdditionalAddressTableId---"
    And I enter "External_Additional_Address" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I enter in modal value "Automation Test" into field "AddressLine2__c"
    When I click modal button "Save"
    #535882
    Then I softly see value "Backup" for title "Address Type" inside table "---home:-:AdditionalAddressTableId---"
    #535733
    Then I softly can see row level action button "Edit" against "Backup" in flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly can see row level action button "View" against "Backup" in flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly can see row level action button "Delete" against "Backup" in flex table with id "---home:-:AdditionalAddressTableId---"
    When I click on "View" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    #535882 #535733
    Then I see field "Street" as "NYC" on modal
    Then I see field "Address Type" as "Backup" on modal
    Then I see field "PO Box" as "Automation Test" on modal
    Then I see field "City" as "Chicago" on modal
    Then I see field "State" as "AK" on modal
    Then I see field "Zip Code" as "12345" on modal
    Then I see field "County Code" as "12" on modal
    Then I see field "Country" as "USA" on modal
    When I click modal button "Close"
    When I click on "Edit" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    And I enter in modal value "Data Storage" into field "AddressType__c"
    And I enter in modal value "Chikago" into field "AddressLine1__c"
    And I enter in modal value "Sterling" into field "City__c"
    And I enter in modal value "AL" into field "State__c"
    And I enter in modal value "12321" into field "ZipCode__c"
    And I enter in modal value "NYC" into field "Country2__c"
    And I enter in modal value "14" into field "County1__c"
    And I enter in modal value "AutomationTest" into field "AddressLine2__c"
    When I click modal button "Save"
    #535733
    Then I softly see value "Data Storage" for title "Address Type" inside table "---home:-:AdditionalAddressTableId---"
    #535733
    Then I see the following rows under the following headers in table with id "---home:-:AdditionalAddressTableId---" :
      | Actions     | Address Type | Street  | PO Box         | City     | State | Zip Code | County Code | Country |
      | Action menu | Data Storage | Chikago | AutomationTest | Sterling | AL    | 12321    | 14          | NYC     |
    When I click on "View" icon for "Data Storage" inside flex table with id "---home:-:AdditionalAddressTableId---"
    #535733
    Then I see field "Street" as "Chikago" on modal
    Then I see field "Address Type" as "Data Storage" on modal
    Then I see field "PO Box" as "AutomationTest" on modal
    Then I see field "City" as "Sterling" on modal
    Then I see field "State" as "AL" on modal
    Then I see field "Zip Code" as "12321" on modal
    Then I see field "County Code" as "14" on modal
    Then I see field "Country" as "NYC" on modal
    When I click modal button "Close"
    When I click on "Edit" icon for "Data Storage" inside flex table with id "---home:-:AdditionalAddressTableId---"
    And I wait for "2" seconds
    And I enter in modal value "--None--" into field "AddressType__c"
    And I clear in modal the value from field "AddressLine1__c"
    And I clear in modal the value from field "City__c"
    And I enter in modal value "--None--" into field "State__c"
    And I clear in modal the value from field "ZipCode__c"
    And I clear in modal the value from field "Country2__c"
    And I clear in modal the value from field "County1__c"
    And I clear in modal the value from field "AddressLine2__c"
    And I click modal button "Save"
    #535882
    Then I softly see the following messages in the page details contains:
      | To save, Address Type is required. |
      | To save, Street is required.       |
      | To save, City is required.         |
      | To save, State is required.        |
      | To save, Zip Code is required.     |
      | To save, Country is required.      |
    And I enter in modal value "Business" into field "AddressType__c"
    And I enter in modal value "test" into field "AddressLine1__c"
    And I enter in modal value "NYC" into field "City__c"
    And I enter in modal value "AR" into field "State__c"
    And I enter in modal value "12333" into field "ZipCode__c"
    And I enter in modal value "USA" into field "Country2__c"
    And I enter in modal value "15" into field "County1__c"
    And I enter in modal value "Automation" into field "AddressLine2__c"
    When I click modal button "Save"
    #535882
    Then I see the following rows under the following headers in table with id "---home:-:AdditionalAddressTableId---" :
      | Actions     | Address Type | Street | PO Box     | City | State | Zip Code | County Code | Country |
      | Action menu | Business     | test   | Automation | NYC  | AR    | 12333    | 15          | USA     |
    When I click on "Delete" icon for "Business" inside flex table with id "---home:-:AdditionalAddressTableId---"
    #535733
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "Business" for title "Address Type" inside table "---home:-:AdditionalAddressTableId---"
    When I click on top right button "Verify" in flex table with id "---home:-:ThirdPartyVerificationTableId---"
    And I wait for "5" seconds
    #535736
    Then I see the following rows under the following headers in table with id "---home:-:ThirdPartyVerificationTableId---" :
      | Action menu | Verification Source | Verification Type | Status          | Recorded date |
      | Action menu | FPDS                | FPDS Verification | No Record Found |               |
      | Action menu | SAM.Gov             | Exclusion         | No Record Found |               |
      | Action menu | SAM.Gov             | Entity Validation | Record Found    |               |

  @535753 @535884 @535760 @@535847 @536268 @NYSEDSprint-13 @US-532445 @US-534182 @M05 @ActiveOrg535760
  Scenario Outline:Verify that internal users see the new section, ‘Subrecipient Organization Message,’ with the field ‘Subrecipient Organization Message’ added under the Messages tab.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    #536268
    Then I softly see field "Popular Name" as "{SavedValue:SubrecipientOrg}"
    And I navigate to "Messages" sub tab
    And I click on "Enter Message" in the page details
    And I navigate to "Organization Information" sub tab
    #535760
    Then I softly see "Enter Organization Message" opens in overLay window
    And I enter in modal value "" into field "NYSED_SubOrgMessage__c"
    When I click modal button "Save"
    #535760
    Then I see field "Subrecipient Organization Message" as "" on modal
    Then I softly do not see asterisk mark on "Subrecipient Organization Message"
    When I click modal button "Edit"
    And I wait for "2" seconds
    And I enter in modal value "{SavedValue:Char255}" into field "NYSED_SubOrgMessage__c"
    When I click modal button "Save"
    #535760
    Then I see field "Subrecipient Organization Message" as "{SavedValue:Char255}" on modal
    Then I softly see "Add/Edit Message" page block displayed
    When I click modal button "Close"
    #535753
    Then I see below fields in "Subrecipient Organization Message" page block
      | Subrecipient Organization Message |
    Then I softly see field "Subrecipient Organization Message" as "{SavedValue:Char255}"
    And I navigate to "Overview" sub tab
    When I click on "View" icon for "Billing Address" inside flex table with id "---home:-:AdditionalAddressTableId---"
    #535884
    Then I softly see field "Address Type" inside page block
    Then I softly see field "Street" inside page block
    Then I softly cannot see field "Address Line 1" inside page block
    Then I softly cannot see field "Address Line 2" inside page block
    Then I softly see field "PO Box" inside page block
    Then I softly see field "City" inside page block
    Then I softly see field "State" inside page block
    Then I softly cannot see field "Congressional district" inside page block
    Then I softly cannot see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field "Zip Code" inside page block
    Then I softly see field "County Code" inside page block
    Then I softly see field "Country" inside page block
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" inside table
    When I hovering mouse on help text icon inside page block detail "Vendor ID"
    Then I softly see "A Vendor ID is a State-provided identification number." shown as help text
    When I hovering mouse on help text icon inside page block detail "OSC Vendor Status"
    Then I softly see "OSC (Office of State Comptroller) vendor status Active/Inactive flag. Used with payments." shown as help text
    When I hovering mouse on help text icon inside page block detail "Not For Profit"
    Then I softly see "Not for profit Yes/No flag. Used with payments." shown as help text
    Then I softly see field "Not For Profit" as "No"

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | PO       |
#      | FO       |
#      | EXE      |
#      | ADMIN    |

  @536262 @NYSEDSprint-13 @US-534182 @M05
  Scenario Outline:Verify that the Grantee user sees the Popular Name field displays the Organization Name associated with the provided UEI on the Subrecipient organization layout.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    #536262
    Then I softly see field "Popular Name" as "{SavedValue:SubrecipientOrg}"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_LEA |
#      | GRANTEE_VO  |
#      | GRANTEE_CE  |
#      | GRANTEE_NU  |

  @536263 @536262 @536269 @NYSEDSprint-13 @US-534182 @M05 @PopularName
  Scenario Outline:Verify that the Grantee user sees the Popular Name field length is changed to 255 characters on the Subrecipient organization layout.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Name"
    And I click on "Save" in the page details
    #536262
    Then I softly see field "Popular Name" as "{SavedValue:Char255}"
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I clear the value from field "Name"
    And I enter value "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" into field "Name"
    And I click on "Save" in the page details
    Then I softly see field "Popular Name" as "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" inside table
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "5" seconds
    And I enter value "{SavedValue:Char256}" into field "Name"
    And I click on "Save" in the page details
    #536262
    Then I softly see field "Popular Name" as "{SavedValue:Char255}"
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I clear the value from field "Name"
    And I enter value "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" into field "Name"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Popular Name" as "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}"

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA |

  @536265 @536264 @536261 @536272 @NYSEDSprint-13 @US-534182 @M05 @PopularName
  Scenario Outline:Verify that the Grantee user sees that the following field lengths are updated as below on the Edit Additional Address modal under the Overview tab -> Additional Address section on the Subrecipient organization layout.
  |Verify that the Grantee user sees that the following field lengths are updated as below in the Physical Address section on the Subrecipient organization layout.|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---home:-:AdditionalAddressTableId---"
    And I enter "External_Additional_Address" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I clear the value from field "AddressLine1__c"
    And I clear the value from field "City__c"
    When I enter in modal value "{SavedValue:Char256}" into field "AddressLine1__c"
    When I enter in modal value "{SavedValue:Char256}" into field "AddressLine2__c"
    When I enter in modal value "{SavedValue:Char42}" into field "City__c"
    When I click modal button "Save"
    Then I see the following rows under the following headers in table with id "---home:-:AdditionalAddressTableId---" :
      | Actions     | Address Type | Street               | PO Box               | City                | State | Zip Code | County Code | Country |
      | Action menu | Backup       | {SavedValue:Char255} | {SavedValue:Char255} | {SavedValue:Char40} | AK    | 12333    | 12          | USA     |
    When I click on "View" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    #536264
    Then I see field "Street" as "{SavedValue:Char255}" on modal
    Then I see field "PO Box" as "{SavedValue:Char255}" on modal
    Then I see field "City" as "{SavedValue:Char40}" on modal
    And I click modal button "Close"
    When I click on "Edit" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    And I clear the value from field "BillingStreet"
    And I clear the value from field "AddressLine2__c"
    And I clear the value from field "BillingCity"
    When I enter in modal value "{SavedValue:Char256}" into field "AddressLine1__c"
    When I enter in modal value "{SavedValue:Char256}" into field "AddressLine2__c"
    When I enter in modal value "{SavedValue:Char42}" into field "City__c"
    And I click modal button "Save"
    When I click on "View" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    #536265
    Then I see field "Street" as "{SavedValue:Char255}" on modal
    Then I see field "PO Box" as "{SavedValue:Char255}" on modal
    Then I see field "City" as "{SavedValue:Char40}" on modal
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I clear the value from field "BillingStreet"
    And I clear the value from field "AddressLine2__c"
    And I clear the value from field "BillingCity"
    And I enter value "{SavedValue:Char256}" into field "BillingStreet"
    And I enter value "{SavedValue:Char256}" into field "AddressLine2__c"
    And I enter value "{SavedValue:Char42}" into field "BillingCity"
    And I click on "Save" in the page details
    #536261
    Then I softly see field "Street" as "{SavedValue:Char255}"
    Then I softly see field "PO Box" as "{SavedValue:Char255}"
    Then I softly see field "City" as "{SavedValue:Char40}"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" inside table
    And I wait for "2" seconds
    When I click on "Edit" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    And I clear the value from field "AddressLine1__c"
    And I clear the value from field "AddressLine2__c"
    And I clear the value from field "City__c"
    When I enter in modal value "{SavedValue:Char256}" into field "AddressLine1__c"
    When I enter in modal value "{SavedValue:Char256}" into field "AddressLine2__c"
    When I enter in modal value "{SavedValue:Char42}" into field "City__c"
    And I click modal button "Save"
    When I click on "View" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    #536265
    Then I see field "Street" as "{SavedValue:Char255}" on modal
    Then I see field "PO Box" as "{SavedValue:Char255}" on modal
    Then I see field "City" as "{SavedValue:Char40}" on modal
    And I click modal button "Close"
    When I click on top right button "New" in flex table with id "---home:-:AdditionalAddressTableId---"
    And I enter "External_Additional_Address" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I clear the value from field "AddressLine1__c"
    And I clear the value from field "City__c"
    When I enter in modal value "{SavedValue:Char256}" into field "AddressLine1__c"
    When I enter in modal value "{SavedValue:Char256}" into field "AddressLine2__c"
    When I enter in modal value "{SavedValue:Char42}" into field "City__c"
    When I click modal button "Save"
    Then I see the following rows under the following headers in table with id "---home:-:AdditionalAddressTableId---" :
      | Actions     | Address Type | Street               | PO Box               | City                | State | Zip Code | County Code | Country |
      | Action menu | Backup       | {SavedValue:Char255} | {SavedValue:Char255} | {SavedValue:Char40} | AK    | 12345    | 12          | USA     |
    When I click on "View" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    #536271
    Then I see field "Street" as "{SavedValue:Char255}" on modal
    Then I see field "PO Box" as "{SavedValue:Char255}" on modal
    Then I see field "City" as "{SavedValue:Char40}" on modal

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA |

  @538592 @NYSEDSprint-16 @US-537178 @M05
  Scenario Outline:Verify that if a Submit and Certify OR LEA Admin Role user edits the contacts and uses a duplicate email ID (External User ID) from the same org then he should get validation on click of Save.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
#    And I select value inside table "AdditionalUser" is "All"
    And I wait for "2" seconds
    When I click on "Edit" icon for "Automation static Record" inside flex table with id "---home:-:userContactsTableId---"
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    When I enter in modal value "8967859036" into field "Phone"
    When I enter in modal value "{SavedValue:AutomationContactEmail}" into field "Email"
    When I click modal button "Save"
    #538592
    Then I softly see the following messages in the page details contains:
      | Contacts must have unique email addresses. The email address entered is associated with an existing contact. |

    Examples:
      | UserType     |
      | EXTERNAL_SC  |
      | EXTERNAL_LEA |

  @538597 @NYSEDSprint-16 @US-537178 @M05
  Scenario:Verify that if an Internal user edits the contacts (any Role user) and uses a duplicate email ID from the same org then he should see vaidation on click of Save
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" inside table
    And I wait for "2" seconds
    And I select value inside table "AdditionalUser" is "All"
    And I wait for "2" seconds
    When I click on "Edit" icon for "Automation static Record" inside flex table with id "---home:-:userContactsTableId---"
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    When I enter in modal value "8967859036" into field "Phone"
    When I enter in modal value "{SavedValue:AutomationContactEmail}" into field "Email"
    When I click modal button "Save"
    #538597
    Then I softly see the following messages in the page details contains:
      | Contacts must have unique email addresses. The email address entered is associated with an existing contact. |

  @537574 @NYSEDSprint-14 @US-536217 @M05
  Scenario Outline:Verify that the grantee user see that below changes have been made in the Physical Address section under the Overview tab on the Subrecipient Organization layout.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "4" seconds
    #537574
    Then I softly see asterisk mark on "County Code"
    Then I softly do not see asterisk mark on "Building Code"
    Then I softly do not see asterisk mark on "Address Sequence Number"
    And I click on "Edit" in the page details
    And I clear the value from field "County__c"
    And I clear the value from field "NYSED_BuildingCode__c"
    And I clear the value from field "NYSED_AddressSequenceNumber__c"
    And I click on "Save" in the page details
    #537574
    Then I softly cannot see the following messages in the page details contains:
      | To Save, County Code is required in the Overview tab under the Physical Address section.             |
      | To Save, Building Code is required in the Overview tab under the Physical Address section.           |
      | To Save, Address Sequence Number is required in the Overview tab under the Physical Address section. |
    And I wait for "3" seconds
    And I enter value "12" into field "County__c"
    And I enter value "123456789012" into field "NYSED_BuildingCode__c"
    And I enter value "123" into field "NYSED_AddressSequenceNumber__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA |

  @525710 @525709 @525712-Home @NYSEDSprint-14 @US-536217 @M05
  Scenario Outline:Verify that the grantee user see that a new section, Payee Information, is added after the CSO Information section with below fields in order:
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    #525710 #525709 #525712
    Then I see only the following ordered page blocks :
      | Organization Information      |
      | Physical Address              |
      | CSO Information               |
      | Payee Information             |
      | Vendor Information            |
      | Additional SEDREF Information |
      | Contacts                      |
      | Indirect Cost Rate            |
      | System Information            |
    #525710
    Then I see below fields in "Payee Information" page block
      | Payee Name | Payee Street | Payee PO Box | Payee City | Payee State | Payee Zip Code | Payee Country | Payee ID |
    Then I softly do not see asterisk mark on "Payee Name"
    Then I softly do not see asterisk mark on "Payee Street"
    Then I softly do not see asterisk mark on "Payee PO Box"
    Then I softly do not see asterisk mark on "Payee City"
    Then I softly do not see asterisk mark on "Payee State"
    Then I softly do not see asterisk mark on "Payee Zip Code"
    Then I softly do not see asterisk mark on "Payee Country"
    Then I softly do not see asterisk mark on "Payee ID"
    #525709
    Then I see below fields in "CSO Information" page block
      | CSO Title | CSO Name | CSO Salute | CSO Phone Number |
    Then I softly do not see asterisk mark on "CSO Title"
    Then I softly do not see asterisk mark on "CSO Name"
    Then I softly do not see asterisk mark on "CSO Salute"
    Then I softly do not see asterisk mark on "CSO Phone Number"
    #525712
    Then I see below fields in "Additional SEDREF Information" page block
      | Charity Reg | Municipality Code | Federal ID | Hist Bedscode1 | Hist Bedscode2 | Hist Bedscode3 | Hist Bedscode4 | Date Active | Date Inactivate | Established Date | Established Date |
    Then I softly do not see asterisk mark on "Charity Reg"
    Then I softly do not see asterisk mark on "Municipality Code"
    Then I softly do not see asterisk mark on "Federal ID"
    Then I softly do not see asterisk mark on "Hist Bedscode1"
    Then I softly do not see asterisk mark on "Hist Bedscode2"
    Then I softly do not see asterisk mark on "Hist Bedscode3"
    Then I softly do not see asterisk mark on "Hist Bedscode4"
    Then I softly do not see asterisk mark on "Date Active"
    Then I softly do not see asterisk mark on "Act Inactive"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_LEA |
#      | GRANTEE_VO  |
#      | GRANTEE_CE  |

  @525869 @525883 @525881 @525885 @NYSEDSprint-14 @US-536217 @M05
  Scenario Outline: Verify that internal users see that a new section, Physical Address, is added after the Organization Information section with below fields in order.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I wait for "2" seconds
    #525869 #525883 #525881 #525885
    Then I see only the following ordered page blocks :
      | Organization Information      |
      | Physical Address              |
      | CSO Information               |
      | Payee Information             |
      | Vendor Information            |
      | Additional SEDREF Information |
      | Contacts                      |
      | Indirect Cost Rate            |
      | Third-Party Verification      |
      | System Information            |
    #525869
    Then I see below fields in "Physical Address" page block
      | Street | PO Box | City | County Code | State | Zip Code | Country | Building Code | Address Sequence Number |
    Then I softly see asterisk mark on "Street"
    Then I softly do not see asterisk mark on "PO Box"
    Then I softly see asterisk mark on "City"
    Then I softly see asterisk mark on "County Code"
    Then I softly see asterisk mark on "State"
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see asterisk mark on "Country"
    Then I softly do not see asterisk mark on "Building Code"
    Then I softly do not see asterisk mark on "Address Sequence Number"
    #525883
    Then I see below fields in "Payee Information" page block
      | Payee Name | Payee Street | Payee PO Box | Payee City | Payee State | Payee Zip Code | Payee Country | Payee ID |
    #525883
    Then I softly do not see asterisk mark on "Payee Name"
    Then I softly do not see asterisk mark on "Payee Street"
    Then I softly do not see asterisk mark on "Payee PO Box"
    Then I softly do not see asterisk mark on "Payee City"
    Then I softly do not see asterisk mark on "Payee State"
    Then I softly do not see asterisk mark on "Payee Zip Code"
    Then I softly do not see asterisk mark on "Payee Country"
    Then I softly do not see asterisk mark on "Payee ID"
    #525881
    Then I see below fields in "CSO Information" page block
      | CSO Title | CSO Name | CSO Salute | CSO Phone Number |
    Then I softly do not see asterisk mark on "CSO Title"
    Then I softly do not see asterisk mark on "CSO Name"
    Then I softly do not see asterisk mark on "CSO Salute"
    Then I softly do not see asterisk mark on "CSO Phone Number"
    #525885
    Then I see below fields in "Additional SEDREF Information" page block
      | Charity Reg | Municipality Code | Federal ID | Hist Bedscode1 | Hist Bedscode2 | Hist Bedscode3 | Hist Bedscode4 | Date Active | Act Inactive | Established Date |
    Then I softly do not see asterisk mark on "Charity Reg"
    Then I softly do not see asterisk mark on "Municipality Code"
    Then I softly do not see asterisk mark on "Federal ID"
    Then I softly do not see asterisk mark on "Hist Bedscode1"
    Then I softly do not see asterisk mark on "Hist Bedscode2"
    Then I softly do not see asterisk mark on "Hist Bedscode3"
    Then I softly do not see asterisk mark on "Hist Bedscode4"
    Then I softly do not see asterisk mark on "Date Active"
    Then I softly do not see asterisk mark on "Act Inactive"

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | FO       |
#      | PO       |
#      | EXE      |
#      | ADMIN    |

  @526022 @539781 @NYSEDSprint-10 @US-519409 @M05
  Scenario Outline:  Verify that only the admin user can edit the following fields under the Overview tab -> Organization Information section. : l. License Cap
    When I login to "As a Grantor" app as "<UserType>" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" inside table
    #539781
    Then I softly see field "Not For Profit" as "No"
    And I navigate to "Overview" sub tab
    Then I can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see that "Not For Profit" rendered in view mode only
    And I enter value "$%^&" into field "---home:-:licenseCap---"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, License Cap is required in the Overview tab under the Organization Information section. |
    And I enter value "-89" into field "---home:-:licenseCap---"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | License Cap must be greater than 0. |
    And I enter value "7" into field "---home:-:licenseCap---"
    And I click on "Save" in the page details
    Then I softly see field "License Cap" as "7"
    And I click on "Edit" in the page details
    And I enter value "111" into field "---home:-:licenseCap---"
    And I click on "Save" in the page details
    Then I softly see field "License Cap" as "11"
    And I click on "Edit" in the page details
    And I enter value "12" into field "---home:-:licenseCap---"
    And I click on "Save" in the page details
    Then I softly see field "License Cap" as "12"

    Examples:
      | UserType |
      | ADMIN    |

  @543071 @NYSEDSprint-15 @US-539637 @NYSEDSprint-17 @US-538760 @M05
  Scenario Outline:Verify that the grantee users see the new field 'Is Parent Organization', added in the Organization Information section on the Subrecipient Organization layout and that those are not editable.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "3" seconds
    #543071
    Then I softly see field "Is Parent Organization" inside page block
    And I click on "Edit" in the page details
    #543071
    Then I softly see field "Is Parent Organization" is not editable

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA |

  @539782 @NYSEDSprint-15 @US-539637 @M05
  Scenario Outline:Verify that the grantee user can see the Not For Profit field should not be editable if this is set other than NA. : Set to No
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "3" seconds
    #539782
    Then I softly see field "Not For Profit" as "No"
    And I click on "Edit" in the page details
    #539782
    Then I softly see that "Not For Profit" rendered in view mode only

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA |

  @543070 @NYSEDSprint-17 @US-538760 @M05
  Scenario Outline: Adding a flag on organization layout to show if it is a parent organization
    When I login to "As a Grantor" app as "<UserType>" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    And I navigate to "Overview" sub tab
    #543070
    Then I softly see field "Is Parent Organization" inside page block
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Location" is not editable
    Then I softly see field "Is Parent Organization" is not editable

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | FO       |
#      | PO       |
#      | EXE      |

  @543069 @NYSEDSprint-17 @US-538760 @M05
  Scenario Outline: Adding a flag on organization layout to show if it is a parent organization
    When I login to "As a Grantor" app as "<UserType>" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    And I navigate to "Overview" sub tab
    #543069
    Then I softly see field "Is Parent Organization" added after "SED NYC Public"
    Then I softly see asterisk mark on "Is Parent Organization"
    And I click on "Edit" in the page details
    Then I see only the following ordered options in dropdown field "NYSED_IsParentOrganization__c" :
      | --None-- | Yes | No |
    And I enter value "--None--" into field "NYSED_IsParentOrganization__c"
    And I click on "Save" in the page details
    #543069
    Then I softly see the following messages in the page details contains:
      | To save, Is Parent Organization is required in the Overview tab under the Organization Information section. |
    And I enter value "Yes" into field "NYSED_IsParentOrganization__c"
    And I click on "Save" in the page details
    #543069
    Then I softly see field "Is Parent Organization" as "Yes"

    Examples:
      | UserType |
      | ADMIN    |

  @NYSED-4024 @NYSEDSprint-28 @US-NYSED-3904 @M05
  Scenario Outline: Verify that the Submit and Certify Role and LEA Admin Role user can see the page-level Edit button on the Subrecipient Organization layout when the Institution ID field value is not present.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    #NYSED-4024
    Then I softly see field "Institution ID" as ""
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "1236" into field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    #NYSED-4024
    Then I softly see field "4-Digit Zip Code Extension" as "1236"

    Examples:
      | UserType     |
      | EXTERNAL_SC  |
      | EXTERNAL_LEA |

  @NYSED-4021 @NYSED-4022 @NYSEDSprint-28 @US-NYSED-3904 @M05
  Scenario Outline: Verify that the Submit and Certify Role and LEA Admin Role user cannot see the page-level Edit button on the Subrecipient Organization layout when the Institution ID field value is present.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    #NYSED-4021
    Then I softly see field "Institution ID" as "{SavedValue:InstitutionIDForAutomationPermanentNysedSchoolOrg}"
    Then I softly cannot see top right button "Edit" in page detail
    #NYSED-4022
    Then I softly can see top right button "New" in flex table with id "---home:-:userContactsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---home:-:userContactsTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---home:-:userContactsTableId---"
    Then I softly can see top right button "New" in flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly can see row level action button "Edit" against "Billing Address" in flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly can see row level action button "View" against "Billing Address" in flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly can see row level action button "Delete" against "Billing Address" in flex table with id "---home:-:AdditionalAddressTableId---"
    And I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly can see row level action button "Edit" against "pdf" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly can see row level action button "View" against "pdf" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly can see row level action button "Delete" against "pdf" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly can see row level action button "Download" against "pdf" in flex table with id "---home:-:OrganizationAddfile---"
    Then I softly can see top right button "New" in flex table with id "---home:-:ExternalNotesTableId---"
    When I enter the following values into flex table with id "---home:-:ExternalNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly can see row level action button "Edit" against "{SavedValue:GRANTEE_LEA Username}" in flex table with id "---home:-:ExternalNotesTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:GRANTEE_LEA Username}" in flex table with id "---home:-:ExternalNotesTableId---"

    Examples:
      | UserType    |
#      | GRANTEE_SC  |
      | GRANTEE_LEA |

  @NYSED-4922 @NYSEDSprint-28 @US-NYSED-3904 @M05 @ExecutionRemaining
  Scenario Outline: Verify that the Grantee user can see the following changes have been made on the Subrecipient Organization layout -> Overview tab -> Organization Information section
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    #NYSED-4922
    Then I softly see field "SEDREF Institution Type" added after "GG Institution Type"
    Then I softly see field "SEDREF Institution Sub Type" added after "SEDREF Institution Type"
    Then I softly see field "SED NYC Public" added after "SED NYC"
    When I hovering mouse on help text icon inside page block detail "SEDREF Institution Type"
    Then I softly see "SEDREF Institution type for the institution." shown as help text
    When I hovering mouse on help text icon inside page block detail "SEDREF Institution Sub Type"
    Then I softly see "SEDREF Institution subtype for the institution. This is the sub-category of the institution type that the institution belongs to." shown as help text

    Examples:
      | UserType     |
      | EXTERNAL_SC  |
      | EXTERNAL_LEA |

  @NYSED-4923 @NYSEDSprint-28 @US-NYSED-2898 @M05 @ExecutionRemaining
  Scenario Outline: Verify that the Admin user can see the following changes have been made on the Subrecipient Organization layout -> Overview tab -> Organization Information section
    When I login to "As a Grantor" app as "<UserType>" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" inside table
    And I navigate to "Overview" sub tab
    #NYSED-4923
    Then I softly see field "SEDREF Institution Type" added after "GG Institution Type"
    Then I softly see field "SEDREF Institution Sub Type" added after "SEDREF Institution Type"
    Then I softly see field "SED NYC Public" added after "SED NYC"
    When I hovering mouse on help text icon inside page block detail "SEDREF Institution Type"
    Then I softly see "SEDREF Institution type for the institution." shown as help text
    When I hovering mouse on help text icon inside page block detail "SEDREF Institution Sub Type"
    Then I softly see "SEDREF Institution subtype for the institution. This is the sub-category of the institution type that the institution belongs to." shown as help text

    Examples:
      | UserType |
      | ADMIN    |

  @NYSED-3412 @NYSED-3427 @NYSEDSprint-26 @US-NYSED-3412 @US-NYSED-1231 @M05
  Scenario Outline: Verify that the Internal User cannot see the Divisions child table as it is removed on the Home phase → Organization module → Internal left menu → Internal Organization Hierarchy list filter.
    When I login to "As a Grantor" app as "<UserType>" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Internal" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    #NYSED-3412
    Then I softly do not see child table in "---home:-:internalOrganizationId---"
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I navigate to "Related Log" sub tab
    And I wait for "2" seconds
    #NYSED-3427
    Then I softly do not see "Progress Reports" page block displayed
    Then I softly do not see "Site Visit" page block displayed
    Then I softly do not see "Desk Review" page block displayed

    Examples:
      | UserType |
      | PM       |
#      | FO       |
#      | FD       |
#      | FO       |
#      | EXE      |
#      | ADMIN    |

  @NYSED-3429 @NYSEDSprint-28 @US-NYSED-1231 @M05
  Scenario Outline: Verify that the Grantee user can see the following changes have been made on the Subrecipient Organization layout -> Overview tab -> Organization Information section
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Related Log" sub tab
    And I wait for "2" seconds
    #NYSED-3429
    Then I softly do not see "Progress Reports" page block displayed
    Then I softly do not see "Site Visit" page block displayed
    Then I softly do not see "Desk Review" page block displayed

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_LEA  |
#      | GRANTEE_VO   |
#      | GRANTEE_CE   |

  @NYSED-3467 @NYSED-3464 @NYSED-3462 @NYSEDSprint-26 @US-NYSED-2085 @M05
  Scenario Outline: Verify that the Grantee User sees that the County Code field is required to save on the Subrecipient Organization layout -> Overview tab ->Additional address section -> ‘View Additional Address’ modal.
  |Verify that the Grantee User sees that the Additional address section, below changes have been made on the Subrecipient Organization layout -> Overview tab|
  |Verify that the Grantee User sees that the Internal Organization column is removed on the Subrecipient Organization layout -> Related Log tab -> Grant section|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    #NYSED-3462
    Then I see only the following headers in table with id "---home:-:ActiveGrantsByOrganizationSubrecipientTableId---" :
      | Actions | Grant Title | Project Period | Total Awarded Amount |
    And I navigate to "Overview" sub tab
    #NYSED-3464
    Then I see only the following headers in table with id "---home:-:AdditionalAddressTableId---" :
      | Actions | Address Type | Street | PO Box | City | State | Zip Code | County Code | Country |
    And I save the value from row "1" for column name "Address Type" as "AddressType" from flex table "---home:-:AdditionalAddressTableId---"
    And I click on "View" icon for "{SavedValue:AddressType}" inside flex table with id "---home:-:AdditionalAddressTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-3467
    Then I softly see asterisk mark on "County Code"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_LEA  |

  @NYSED-3463 @NYSED-3461 @NYSEDSprint-26 @US-NYSED-2085 @M05
  Scenario Outline:Verify that the Grantee User sees that the Contact Type field is hidden on the Subrecipient Organization layout -> Overview tab → Contacts sections → Create and Edit Contact modal
  |Verify that the Grantee User sees that the below changes have been made on the Subrecipient Organization layout -> Overview tab -> Additional SEDREF Information section|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    #NYSED-3463
    Then I softly cannot see field " Contact Type" inside page block
    And I click modal button "Close"
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    And I click on "Edit" icon for "{SavedValue:EXTERNAL_SC Username}" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-3463
    Then I softly cannot see field " Contact Type" inside page block
    And I click modal button "Close"
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    #NYSED-3461
    Then I softly cannot see field "Act Inactive" inside page block
    Then I softly see field "Date Inactivate" added after "Date Active"
    Then I softly see field "Established Date" added after "Date Inactivate"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see that "Date Inactivate" rendered in view mode only
    Then I softly see that "Established Date" rendered in view mode only

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA  |

  @NYSED-3442 @NYSED-3445 @NYSED-2085-US @Vaibhav
  Scenario Outline:Verify that the Grantee User sees that the License Cap field is removed/hidden on the Home phase -> Organization Profile module -> Subrecipient Organization layout -> in the header section.
  |Verify that the Grantee User sees that the following fields are removed/hidden on the Home phase -> Organization Profile module -> Subrecipient Organization layout -> Overview tab -> Organization Information section|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    Then I see the following fields in the page detail header :
      | EGMS ID | Status |
    Then I softly do not see fields "License Cap" is visible
    Then I softly cannot see field "Location" inside page block
    Then I softly cannot see field "Bedscode" inside page block
    Then I softly cannot see field "EIN" inside page block

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA  |
#      | EXTERNAL_VO   |
#      | EXTERNAL_CE   |

  @NYSED-3446 @NYSED-3447 @NYSED-3448 @NYSED-3454 @NYSED-3456 @NYSED-3457 @Vaibhav
  Scenario Outline: Verify that the Grantee User sees that the new formula non-editable field ‘SED NYC’ is added after the ‘Hold Payments’ field on the Subrecipient Organization layout -> Overview tab -> Organization Information section.
  |Verify that the Grantee User sees that the Institution Type field displays the value selected during registration on the Subrecipient Organization layout -> Overview tab -> Organization Information section.|
  |Verify that the Grantee User sees that the UEI field is editable and displays the value entered during registration on the Subrecipient Organization layout -> Overview tab -> Organization Information section.|
  |Verify that the Grantee User sees that the new read-only field Country Code is added after the Country field on the Subrecipient Organization layout -> Overview tab -> Physical Address section|
  |Verify that the Grantee User sees that the new read-only field 'Payee Zip Code Extension' is added after Payee Zip Code field on the Subrecipient Organization layout -> Overview tab -> Payee Information section|
  |Verify that the Grantee User sees that the new read-only text field 'Payee Zip Code' is added on the Subrecipient Organization layout -> Overview tab -> Payee Information section|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    #NYSED-3446
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see field "SED NYC" added after "Hold Payments"
    Then I softly see field "SED NYC" is not editable
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "31" into field "County__c"
    When I click on "Save" in the page details
    Then I softly see field "SED NYC" as "Yes"
    Then I softly see field "County Code" as "31"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see field "SED NYC" is not editable
    Then I softly see "Physical Address" page block displayed
    And I enter value "13" into field "County__c"
    When I click on "Save" in the page details
    Then I softly see field "SED NYC" as "No"
    Then I softly see field "County Code" as "13"
  #NYSED-3447
    Then I softly see field "GG Institution Type" inside page block
    When I click on "Edit" in the page details
    Then I softly see field "GG Institution Type" as "Public School Districts"
    Then I softly see field "GG Institution Type" is not editable
  #NYSED-3448
    Then I softly see field "UEI" inside page block
    And I enter value "TMNCGDWW5QL8" into field "UEISam__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | A subrecipient organization with this UEI number already exists. Enter a different UEI. |
    And I enter value "TMNCGDWW5QL7" into field "UEISam__c"
    When I click on "Save" in the page details
    Then I softly see field "UEI" as "TMNCGDWW5QL7"
  #NYSED-3454
    Then I softly see "Physical Address" page block displayed
    Then I softly see field "Country Code" added after "Country"
    When I click on "Edit" in the page details
    Then I softly see field "Country Code" is not editable
  #NYSED-3456
    Then I softly see field "4-Digit Zip Code Extension" added after "Zip Code"
    Then I softly see field "4-Digit Zip Code Extension" is not editable
  #NYSED-3457
    Then I softly see "Payee Information" page block displayed
    Then I softly see field "Payee Zip Code" added after "Payee State"
    Then I softly see field "Payee Zip Code" is not editable

    Examples:
      | UserType     |
#      | EXTERNAL_SC  |
      | EXTERNAL_LEA |

  @NYSED-3458 @NYSED-3459 @NYSED-3460 @Vaibhav
  Scenario Outline: Verify that the Grantee User sees that the new read-only short text field 'Vendor Location' is added after the OSC Vendor Status field on the Subrecipient Organization layout -> Overview tab -> Vendor Information section
  |Verify that the Grantee User sees that the field 'OSC Vendor Status' is added on the Subrecipient Organization layout -> Overview tab -> Vendor Information section|
  |Verify that the Grantee User sees that the field Vendor ID is marked as a non-editable field on the Subrecipient Organization layout -> Overview tab -> Vendor Information section|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see "Vendor Information" page block displayed
    Then I softly see field "Vendor Location" added after "OSC Vendor Status"
    When I hovering mouse on help text icon inside page block detail "Vendor Location"
    Then I softly see "The vendor location used with payments." shown as help text
    When I click on "Edit" in the page details
    Then I softly see field "Vendor Location" is not editable
    #NYSED-3459
    Then I softly see field "OSC Vendor Status" inside page block
    When I hovering mouse on help text icon inside page block detail "OSC Vendor Status"
    Then I softly see "OSC (Office of State Comptroller) vendor status Active/Inactive flag. Used with payments." shown as help text
    Then I softly see field "OSC Vendor Status" is not editable
    #NYSED-3460
    Then I softly see field "Vendor ID" inside page block
    Then I softly see field "Vendor ID" is not editable

    Examples:
      | UserType     |
#      | EXTERNAL_SC  |
      | EXTERNAL_LEA |

  @NYSED-3465 @Vaibhav
  Scenario Outline: Verify that the Grantee User sees that the County Code field is required to save on the Subrecipient Organization layout -> Overview tab ->Additional address section -> ‘Create Additional Address’ modal.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    When I click on "Edit" in the page details
    And I clear the value from field "County__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, County Code is required in the Overview tab under the Physical Address section. |
    And I enter value "134" into field "County__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "0.9" into field "County__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "Test" into field "County__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "14" into field "County__c"
    When I click on "Save" in the page details
    Then I softly see field "County Code" as "14"

    Examples:
      | UserType     |
#      | EXTERNAL_SC  |
      | EXTERNAL_LEA |

  @NYSED-3466 @Vaibhav
  Scenario Outline: Verify that the Grantee User sees that the County Code field is required to save on the Subrecipient Organization layout -> Overview tab ->Additional address section -> ‘Edit Additional Address’ modal.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    And I click on top right button "New" in flex table with id "---home:-:AdditionalAddressTableId---"
    And I enter "External_Additional_Address" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I enter in modal value "Automation Test" into field "AddressLine2__c"
    When I click modal button "Save"
    When I click on "Edit" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly see asterisk mark on "County Code"
    And I clear the value from field "County1__c"
    When I click modal button "Save"
    Then I see the following messages in the page details contains:
      | To save, County Code is required. |
    And I enter value "14" into field "County1__c"
    When I click on "Save" in the page details
    Then I softly see value "14" for title "County Code" inside table "---home:-:AdditionalAddressTableId---"

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA |

  @NYSED-3449 @Vaibhav
  Scenario Outline: Verify that the Grantee User sees that the new optional, text, and editable field ‘4-Digit Zip Code Extension’ is added after Zip code field on the Subrecipient Organization layout -> Overview tab -> Physical Address section
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly see "Physical Address" page block displayed
    Then I softly see field "4-Digit Zip Code Extension" added after "Zip Code"
    When I click on "Edit" in the page details
    Then I softly do not see asterisk mark on "4-Digit Zip Code Extension"
    And I enter value "Test" into field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    Then I see the following messages in the page details contains:
      | The 4-Digit Zip Code Extension should consist of 4 digits. |
    And I enter value "123" into field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    Then I see the following messages in the page details contains:
      | The 4-Digit Zip Code Extension should consist of 4 digits. |
    And I enter value "33.3" into field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    Then I see the following messages in the page details contains:
      | The 4-Digit Zip Code Extension should consist of 4 digits. |
    And I enter value "abcd" into field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    Then I see the following messages in the page details contains:
      | The 4-Digit Zip Code Extension should consist of 4 digits. |
    And I enter value "1234" into field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    Then I softly see field "4-Digit Zip Code Extension" as "1234"
    When I click on "Edit" in the page details
    And I enter value "5678" into field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    Then I softly see field "4-Digit Zip Code Extension" as "5678"

    Examples:
      | UserType     |
#      | EXTERNAL_SC  |
      | EXTERNAL_LEA |

  @NYSED-3468 @NYSED-3469 @NYSED-3471 @NYSED-3473 @NYSED-3474 @NYSED-3475 @NYSED-3476 @NYSED-3477 @NYSED-3478 @US-NYSED-2883
  Scenario: Verify that the Admin User sees that the License Cap field is removed/hidden on the Home phase -> Organization Profile module -> Subrecipient Organization layout -> in the header section.
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" inside table
    #NYSED-3468
    Then I see the following fields in the page detail header :
      | EGMS ID | Status |
    Then I softly do not see fields "License Cap" is visible
    #NYSED-3469
    Then I softly see "Additional SEDREF Information" page block displayed
    Then I softly see field "Date Inactivate" as ""
    Then I softly see field "Status" as "Active"
    #NYSED-3471
    Then I softly see "Organization Information" page block displayed
    Then I softly do not see fields "Location" is visible
    Then I softly do not see fields "Bedscode" is visible
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    #NYSED-3473
    Then I softly see that "GG Institution Type" rendered in view mode only
    #NYSED-3474
    Then I softly see fields "UEISam__c" is in edit mode
    And I enter value "RS5MPRZU1828" into field "UEISam__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | A subrecipient organization with this UEI number already exists. Enter a different UEI. |
    And I enter value "RS5MPRZU18" into field "UEISam__c"
    When I click on "Save" in the page details
    Then I softly see field "UEI" as "RS5MPRZU18"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    #NYSED-3475
    Then I softly see "Physical Address" page block displayed
    Then I softly see fields "NYSED_Zip_Code_Extension__c" is in edit mode
#    And I enter value "No" into field "NYSED_IsParentOrganization__c"
    Then I softly do not see asterisk mark on "NYSED_Zip_Code_Extension__c"
    And I clear the value from field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    Then I softly see field "4-Digit Zip Code Extension" as ""
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "123" into field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The 4-Digit Zip Code Extension should consist of 4 digits. |
    And I enter value "32.2" into field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The 4-Digit Zip Code Extension should consist of 4 digits. |
    And I enter value "abcd" into field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The 4-Digit Zip Code Extension should consist of 4 digits. |
    And I enter value "12365" into field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    Then I softly see field "4-Digit Zip Code Extension" as "1236"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "3434" into field "NYSED_Zip_Code_Extension__c"
    When I click on "Save" in the page details
    Then I softly see field "4-Digit Zip Code Extension" as "3434"
    #NYSED-3476
    Then I see below fields in "Physical Address" page block
      | Country | Country Code |
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see that "Country Code" rendered in view mode only
    #NYSED-3477
    Then I softly see "Payee Information" page block displayed
    Then I softly see that "Payee Zip Code Extension" rendered in view mode only
    Then I see below fields in "Payee Information" page block
      | Payee Zip Code | Payee Zip Code Extension
    #NYSED-3478
    Then I softly see that "Payee Zip Code" rendered in view mode only

  @NYSED-3479 @NYSED-3480 @NYSED-3481 @NYSED-3482 @NYSED-3483 @NYSED-3484 @NYSED-3485 @NYSED-3486 @NYSED-3487 @needtoReview
  Scenario: Verify that the Admin User sees that the new read-only short text field 'Vendor Location' is added after the OSC Vendor Status field on the Subrecipient Organization layout -> Overview tab -> Vendor Information section
  |Verify that the Admin User sees that the field 'OSC Vendor Status' is added on the Subrecipient Organization layout -> Overview tab -> Vendor Information section|
  |Verify that the Admin User sees that the field Vendor ID is marked as a non-editable field on the Subrecipient Organization layout -> Overview tab -> Vendor Information section|
  |Verify that the Admin User sees that the below changes have been made on the Subrecipient Organization layout -> Overview tab -> Additional SEDREF Information section|
  |Verify that the Admin User sees that the Internal Organization column is removed on the Subrecipient Organization layout -> Related Log tab -> Grant section|
  |Verify that the Admin User sees that the Additional address section, below changes have been made on the Subrecipient Organization layout -> Overview tab|
  |Verify that the Admin User sees that the County Code field is required to save on the Subrecipient Organization layout -> Overview tab ->Additional address section -> ‘Create Additional Address’ modal.|
  |Verify that the Admin User sees that the County Code field is required to save on the Subrecipient Organization layout -> Overview tab ->Additional address section -> ‘Edit Additional Address’ modal.|
  |Verify that the Admin User sees that the County Code field is required to save on the Subrecipient Organization layout -> Overview tab ->Additional address section -> ‘View Additional Address’ modal.|
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    Then I softly see "Subrecipients Organization - All" page block displayed
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I navigate to "Overview" sub tab
    Then I softly see "Vendor Information" page block displayed
    Then I softly see field "Vendor Location" added after "OSC Vendor Status"
    When I hovering mouse on help text icon inside page block detail "Vendor Location"
    Then I softly see "The vendor location used with payments." shown as help text
    When I click on "Edit" in the page details
    Then I softly see field "Vendor Location" is not editable
    #NYSED-3480
    Then I softly see field "OSC Vendor Status" inside page block
    When I hovering mouse on help text icon inside page block detail "OSC Vendor Status"
    Then I softly see "OSC (Office of State Comptroller) vendor status Active/Inactive flag. Used with payments." shown as help text
    Then I softly see field "OSC Vendor Status" is not editable
    #NYSED-3481
    Then I softly see field "Vendor ID" inside page block
    Then I softly see field "Vendor ID" is not editable
    #NYSED-3482
    Then I softly see "Additional SEDREF Information" page block displayed
    Then I softly cannot see field "Act Inactive field" inside page block
    Then I softly see field "Date Inactivate" added after "Date Active"
    Then I softly see field "Established Date" added after "Date Inactivate"
    Then I softly see field "Date Inactivate" is not editable
    Then I softly see field "Established Date" is not editable
    #NYSED-3483
    And I navigate to "Related Log" sub tab
    Then I softly see "Grants" page block displayed
    Then I softly do not see "Internal Organization" in flex table header "---home:-:RelatedLogGrantsTableId---"
    #NYSED-3484
    And I navigate to "Overview" sub tab
    Then I softly see "Additional Address" page block displayed
    Then I softly see field "PO Box" inside page block
    Then I softly see field "County Code" inside page block
    Then I see only the following headers in table with id "---home:-:AdditionalAddressTableId---" :
      | Actions | Address Type | Street | PO Box | City | State | Zip Code | County Code | Country |
    #NYSED-3485
    And I click on top right button "New" in flex table with id "---home:-:AdditionalAddressTableId---"
    And I enter "External_Additional_Address" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I enter in modal value "Automation Test" into field "AddressLine2__c"
    Then I softly see asterisk mark on "County Code"
    And I clear the value from field "County1__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, County Code is required. |
    And I enter value "134" into field "County1__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "0.9" into field "County1__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "Test" into field "County1__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    And I enter value "14" into field "County1__c"
    When I click on "Save" in the page details
    Then I softly see value "14" for title "County Code" inside table "---home:-:AdditionalAddressTableId---"
    #NYSED-3486
    When I click on "Edit" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly see asterisk mark on "County Code"
    And I clear the value from field "County1__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, County Code is required. |
    And I enter value "13" into field "County1__c"
    When I click on "Save" in the page details
    Then I softly see value "13" for title "County Code" inside table "---home:-:AdditionalAddressTableId---"
    #NYSED-3487
    When I click on "View" icon for "Backup" inside flex table with id "---home:-:AdditionalAddressTableId---"
    Then I softly see asterisk mark on "County Code"

  @NYSED-10227 @NYSED-10228 @NYSED-10229 @NYSED-Sprint-35 @US-NYSED-9490 @M05
  Scenario Outline: Verify that the Internal User can see that on the Subrecipient Organization layout, below changes and field sequence have been made in the Header section
  |Verify that the Internal User can see that on the Subrecipient Organization layout → Overview tab → Organization Information section, below changes have been made.|
  |Verify that the Internal User can see that on the Subrecipient Organization layout → Overview tab → ‘Physical Address’ section is renamed to ‘Physical Address’ and ‘Additional Address’ section is hidden/removed.|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    Then I softly see "Subrecipients Organization - All" page block displayed
    When I perform quick search for "{SavedValue:SubrecipientOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:SubrecipientOrg}" inside table
    And I navigate to "Overview" sub tab
    #NYSED-10227
    Then I see the following fields in the page detail header :
      | EGMS ID | Institution ID | SED Code | Status | Not For Profit | GG Institution Type | SEDREF Institution Type | SEDREF Institution Sub Type |
    #NYSED-10228
    Then I see below fields in "Organization Information" page block
      | SED Code | Institution ID | GG Institution Type | SEDREF Institution Type | SEDREF Institution Sub Type | Popular Name | UEI | Not For Profit | Interest Eligible | Phone Number | SAM.Gov Expiration Date | License Cap | Hold Payments | SED NYC | SED NYC Public | Is Parent Organization |
    Then I see below fields in "Vendor Information" page block
      | Vendor ID | OSC Vendor Status | Vendor Location |
    #NYSED-10229
    Then I softly do not see "Physical Address" page block displayed
    Then I softly do not see "Additional Address" page block displayed
    Then I see only the following ordered page blocks :
      | Organization Information      |
      | Physical Address              |
      | CSO Information               |
      | Payee Information             |
      | Vendor Information            |
      | Additional SEDREF Information |
      | Contacts                      |
      | Indirect Cost Rate            |
      | Third-Party Verification      |
      | System Information            |

    Examples:
      | UserType |
      | ADMIN    |
#      | PO       |
#      | FD       |
#      | FD       |
#      | PM       |
#      | EXE      |

  @NYSED-10225 @NYSED-10224 @NYSED-10223 @NYSED-Sprint-35 @US-NYSED-9232 @M05 @Bug-Ticket-NYSED-10272 @Bug-Ticket-NYSED-10319
  Scenario Outline:Verify that the Grantee User can see that on the Subrecipient Organization layout → Overview tab → ‘Physical Address’ section is renamed to ‘Physical Address’ and ‘Additional Address’ section is hidden/removed.
  |Verify that the Grantee User can see that on the Subrecipient Organization layout → Overview tab → Organization Information section, below changes have been made|
  |Verify that the Grantee User can see that on the Subrecipient Organization layout, below changes and field sequence have been made in the Header section|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #NYSED-10223
    Then I see the following fields in the page detail header :
      | EGMS ID | Institution ID | SED Code | Status | Not For Profit | GG Institution Type | SEDREF Institution Type | SEDREF Institution Sub Type |
    #NYSED-10224
    Then I see below fields in "Organization Information" page block
      | SED Code | Institution ID | GG Institution Type | SEDREF Institution Type | SEDREF Institution Sub Type | Popular Name | UEI | Not For Profit | Interest Eligible | Phone Number | SAM.Gov Expiration Date | Hold Payments | SED NYC | SED NYC Public | Is Parent Organization |
    Then I softly cannot see field "License Cap" inside page block
    Then I see below fields in "Vendor Information" page block
      | Vendor ID | OSC Vendor Status | Vendor Location |
    #NYSED-10225
    Then I softly do not see "Primary Address" page block displayed
    Then I softly do not see "Additional Address" page block displayed
    Then I see only the following ordered page blocks :
      | Organization Information      |
      | Physical Address              |
      | CSO Information               |
      | Payee Information             |
      | Vendor Information            |
      | Additional SEDREF Information |
      | Contacts                      |
      | Indirect Cost Rate            |
      | System Information            |

    Examples:
      | UserType    |
      | GRANTEE_SC  |
      | GRANTEE_CE  |
      | GRANTEE_VO  |
      | GRANTEE_LEA |