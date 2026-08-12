@fundingSourceNysed @planningNysed @planning
Feature: Validate all scenarios in Funding Source

  @492819 @Sprint-01 @US-490341 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user see only Edit button at the Internal Funding Sources page layout and other record flow action buttons at page level action dropdown
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Activate" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Activate" in page detail
    Then I softly can see top right dropdown button "Deactivate" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType |
      | FD       |

  @492822  @Sprint-01 @US-490341 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user see only Edit button at the External Funding Sources page layout and other record flow action buttons at page level action dropdown
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Activate" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Activate" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Activate" in page detail
    Then I softly can see top right dropdown button "Deactivate" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    Examples:
      | UserType |
      | FD       |

  @493453 @Sprint-02 @US-487296 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user see only Edit button at the External Funding Sources page layout and other record flow action buttons at page level action dropdown
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    Then I softly see "State Funding Sources - All" page block displayed
    Then I softly see "Federal Funding Sources - All" page block displayed
    Then I softly see "Funding Accounts - All" page block displayed

    Examples:
      | UserType |
      | ADMIN    |
#      | EXE      |
#      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @493454 @Sprint-02 @US-487296 @M04 @M04Planning
  Scenario Outline: Verify that the Internal User can see the below columns on the Funding Account list view
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    Then I see only the following headers in table with id "---fundingsource:-:fundingTableId---" :
      | Actions | EGMS ID | Fund Year | Title | Type | Cert Level | Funding Source EGMS ID | Funding Source Title | Created By ID | Status |

    Examples:
      | UserType |
      | ADMIN    |
#      | EXE      |
#      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @493455 @Sprint-02 @US-487296 @M04 @M04Planning
    @NYSED-4912 @NYSEDSprint-28 @US-NYSED-4908
  Scenario Outline: Verify that the Internal User can see the below list of options for Funding Account list view
  |Verify that the Internal User can view the updated list filter names displayed for State and Federal Funding Sources and Funding Accounts.|
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    #NYSED-4912
    Then I softly see toggle option "Funding Accounts - All" inside flex table id "---fundingsource:-:fundingTableId---"
    Then I softly see toggle option "Funding Accounts - Active" inside flex table id "---fundingsource:-:fundingTableId---"
    Then I softly see toggle option "Funding Accounts - Created" inside flex table id "---fundingsource:-:fundingTableId---"
    Then I softly see toggle option "Funding Accounts - Closed" inside flex table id "---fundingsource:-:fundingTableId---"
    Then I softly see toggle option "Federal Funding Sources - All" inside flex table id "---fundingsource:-:externalFundingTableId---"
    Then I softly see toggle option "Federal Funding Sources - Active" inside flex table id "---fundingsource:-:externalFundingTableId---"
    Then I softly see toggle option "Federal Funding Sources - Created" inside flex table id "---fundingsource:-:externalFundingTableId---"
    Then I softly see toggle option "Federal Funding Sources - Closed" inside flex table id "---fundingsource:-:externalFundingTableId---"
    Then I softly see toggle option "State Funding Sources - All" inside flex table id "---fundingsource:-:fundingSourceTableId---"
    Then I softly see toggle option "State Funding Sources - Active" inside flex table id "---fundingsource:-:fundingSourceTableId---"
    Then I softly see toggle option "State Funding Sources - Created" inside flex table id "---fundingsource:-:fundingSourceTableId---"
    Then I softly see toggle option "State Funding Sources - Closed" inside flex table id "---fundingsource:-:fundingSourceTableId---"

    Examples:
      | UserType |
      | ADMIN    |
#      | EXE      |
#      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @493456 @Sprint-02 @US-487296 @M04 @M04Planning
  Scenario Outline: Verify that the Internal User can see the Created funding accounts (Internal and External) under the Funding Account - Draft list view
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedInternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Created"
    When I perform quick search for "{SavedValue:CreatedInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:CreatedInternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Created"
    When I perform quick search for "{SavedValue:CreatedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:CreatedExternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    Examples:
      | UserType |
      | ADMIN    |
#      | EXE      |
#      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @493458 @Sprint-02 @US-487296 @M04 @M04Planning
  Scenario Outline: Verify that the Internal User can see the Active funding accounts (Internal and External) under the Funding Account - Active list view
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Active"
    When I perform quick search for "{SavedValue:InternalFundingAccountTitle}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:InternalFundingAccountTitle}" inside table "---fundingsource:-:fundingTableId---"
    When I perform quick search for "{SavedValue:AutomationExternalFundingAccountTitle}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:AutomationExternalFundingAccountTitle}" inside table "---fundingsource:-:fundingTableId---"

    Examples:
      | UserType |
      | ADMIN    |
#      | EXE      |
#      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @493462 @Sprint-02 @US-487296 @M04 @M04Planning
  Scenario Outline: Verify that the Internal User can see the Closed funding accounts (Internal and External) under the Funding Account - Closed list view
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedInternalFunddingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Closed"
    When I perform quick search for "{SavedValue:ClosedInternalFunddingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Closed" for title "Status" against the value "{SavedValue:ClosedInternalFunddingAccount}" inside table "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Closed"
    When I perform quick search for "{SavedValue:ClosedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Closed" for title "Status" against the value "{SavedValue:ClosedExternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"

    Examples:
      | UserType |
      | ADMIN    |
#      | EXE      |
#      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @493463 @Sprint-02 @US-487296 @M04 @M04Planning
  Scenario Outline: Verify that the Internal User can see the All funding accounts (Internal and External) under the Funding Account - All list view
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedInternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:CreatedInternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:CreatedInternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    And I click on "View" icon for "{SavedValue:CreatedInternalFundingAccount}" inside table
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActiveInternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:ActiveInternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:ActiveInternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    And I click on "View" icon for "{SavedValue:ActiveInternalFundingAccount}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedInternalFunddingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ClosedInternalFunddingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Closed" for title "Status" against the value "{SavedValue:ClosedInternalFunddingAccount}" inside table "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:CreatedExternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    Then I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:CreatedExternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    And I click on "View" icon for "{SavedValue:CreatedExternalFundingAccount}" inside table
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActiveExternalFundingAccount"
    Then I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:ActiveExternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    Then I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:ActiveExternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    And I click on "View" icon for "{SavedValue:ActiveExternalFundingAccount}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedInternalFunddingAccount"
    Then I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ClosedInternalFunddingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Closed" for title "Status" against the value "{SavedValue:ClosedInternalFunddingAccount}" inside table "---fundingsource:-:fundingTableId---"

    Examples:
      | UserType |
      | ADMIN    |
#      | EXE      |
#      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @493466 @Sprint-02 @US-487296 @M04 @M04Planning
  Scenario Outline: Verify that the Internal User can not see the Active and Deactivated funding accounts (Internal and External) under the Funding Account - Draft list view
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedInternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Created"
    When I perform quick search for "{SavedValue:CreatedInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:CreatedInternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:CreatedInternalFundingAccount}" inside table
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActiveInternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Created"
    When I perform quick search for "{SavedValue:ActiveInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveInternalFundingAccount}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedInternalFunddingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Created"
    When I perform quick search for "{SavedValue:ClosedInternalFunddingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Created"
    When I perform quick search for "{SavedValue:CreatedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:CreatedExternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:CreatedExternalFundingAccount}" inside table
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActiveExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Created"
    When I perform quick search for "{SavedValue:ActiveExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveExternalFundingAccount}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Created"
    When I perform quick search for "{SavedValue:ClosedInternalFunddingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---fundingsource:-:fundingTableId---"

    Examples:
      | UserType |
      | ADMIN    |
#      | EXE      |
#      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @493467 @Sprint-02 @US-487296 @M04 @M04Planning
  Scenario Outline: Verify that the Internal User can not see the Active and Deactivated funding accounts (Internal and External) under the Funding Account - Draft list view
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedInternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Active"
    When I perform quick search for "{SavedValue:CreatedInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:CreatedInternalFundingAccount}" inside table
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActiveInternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Active"
    When I perform quick search for "{SavedValue:ActiveInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:ActiveInternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveInternalFundingAccount}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedInternalFunddingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Active"
    When I perform quick search for "{SavedValue:ClosedInternalFunddingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I wait for "5" seconds
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Active"
    When I perform quick search for "{SavedValue:CreatedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:CreatedExternalFundingAccount}" inside table
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActiveExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Active"
    When I perform quick search for "{SavedValue:ActiveExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:ActiveExternalFundingAccount}" inside table "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveExternalFundingAccount}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Active"
    When I perform quick search for "{SavedValue:ClosedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---fundingsource:-:fundingTableId---"

    Examples:
      | UserType |
      | ADMIN    |
#      | EXE      |
#      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @493469 @Sprint-02 @US-487296 @M04 @M04Planning
  Scenario Outline: Verify that the Internal User can not see the Active and Created funding accounts (Internal and External) under the Funding Account - Deactivated list view
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedInternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Closed"
    When I perform quick search for "{SavedValue:CreatedInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:CreatedInternalFundingAccount}" inside table
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActiveInternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Closed"
    When I perform quick search for "{SavedValue:ActiveInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveInternalFundingAccount}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedInternalFunddingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Closed"
    When I perform quick search for "{SavedValue:ClosedInternalFunddingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Closed" for title "Status" against the value "{SavedValue:ClosedInternalFunddingAccount}" inside table "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I wait for "5" seconds
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Closed"
    When I perform quick search for "{SavedValue:CreatedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:CreatedExternalFundingAccount}" inside table
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActiveExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Closed"
    When I perform quick search for "{SavedValue:ActiveExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---fundingsource:-:fundingTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveExternalFundingAccount}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Closed"
    When I perform quick search for "{SavedValue:ClosedInternalFunddingAccount}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly see value "Closed" for title "Status" against the value "{SavedValue:ClosedInternalFunddingAccount}" inside table "---fundingsource:-:fundingTableId---"

    Examples:
      | UserType |
      | ADMIN    |
#      | EXE      |
#      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @493481 @Sprint-02 @US-487296 @M04 @M04Planning
  Scenario Outline: Verify that the owner of the funding account can edit it when it is in created
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Created"
    When I perform quick search for "{SavedValue:FundingAccId}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:FundingAccId}" in flex table with id "---fundingsource:-:fundingTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:FundingAccId}" in flex table with id "---fundingsource:-:fundingTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingTableId---"
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter value "2500" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$2,500"

    Examples:
      | UserType |
      | FD       |

  @493481-EX @Sprint-02 @US-487296 @M04 @M04Planning
  Scenario Outline: Verify that the owner of the funding account can edit it when it is in created
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:externalFundingSourceTableId---"
    And I wait for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Created"
    When I perform quick search for "{SavedValue:FundingAccId}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:FundingAccId}" in flex table with id "---fundingsource:-:fundingTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:FundingAccId}" in flex table with id "---fundingsource:-:fundingTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingTableId---"
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter value "2500" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$2,500"

    Examples:
      | UserType |
      | FD       |

  @493487 @Sprint-02 @US-487296 @M04 @M04Planning
  Scenario Outline: Verify that the all the Internal Users can view the funding accounts
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedInternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:CreatedInternalFundingAccount}" inside flex table with id "---fundingsource:-:fundingTableId---"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:CreatedInternalFundingAccount}" inside table
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActiveInternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveInternalFundingAccount}" inside flex table with id "---fundingsource:-:fundingTableId---"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveInternalFundingAccount}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedInternalFunddingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ClosedInternalFunddingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ClosedInternalFunddingAccount}" inside flex table with id "---fundingsource:-:fundingTableId---"
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I wait for "5" seconds
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:CreatedExternalFundingAccount}" inside flex table with id "---fundingsource:-:fundingTableId---"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:CreatedExternalFundingAccount}" inside table
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActiveExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveExternalFundingAccount}" inside flex table with id "---fundingsource:-:fundingTableId---"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveExternalFundingAccount}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ClosedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ClosedExternalFundingAccount}" inside flex table with id "---fundingsource:-:fundingTableId---"
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"

    Examples:
      | UserType |
      | ADMIN    |
#      | EXE      |
#      | FO       |
#      | PM       |
#      | PO       |
#      | FD       |

  @493512 @493514 @493515 @493517 @493519 @493520 @Sprint-02 @US-487296 @M04 @M04Planning
  Scenario Outline: Verify that the all the Internal Users can view the funding accounts
    Given I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedInternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Funding Accounts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CreatedInternalFundingAccount}"
    Then I softly see column header "EGMS ID" inside table "Funding Accounts"
    Then I softly see column header "Title" inside table "Funding Accounts"
    Then I softly see column header "Appropriation Amount" inside table "Funding Accounts"
    Then I softly see column header "Funding Source" inside table "Funding Accounts"
    Then I softly see column header "Created By" inside table "Funding Accounts"
    Then I softly see column header "Status" inside table "Funding Accounts"
    And I click on hyperlink for global search containing value "{SavedValue:CreatedInternalFundingAccount}"
    Then I see the header is "Funding Account" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:CreatedInternalFundingAccount}" inside table
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActiveInternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Funding Accounts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ActiveInternalFundingAccount}"
    Then I softly see column header "EGMS ID" inside table "Funding Accounts"
    Then I softly see column header "Title" inside table "Funding Accounts"
    Then I softly see column header "Appropriation Amount" inside table "Funding Accounts"
    Then I softly see column header "Funding Source" inside table "Funding Accounts"
    Then I softly see column header "Created By" inside table "Funding Accounts"
    Then I softly see column header "Status" inside table "Funding Accounts"
    And I click on hyperlink for global search containing value "{SavedValue:ActiveInternalFundingAccount}"
    Then I see the header is "Funding Account" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveInternalFundingAccount}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedInternalFunddingAccount"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Funding Accounts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ClosedInternalFunddingAccount}"
    Then I softly see column header "EGMS ID" inside table "Funding Accounts"
    Then I softly see column header "Title" inside table "Funding Accounts"
    Then I softly see column header "Appropriation Amount" inside table "Funding Accounts"
    Then I softly see column header "Funding Source" inside table "Funding Accounts"
    Then I softly see column header "Created By" inside table "Funding Accounts"
    Then I softly see column header "Status" inside table "Funding Accounts"
    And I click on hyperlink for global search containing value "{SavedValue:ClosedInternalFunddingAccount}"
    Then I see the header is "Funding Account" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I wait for "5" seconds
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "CreatedExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Funding Accounts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CreatedExternalFundingAccount}"
    Then I softly see column header "EGMS ID" inside table "Funding Accounts"
    Then I softly see column header "Title" inside table "Funding Accounts"
    Then I softly see column header "Appropriation Amount" inside table "Funding Accounts"
    Then I softly see column header "Funding Source" inside table "Funding Accounts"
    Then I softly see column header "Created By" inside table "Funding Accounts"
    Then I softly see column header "Status" inside table "Funding Accounts"
    And I click on hyperlink for global search containing value "{SavedValue:CreatedExternalFundingAccount}"
    Then I see the header is "Funding Account" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:CreatedExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:CreatedExternalFundingAccount}" inside table
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ActiveExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Funding Accounts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ActiveExternalFundingAccount}"
    Then I softly see column header "EGMS ID" inside table "Funding Accounts"
    Then I softly see column header "Title" inside table "Funding Accounts"
    Then I softly see column header "Appropriation Amount" inside table "Funding Accounts"
    Then I softly see column header "Funding Source" inside table "Funding Accounts"
    Then I softly see column header "Created By" inside table "Funding Accounts"
    Then I softly see column header "Status" inside table "Funding Accounts"
    And I click on hyperlink for global search containing value "{SavedValue:ActiveExternalFundingAccount}"
    Then I see the header is "Funding Account" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:ActiveExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveExternalFundingAccount}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ClosedExternalFundingAccount"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Funding Accounts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ClosedExternalFundingAccount}"
    Then I softly see column header "EGMS ID" inside table "Funding Accounts"
    Then I softly see column header "Title" inside table "Funding Accounts"
    Then I softly see column header "Appropriation Amount" inside table "Funding Accounts"
    Then I softly see column header "Funding Source" inside table "Funding Accounts"
    Then I softly see column header "Created By" inside table "Funding Accounts"
    Then I softly see column header "Status" inside table "Funding Accounts"
    And I click on hyperlink for global search containing value "{SavedValue:ClosedExternalFundingAccount}"
    Then I see the header is "Funding Account" in the page details

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |
#      | EXE      |
#      | ADMIN    |

  @496788 @Sprint-03 @US-493318 @M04 @M04Planning
  Scenario Outline: Verify that fund code field is added at Funding Source and Funding account - Internal Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "Fund Code" as "1990"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see field "Fund Code" as "1990"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"

    Examples:
      | UserType |
      | FD       |

  @496795 @496815 @497324 @Sprint-03 @US-493318 @M04 @M04Planning @sanitysuite
  Scenario Outline: Verify that fund code field is editable at Funding Source when in created state and field is a required text field which allows only 4 digits without decimal - Internal Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    #496795
    And I enter value "mmmm" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 digits |
    And I enter value "-192" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 digits |
    And I enter value ".99" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 digits |
    And I enter value "123" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund Code is required and must contain 4 digits. |
    When I click on "Edit" in the page details
    And I enter value "12345" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    Then I softly see field "Fund Code" as "1234"
    When I click on "Activate" in the page details
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Active"
    #497324
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable
    #496815
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    Then I softly see field "Fund Code" is not editable

    Examples:
      | UserType |
      | FD       |

  @496825 @Sprint-03 @US-493318 @M04 @M04Planning @sanitysuite
  Scenario Outline: Verify that fund code field is not editable at Funding Account and funding source for other internal user except Admin and FD - Internal Funding Source
    Given I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    Then I softly see fields "Fund_Code__c" is in edit mode
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "State Funding Sources - All"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable

    Examples:
      | UserType |
      | FO       |
#      | PO       |
#      | EXE      |

  @496834 @Sprint-03 @US-493318 @M04 @M04Planning @sanitysuite
  Scenario Outline: Verify that Fund code is not unique and can be duplicate for Funding source and funding account - Internal Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Fund Code" as "1990"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Fund Code" as "1990"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"

    Examples:
      | UserType |
      | FD       |

  @496841 @496924 @535664 @535663 @535639 @535915 @535908 @535916 @Sprint-03 @US-493318 @US-533938 @M04 @M04Planning @sprint-13 @sanitysuite @bugID_538665
  Scenario Outline: Verify that fund code field is added at Funding Source and Funding account - External Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    #535639
    Then I softly see field "Funding Source Type" as "Federal"
    Then I softly see that "Funding Source Type" rendered in view mode only
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    #535639
    Then I see the header is "Federal Funding Source" in the page details
    #536053
    Then I see below fields in "Information" page block
      | Federal Award Name | Funding Type | Assistance Listing Number | Assistance Listing Title | Start Date | End Date | FAIN | Federal Award Date | Federal Awarding Agency Code | Federal Awarding Agency Name | Federal Award Amount | Federal Message | Is the award R & D? | GSPS? |
    Then I softly see field "Funding Type" added after "Federal Award Name"
    Then I softly see field "Assistance Listing Number" added after "Funding Type"
    Then I softly see field "Assistance Listing Title" added after "Assistance Listing Number"
    Then I softly see field "Start Date" added after "Assistance Listing Title"
    Then I softly see field "End Date" added after "Start Date"
    Then I softly see field "FAIN" added after "End Date"
    Then I softly see field "Federal Award Date" added after "FAIN"
    Then I softly see that "Funding Type" rendered in view mode only
    Then I softly see field "Funding Source Type" as "Federal"
    #535663
    Then I softly do not see asterisk mark on "Federal Award Date"
    Then I softly see field "Federal Award Date" as ""
    When I click on "Edit" in the page details
    And I enter value "{Date:MM/dd/yyyy::d+7}" into field "NYSED_FederalAwardDate__c"
    When I click on "Save" in the page details
    #535663
    Then I softly see field "Federal Award Date" as "{Date:M/d/yyyy::d+7}"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    #496924
    Then I softly see field "Fund Code" as "1990"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FUNDINGACCOUNTID"
    When I navigate to "Messages" sub tab
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "FAIN"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "FAIN"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "FAIN"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "FAIN"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
      #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "FAIN"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #535915
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    #535915
    Then I softly see that "Funding Account Message" rendered in view mode only
    #535908
    Then I softly see "Funding Account Message" page block displayed
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "FAIN"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "FAIN"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "FAIN"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
      #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "FAIN"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "FAIN"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Messages" sub tab
    #535908
    Then I softly see that "Funding Account Message" rendered in view mode only
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Overview" sub tab
    Then I see below fields in "Information" page block
      | Federal Award Name | Funding Type | Assistance Listing Number | Assistance Listing Title | Start Date | End Date | FAIN | Federal Award Date | Federal Awarding Agency Code | Federal Awarding Agency Name | Federal Award Amount | Federal Message | Is the award R & D? | GSPS? |
    Then I softly see field "Funding Type" added after "Federal Award Name"
    Then I softly see field "Assistance Listing Number" added after "Funding Type"
    Then I softly see field "Assistance Listing Title" added after "Assistance Listing Number"
    Then I softly see field "Start Date" added after "Assistance Listing Title"
    Then I softly see field "End Date" added after "Start Date"
    Then I softly see field "FAIN" added after "End Date"
    Then I softly see field "Federal Award Date" added after "FAIN"
    Then I softly see that "Funding Type" rendered in view mode only
    Then I softly see field "Funding Source Type" as "Federal"
    #535664
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "Federal Award Name"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on back arrow
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I navigate to "Messages" sub tab
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I navigate to "Overview" sub tab
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    #535664
    Then I softly see field "Federal Award Date" added after "Federal Award Name"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "Federal Award Name"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "Federal Award Name"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "Federal Award Name"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "Federal Award Name"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    #535908
    Then I softly see "Funding Account Message" page block displayed
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536053
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Federal Award Date" added after "Federal Award Name"
    Then I softly see that "Federal Award Date" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FUNDINGACCOUNTID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    #535916
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only

    Examples:
      | UserType |
      | FD       |

  @496889 @496894 @497319 @Sprint-03 @US-493318 @M04 @M04Planning @sanitysuite
  Scenario Outline: Verify that fund code field is editable at Funding Source when in created state and field is a required text field which allows only 4 digits without decimal - External Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    #496889
    And I enter value "mmmm" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 digits. |
    And I enter value "-192" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 digits. |
    And I enter value ".99" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 digits |
    And I clear the value from field "Fund_Code__c"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund Code is required and must contain 4 digits. |
    When I click on "Edit" in the page details
    And I enter value "123" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund Code is required and must contain 4 digits. |
    When I click on "Edit" in the page details
    And I enter value "12345" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see field "Fund Code" as "1234"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Fund Code is required and must contain 4 digits. |
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    #496894
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I softly cannot see top right button "Edit" in page detail
    And I click on back arrow
    #497319
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    Then I softly see field "Fund Code" is not editable
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | UserType |
      | FD       |

  @493348 @493350 @535909 @535910 @Sprint-02 @US-490856 @US-534107 @bugID-503165 @M04 @M04Planning @sprint-13
  Scenario Outline: Verify that Internal User can see Sub-award column is removed and Funding account Title column is added next to EGMS ID column on Funding Account section - External Funding Account
  |Verify that the user can see that Funding Account EGMS ID is added at header of Funding Account - External Funding Account|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see the header is "Funding Account" in the page details
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Title" as "FundingAccountTitle"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    #535910
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    And I enter value "" into field "NYSED_AcctMsg__c" page block
    And I click on "Save" in the page details
    #535909
    Then I softly see field "Funding Account Message" as ""
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "{AUTOEnvData:Char256}" into field "NYSED_AcctMsg__c" page block
    And I click on "Save" in the page details
    #535909
    Then I softly see field "Funding Account Message" as "{AUTOEnvData:Char255}"
    When I click on "Activate" in the page details
    #493350
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
    Then I see the header is "Federal Funding Source" in the page details
    Then I softly see "EGMS ID" inside page block detail
    Then I softly do not see "Subaward" in flex table header "---fundingsource:-:fundingAccountTableId---"
    Then I see only the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Actions | Fund Year | Funding Account Title | Cert Level | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance | Status |
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    #535910
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    And I enter value "" into field "NYSED_AcctMsg__c" page block
    And I click on "Save" in the page details
    #535909
    Then I softly see field "Funding Account Message" as ""
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "{AUTOEnvData:Char256}" into field "NYSED_AcctMsg__c" page block
    And I click on "Save" in the page details
    #535909
    Then I softly see field "Funding Account Message" as "{AUTOEnvData:Char255}"

    Examples:
      | UserType |
      | FD       |

  @493345 @493349 @535635 @Sprint-02 @US-490856 @bugID-503165 @M04 @M04Planning
  Scenario Outline: Verify that Internal User can see Sub-award column is removed and Funding account Title column is added next to EGMS ID column on Funding Account section - Internal Funding Account
  |Verify that the user can see that Funding Account EGMS ID is added at header of Funding Account - Internal Funding Account|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    #535635
    Then I see the header is "State Funding Source" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see the header is "Funding Account" in the page details
    And I save the field labeled "Title" as "FundingAccountTitle"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    #493349
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I see the header is "State Funding Source" in the page details
    Then I softly see "EGMS ID" inside page block detail
    Then I softly do not see "Subaward" in flex table header "---fundingsource:-:fundingAccountTableId---"
    Then I see only the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Actions | Fund Year | Funding Account Title | Cert Level | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance | Status |

    Examples:
      | UserType |
      | FD       |

  @493354 @Sprint-02 @US-490856 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user can see 'Funding Account Title' column is added after 'Funding Account' column ( Announcement layout->Financials tab-> Funding Accounts Section )
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount2}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"

    Examples:
      | UserType |
      | PO       |
#      | PM       |
#      | EXE      |

  @493355 @Sprint-02 @US-490856 @M04 @M04Planning @skipOnJenkins
  Scenario Outline: Verify that the Internal user can see 'Funding Account Title' column is added after 'Funding Account' column ( FDM layout->FDM tab-> Funding Accounts Section )
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Review Completed"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see field "Status" as "Review Completed"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see field "Status" as "Review Completed"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see field "Status" as "Review Completed"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Funding Decision Memo" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationReview:-:FDM_FA_TableID---"
#    When I click "Associate" after selection of "---AUTOEnvData:-:InternalFundingAccount---" in the table "---applicationReview:-:FDM_FA_AssociateModalID---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount2}" in the table "---applicationReview:-:FDM_FA_AssociateModalID---"
    When I close "Funding Accounts" modal by clicking the top right x button
    And I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---applicationReview:-:FDM_FA_TableID---" without waiting for record
    Then I softly see field "FundingAccount__r.Title__c" not in edit mode
    And I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---applicationReview:-:FDM_FA_TableID---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---applicationReview:-:FDM_FA_TableID---" without waiting for record
    Then I softly see field "FundingAccount__r.Title__c" is not editable
    And I click on "Undo" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---applicationReview:-:FDM_FA_TableID---" without waiting for record
    Then I softly see value "Automation Permanent Funding Account" for title "Funding Account Title" against the value "{SavedValue:fundingAccount}" inside table "---applicationReview:-:FDM_FA_TableID---"
    Then I softly see value "Automation Permanent External Funding Account" for title "Funding Account Title" against the value "{SavedValue:fundingAccount2}" inside table "---applicationReview:-:FDM_FA_TableID---"

    Examples:
      | Announcement Name                                               | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Review} | {SavedValue:Automation Runtime Announcement Application Review} |

  @493351 @Sprint-02 @US-490856 @M04 @M04Planning @skipOnJenkins
  Scenario Outline: Verify that the Internal user can see 'Funding Account Title' column is added after 'Funding Account' column ( Award layout->Budget tab-> Funding Account Information Section )- Direct Grant
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I see only the following headers in table with id "---subAwardStandAlone:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Available Balance | Encumbrance |

    Examples:
      | UserType |
      | PM       |
#      | EXE      |
#      | PO       |

  @493351 @Sprint-02 @US-490856 @M04 @M04Planning @skipOnJenkins
  Scenario Outline: Verify that the Internal user can see 'Funding Account Title' column is added after 'Funding Account' column ( Award layout->Budget tab-> Funding Account Information Section )- Award from FDM
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "SECOND_FUNDING_ACCOUNT-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "RelatedAwards1" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount2}" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on "Edit" icon for "{SavedValue:fundingAccount}" inside flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" without waiting for record
    Then I softly see field "FundingAccount__r.Title__c" not in edit mode
    And I click on "Undo" icon for "{SavedValue:fundingAccount}" inside flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" without waiting for record
    And I click on "Edit" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" without waiting for record
    Then I softly see field "FundingAccount__r.Title__c" is not editable
    And I click on "Undo" icon for "{SavedValue:fundingAccount2}" inside flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" without waiting for record
    Then I softly see value "Automation Permanent Funding Account" for title "Funding Account Title" against the value "{SavedValue:fundingAccount}" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I softly see value "Automation Permanent External Funding Account" for title "Funding Account Title" against the value "{SavedValue:fundingAccount2}" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |

  @493352 @Sprint-02 @US-490856 @bugID-503241 @M04 @M04Planning @skipOnJenkins
  Scenario Outline: Verify that the Internal user can see 'Funding Account Title' column is added after 'Funding Account' column ( Award layout->Actuals tab-> Funding Account Information Section )- Award from FDM
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "SECOND_FUNDING_ACCOUNT-<User>"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "RelatedAwards1" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Actuals" sub tab
    Then I see only the following headers in table with id "AwardFundingAccountsActuals" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Encumbrance | Spent | Encumbrance Balance |
    Then I softly see value "Automation Permanent Funding Account" for title "Funding Account Title" against the value "{SavedValue:fundingAccount}" inside table "AwardFundingAccountsActuals"
    Then I softly see value "Automation Permanent External Funding Account" for title "Funding Account Title" against the value "{SavedValue:fundingAccount2}" inside table "AwardFundingAccountsActuals"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |

  @493352 @Sprint-02 @US-490856 @M04 @M04Planning @skipOnJenkins
  Scenario Outline: Verify that the Internal user can see 'Funding Account Title' column is added after 'Funding Account' column ( Award layout->Actuals tab-> Funding Account Information Section )- Direct Grant
    Given I activated standalone subaward "AwardEGMSID" with properties "SECOND_FUNDING_ACCOUNT" of type "Competitive"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I see that "Subaward" is in "Activated" status
    When I navigate to "Actuals" sub tab
    Then I see only the following headers in table with id "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---" :
      | Actions | Funding Account | Fund Code | Funding Account Title | Encumbrance | Spent | Encumbrance Balance |
    Then I softly see value "Automation Permanent Funding Account" for title "Funding Account Title" against the value "{SavedValue:fundingAccount}" inside table "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---"
    Then I softly see value "Automation Permanent External Funding Account" for title "Funding Account Title" against the value "{SavedValue:fundingAccount2}" inside table "---subAwardStandAlone:-:awardActualsTabFundingAccountTableId---"

    Examples:
      | UserType |
      | FD       |
#      | ADMIN    |

  @496922 @Sprint-03 @US-493318 @M04 @M04Planning
  Scenario Outline: Verify that fund code field is not editable at Funding Account and funding source for other internal user except Admin and FD - Internal Funding Source
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "State Funding Sources - All"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    Then I softly cannot see top right button "Edit" in page detail
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable

    Examples:
      | UserType |
      | FO       |
#      | PO       |
#      | EXE      |

  @496438 @496453 @496454 @496457 @496458 @Sprint-03 @US-487308 @M04 @M04Planning
  Scenario Outline: Verify that snapshot history is available when the funding account is activated. - Internal funding source
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    Then I softly see fields "Fund_Code__c" is in edit mode
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "History" sub tab
    Then I softly see "Total Records: 1" inside flex table with id "---fundingsource:-:grantorSnapshotTableId---"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #@496453 #496453
    When I navigate to "History" sub tab
    Then I softly see "Total Records: 1" inside flex table with id "---fundingsource:-:grantorSnapshotTableId---"
    #@496457
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I navigate to "History" sub tab
    Then I softly see "Total Records: 1" inside flex table with id "---fundingsource:-:grantorSnapshotTableId---"
    #496458
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "History" sub tab
    And I wait for "60" seconds
    And I refresh the page
    And I wait for "6" seconds
    Then I softly see "Total Records: 2" inside flex table with id "---fundingsource:-:grantorSnapshotTableId---"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "History" sub tab
    And I wait for "2" seconds
    Then I softly see "Total Records: 2" inside flex table with id "---fundingsource:-:grantorSnapshotTableId---"

    Examples:
      | UserType |
      | FD       |

  @496461 @Sprint-03 @US-487308 @M04 @M04Planning @Bug_Id_525978
  Scenario Outline: Verify that all information is available in the downloaded pdf file from snapshot history at funding source and funding account - Internal funding source
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I wait for "2" seconds
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    When I navigate to "History" sub tab
    And I click on "Download" icon for "<LinkUser>" inside flex table with id "---program:-:grantorSnapshothistoryTable---" without waiting for record
    When I download the file
    And I wait for "3" seconds
    Then I softly see "{SavedValue:FUNDINGSOURCE}" on page "1" of "govgrants" pdf file
    Then I softly see "Active" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I navigate to "History" sub tab
    And I click on "Download" icon for "<LinkUser>" inside flex table with id "---program:-:grantorSnapshothistoryTable---" without waiting for record
    When I download the file
    And I wait for "5" seconds
    Then I softly see "EGMS ID" on page "1" of "govgrants" pdf file
    Then I softly see "Active" on page "1" of "govgrants" pdf file
    Then I softly see "Fund Code" on page "1" of "govgrants" pdf file
    Then I softly see "{SavedValue:FUNDINGSOURCE}" on page "1" of "govgrants" pdf file
    Then I softly see "1990" on page "1" of "govgrants" pdf file

    Examples:
      | UserType | LinkUser      |
      | FD       | Automation FD |

  @496463 @496464 @496465 @496466 @496467 @Sprint-03 @US-487308 @M04 @M04Planning
  Scenario Outline:Verify that snapshot history is available when the funding account is activated. - External funding source
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I navigate to "History" sub tab
    #496463
    Then I softly see "Total Records: 1" inside flex table with id "---fundingsource:-:grantorSnapshotTableId---"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "History" sub tab
    #496464 #496465
    Then I softly see "Total Records: 1" inside flex table with id "---fundingsource:-:grantorSnapshotTableId---"
    #496466
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I navigate to "History" sub tab
    Then I softly see "Total Records: 1" inside flex table with id "---fundingsource:-:grantorSnapshotTableId---"
    #496467
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "History" sub tab
    And I wait for "60" seconds
    And I refresh the page
    And I wait for "6" seconds
    Then I softly see "Total Records: 2" inside flex table with id "---fundingsource:-:grantorSnapshotTableId---"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "History" sub tab
    And I wait for "2" seconds
    Then I softly see "Total Records: 2" inside flex table with id "---fundingsource:-:grantorSnapshotTableId---"

    Examples:
      | UserType |
      | FD       |

  @496468 @Sprint-03 @US-487308 @M04 @M04Planning @Bug_Id_525978
  Scenario Outline:Verify that snapshot history is available when the funding account is activated. - External funding source
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    When I navigate to "History" sub tab
    And I click on "Download" icon for "<LinkUser>" inside flex table with id "---program:-:grantorSnapshothistoryTable---" without waiting for record
    When I download the file
    And I wait for "3" seconds
    Then I softly see "{SavedValue:FUNDINGSOURCE}" on page "1" of "govgrants" pdf file
    Then I softly see "Active" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I navigate to "History" sub tab
    And I click on "Download" icon for "<LinkUser>" inside flex table with id "---program:-:grantorSnapshothistoryTable---" without waiting for record
    When I download the file
    And I wait for "3" seconds
    Then I softly see "{SavedValue:FUNDINGSOURCE}" on page "1" of "govgrants" pdf file
    Then I softly see "Active" on page "1" of "govgrants" pdf file
    Then I softly see "Fund Code" on page "1" of "govgrants" pdf file
    Then I softly see "1990" on page "1" of "govgrants" pdf file

    Examples:
      | UserType | LinkUser      |
      | FD       | Automation FD |

  @498555 @498561 @498619 @Sprint-04 @US-494958 @M04 @M04Planning @sanitysuite
  Scenario Outline: Verify that 'Able to Pay?' flag is added on funding account header row and is a checkbox field - Internal Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    #498619
    Then I softly cannot see top right button "Stop Payments" in page detail
    Then I softly see field "Able to Pay?" as "No"
    Then I softly see field "Able to Pay?" is not editable
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see field "Able to Pay?" inside page block
    #@498561
    When I hovering mouse on help text icon inside page block detail "Able to Pay?"
    Then I softly see "If 'No', payments can not be made from funding account. Click 'Release Payments' to set as 'Yes'. Click 'Stop Payments' to set as 'No'." shown as help text
    #498619
    When I click on "Release Payments" in the page details
    Then I softly see field "Able to Pay?" as "Yes"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    Then I softly cannot see top right button "Stop Payments" in page detail
    Then I softly see field "Able to Pay?" as "Yes"

    Examples:
      | UserType |
      | FD       |

  @498562 @498605 @Sprint-04 @US-494958 @M04 @M04Planning @sanitysuite
  Scenario Outline: Verify that a 'Stop Payments' button is visible on page layout when funding account is in 'Active' state, 'Able to Pay?' checkbox is checked and when clicked on 'Stop Payments', 'Able to Pay?' checkbox is marked as un-checked  - Internal Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "20" into field "NYSED_CstCntr__c"
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see field "Able to Pay?" inside page block
    #498605
    Then I softly see field "Able to Pay?" as "No"
    Then I softly can see top right button "Release Payments" in page detail
    When I click on "Release Payments" in the page details
    Then I softly see field "Able to Pay?" as "Yes"
    #498562
    Then I softly can see top right button "Stop Payments" in page detail
    When I click on "Stop Payments" in the page details
    Then I softly see field "Able to Pay?" as "No"

    Examples:
      | UserType |
      | FD       |

  @498621 @Sprint-04 @US-494958 @M04 @M04Planning @passed
  Scenario Outline: Verify that a 'Release Payments' button is not visible on page layout when funding account is in 'Created' and 'Closed' state - Internal Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    #498621
    Then I softly cannot see top right button "Release Payments" in page detail
    Then I softly see field "Able to Pay?" as "No"
    Then I softly see field "Able to Pay?" is not editable
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    Then I softly cannot see top right button "Release Payments" in page detail
    Then I softly see field "Able to Pay?" as "No"

    Examples:
      | UserType |
      | FD       |

  @498726 @498728 @498734 @Sprint-04 @US-494958 @M04 @M04Planning
  Scenario Outline:Verify that 'Able to Pay?' flag is added on funding account header row and is a checkbox field - External Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "1000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    #498734
    Then I softly see field "Status" as "Created"
    Then I softly cannot see top right button "Stop Payments" in page detail
    Then I softly see field "Able to Pay?" as "No"
    Then I softly see field "Able to Pay?" is not editable
    When I click on "Activate" in the page details
    #498726
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see field "Able to Pay?" inside page block
    Then I softly see field "Able to Pay?" as "No"
    #498728
    When I hovering mouse on help text icon inside page block detail "Able to Pay?"
    Then I softly see "If 'No', payments can not be made from funding account. Click 'Release Payments' to set as 'Yes'. Click 'Stop Payments' to set as 'No'." shown as help text
    #498734
    When I click on "Release Payments" in the page details
    Then I softly see field "Able to Pay?" as "Yes"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    Then I softly cannot see top right button "Stop Payments" in page detail
    Then I softly see field "Able to Pay?" as "Yes"

    Examples:
      | UserType |
      | FD       |

  @498730 @498731 @Sprint-04 @US- @M04 @M04Planning
  Scenario Outline: Verify that a 'Stop Payments' button is visible on page layout when funding account is in 'Active' state, 'Able to Pay?' checkbox is checked and when clicked on 'Stop Payments', 'Able to Pay?' checkbox is marked as un-checked - External Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see field "Able to Pay?" inside page block
    Then I softly see field "Able to Pay?" as "No"
    #498731
    Then I softly see field "Able to Pay?" as "No"
    Then I softly can see top right button "Release Payments" in page detail
    When I click on "Release Payments" in the page details
    Then I softly see field "Able to Pay?" as "Yes"
    #498730
    Then I softly can see top right button "Stop Payments" in page detail
    When I click on "Stop Payments" in the page details
    Then I softly see field "Able to Pay?" as "No"

    Examples:
      | UserType |
      | FD       |

  @498736 @Sprint-04 @US-494958 @M04 @M04Planning
  Scenario Outline: Verify that a 'Release Payments' button is not visible on page layout when funding account is in 'Created' and 'Closed' state - External Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly cannot see top right button "Release Payments" in page detail
    Then I softly see field "Able to Pay?" as "No"
    Then I softly see field "Able to Pay?" is not editable
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    Then I softly cannot see top right button "Release Payments" in page detail
    Then I softly see field "Able to Pay?" as "No"

    Examples:
      | UserType |
      | FD       |

  @498877 @Sprint-04 @US-494958 @M04 @M04Planning
  Scenario Outline: Verify that a 'Stop Payments' button is not visible to other internal users except FD and Admin users on page layout when funding account is in 'Active' state and 'Able to Pay?' checkbox is checked - Internal Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Release Payments" in the page details
    Then I softly see field "Able to Pay?" as "Yes"
    Then I softly can see top right button "Stop Payments" in page detail
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "State Funding Sources - All"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    Then I softly cannot see top right button "Stop Payments" in page detail
    Then I softly see field "Able to Pay?" as "Yes"

    Examples:
      | UserType | NonOwner |
      | FD       | PM       |

  @504933 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at Internal Funding Account 'Stop Payments' and 'Release Payments' buttons are available to all FD profile users, when record is in 'Active' state. and see the Confirmation Message when FD users clicks on the buttons.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    Then I see field "Able to Pay?" is not editable
    Then I softly see field "Able to Pay?" as "No"
    Then I see the header is "Funding Account" in the page details
    Then I softly can see top right button "Release Payments" in page detail
    And I click on "Release Payments" in the page details
    Then I softly can see top right button "Stop Payments" in page detail
    And I click on "Stop Payments" in the page details
    And I wait for "2" seconds
    Then I softly can see top right button "Release Payments" in page detail
    When I re-login to "As a Grantor" app as "<UserType1>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly can see top right button "Release Payments" in page detail
    And I click on "Release Payments" in the page details
    Then I softly can see top right button "Stop Payments" in page detail
    And I click on "Stop Payments" in the page details

    Examples:
      | UserType | UserType1 |
      | FD       | FD1       |

  @502799 @502788 @499058 @Sprint-05 @US-501892 @M04 @M04Planning @sanitysuite
  Scenario Outline: Verify that at Internal Funding Account Deactivate button is available to all FD profile users, when record is in 'Active' state.
  |Verify that at Internal Funding Account Activate button is available to all FD profile users, when record is in 'Created' or 'Closed' state.|
  |Verify that the FD users cannot sees the 'Edit' button is available on Active Funding account and cannot edit the 'Appropriation Amount' field.- Internal Funding Soucre |
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly can see top right button "Activate" in page detail
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    When I re-login to "As a Grantor" app as "<UserType1>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    #502788
    Then I softly can see top right button "Activate" in page detail
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    #499058
    Then I softly cannot see top right button "Edit" in page detail
    #502799
    Then I softly can see top right button "Deactivate" in page detail
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    #502788
    Then I softly can see top right button "Activate" in page detail
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"

    Examples:
      | UserType | UserType1 |
      | FD       | FD1       |

  @502803_FD @493600_FD @502684_FD @493597_FD @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at Internal Funding Account Deactivate, 'Stop Payments' OR 'Release Payments' buttons are not available to other users than the FD profile users, when record is in 'Active' state.
  |Verify that the only FD users see the 'New' button on the Planning phase->Internal Funding Source and only FD user able to create the Internal Funding Source.|
  |Verify that the other than the FD users cannot sees the 'Edit' button is available on Close Funding account and cannot edit the 'Appropriation Amount' field.|
  |Verify that the FD user sees the 'Edit' button is available on Close Funding account and Admin can edit only 'Appropriation Amount' field.: Internal Funding Account|
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    #502684
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    Then I softly can see top right button "Activate" in page detail
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    #502803
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly cannot see top right button "Stop Payments" in page detail
    Then I softly cannot see top right button "Release Payments" in page detail
    Then I softly cannot see top right button "Deactivate" in page detail
    #493600
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    When I click on "Deactivate" in the page details
    #493597
    Then I softly can see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | OtherUsers |
      | PM         |
#      | PO         |
#      | EXE        |
#      | FO         |

  @502689 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that the other than the FD users cannot see the 'New' button on the Planning phase->Internal Funding Source and External Funding Source
    When I login to "As a Grantor" app as "<OtherUsers>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---fundingSource:-:fundingSourceTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---fundingSource:-:externalFundingTableId---"

    Examples:
      | OtherUsers |
      | PM         |
#      | PO         |
#      | EXE        |
#      | FO         |

  @493620 @493619 @493599 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user sees the validation on 'Save' if the 'Available Balance' is less than zero. - Internal Funding Account
  |Verify that the Internal user sees the validation on 'Save' if appropriation amount is less than spent. - Internal Funding account|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "Cert Level" as "CertLevel"
    And I click on "Edit" in the page details
    #493599
    Then I softly see fields "AppropriationBalance__c" is in edit mode
    And I clear the value from field "AppropriationBalance__c"
    And I click on "Save" in the page details
    Then I see the following messages in the page details contains:
      | To Save, Cert Level is required in the Overview tab under the Financials section. |
    When I enter value "-99" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    Then I see the following messages in the page details contains:
      | Cert Level must be a positive value. |
    #493619
    When I enter value "-10" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    Then I see the following messages in the page details contains:
      | Cert Level cannot be less than Expenditure Paid to Date. |

    Examples:
      | UserType |
      | FD       |

  @NYSED-4785 @502878_FD @Sprint-05 @US-501892 @M04 @M04Planning @bugID-512320
  Scenario Outline: Verify that the edit action is not available to other users than the FD users, when the other profile users search funding account EGMS ID using global search: Internal Funding Account
  |Verify that the edit action is available to FD profile users only, when the FD profile users search funding account EGMS ID using global search: Internal Funding Account|
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    And I save the field labeled "EGMS ID" as "FA_EGMSID"
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I select "Funding Accounts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FA_EGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:FA_EGMSID}" in global search with id "Funding Accounts||List View"
    #502883
    Then I softly see the following messages in the page details contains:
      | You don`t have sufficient access to edit this record |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I select "Funding Accounts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FA_EGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:FA_EGMSID}" in global search with id "Funding Accounts||List View"
    Then I softly can see row level action button "Delete" against "{SavedValue:FA_EGMSID}" in global search with id "Funding Accounts||List View"
    And I click on row level action button "Edit" against "{SavedValue:FA_EGMSID}" in global search with id "Funding Accounts||List View"
    Then I see the header is "Funding Account" in the page details
    And I clear the value from field "Description__c"
    When I enter value "Automation Testing" into field "Description__c"
    And I click on "Save" in the page details
    Then I softly can see top right button "Activate" in page detail
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I select "Funding Accounts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FA_EGMSID}"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:FA_EGMSID}" in global search with id "Funding Accounts||List View"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:FA_EGMSID}" in global search with id "Funding Accounts||List View"
   #502878
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I wait for "3" seconds
    And I select "Funding Accounts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FA_EGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:FA_EGMSID}" in global search with id "Funding Accounts||List View"

    Examples:
      | OtherUsers |
      | PM         |
#      | PO         |
#      | EXE        |
#      | FO         |

  @502703 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at Internal Funding source list view, row level Edit action is available to FD profile users only.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Funding Source" as "FundingSourceID"
    When I re-login to "As a Grantor" app as "<UserType1>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingSourceID}" in "---fundingsource:-:fundingSourceTableId---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:FundingSourceID}" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I click on "Edit" icon for "{SavedValue:FundingSourceID}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

    Examples:
      | UserType | UserType1 |
      | FD       | FD1       |

  @502715 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at Internal Funding source Edit button is not available to other users than the Admin and FD users when record is in 'Created' state and New button is not available in the Funding Account section of the Funding source.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FundingSourceID"
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingSourceID}" in "---fundingsource:-:fundingSourceTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:FundingSourceID}" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I click on "View" icon for "{SavedValue:FundingSourceID}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    Then I see the header is "State Funding Source" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "New" in flex table with id "---fundingSource:-:fundingAccountTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingSourceID}" in "---fundingsource:-:fundingSourceTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:FundingSourceID}" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I click on "View" icon for "{SavedValue:FundingSourceID}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    Then I see the header is "State Funding Source" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "New" in flex table with id "---fundingSource:-:fundingAccountTableId---"

    Examples:
      | OtherUsers |
      | PM         |
#      | PO         |
#      | EXE        |
#      | FO         |

  @502789 @502800 @502785 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at External Funding Account Activate button is available to all Admin and FD profile users, when record is in 'Created' or 'Closed' state.
  |Verify that at External Funding Account Deactivate button is available to all Admin and FD profile users, when record is in 'Active' state.|
  |Verify that at External Funding Account Edit button is available to all Admin and FD profile users, when record is in 'Created' or 'Closed' state.|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly can see top right button "Activate" in page detail
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    Then I softly can see top right button "Edit" in page detail
    When I click on "Activate" in the page details
    Then I softly can see top right button "Deactivate" in page detail
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I re-login to "As a Grantor" app as "<UserType1>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly can see top right button "Activate" in page detail
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    And I refresh the page
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly can see top right button "Deactivate" in page detail
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Activate" in page detail

    Examples:
      | UserType | UserType1 |
      | FD       | FD1       |

  @502804_FD @502792_FD @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at External Funding Account Deactivate, 'Stop Payments' OR 'Release Payments' buttons are not available to other users than the FD profile users, when record is in 'Active' state.
  |Verify that at External Funding Account Edit and Activate button is not available to other users than the FD users when record is in 'Created' or 'Closed' state.|
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly cannot see top right button "Activate" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly can see top right button "Activate" in page detail
    When I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly cannot see top right button "Stop Payments" in page detail
    Then I softly cannot see top right button "Release Payments" in page detail
    Then I softly cannot see top right button "Deactivate" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    When I click on "Deactivate" in the page details
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Activate" in page detail

    Examples:
      | OtherUsers |
      | PM         |
#      | PO         |
#      | EXE        |
#      | FO         |

  @502774 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: VVerify that at External Funding source ->Overview tab->Funding Accounts section, 'New' button is available to all FD profile users, when record is in 'Created' or 'Active' state.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    Then I softly can see top right button "New" in flex table with id "---fundingSource:-:fundingAccountTableId---"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly can see top right button "Activate" in page detail
    And I save the field labeled "Funding Source" as "FundingSourceID"
    When I click on "Activate" in the page details
    And I click "{SavedValue:FundingSourceID}" lookup link
    And I wait for "4" seconds
    Then I see the header is "Federal Funding Source" in the page details
    Then I softly can see top right button "New" in flex table with id "---fundingSource:-:fundingAccountTableId---"

    Examples:
      | UserType |
      | FD       |

  @502769 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at External Funding source Edit button is available to all FD profile users, when record is in 'Created' state.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    Then I softly can see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "<UserType1>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly can see top right button "Edit" in page detail

    Examples:
      | UserType | UserType1 |
      | FD       | FD1       |

  @502781_FD @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at External Funding source Edit button is not available to other users than the FD users when record is in 'Created' state and New button is not available in the Funding Account section of the Funding source.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FundingSourceID"
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Federal Funding Sources - All"
    When I perform quick search for "{SavedValue:FundingSourceID}" in "---fundingsource:-:externalFundingTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:FundingSourceID}" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I click on "View" icon for "{SavedValue:FundingSourceID}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "New" in flex table with id "---fundingSource:-:fundingAccountTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    When I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Federal Funding Sources - All"
    When I perform quick search for "{SavedValue:FundingSourceID}" in "---fundingsource:-:externalFundingTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:FundingSourceID}" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I click on "View" icon for "{SavedValue:FundingSourceID}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "New" in flex table with id "---fundingSource:-:fundingAccountTableId---"

    Examples:
      | OtherUsers |
      | PM         |
#      | PO         |
#      | EXE        |
#      | FO         |

  @502771 @502685 @Sprint-05 @US-501892 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at External Funding source list view, row level Edit action is available to FD profile users only.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    #502685
    Then I see the header is "Federal Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Funding Source" as "FundingSourceID"
    Then I softly can see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "<UserType1>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Federal Funding Sources - All"
    When I perform quick search for "{SavedValue:FundingSourceID}" in "---fundingsource:-:externalFundingTableId---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:FundingSourceID}" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I click on "Edit" icon for "{SavedValue:FundingSourceID}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

    Examples:
      | UserType | UserType1 |
      | FD       | FD1       |

  @499016 @Sprint-05 @US-501892 @M04 @M04Planning @sanitysuite
  Scenario: Verify that the FD user sees the 'Edit' button is available on Close Funding account and FD can edit only 'Appropriation Amount' field.: External Funding Account
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FundingSourceID"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    And I wait for "4" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    Then I softly see fields "AppropriationBalance__c" is in edit mode

  @NYSED-4784 @502883 @Sprint-05 @US-501892 @M04 @M04Planning @bugID-512320 @bugID_538745 @Bug-Ticket-NYSED-2893
  Scenario Outline: Verify that the edit action is not available to other users than the FD users, when the other profile users search funding account EGMS ID using global search: External Funding Account
  |Verify that the edit action is available to Admin and FD profile users only, when the FD profile users search funding account EGMS ID using global search: External Funding Account|
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FundingSourceID"
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:FundingAccountID}"
    And I click on row level action button "Edit" against "{SavedValue:FundingAccountID}" in global search with id "Funding Accounts||List View"
    #NYSED-4784
    Then I softly see the following messages in the page details contains:
      | You don`t have sufficient access to edit this record |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:FundingAccountID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:FundingAccountID}" in global search with id "Funding Accounts||List View"
    Then I softly can see row level action button "Delete" against "{SavedValue:FundingAccountID}" in global search with id "Funding Accounts||List View"
    And I click on row level action button "Edit" against "{SavedValue:FundingAccountID}" in global search with id "Funding Accounts||List View"
    Then I see the header is "Funding Account" in the page details
    And I clear the value from field "NYSED_PayeeRef__c"
    When I enter value "Automation Testing" into field "NYSED_PayeeRef__c"
    And I click on "Save" button
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:FundingAccountID}"
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:FundingAccountID}" in global search with id "Funding Accounts||List View"

    Examples:
      | OtherUsers |
      | PM         |
#      | PO         |
#      | EXE        |
#      | FO         |

  @502700 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at Internal Funding source Edit button is available to all Admin and FD profile users, when record is in 'Created' state.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    When I re-login to "As a Grantor" app as "<UserType1>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "Edit" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I clear the value from field "StartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "StartDate__c"
    And I click on "Save" in the page details

    Examples:
      | UserType | UserType1 |
      | FD       | FD1       |

  @502712 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at Internal Funding source ->Overview tab->Funding Accounts section, 'New' button is available to all FD profile users, when record is in 'Created' or 'Active' state.
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FundingSourceID"
    When I re-login to "As a Grantor" app as "<OtherType1>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingSourceID}" in "---fundingsource:-:fundingSourceTableId---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:FundingSourceID}" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I click on "View" icon for "{SavedValue:FundingSourceID}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    Then I see the header is "State Funding Source" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "New" in flex table with id "---fundingSource:-:fundingAccountTableId---"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    When I re-login to "As a Grantor" app as "<OtherType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    When I re-login to "As a Grantor" app as "<OtherType1>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingSourceID}" in "---fundingsource:-:fundingSourceTableId---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:FundingSourceID}" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I click on "View" icon for "{SavedValue:FundingSourceID}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    Then I see the header is "State Funding Source" in the page details
    Then I softly can see top right button "New" in flex table with id "---fundingSource:-:fundingAccountTableId---"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details

    Examples:
      | OtherType | OtherType1 |
      | FD        | FD1        |

  @502848 @Sprint-05 @US-501892 @M04 @M04Planning @bugID-512320 @bug_id_538085
  Scenario Outline: Verify that at Internal Funding Account list view, row level Edit action is available to Admin and FD profile users only.
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    And I save the field labeled "EGMS ID" as "FA_EGMSID"
    When I re-login to "As a Grantor" app as "<OtherType1>" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:FA_EGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:FA_EGMSID}" in global search with id "Funding Accounts||List View"
    Then I softly can see row level action button "Delete" against "{SavedValue:FA_EGMSID}" in global search with id "Funding Accounts||List View"
    And I click on row level action button "Edit" against "{SavedValue:FA_EGMSID}" in global search with id "Funding Accounts||List View"
    Then I see the header is "Funding Account" in the page details
    And I clear the value from field "Description__c"
    When I enter value "Automation Testing" into field "Description__c"
    And I click on "Save" in the page details
    Then I softly can see top right button "Activate" in page detail
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    When I re-login to "As a Grantor" app as "<OtherType>" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:FA_EGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:FA_EGMSID}" in global search with id "Funding Accounts||List View"
    Then I softly can see row level action button "Delete" against "{SavedValue:FA_EGMSID}" in global search with id "Funding Accounts||List View"
    And I click on row level action button "Edit" against "{SavedValue:FA_EGMSID}" in global search with id "Funding Accounts||List View"
    Then I see the header is "Funding Account" in the page details
    And I clear the value from field "Description__c"
    When I enter value "Yes" into field "NYSED_GAPE__c"
    And I click on "Save" in the page details
    Then I softly can see top right button "Activate" in page detail

    Examples:
      | OtherType | OtherType1 |
      | FD        | FD1        |

  @502732 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at Internal Funding Account Edit button is available to all FD profile users, when record is in 'Created' or 'Closed' state.
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    When I re-login to "As a Grantor" app as "<OtherType1>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Activate" in page detail
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    And I wait for "2" seconds
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly can see top right button "Edit" in page detail

    Examples:
      | OtherType | OtherType1 |
      | FD        | FD1        |

  @502793_FD @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at Internal Funding Account Edit and Activate button is not available to other users than the  FD users when record is in 'Created' or 'Closed' state.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FundingSourceID"
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Activate" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Activate" in page detail

    Examples:
      | OtherUsers |
      | PM         |
#      | PO         |
#      | EXE        |
#      | FO         |

  @502849 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at External Funding Account list view, row level Edit action is available to FD profile users only.
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    When I re-login to "As a Grantor" app as "<OtherType1>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:FundingAccountID}" in flex table with id "---fundingsource:-:fundingTableId---"
    When I click on "Edit" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

    Examples:
      | OtherType | OtherType1 |
      | FD        | FD1        |

  @502822 @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that at External Funding Account 'Stop Payments' and 'Release Payments' buttons are available to all FD profile users, when record is in 'Active' state. and see the Confirmation Message when FD users clicks on the buttons.
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I re-login to "As a Grantor" app as "<OtherType1>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I see the header is "Funding Account" in the page details
    Then I softly can see top right button "Release Payments" in page detail
    And I click on "Release Payments" in the page details
    Then I softly can see top right button "Stop Payments" in page detail
    And I click on "Stop Payments" in the page details
    Then I softly can see top right button "Release Payments" in page detail

    Examples:
      | OtherType | OtherType1 |
      | FD        | FD1        |

  @493602_InternalFA @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that the FD users sees the Field history is captured for field appropriation amount when value is updated on close Funding account. - Internal FA
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see field "Fund Year" as "1990-25"
    And I save the field labeled "Cert Level" as "AppropriationAmount"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I clear the value from field "AppropriationBalance__c"
    When I enter value "10000" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "$10,000" for title "New Value" inside field history table
    Then I softly see value "$10,000,000" for title "Original Value" inside field history table

    Examples:
      | OtherType |
      | FD        |

  @493602_ExternalFA @Sprint-05 @US-501892 @M04 @M04Planning
  Scenario Outline: Verify that the FD users sees the Field history is captured for field appropriation amount when value is updated on close Funding account. - External FA
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Cert Level" as "AppropriationAmount"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I click on "Edit" in the page details
    And I clear the value from field "AppropriationBalance__c"
    When I enter value "10000" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "$10,000" for title "New Value" inside field history table
    Then I softly see value "$10,000,000" for title "Original Value" inside field history table

    Examples:
      | OtherType |
      | FD        |

  @501894 @501921 @Sprint-05 @US-499299 @M04 @M04Planning @bugID-516299
  Scenario Outline: Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: h. Fund Year.: External|
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: n. NYC PGM ID.: External|
  |Verify that the Internal user see the new SFS Information section is added after Basic Information Section in the Funding account->Overview tab->SFS Information.: External|
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
      #501894-created state
    And I click on "Edit" in the page details
    Then I softly see field "NYC PGM ID" inside page block
    When I hovering mouse on help text icon inside page block detail "NYC PGM ID"
    Then I softly see "ID for New York City projects" shown as help text
    When I enter value "#%^" into field "NYC_PGM_ID__c"
    And I click on "Save" in the page details
    Then I softly see field "NYC PGM ID" as ""
    And I click on "Edit" in the page details
    When I enter value "12.88" into field "NYC_PGM_ID__c"
    And I click on "Save" in the page details
    Then I softly see field "NYC PGM ID" as "12"
    And I click on "Edit" in the page details
    When I enter value "19" into field "NYC_PGM_ID__c"
    And I click on "Save" in the page details
    Then I softly see field "NYC PGM ID" as "19"
    And I click on "Edit" in the page details
    And I clear the value from field "NYC_PGM_ID__c"
    And I click on "Save" in the page details
    Then I softly can see top right button "Activate" in page detail
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #close state
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"

    Examples:
      | OtherType |
      | FD        |

  @501925 @501885 @501887 @501918 @501912 @Sprint-05 @US-499299 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user see the new SFS Information section have below fields, all are not editable..: External
  |Verify that the Internal user see the Information Section is renamed as Basic Information in the Overview tab of the Funding account page layout. : External|
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following fields.: External|
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: y. EDGAPS Date.: External|
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: x. Exp Date.: External|
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: w. Liq Date.: External|
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    #501885
    And I navigate to "Overview" sub tab
    Then I softly see "Basic Information" page block displayed
    Then I softly do not see "Information" page block displayed
    #501887
    Then I softly see field "Title" inside page block
    Then I softly see field "Short Description" inside page block
    Then I softly see field "Start Date" inside page block
    Then I softly see field "End Date" inside page block
    Then I softly see field "Fund Code" inside page block
    Then I softly see field "Fund" inside page block
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    #501918
    When I hovering mouse on help text icon inside page block detail "EDGAPS Date"
    Then I softly see "Last date to draw funds - now called G5. Applicable only federal funds." shown as help text
    Then I softly see field "EDGAPS Date" inside page block
    #NeedToCreateNewStep-To DO Santosh
#    When I see the Exp Date field is date Field.
    #501912
    When I hovering mouse on help text icon inside page block detail "Liq Date"
    Then I softly see "Date the obligations will be liquidated." shown as help text
    Then I softly see field "Liq Date" inside page block
    #NeedToCreateNewStep-To DO Santosh
#    When I see the Liq Date field is date Field.
    #501925
    Then I softly see "Chart of Accounts" page block displayed
    When I hovering mouse on help text icon inside page block detail "Cst Cntr"
    Then I softly see "OSC identifier which designates which appropriation this fund is paid out of." shown as help text
    Then I softly see field "Cst Cntr" is not editable
    When I hovering mouse on help text icon inside page block detail "Variable"
    Then I softly see "OSC identifier which designates which appropriation this fund is paid out of." shown as help text
    Then I softly see field "Variable" is not editable
    When I hovering mouse on help text icon inside page block detail "Year"
    Then I softly see "School year/OSC identifier which designates which appropriation this fund is paid out of." shown as help text
    Then I softly see field "Year" is not editable
    When I hovering mouse on help text icon inside page block detail "Fund"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Fund" is not editable
    When I hovering mouse on help text icon inside page block detail "Prog"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Prog" is not editable
    When I hovering mouse on help text icon inside page block detail "Bud Ref"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Bud Ref" is not editable
    When I hovering mouse on help text icon inside page block detail "Acct"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Acct" is not editable
    When I hovering mouse on help text icon inside page block detail "Act"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Act" is not editable
    When I hovering mouse on help text icon inside page block detail "Proj"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Proj" is not editable
    When I hovering mouse on help text icon inside page block detail "CF-1"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "CF-1" is not editable
    When I hovering mouse on help text icon inside page block detail "CF-2"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "CF-2" is not editable
    When I hovering mouse on help text icon inside page block detail "CF-3"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "CF-3" is not editable
    When I hovering mouse on help text icon inside page block detail "Status"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Status" is not editable
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    Then I softly see field "Cst Cntr" is not editable
    Then I softly see field "Variable" is not editable
    Then I softly see field "Year" is not editable
    Then I softly see field "Year" is not editable
    Then I softly see field "Fund" is not editable
    Then I softly see field "Prog" is not editable
    Then I softly see field "Bud Ref" is not editable
    Then I softly see field "Acct" is not editable
    Then I softly see field "Act" is not editable
    Then I softly see field "Proj" is not editable
    Then I softly see field "CF-1" is not editable
    Then I softly see field "CF-2" is not editable
    Then I softly see field "CF-3" is not editable
    Then I softly see field "Status" is not editable

    Examples:
      | OtherType |
      | FD        |

  @501907 @501904 @Sprint-05 @US-499299 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: w. Liq Date.: External
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: v. Chg Date?.: External|
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    #501907
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter value "No" into field "NYSED_ChgDate__c"
    When I enter value "20" into field "NYSED_LiqDate__c"
    When I enter value "21" into field "NYSED_LiquidateInDays__c"
    And I click on "Save" in the page details
    And I save the field labeled "Liq Date" as "LiqDate"
    Then I softly see field "Liq Date" as "{SavedValue:LiqDate}"
    #501904
    Then I softly see field "Chg Date?" inside page block
    When I hovering mouse on help text icon inside page block detail "Chg Date?"
    Then I softly see "Indicator if extension was granted for Liquidation" shown as help text
    And I click on "Edit" in the page details
    When I enter value "Yes" into field "NYSED_ChgDate__c"
    When I enter value "361" into field "NYSED_LiquidateInDays__c"
    And I click on "Save" in the page details
    Then I softly see field "Chg Date?" as "Yes"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    And I click on "Edit" in the page details
    When I enter value "No" into field "NYSED_ChgDate__c"
    When I enter value "30" into field "NYSED_LiqDate__c"
    When I enter value "30" into field "NYSED_LiquidateInDays__c"
    And I click on "Save" in the page details
    And I save the field labeled "Liq Date" as "LiqDate1"
    Then I softly see field "Liq Date" as "{SavedValue:LiqDate1}"
    #501904
    Then I softly see field "Chg Date?" inside page block
    When I hovering mouse on help text icon inside page block detail "Chg Date?"
    Then I softly see "Indicator if extension was granted for Liquidation" shown as help text
    And I click on "Edit" in the page details
    When I enter value "No" into field "NYSED_ChgDate__c"
    And I click on "Save" in the page details
    Then I softly see field "Chg Date?" as "No"
    Examples:
      | OtherType |
      | FD        |

  @501903 @501778 @Sprint-05 @US-499299 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: u. Liquidate In Days
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: r. Under Review.: External|
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    #501778
    Then I softly see field "Under Review" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_UnderReview__c" :
      | --None-- | Yes | No |
    When I enter value "No" into field "NYSED_UnderReview__c"
    And I click on "Save" in the page details
    Then I softly see field "Under Review" as "No"
    #501903
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see field "Liquidate In Days" inside page block
    When I hovering mouse on help text icon inside page block detail "Liquidate In Days"
    Then I softly see "Number of days in which funds must be liquidated." shown as help text
    When I enter value "20.7" into field "NYSED_LiquidateInDays__c"
    And I click on "Save" in the page details
    Then I softly see field "Liquidate In Days" as "207"
    And I click on "Edit" in the page details
    When I enter value "361" into field "NYSED_LiquidateInDays__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    And I click on "Edit" in the page details
    When I enter value "22" into field "NYSED_LiquidateInDays__c"
    And I click on "Save" in the page details
    Then I softly see field "Liquidate In Days" as "22"
    #501903
    Then I softly see field "Liquidate In Days" inside page block
    When I hovering mouse on help text icon inside page block detail "Liquidate In Days"
    Then I softly see "Number of days in which funds must be liquidated." shown as help text
    And I click on "Edit" in the page details
    When I enter value "20.7" into field "NYSED_LiquidateInDays__c"
    And I click on "Save" in the page details
    Then I softly see field "Liquidate In Days" as "207"

    Examples:
      | OtherType |
      | FD        |

  @501898 @501896 @Sprint-05 @US-499299 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: q. GAPE.: External
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: p. Contract?.: External|
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: o. Payee Ref.: External |
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    #501899
    Then I softly see field "GAPE" inside page block
    When I hovering mouse on help text icon inside page block detail "GAPE"
    Then I softly see "Grant programs covered by 34CFR part 76." shown as help text
    Then I see only the following ordered options in dropdown field "NYSED_GAPE__c" :
      | --None-- | Yes | No |
    When I enter value "No" into field "NYSED_GAPE__c"
    And I click on "Save" in the page details
    Then I softly see field "GAPE" as "No"
    #501896
    And I click on "Edit" in the page details
    Then I softly see field "Contract?" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_Contract__c" :
      | --None-- | Grant contract | No |
    When I enter value "Grant contract" into field "NYSED_Contract__c"
    And I click on "Save" in the page details
    Then I softly see field "Contract?" as "Grant contract"

    Examples:
      | OtherType |
      | FD        |

  @501891 @501889 @Sprint-05 @US-499299 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: h. Fund Year.: External
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field. : g. Year.: External|
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "Federal Funding Source" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "1234" into field "Fund_Code__c" page block
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I enter value "--None--" into field "NYSED_Year__c"
    When I click on "Save" in the page details
     #501889
    When I click on "Activate" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Year is required to Activate the Funding Account. |
    And I click on "Edit" in the page details
    And I enter value "1991" into field "NYSED_Year__c"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    And I navigate to "Overview" sub tab
    #501891
    Then I softly see field "Fund Year" as "1234-91"

    Examples:
      | OtherType |
      | FD        |

  @501883 @Sprint-05 @US-499299 @M04 @M04Planning @@bugID-516299
  Scenario Outline: Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: h. Fund Year.|
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: n. NYC PGM ID.|
  |Verify that the Internal user see the new SFS Information section is added after Basic Information Section in the Funding account->Overview tab->SFS Information.|
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
      #501894-created state
    And I click on "Edit" in the page details
    Then I softly see field "NYC PGM ID" inside page block
    When I hovering mouse on help text icon inside page block detail "NYC PGM ID"
    Then I softly see "ID for New York City projects" shown as help text
    When I enter value "#%^" into field "NYC_PGM_ID__c"
    And I click on "Save" in the page details
    Then I softly see field "NYC PGM ID" as ""
    And I click on "Edit" in the page details
    When I enter value "124.88" into field "NYC_PGM_ID__c"
    And I click on "Save" in the page details
    Then I softly see field "NYC PGM ID" as "12"
    And I click on "Edit" in the page details
    When I enter value "12" into field "NYC_PGM_ID__c"
    And I click on "Save" in the page details
    Then I softly see field "NYC PGM ID" as "12"
    And I click on "Edit" in the page details
    And I clear the value from field "NYC_PGM_ID__c"
    And I click on "Save" in the page details
    #501883
    Then I softly see "Chart of Accounts" page block displayed

    Examples:
      | OtherType |
      | FD        |

  @501884 @501266 @501277 @501870 @501869 @Sprint-05 @US-499299 @M04 @M04Planning @passed
  Scenario Outline: Verify that the Internal user see the new SFS Information section have below fields, all are not editable.
  |Verify that the Internal user see the Information Section is renamed as Basic Information in the Overview tab of the Funding account page layout. |
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following fields.: External|
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: y. EDGAPS Date.|
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: x. Exp Date.|
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: w. Liq Date.|
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    #501266
    And I navigate to "Overview" sub tab
    Then I softly see "Basic Information" page block displayed
    Then I softly do not see "Information" page block displayed
    #501277
    Then I softly see field "Title" inside page block
    Then I softly see field "Short Description" inside page block
    Then I softly see field "Start Date" inside page block
    Then I softly see field "End Date" inside page block
    Then I softly see field "Fund Code" inside page block
    Then I softly see field "Fund" inside page block
    And I click on "Edit" in the page details
    And I wait for "2" seconds
#    When I see the EDGAPS Date is date Field
    #501884
    When I hovering mouse on help text icon inside page block detail "Exp Date"
    Then I softly see "Date the appropriation lapses." shown as help text
    Then I softly see field "Exp Date" inside page block
#    When I see the Exp Date field is date Field.
    #501884
    Then I softly see "Chart of Accounts" page block displayed
    When I hovering mouse on help text icon inside page block detail "Cst Cntr"
    Then I softly see "OSC identifier which designates which appropriation this fund is paid out of." shown as help text
    Then I softly see field "Cst Cntr" is not editable
    When I hovering mouse on help text icon inside page block detail "Variable"
    Then I softly see "OSC identifier which designates which appropriation this fund is paid out of." shown as help text
    Then I softly see field "Variable" is not editable
    When I hovering mouse on help text icon inside page block detail "Year"
    Then I softly see "School year/OSC identifier which designates which appropriation this fund is paid out of." shown as help text
    Then I softly see field "Year" is not editable
    When I hovering mouse on help text icon inside page block detail "Fund"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Fund" is not editable
    When I hovering mouse on help text icon inside page block detail "Prog"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Prog" is not editable
    When I hovering mouse on help text icon inside page block detail "Bud Ref"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Bud Ref" is not editable
    When I hovering mouse on help text icon inside page block detail "Acct"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Acct" is not editable
    When I hovering mouse on help text icon inside page block detail "Act"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Act" is not editable
    When I hovering mouse on help text icon inside page block detail "Proj"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Proj" is not editable
    When I hovering mouse on help text icon inside page block detail "CF-1"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "CF-1" is not editable
    When I hovering mouse on help text icon inside page block detail "CF-2"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "CF-2" is not editable
    When I hovering mouse on help text icon inside page block detail "CF-3"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "CF-3" is not editable
    When I hovering mouse on help text icon inside page block detail "Status"
    Then I softly see "Cost Center Information." shown as help text
    Then I softly see field "Status" is not editable

    Examples:
      | OtherType |
      | FD        |

  @501899 @Sprint-05 @US-499299 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: u. Liquidate In Days
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: s. GSPS?.|
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: r. Under Review.|
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    #501899
    Then I softly see field "Under Review" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_UnderReview__c" :
      | --None-- | Yes | No |
    When I enter value "No" into field "NYSED_UnderReview__c"
    And I click on "Save" in the page details
    Then I softly see field "Under Review" as "No"

    Examples:
      | OtherType |
      | FD        |

  @501777 @501775 @Sprint-05 @US-499299 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: q. GAPE.
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: p. Contract?. |
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: o. Payee Ref. |
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    Then I softly see field "GAPE" inside page block
    When I hovering mouse on help text icon inside page block detail "GAPE"
    Then I softly see "Grant programs covered by 34CFR part 76." shown as help text
    Then I see only the following ordered options in dropdown field "NYSED_GAPE__c" :
      | --None-- | Yes | No |
    When I enter value "No" into field "NYSED_GAPE__c"
    And I click on "Save" in the page details
    Then I softly see field "GAPE" as "No"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    Then I softly see field "Contract?" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_Contract__c" :
      | --None-- | Grant contract | No |
    When I enter value "Grant contract" into field "NYSED_Contract__c"
    And I click on "Save" in the page details
    Then I softly see field "Contract?" as "Grant contract"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"

    Examples:
      | OtherType |
      | FD        |

  @501770 @501288 @Sprint-05 @US-499299 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field.: h. Fund Year.:
  |Verify that the Internal user see in the Overview tab of the Funding account Basic Information section having following field. : g. Year.|
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I see the header is "State Funding Source" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "1234" into field "---fundingsource:-:FA_fundCode---"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I enter value "--None--" into field "NYSED_Year__c"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Year is required to Activate the Funding Account. |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "2075" into field "NYSED_Year__c"
    And I click on "Save" in the page details
    Then I see the header is "Funding Account" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Fund Year" as "1234-75"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"

    Examples:
      | OtherType |
      | FD        |

  @498878 @Sprint-04 @US-494958 @M04 @M04Planning
  Scenario Outline: Verify that a 'Release Payments' button is not visible to other internal users except FD and Admin users on page layout when funding account is in 'Active' state and 'Able to Pay?' checkbox is un-checked - Internal Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly can see top right button "Release Payments" in page detail
    Then I softly see field "Able to Pay?" as "No"
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "State Funding Sources - All"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    Then I softly cannot see top right button "Release Payments" in page detail
    Then I softly see field "Able to Pay?" as "No"

    Examples:
      | UserType | NonOwner |
      | FD       | PM       |

  @498879 @Sprint-04 @US-494958 @M04 @M04Planning
  Scenario Outline: Verify that a 'Stop Payments' button is not visible to other internal users except FD and Admin users on page layout when funding account is in 'Active' state and 'Able to Pay?' checkbox is checked - External Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Release Payments" in the page details
    Then I softly see field "Able to Pay?" as "Yes"
    Then I softly can see top right button "Stop Payments" in page detail
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "State Funding Sources - All"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    Then I softly cannot see top right button "Stop Payments" in page detail
    Then I softly see field "Able to Pay?" as "Yes"

    Examples:
      | UserType | NonOwner |
      | FD       | PM       |

  @498880 @Sprint-04 @US-494958 @M04 @M04Planning
  Scenario Outline: Verify that a 'Release Payments' button is not visible to other internal users except FD and Admin users on page layout when funding account is in 'Active' state and 'Able to Pay?' checkbox is un-checked - External Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly can see top right button "Release Payments" in page detail
    Then I softly see field "Able to Pay?" as "No"
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "State Funding Sources - All"
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside table
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    Then I softly cannot see top right button "Release Payments" in page detail
    Then I softly see field "Able to Pay?" as "No"

    Examples:
      | UserType | NonOwner |
      | FD       | PM       |

  @501243 @@501244 @501245 @535669 @535670 @533393 @533395 @533406 @545575 @545573 @US-544466 @NYSEDSprint-19 @NYSEDSprint-05 @US-544469 @US-500364 @US-532347 @M04 @M04Planning @October2025
  Scenario Outline: Verify that Fund Code field is added at Internal Funding Source list view, next to Title Column.
  |Verify that the FD user sees that the filters in the Planning -> Funding Sources -> Internal Funding Sources list view have been renamed to ‘State Funding Sources’.|
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    #535669
    And I click toggle button to select "State Funding Sources - All"
    #533393
    Then I see only the following headers in table with id "---fundingsource:-:fundingSourceTableId---" :
      | Actions | EGMS ID | Title | Type | Cert Level | Created By ID | Status |
    And I click toggle button to select "State Funding Sources - Created"
    #535669 #533393
    Then I see only the following headers in table with id "---fundingsource:-:fundingSourceTableId---" :
      | Actions | EGMS ID | Title | Type | Cert Level | Created By ID | Status |
    And I click toggle button to select "State Funding Sources - Active"
    #535669 #533393
    Then I see only the following headers in table with id "---fundingsource:-:fundingSourceTableId---" :
      | Actions | EGMS ID | Title | Type | Cert Level | Created By ID | Status |
    And I click toggle button to select "State Funding Sources - Closed"
    #535669 #533393
    Then I see only the following headers in table with id "---fundingsource:-:fundingSourceTableId---" :
      | Actions | EGMS ID | Title | Type | Cert Level | Created By ID | Status |
    #501244
    And I click toggle button to select "Federal Funding Sources - All"
    #535670 #533395 #545575
    Then I see only the following headers in table with id "---fundingsource:-:externalFundingTableId---" :
      | Actions | EGMS ID | Title | Type | Cert Level | Created By ID | Status |
    And I click toggle button to select "Federal Funding Sources - Created"
    #535670 #533395 #545575
    Then I see only the following headers in table with id "---fundingsource:-:externalFundingTableId---" :
      | Actions | EGMS ID | Title | Type | Cert Level | Created By ID | Status |
    And I click toggle button to select "Federal Funding Sources - Active"
    #535670 #533395 #545575
    Then I see only the following headers in table with id "---fundingsource:-:externalFundingTableId---" :
      | Actions | EGMS ID | Title | Type | Cert Level | Created By ID | Status |
    And I click toggle button to select "Federal Funding Sources - Closed"
    #535670 #533395 #545575
    Then I see only the following headers in table with id "---fundingsource:-:externalFundingTableId---" :
      | Actions | EGMS ID | Title | Type | Cert Level | Created By ID | Status |
    #501245 #533406
    And I click toggle button to select "Funding Accounts - All"
    Then I see only the following headers in table with id "---fundingsource:-:fundingTableId---" :
      | Actions | EGMS ID | Fund Year | Title | Type | Cert Level | Funding Source EGMS ID | Funding Source Title | Created By ID | Status |
    And I click toggle button to select "Funding Accounts - Created"
    Then I see only the following headers in table with id "---fundingsource:-:fundingTableId---" :
      | Actions | EGMS ID | Fund Year | Title | Type | Cert Level | Funding Source EGMS ID | Funding Source Title | Created By ID | Status |
    And I click toggle button to select "Funding Accounts - Active"
    Then I see only the following headers in table with id "---fundingsource:-:fundingTableId---" :
      | Actions | EGMS ID | Fund Year | Title | Type | Cert Level | Funding Source EGMS ID | Funding Source Title | Created By ID | Status |
    And I click toggle button to select "Funding Accounts - Closed"
    Then I see only the following headers in table with id "---fundingsource:-:fundingTableId---" :
      | Actions | EGMS ID | Fund Year | Title | Type | Cert Level | Funding Source EGMS ID | Funding Source Title | Created By ID | Status |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |
#      | FO       |
#      | FD       |

  @501890 @502134 @504234 @502071 @502385 @Sprint-05 @US-500356 @511053 @511075 @US-509775 @515847 @533378 @533309 @533375 @533315 @533307 @US-513804 @US-532347 @M04 @M04Planning
  Scenario Outline:Verify the field-level changes in Internal Funding Source -> Overview tab -> Funding Information Section, including renamed fields, new fields, and existing fields.
  |Verify that the FD user sees the previously added 'Expenditure Paid to Date' field is removed and that the 'Spent' field has been renamed to 'Expenditure Paid to Date' on the internal funding source layout.|
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    #533315
    Then I see only the following ordered options in dropdown field "NYSED_GSPS__c" :
      | --None-- | Yes | No |
    And I wait for "2" seconds
    When I enter value "No" into field "NYSED_GSPS__c"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    #533315
    Then I softly see field "GSPS?" as "No"
    Then I softly see field "GSPS?" added after "End Date"
    When I hovering mouse on help text icon inside page block detail "GSPS?"
    Then I softly see "GSPS Fund." shown as help text
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #@515847 #533378 @US-513804
    Then I softly see field "School Year Level" inside page block
    Then I see only the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Actions | Fund Year | Funding Account Title | Cert Level | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance | Status |
    #501890 #533378
    Then I softly see field "School Year Level" inside page block
    Then I softly see field "Cert Level" inside page block
    Then I softly see field "Pre-Encumbrance" inside page block
    Then I softly see field "Outstanding Encumbrance" inside page block
    Then I softly see field "Enc Life" inside page block
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly see field "Total Obligation" inside page block
    Then I softly see field "Available Balance" inside page block
    When I hovering mouse on help text icon inside page block detail "Expenditure Paid to Date"
    Then I softly see "Amount of funds disbursed to local agencies operating in a project year." shown as help text
    #511075
    Then I softly see field "School Year Level" as "$0"
    Then I softly see field "Pre-Encumbrance" as "$0"
    Then I softly see field "Outstanding Encumbrance" as "$0"
    Then I softly see field "Enc Life" as "$0"
    Then I softly see field "Expenditure Paid to Date" as "$0"
    Then I softly see field "Cert Level" as "$0"
    Then I softly see field "Total Obligation" as "$0"
    Then I softly see field "Available Balance" as "$0"
      #504234
    Then I softly see field "School Year Level" is not editable
    Then I softly see field "Cert Level" is not editable
    Then I softly see field "Outstanding Encumbrance" is not editable
    Then I softly see field "Enc Life" is not editable
    Then I softly see field "Expenditure Paid to Date" is not editable
    #502071
    Then I softly see "Cert Level" in flex table header "---fundingsource:-:fundingAccountTableId---"
    Then I softly see "Outstanding Encumbrance" in flex table header "---fundingsource:-:fundingAccountTableId---"
    #511053
    When I hovering mouse on help text icon inside page block detail "Total Obligation"
    Then I softly see "Sum of Pre-Encumbrance, Outstanding Encumbrance and Expenditure Paid to Date." shown as help text
    When I hovering mouse on help text icon inside page block detail "Available Balance"
    Then I softly see "Balance remaining after subtracting Total Obligation from Cert Level." shown as help text
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    #533307
    Then I softly cannot see field "GSPS?" inside page block
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #533309
    Then I softly see field "Expenditure Paid to Date" as "$0" in "Financials" pageblock
    When I hovering mouse on help text icon inside page block detail "Expenditure Paid to Date"
    Then I softly see "Amount of funds disbursed to local agencies operating in a project year." shown as help text
    #533378
    Then I softly cannot see field "Spent" inside page block
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #533309
    Then I softly see field "Expenditure Paid to Date" as "$0" in "Financials" pageblock
    When I hovering mouse on help text icon inside page block detail "Expenditure Paid to Date"
    Then I softly see "Amount of funds disbursed to local agencies operating in a project year." shown as help text
    #533307
    Then I softly cannot see field "GSPS?" inside page block
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Overview" sub tab
    #@515847 #533378 @US-513804
    Then I softly see field "School Year Level" inside page block
    Then I see only the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Actions | Fund Year | Funding Account Title | Cert Level | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance | Status |
    Then I softly see field "Cert Level" inside page block
    Then I softly see field "Pre-Encumbrance" inside page block
    Then I softly see field "Outstanding Encumbrance" inside page block
    Then I softly see field "Enc Life" inside page block
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly see field "School Year Level" inside page block
    Then I softly see field "Total Obligation" inside page block
    Then I softly see field "Available Balance" inside page block
    #533378
    Then I softly cannot see field "Spent" inside page block
    When I hovering mouse on help text icon inside page block detail "Expenditure Paid to Date"
    Then I softly see "Amount of funds disbursed to local agencies operating in a project year." shown as help text
     #511075
    Then I softly see field "School Year Level" as "$0"
    Then I softly see field "Pre-Encumbrance" as "$0"
    Then I softly see field "Outstanding Encumbrance" as "$0"
    Then I softly see field "Enc Life" as "$0"
    Then I softly see field "Expenditure Paid to Date" as "$0"
    Then I softly see field "School Year Level" as "$0"
    Then I softly see field "Total Obligation" as "$0"
    Then I softly see field "Available Balance" as "$10,000,000"
    Then I see the following rows under the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Cert Level  | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance |
      | $10,000,000 | $0              | $0                      | $0                       | $0               | $10,000,000       |
      #502071
    Then I softly see "Cert Level" in flex table header "---fundingsource:-:fundingAccountTableId---"
    Then I softly see "Outstanding Encumbrance" in flex table header "---fundingsource:-:fundingAccountTableId---"
    #511053
    When I hovering mouse on help text icon inside page block detail "Total Obligation"
    Then I softly see "Sum of Pre-Encumbrance, Outstanding Encumbrance and Expenditure Paid to Date." shown as help text
    When I hovering mouse on help text icon inside page block detail "Available Balance"
    Then I softly see "Balance remaining after subtracting Total Obligation from Cert Level." shown as help text
    #533375
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "GSPS?" rendered in view mode only
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    #533309
    Then I softly see field "Expenditure Paid to Date" as "$0" in "Financials" pageblock
    When I hovering mouse on help text icon inside page block detail "Expenditure Paid to Date"
    Then I softly see "Amount of funds disbursed to local agencies operating in a project year." shown as help text
    #533307
    Then I softly cannot see field "GSPS?" inside page block
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #533375
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "GSPS?" rendered in view mode only
    #@515847 #533309 @US-513804
    Then I softly see field "School Year Level" inside page block
    Then I see only the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Actions | Fund Year | Funding Account Title | Cert Level | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance | Status |
    Then I softly see field "Cert Level" inside page block
    Then I softly see field "Pre-Encumbrance" inside page block
    Then I softly see field "Outstanding Encumbrance" inside page block
    Then I softly see field "Enc Life" inside page block
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly see field "School Year Level" inside page block
    Then I softly see field "Total Obligation" inside page block
    Then I softly see field "Available Balance" inside page block
    #533378
    Then I softly cannot see field "Spent" inside page block
    When I hovering mouse on help text icon inside page block detail "Expenditure Paid to Date"
    Then I softly see "Amount of funds disbursed to local agencies operating in a project year." shown as help text
    #502134
    Then I softly see field "School Year Level" is not editable
    Then I softly see field "Cert Level" is not editable
    Then I softly see field "Outstanding Encumbrance" is not editable
    Then I softly see field "Enc Life" is not editable
    Then I softly see field "Expenditure Paid to Date" is not editable
      #502071
    Then I softly see "Cert Level" in flex table header "---fundingsource:-:fundingAccountTableId---"
    Then I softly see "Outstanding Encumbrance" in flex table header "---fundingsource:-:fundingAccountTableId---"
    #511053
    When I hovering mouse on help text icon inside page block detail "Total Obligation"
    Then I softly see "Sum of Pre-Encumbrance, Outstanding Encumbrance and Expenditure Paid to Date." shown as help text
    When I hovering mouse on help text icon inside page block detail "Available Balance"
    Then I softly see "Balance remaining after subtracting Total Obligation from Cert Level." shown as help text
    #511075
    Then I softly see field "School Year Level" as "$0"
    Then I softly see field "Pre-Encumbrance" as "$0"
    Then I softly see field "Outstanding Encumbrance" as "$0"
    Then I softly see field "Enc Life" as "$0"
    Then I softly see field "Expenditure Paid to Date" as "$0"
    Then I softly see field "School Year Level" as "$0"
    Then I softly see field "Total Obligation" as "$0"
    Then I softly see field "Available Balance" as "$10,000,000"
    Then I see the following rows under the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Cert Level  | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance |
      | $10,000,000 | $0              | $0                      | $0                       | $0               | $10,000,000       |

    Examples:
      | UserType |
      | FD       |

  @501962 @502065 @NYSED-1735 @NYSED-1835 @NYSED-1837 @Sprint-05 @US-500356 @US-NYSED-1494 @NYSEDSprint-22 @NYSEDSprint-23 @US-NYSED-1796 @M04 @M04Planning
  Scenario Outline:Verify that the internal user see the 'School Year Level' field under Funding Source -> Overview tab -> Funding Information Section. - Internal Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2020" into field "Fund_Code__c"
    And I enter value "1000" into field "NYSED_SYAppr__c"
    And I enter value "1000" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    And I save the field labeled "Cert Level" as "CertLevel1"
    And I save the field labeled "School Year Level" as "SYAppr1"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FATitle"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    Given I navigate to "Overview" sub tab
    #NYSED-1735
    Then I softly see field "School Year Level" as "$0"
    When I click on "View" icon for "{SavedValue:FATitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I wait for "3" seconds
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    Given I navigate to "Overview" sub tab
    #NYSED-1735
    Then I softly see field "School Year Level" as "$1,000"
    Then I softly see field "School Year Level" as "{SavedValue:SYAppr1}"
    #NYSED-1835
    Then I softly see field "End Date" as "{Date:M/d/yyyy::d+3650}"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "2020" into field "Fund_Code__c"
    And I enter value "1000" into field "NYSED_SYAppr__c"
    And I enter value "1000" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    And I save the field labeled "Cert Level" as "CertLevel2"
    And I save the field labeled "School Year Level" as "SYAppr2"
    And I save the field labeled "Title" as "FATitle1"
    When I click on "Activate" in the page details
    #NYSED-1835
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Overview" sub tab
    #501962
    Then I softly see field "School Year Level" inside page block
    #NYSED-1735
    Then I softly see field "School Year Level" as "$2,000"
    And I save the field labeled "School Year Level" as "SYAppr3"
    When I hovering mouse on help text icon inside page block detail "School Year Level"
    Then I softly see "Amount available to the State for grants to local agencies in the designated fiscal year." shown as help text
    #502065
    Then I softly see field "Cert Level" inside page block
    When I hovering mouse on help text icon inside page block detail "Cert Level"
    Then I softly see "Amount of State Appropriation approved by the NYS Division of Budget (DOB) and posted to the Office of the State Comptrollers(OSC) Ledgers." shown as help text
    Then I softly see field "Cert Level" as "$2,000"
    And I save the field labeled "Cert Level" as "CertLevel3"
    Then I softly see addition of two fields "{SavedValue:SYAppr1}" and "{SavedValue:SYAppr2}" is equal to "{SavedValue:SYAppr3}"
    Then I softly see addition of two fields "{SavedValue:CertLevel1}" and "{SavedValue:CertLevel2}" is equal to "{SavedValue:CertLevel3}"
    When I click on "View" icon for "{SavedValue:FATitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I wait for "3" seconds
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:FATitle1}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I wait for "3" seconds
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "2020" into field "Fund_Code__c"
    And I enter value "1000" into field "NYSED_SYAppr__c"
    And I enter value "1000" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    #NYSED-1837
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    #NYSED-1837
    Then I softly see field "Status" as "Active"

    Examples:
      | UserType |
      | FD       |

  @502072 @502121 @502136 @504235 @Sprint-05 @US-500356 @511055 @511083 @US-509775 @US-513804 @515883 @533383 @533382 @533386
    @533385 @533388 @US-532347 @M04 @M04Planning
  Scenario Outline:Verify the field-level changes in External Funding Source -> Overview tab -> Funding Information Section, including renamed fields, new fields, and existing fields.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
     #533385
    Then I see only the following ordered options in dropdown field "NYSED_GSPS__c" :
      | --None-- | Yes | No |
    And I wait for "2" seconds
    When I enter value "No" into field "NYSED_GSPS__c"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    #533385
    Then I softly see field "GSPS?" as "No"
    Then I softly see field "GSPS?" added after "End Date"
    When I hovering mouse on help text icon inside page block detail "GSPS?"
    Then I softly see "GSPS Fund." shown as help text
    Then I see status in Progress-bar is "Created" and is "dark blue"
    #515883 #533388 @US-513804
    Then I see only the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Actions | Fund Year | Funding Account Title | Cert Level | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance | Status |
    #502072 #533378
    Then I softly cannot see field "Spent" inside page block
    Then I softly see field "School Year Level" inside page block
    Then I softly see field "Cert Level" inside page block
    Then I softly see field "Pre-Encumbrance" inside page block
    Then I softly see field "Outstanding Encumbrance" inside page block
    Then I softly see field "Enc Life" inside page block
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly see field "Total Obligation" inside page block
    Then I softly see field "Available Balance" inside page block
     #511083
    Then I softly see field "School Year Level" as "$0"
    Then I softly see field "Pre-Encumbrance" as "$0"
    Then I softly see field "Outstanding Encumbrance" as "$0"
    Then I softly see field "Enc Life" as "$0"
    Then I softly see field "Expenditure Paid to Date" as "$0"
    Then I softly see field "Cert Level" as "$0"
    Then I softly see field "Total Obligation" as "$0"
    Then I softly see field "Available Balance" as "$0"
    #502136
    Then I softly see field "School Year Level" is not editable
    Then I softly see field "Cert Level" is not editable
    Then I softly see field "Outstanding Encumbrance" is not editable
    Then I softly see field "Enc Life" is not editable
    Then I softly see field "Expenditure Paid to Date" is not editable
      #502121
    Then I softly see "Cert Level" in flex table header "---fundingsource:-:fundingAccountTableId---"
    Then I softly see "Outstanding Encumbrance" in flex table header "---fundingsource:-:fundingAccountTableId---"
    And I navigate to "Overview" sub tab
    #511055
    When I hovering mouse on help text icon inside page block detail "Total Obligation"
    Then I softly see "Sum of Pre-Encumbrance, Outstanding Encumbrance and Expenditure Paid to Date." shown as help text
    When I hovering mouse on help text icon inside page block detail "Available Balance"
    Then I softly see "Balance remaining after subtracting Total Obligation from Cert Level." shown as help text
    #533388
    When I hovering mouse on help text icon inside page block detail "Expenditure Paid to Date"
    Then I softly see "Amount of funds disbursed to local agencies operating in a project year." shown as help text
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    #533382
    Then I softly cannot see field "GSPS?" inside page block
    #533383
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly cannot see field "Spent" inside page block
    When I hovering mouse on help text icon inside page block detail "Expenditure Paid to Date"
    Then I softly see "Amount of funds disbursed to local agencies operating in a project year." shown as help text
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #533382
    Then I softly cannot see field "GSPS?" inside page block
    #533383
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly cannot see field "Spent" inside page block
    When I hovering mouse on help text icon inside page block detail "Expenditure Paid to Date"
    Then I softly see "Amount of funds disbursed to local agencies operating in a project year." shown as help text
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    #533386
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "GSPS?" rendered in view mode only
    #515883 @US-513804 #533378
    Then I see only the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Actions | Fund Year | Funding Account Title | Cert Level | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance | Status |
     #502072 #533378
    And I navigate to "Overview" sub tab
    Then I softly see field "School Year Level" inside page block
    Then I softly see field "Cert Level" inside page block
    Then I softly see field "Pre-Encumbrance" inside page block
    Then I softly see field "Outstanding Encumbrance" inside page block
    Then I softly see field "Enc Life" inside page block
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly see field "Cert Level" inside page block
    Then I softly see field "Total Obligation" inside page block
    Then I softly see field "Available Balance" inside page block
    #533378
    Then I softly cannot see field "Spent" inside page block
     #511083
    Then I softly see field "School Year Level" as "$0"
    Then I softly see field "Pre-Encumbrance" as "$0"
    Then I softly see field "Outstanding Encumbrance" as "$0"
    Then I softly see field "Enc Life" as "$0"
    Then I softly see field "Expenditure Paid to Date" as "$0"
    Then I softly see field "Total Obligation" as "$0"
    Then I softly see field "Available Balance" as "$10,000,000"
    Then I see the following rows under the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Cert Level  | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance |
      | $10,000,000 | $0              | $0                      | $0                       | $0               | $10,000,000       |
    #502121
    Then I softly see "Cert Level" in flex table header "---fundingsource:-:fundingAccountTableId---"
    Then I softly see "Outstanding Encumbrance" in flex table header "---fundingsource:-:fundingAccountTableId---"
     #511055
    When I navigate to "Overview" sub tab
    When I hovering mouse on help text icon inside page block detail "Total Obligation"
    Then I softly see "Sum of Pre-Encumbrance, Outstanding Encumbrance and Expenditure Paid to Date." shown as help text
    When I hovering mouse on help text icon inside page block detail "Available Balance"
    Then I softly see "Balance remaining after subtracting Total Obligation from Cert Level." shown as help text
    #533388
    When I hovering mouse on help text icon inside page block detail "Expenditure Paid to Date"
    Then I softly see "Amount of funds disbursed to local agencies operating in a project year." shown as help text
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    #533382
    Then I softly cannot see field "GSPS?" inside page block
    #533383
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly cannot see field "Spent" inside page block
    When I hovering mouse on help text icon inside page block detail "Expenditure Paid to Date"
    Then I softly see "Amount of funds disbursed to local agencies operating in a project year." shown as help text
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "2" seconds
    #533386
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "GSPS?" rendered in view mode only
    #515883 #533378 @US-513804
    Then I see only the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Actions | Fund Year | Funding Account Title | Cert Level | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance | Status |
    #533378
    Then I softly cannot see field "Spent" inside page block
    #502072 #533378
    And I navigate to "Overview" sub tab
    Then I softly see field "School Year Level" inside page block
    Then I softly see field "Cert Level" inside page block
    Then I softly see field "Pre-Encumbrance" inside page block
    Then I softly see field "Outstanding Encumbrance" inside page block
    Then I softly see field "Enc Life" inside page block
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly see field "Total Obligation" inside page block
    Then I softly see field "Available Balance" inside page block
    #504235
    Then I softly see field "School Year Level" is not editable
    Then I softly see field "Cert Level" is not editable
    Then I softly see field "Outstanding Encumbrance" is not editable
    Then I softly see field "Enc Life" is not editable
    Then I softly see field "Expenditure Paid to Date" is not editable
    #502121
    Then I softly see "Cert Level" in flex table header "---fundingsource:-:fundingAccountTableId---"
    Then I softly see "Outstanding Encumbrance" in flex table header "---fundingsource:-:fundingAccountTableId---"
     #511055
    When I hovering mouse on help text icon inside page block detail "Total Obligation"
    Then I softly see "Sum of Pre-Encumbrance, Outstanding Encumbrance and Expenditure Paid to Date." shown as help text
    When I hovering mouse on help text icon inside page block detail "Available Balance"
    Then I softly see "Balance remaining after subtracting Total Obligation from Cert Level." shown as help text
     #511083
    Then I softly see field "School Year Level" as "$0"
    Then I softly see field "Pre-Encumbrance" as "$0"
    Then I softly see field "Outstanding Encumbrance" as "$0"
    Then I softly see field "Enc Life" as "$0"
    Then I softly see field "Expenditure Paid to Date" as "$0"
    Then I softly see field "Total Obligation" as "$0"
    Then I softly see field "Available Balance" as "$10,000,000"
    Then I see the following rows under the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Cert Level  | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance |
      | $10,000,000 | $0              | $0                      | $0                       | $0               | $10,000,000       |
    #533388
    When I hovering mouse on help text icon inside page block detail "Expenditure Paid to Date"
    Then I softly see "Amount of funds disbursed to local agencies operating in a project year." shown as help text

    Examples:
      | UserType |
      | FD       |

  @502074 @502078 @NYSED-1839 @NYSED-1840 @Sprint-05 @US-500356 @NYSEDSprint-23 @US-NYSED-1796 @M04 @M04Planning
  Scenario Outline:Verify that the internal user see the 'School Year Level' field under Funding Source -> Overview tab -> Funding Information Section. - External Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    And I enter value "1000" into field "NYSED_SYAppr__c"
    And I enter value "1000" into field "AppropriationBalance__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    And I save the field labeled "Cert Level" as "CertLevel1"
    And I save the field labeled "School Year Level" as "SYAppr1"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FATitle"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    #NYSED-1839
    Then I softly see field "End Date" as "{Date:M/d/yyyy::d+360}"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "1000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    And I enter value "1000" into field "NYSED_SYAppr__c"
    And I enter value "1000" into field "AppropriationBalance__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    And I save the field labeled "Cert Level" as "CertLevel2"
    And I save the field labeled "School Year Level" as "SYAppr2"
    When I click on "Activate" in the page details
    #NYSED-1839
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FATitle1"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "2" seconds
    #502074
    Then I softly see field "School Year Level" inside page block
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "School Year Level"
    Then I softly see "Amount available to the State for grants to local agencies in the designated fiscal year." shown as help text
    Then I softly see field "School Year Level" as "$2,000"
    And I save the field labeled "School Year Level" as "SYAppr3"
    #502078
    Then I softly see field "Cert Level" inside page block
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "Cert Level"
    Then I softly see "Amount of State Appropriation approved by the NYS Division of Budget (DOB) and posted to the Office of the State Comptrollers(OSC) Ledgers." shown as help text
    Then I softly see field "Cert Level" as "$2,000"
    And I save the field labeled "Cert Level" as "CertLevel3"
    Then I softly see addition of two fields "{SavedValue:SYAppr1}" and "{SavedValue:SYAppr2}" is equal to "{SavedValue:SYAppr3}"
    Then I softly see addition of two fields "{SavedValue:CertLevel1}" and "{SavedValue:CertLevel2}" is equal to "{SavedValue:CertLevel3}"
    When I click on "View" icon for "{SavedValue:FATitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I wait for "3" seconds
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:FATitle1}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I wait for "3" seconds
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "1000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    And I enter value "1000" into field "NYSED_SYAppr__c"
    And I enter value "1000" into field "AppropriationBalance__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    #NYSED-1840
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    Then I softly see field "Status" as "Active"

    Examples:
      | UserType |
      | FD       |

  @502350 @502356 @502364 @502385 @Sprint-05 @US-501033 @511095 @511104 @511101 @Sprint-07 @US-509821 @M04 @M04Planning
  Scenario Outline:Verify the field-level changes in Funding account->Overview tab->Financials section, including renamed fields, new fields, and existing fields. - Internal Funding Source
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    #502385
    Then I softly see field "Cert Level" inside page block
    When I hovering mouse on help text icon inside modal "Cert Level"
    Then I softly see "Amount of State Appropriation approved by the NYS Division of Budget (DOB) and posted to the Office of the State Comptrollers(OSC) Ledgers." shown as help text
    And I wait for "2" seconds
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #502350
    Then I softly see field "School Year Level" inside page block
    Then I softly see field "Cert Level" inside page block
    Then I softly see field "Pre-Encumbrance" inside page block
    Then I softly see field "Outstanding Encumbrance" inside page block
    Then I softly see field "Enc Life" inside page block
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly see field "Total Obligation" inside page block
    Then I softly see field "Available Balance" inside page block
    #502356
    When I hovering mouse on help text icon inside page block detail "School Year Level"
    Then I softly see "Amount available to the State for grants to local agencies in the designated fiscal year." shown as help text
    Then I softly see field "School Year Level" as "$0"
    Given I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "cdfs" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see field "School Year Level" as ""
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "+++" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see field "School Year Level" as ""
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-1235" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | School Year Level must be a positive value. |
    And I enter value "255.3333" into field "NYSED_SYAppr__c" page block
    And I click on "Save" in the page details
    Then I softly see field "School Year Level" as "$255"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-10.999" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | School Year Level must be a positive value. |
    And I clear the value from field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    #511101
    And I click on "Edit" in the page details
    Then I softly see fields "NYSED_SYAppr__c" is in edit mode
    Then I softly see fields "AppropriationBalance__c" is in edit mode
    Then I softly see field "Pre-Encumbrance" is not editable
    Then I softly see field "Outstanding Encumbrance" is not editable
    Then I softly see field "Enc Life" is not editable
    Then I softly see field "Expenditure Paid to Date" is not editable
    Then I softly see field "Total Obligation" is not editable
    Then I softly see field "Available Balance" is not editable
    Then I softly see field "Pre-Encumbrance" as "$0"
    Then I softly see field "Outstanding Encumbrance" as "$0"
    Then I softly see field "Enc Life" as ""
    Then I softly see field "Expenditure Paid to Date" as "$0"
    Then I softly see field "Total Obligation" as "$0"
    And I enter value "1.999" into field "AppropriationBalance__c"
    And I enter value "1.999" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$1,999"
    Then I softly see field "School Year Level" as "$1,999"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-10.987" into field "AppropriationBalance__c"
    And I enter value "-10.987" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Cert Level must be a positive value.        |
      | School Year Level must be a positive value. |
    And I enter value "10.987" into field "AppropriationBalance__c"
    And I enter value "10.987" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$10,987"
    Then I softly see field "School Year Level" as "$10,987"
    And I click on "Edit" in the page details
    And I enter value "1000" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$1,000"
    #502364
    When I hovering mouse on help text icon inside page block detail "Cert Level"
    Then I softly see "Amount of State Appropriation approved by the NYS Division of Budget (DOB) and posted to the Office of the State Comptrollers(OSC) Ledgers." shown as help text
    #511095
    When I hovering mouse on help text icon inside page block detail "Total Obligation"
    Then I softly see "Sum of Pre-Encumbrance, Outstanding Encumbrance and Expenditure Paid to Date." shown as help text
    When I hovering mouse on help text icon inside page block detail "Available Balance"
    Then I softly see "Balance remaining after subtracting Total Obligation from Cert Level." shown as help text
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #502350
    Then I softly see field "School Year Level" inside page block
    Then I softly see field "Cert Level" inside page block
    Then I softly see field "Pre-Encumbrance" inside page block
    Then I softly see field "Outstanding Encumbrance" inside page block
    Then I softly see field "Enc Life" inside page block
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly see field "Total Obligation" inside page block
    Then I softly see field "Available Balance" inside page block
    #502364
    When I hovering mouse on help text icon inside page block detail "Cert Level"
    Then I softly see "Amount of State Appropriation approved by the NYS Division of Budget (DOB) and posted to the Office of the State Comptrollers(OSC) Ledgers." shown as help text
    #511095
    When I hovering mouse on help text icon inside page block detail "Total Obligation"
    Then I softly see "Sum of Pre-Encumbrance, Outstanding Encumbrance and Expenditure Paid to Date." shown as help text
    When I hovering mouse on help text icon inside page block detail "Available Balance"
    Then I softly see "Balance remaining after subtracting Total Obligation from Cert Level." shown as help text
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    #502350
    Then I softly see field "School Year Level" inside page block
    Then I softly see field "Cert Level" inside page block
    Then I softly see field "Pre-Encumbrance" inside page block
    Then I softly see field "Outstanding Encumbrance" inside page block
    Then I softly see field "Enc Life" inside page block
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly see field "Total Obligation" inside page block
    Then I softly see field "Available Balance" inside page block
    #502364
    When I hovering mouse on help text icon inside page block detail "Cert Level"
    Then I softly see "Amount of State Appropriation approved by the NYS Division of Budget (DOB) and posted to the Office of the State Comptrollers(OSC) Ledgers." shown as help text
    #511095
    When I hovering mouse on help text icon inside page block detail "Total Obligation"
    Then I softly see "Sum of Pre-Encumbrance, Outstanding Encumbrance and Expenditure Paid to Date." shown as help text
    When I hovering mouse on help text icon inside page block detail "Available Balance"
    Then I softly see "Balance remaining after subtracting Total Obligation from Cert Level." shown as help text
    #511104
    And I click on "Edit" in the page details
    Then I softly see fields "AppropriationBalance__c" is in edit mode
    Then I softly see field "Pre-Encumbrance" is not editable
    Then I softly see field "Outstanding Encumbrance" is not editable
    Then I softly see field "Enc Life" is not editable
    Then I softly see field "Expenditure Paid to Date" is not editable
    Then I softly see field "Total Obligation" is not editable
    Then I softly see field "Available Balance" is not editable
    Then I softly see field "Pre-Encumbrance" as "$0"
    Then I softly see field "Outstanding Encumbrance" as "$0"
    Then I softly see field "Enc Life" as ""
    Then I softly see field "Expenditure Paid to Date" as "$0"
    Then I softly see field "Total Obligation" as "$0"
    And I enter value "1.999" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$1,999"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-10.987" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Cert Level must be a positive value. |
    And I enter value "10.987" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$10,987"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "1000" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$1,000"

    Examples:
      | UserType |
      | FD       |

  @502401 @502403 @502405 @502411 @Sprint-05 @US-501033 @511107 @511109 @511110 @Sprint-07 @US-509821 @M04 @M04Planning
  Scenario Outline:Verify the field-level changes in External Funding Source -> Overview tab -> Funding Information Section, including renamed fields, new fields, and existing fields.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    #502411
    Then I softly see field "Cert Level" inside page block
    When I hovering mouse on help text icon inside modal "Cert Level"
    Then I softly see "Amount of State Appropriation approved by the NYS Division of Budget (DOB) and posted to the Office of the State Comptrollers(OSC) Ledgers." shown as help text
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #502401
    Then I softly see field "School Year Level" inside page block
    Then I softly see field "Cert Level" inside page block
    Then I softly see field "Pre-Encumbrance" inside page block
    Then I softly see field "Outstanding Encumbrance" inside page block
    Then I softly see field "Enc Life" inside page block
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly see field "Total Obligation" inside page block
    Then I softly see field "Available Balance" inside page block
    #511107
    When I hovering mouse on help text icon inside page block detail "Total Obligation"
    Then I softly see "Sum of Pre-Encumbrance, Outstanding Encumbrance and Expenditure Paid to Date." shown as help text
    When I hovering mouse on help text icon inside page block detail "Available Balance"
    Then I softly see "Balance remaining after subtracting Total Obligation from Cert Level." shown as help text
#      #502403
    When I hovering mouse on help text icon inside page block detail "School Year Level"
    Then I softly see "Amount available to the State for grants to local agencies in the designated fiscal year." shown as help text
    Then I softly see field "School Year Level" as "$0"
    Given I navigate to "Overview" sub tab
    Given I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "cdfs" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see field "School Year Level" as ""
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "+++" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see field "School Year Level" as ""
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-1235" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | School Year Level must be a positive value. |
    And I enter value "255.3333" into field "NYSED_SYAppr__c" page block
    And I click on "Save" in the page details
    Then I softly see field "School Year Level" as "$255"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-10.999" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | School Year Level must be a positive value. |
    And I clear the value from field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #502405
    When I hovering mouse on help text icon inside page block detail "Cert Level"
    Then I softly see "Amount of State Appropriation approved by the NYS Division of Budget (DOB) and posted to the Office of the State Comptrollers(OSC) Ledgers." shown as help text
    #511109
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see fields "AppropriationBalance__c" is in edit mode
    Then I softly see fields "NYSED_SYAppr__c" is in edit mode
    Then I softly see field "Pre-Encumbrance" is not editable
    Then I softly see field "Outstanding Encumbrance" is not editable
    Then I softly see field "Enc Life" is not editable
    Then I softly see field "Expenditure Paid to Date" is not editable
    Then I softly see field "Total Obligation" is not editable
    Then I softly see field "Available Balance" is not editable
    Then I softly see field "Pre-Encumbrance" as "$0"
    Then I softly see field "Outstanding Encumbrance" as "$0"
    Then I softly see field "Enc Life" as ""
    Then I softly see field "Expenditure Paid to Date" as "$0"
    Then I softly see field "Total Obligation" as "$0"
    And I enter value "1.999" into field "AppropriationBalance__c"
    And I enter value "1.999" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$1,999"
    Then I softly see field "School Year Level" as "$1,999"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-10.987" into field "AppropriationBalance__c"
    And I enter value "-10.987" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Cert Level must be a positive value.        |
      | School Year Level must be a positive value. |
    And I enter value "1.999" into field "AppropriationBalance__c"
    And I enter value "1.999" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$1,999"
    Then I softly see field "School Year Level" as "$1,999"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "1000" into field "AppropriationBalance__c"
    And I enter value "1000" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$1,000"
    Then I softly see field "School Year Level" as "$1,000"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #502401
    Then I softly see field "School Year Level" inside page block
    Then I softly see field "Cert Level" inside page block
    Then I softly see field "Pre-Encumbrance" inside page block
    Then I softly see field "Outstanding Encumbrance" inside page block
    Then I softly see field "Enc Life" inside page block
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly see field "Total Obligation" inside page block
    Then I softly see field "Available Balance" inside page block
    #502405
    When I hovering mouse on help text icon inside page block detail "Cert Level"
    Then I softly see "Amount of State Appropriation approved by the NYS Division of Budget (DOB) and posted to the Office of the State Comptrollers(OSC) Ledgers." shown as help text
     #511107
    When I hovering mouse on help text icon inside page block detail "Total Obligation"
    Then I softly see "Sum of Pre-Encumbrance, Outstanding Encumbrance and Expenditure Paid to Date." shown as help text
    When I hovering mouse on help text icon inside page block detail "Available Balance"
    Then I softly see "Balance remaining after subtracting Total Obligation from Cert Level." shown as help text
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
        #502401
    Then I softly see field "School Year Level" inside page block
    Then I softly see field "Cert Level" inside page block
    Then I softly see field "Pre-Encumbrance" inside page block
    Then I softly see field "Outstanding Encumbrance" inside page block
    Then I softly see field "Enc Life" inside page block
    Then I softly see field "Expenditure Paid to Date" inside page block
    Then I softly see field "Total Obligation" inside page block
    Then I softly see field "Available Balance" inside page block
    #502405
    When I hovering mouse on help text icon inside page block detail "Cert Level"
    Then I softly see "Amount of State Appropriation approved by the NYS Division of Budget (DOB) and posted to the Office of the State Comptrollers(OSC) Ledgers." shown as help text
     #511107
    When I hovering mouse on help text icon inside page block detail "Total Obligation"
    Then I softly see "Sum of Pre-Encumbrance, Outstanding Encumbrance and Expenditure Paid to Date." shown as help text
    When I hovering mouse on help text icon inside page block detail "Available Balance"
    Then I softly see "Balance remaining after subtracting Total Obligation from Cert Level." shown as help text
    #511110
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see fields "AppropriationBalance__c" is in edit mode
    Then I softly see field "Pre-Encumbrance" is not editable
    Then I softly see field "Outstanding Encumbrance" is not editable
    Then I softly see field "Enc Life" is not editable
    Then I softly see field "Expenditure Paid to Date" is not editable
    Then I softly see field "School Year Level" is not editable
    Then I softly see field "Total Obligation" is not editable
    Then I softly see field "Available Balance" is not editable
    Then I softly see field "Pre-Encumbrance" as "$0"
    Then I softly see field "Outstanding Encumbrance" as "$0"
    Then I softly see field "Enc Life" as ""
    Then I softly see field "Expenditure Paid to Date" as "$0"
    Then I softly see field "Total Obligation" as "$0"
    And I enter value "1.999" into field "AppropriationBalance__c"
    And I enter value "1.999" into field "NYSED_SYAppr__c"
    And I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$1,999"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-10.987" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Cert Level must be a positive value. |
    And I enter value "1.999" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$1,999"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "1000" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    Then I softly see field "Cert Level" as "$1,000"

    Examples:
      | UserType |
      | FD       |

  @519304 @Sprint-08 @US-518016 @M04 @M04Planning
  Scenario Outline: Verify that 'hyphen' (-) is added in the Fund Year column in Funding Account (All, Active, Closed, Draft) list views on landing page of Planning module-->Funding Sources option
    When I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "Title" as "FSTitle"
    And I save the field labeled "EGMS ID" as "FSEGMSID"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "FAEGMSID"
    And I save the field labeled "Title" as "FATitle"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Created"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    And I wait for "3" seconds
    Then I see only the following headers in table with id "---fundingsource:-:fundingTableId---" :
      | Actions     | EGMS ID               | Fund Year | Title                | Type  | Cert Level  | Funding Source EGMS ID | Funding Source Title | Created By ID | Status  |
      | Action menu | {SavedValue:FAEGMSID} | 1990-25   | {SavedValue:FATitle} | State | $10,000,000 | {SavedValue:FSEGMSID}  | {SavedValue:FSTitle} | Automation FD | Created |
    And I wait for "5" seconds
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    Then I see only the following headers in table with id "---fundingsource:-:fundingTableId---" :
      | Actions     | EGMS ID               | Fund Year | Title                | Type  | Cert Level  | Funding Source EGMS ID | Funding Source Title | Created By ID | Status  |
      | Action menu | {SavedValue:FAEGMSID} | 1990-25   | {SavedValue:FATitle} | State | $10,000,000 | {SavedValue:FSEGMSID}  | {SavedValue:FSTitle} | Automation FD | Created |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FAEGMSID}" inside table
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Active"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    Then I see only the following headers in table with id "---fundingsource:-:fundingTableId---" :
      | Actions     | EGMS ID               | Fund Year | Title                | Type  | Cert Level  | Funding Source EGMS ID | Funding Source Title | Created By ID | Status |
      | Action menu | {SavedValue:FAEGMSID} | 1990-25   | {SavedValue:FATitle} | State | $10,000,000 | {SavedValue:FSEGMSID}  | {SavedValue:FSTitle} | Automation FD | Active |
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    Then I see only the following headers in table with id "---fundingsource:-:fundingTableId---" :
      | Actions     | EGMS ID               | Fund Year | Title                | Type  | Cert Level  | Funding Source EGMS ID | Funding Source Title | Created By ID | Status |
      | Action menu | {SavedValue:FAEGMSID} | 1990-25   | {SavedValue:FATitle} | State | $10,000,000 | {SavedValue:FSEGMSID}  | {SavedValue:FSTitle} | Automation FD | Active |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FAEGMSID}" inside table
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Closed"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    Then I see only the following headers in table with id "---fundingsource:-:fundingTableId---" :
      | Actions     | EGMS ID               | Fund Year | Title                | Type  | Cert Level  | Funding Source EGMS ID | Funding Source Title | Created By ID | Status |
      | Action menu | {SavedValue:FAEGMSID} | 1990-25   | {SavedValue:FATitle} | State | $10,000,000 | {SavedValue:FSEGMSID}  | {SavedValue:FSTitle} | Automation FD | Closed |
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    Then I see only the following headers in table with id "---fundingsource:-:fundingTableId---" :
      | Actions     | EGMS ID               | Fund Year | Title                | Type  | Cert Level  | Funding Source EGMS ID | Funding Source Title | Created By ID | Status |
      | Action menu | {SavedValue:FAEGMSID} | 1990-25   | {SavedValue:FATitle} | State | $10,000,000 | {SavedValue:FSEGMSID}  | {SavedValue:FSTitle} | Automation FD | Closed |

    Examples:
      | UserType |
      | FD       |
#      | EXE      |
#      | FO       |
#      | PM       |
#      | PO       |

  @519325 @519318 @519733 @519364 @519369 @Sprint-08 @US-518016 @M04 @M04Planning @sanitysuite
  Scenario Outline: Verify that FD user see that Y/N options are changed to 'Yes/No' for below fields in Overview Tab-->Basic Information section on Internal Funding Account layouts
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Overview" sub tab
    #519369
    Then I softly see field "Title" inside page block
    Then I softly see field "Fund Code" added after "Title"
    Then I softly see field "Year" added after "Fund Code"
    Then I softly see field "Fund Year" added after "Year"
    Then I softly see field "Short Description" inside page block
    Then I softly see field "Funding Type" added after "Short Description"
    Then I softly see field "Start Date" added after "Funding Source Type"
    Then I softly see field "End Date" added after "Start Date"
    #519369
    Then I softly see field "Fund Year" as "1990-25"
    #519364
    Then I softly see "Chart of Accounts" page block displayed
    #519325
    When I click on "Edit" in the page details
    Then I softly see field "GAPE" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_GAPE__c" :
      | --None-- | Yes | No |
    When I enter value "Yes" into field "NYSED_GAPE__c"
    Then I see only the following ordered options in dropdown field "NYSED_UnderReview__c" :
      | --None-- | Yes | No |
    When I enter value "Yes" into field "NYSED_UnderReview__c"
    Then I see only the following ordered options in dropdown field "NYSED_UNOBSUP__c" :
      | --None-- | Yes | No |
    When I enter value "Yes" into field "NYSED_UNOBSUP__c"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    Then I softly see field "GAPE" as "Yes"
    Then I softly see field "Under Review" as "Yes"
    Then I softly see field "UNOB/SUP" as "Yes"
    And I save the field labeled "Cert Level" as "AppropriationAmount"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
      #519369
    Then I softly see field "Title" inside page block
    Then I softly see field "Fund Code" added after "Title"
    Then I softly see field "Year" added after "Fund Code"
    Then I softly see field "Fund Year" added after "Year"
    Then I softly see field "Short Description" inside page block
    Then I softly see field "Funding Source Type" added after "Short Description"
    Then I softly see field "Start Date" added after "Funding Source Type"
    Then I softly see field "End Date" added after "Start Date"
    #519733
    Then I softly see field "Able to Pay?" as "No"
    Then I softly see field "Able to Pay?" is not editable
    When I hovering mouse on help text icon inside page block detail "Able to Pay?"
    Then I softly see "If 'No', payments can not be made from funding account. Click 'Release Payments' to set as 'Yes'. Click 'Stop Payments' to set as 'No'." shown as help text
    When I click on "Release Payments" in the page details
    And I wait for "3" seconds
    Then I softly see field "Able to Pay?" as "Yes"
    #519318
    Then I softly see field "Fund Year" as "1990-25"
     #519364
    Then I softly see "Chart of Accounts" page block displayed
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I navigate to "Overview" sub tab
    Then I softly see field "Fund Year" as "1990-25"
    #519325
    Then I softly see field "GAPE" inside page block
    #519364
    Then I softly see "Chart of Accounts" page block displayed
    #519369
    Then I softly see field "Title" inside page block
    Then I softly see field "Fund Code" added after "Title"
    Then I softly see field "Year" added after "Fund Code"
    Then I softly see field "Fund Year" added after "Year"
    Then I softly see field "Short Description" inside page block
    Then I softly see field "Funding Source Type" added after "Short Description"
    Then I softly see field "Start Date" added after "Funding Source Type"
    Then I softly see field "End Date" added after "Start Date"

    Examples:
      | OtherType |
      | FD        |

  @519372 @519373 @519734 @519374 @519375 @Sprint-08 @US-518016 @M04 @M04Planning
  Scenario Outline: Verify that 'hyphen' (-) is added in the Fund Year value in Overview Tab-->Basic Information section on External Funding Account layout
    When I login to "As a Grantor" app as "<OtherType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Overview" sub tab
    #519375
    Then I softly see field "Title" inside page block
    Then I softly see field "Fund Code" added after "Title"
    Then I softly see field "Year" added after "Fund Code"
    Then I softly see field "Fund Year" added after "Year"
    Then I softly see field "Short Description" inside page block
    Then I softly see field "Funding Source Type" added after "Short Description"
    Then I softly see field "Start Date" added after "Funding Source Type"
    Then I softly see field "End Date" added after "Start Date"
    #519372
    Then I softly see field "Fund Year" as "1990-25"
    #519374
    Then I softly see "Chart of Accounts" page block displayed
    #519373
    Then I softly see field "GAPE" inside page block
    When I click on "Edit" in the page details
    Then I see only the following ordered options in dropdown field "NYSED_GAPE__c" :
      | --None-- | Yes | No |
    When I enter value "Yes" into field "NYSED_GAPE__c"
    Then I see only the following ordered options in dropdown field "NYSED_UnderReview__c" :
      | --None-- | Yes | No |
    When I enter value "Yes" into field "NYSED_UnderReview__c"
    Then I see only the following ordered options in dropdown field "NYSED_UNOBSUP__c" :
      | --None-- | Yes | No |
    When I enter value "Yes" into field "NYSED_UNOBSUP__c"
    Then I see only the following ordered options in dropdown field "NYSED_ChgDate__c" :
      | --None-- | Yes | No |
    When I enter value "No" into field "NYSED_ChgDate__c"
    When I click on "Save" in the page details
    Then I softly see field "GAPE" as "Yes"
    Then I softly see field "Under Review" as "Yes"
    Then I softly see field "UNOB/SUP" as "Yes"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "361" into field "NYSED_LiqDate__c"
    Then I softly see field "Chg Date?" as "No"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    And I save the field labeled "Cert Level" as "AppropriationAmount"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #519375
    Then I softly see field "Title" inside page block
    Then I softly see field "Fund Code" added after "Title"
    Then I softly see field "Year" added after "Fund Code"
    Then I softly see field "Fund Year" added after "Year"
    Then I softly see field "Short Description" inside page block
    Then I softly see field "Funding Source Type" added after "Short Description"
    Then I softly see field "Start Date" added after "Funding Source Type"
    Then I softly see field "End Date" added after "Start Date"
    #519733
    Then I softly see field "Able to Pay?" as "No"
    Then I softly see field "Able to Pay?" is not editable
    When I hovering mouse on help text icon inside page block detail "Able to Pay?"
    Then I softly see "If 'No', payments can not be made from funding account. Click 'Release Payments' to set as 'Yes'. Click 'Stop Payments' to set as 'No'." shown as help text
    When I click on "Release Payments" in the page details
    And I wait for "3" seconds
    Then I softly see field "Able to Pay?" as "Yes"
    #519372
    Then I softly see field "Fund Year" as "1990-25"
    #519374
    Then I softly see "Chart of Accounts" page block displayed
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I navigate to "Overview" sub tab
    Then I softly see field "Fund Year" as "1990-25"
    #519374
    Then I softly see "Chart of Accounts" page block displayed
    #519375
    Then I softly see field "Title" inside page block
    Then I softly see field "Fund Code" added after "Title"
    Then I softly see field "Year" added after "Fund Code"
    Then I softly see field "Fund Year" added after "Year"
    Then I softly see field "Short Description" inside page block
    Then I softly see field "Funding Source Type" added after "Short Description"
    Then I softly see field "Start Date" added after "Funding Source Type"
    Then I softly see field "End Date" added after "Start Date"

    Examples:
      | OtherType |
      | FD        |

  @516406 @516436 @516480 @516511 @516524 @516534 @Sprint-08 @US-513806 @M04 @M04Planning
  Scenario: Verify that the FD user sees the 'Funding Source Type' field added under Internal Funding Account -> Overview tab -> Basic Information section and that State Fiscal Year values are populated up to SFY-75.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Overview" sub tab
    #516534
    Then I softly see field "School Year Level" inside page block
    When I click on "Edit" in the page details
    And I enter value "-100" into field "NYSED_SYAppr__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | School Year Level must be a positive value. |
    And I enter value "100" into field "NYSED_SYAppr__c"
    When I click on "Save" in the page details
    Then I softly see field "School Year Level" as "$100"
    #516406
    Then I softly see field "Funding Source Type" added after "Short Description"
    #516436
    And I click on "Edit" in the page details
    Then I softly see field "Contract?" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_Contract__c" :
      | --None-- | Grant contract | No |
    When I enter value "Grant contract" into field "NYSED_Contract__c"
    And I click on "Save" in the page details
    Then I softly see field "Contract?" as "Grant contract"
    Then I softly do not see "Account Source" page block displayed
    Then I softly do not see "Fund" page block displayed
    Then I softly do not see "Cost Category" page block displayed
    Then I softly do not see "Year Cen" page block displayed
     #516480
    When I click on "Edit" in the page details
    And I enter value "500.50" into field "NYSED_CstCntr__c" page block
    When I click on "Save" in the page details
    Then I softly see field "Cst Cntr" as "50,050"
    When I click on "Edit" in the page details
    And I enter value "-500.55" into field "NYSED_CstCntr__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Cst Cntr must be positive value. |
    And I enter value "12345678" into field "NYSED_CstCntr__c"
    When I click on "Save" in the page details
    Then I softly see field "Cst Cntr" as "123,456"
    When I click on "Edit" in the page details
    And I enter value "12345" into field "NYSED_CstCntr__c"
    When I click on "Save" in the page details
    Then I softly see field "Cst Cntr" as "12,345"
    When I click on "Edit" in the page details
    And I clear the value from field "NYSED_CstCntr__c"
    When I click on "Save" in the page details
    Then I softly see field "Cst Cntr" as ""
    #516511
    When I click on "Edit" in the page details
    And I enter value "@#$%" into field "NYSED_Variable__c"
    When I click on "Save" in the page details
    Then I softly see field "Variable" as "@#"
    When I click on "Edit" in the page details
    And I enter value "-1" into field "NYSED_Variable__c"
    When I click on "Save" in the page details
    Then I softly see field "Variable" as "-1"
    When I click on "Edit" in the page details
    And I enter value "ab" into field "NYSED_Variable__c"
    When I click on "Save" in the page details
    Then I softly see field "Variable" as "ab"
    When I click on "Edit" in the page details
    And I enter value "12345678" into field "NYSED_Variable__c"
    When I click on "Save" in the page details
    Then I softly see field "Variable" as "12"
    When I click on "Edit" in the page details
    And I enter value "a1" into field "NYSED_Variable__c"
    When I click on "Save" in the page details
    Then I softly see field "Variable" as "a1"
    When I click on "Edit" in the page details
    And I clear the value from field "NYSED_Variable__c"
    When I click on "Save" in the page details
    Then I softly see field "Variable" as ""
    #516524
    When I click on "Edit" in the page details
    And I enter value "@#$%" into field "NYSED_SFSYear__c"
    When I click on "Save" in the page details
    Then I softly see field "Year" as "@#"
    When I click on "Edit" in the page details
    And I enter value "-1" into field "NYSED_SFSYear__c"
    When I click on "Save" in the page details
    Then I softly see field "Year" as "-1"
    When I click on "Edit" in the page details
    And I enter value "ab" into field "NYSED_SFSYear__c"
    When I click on "Save" in the page details
    Then I softly see field "Year" as "ab"
    When I click on "Edit" in the page details
    And I enter value "12345678" into field "NYSED_SFSYear__c"
    When I click on "Save" in the page details
    Then I softly see field "Year" as "12"
    When I click on "Edit" in the page details
    And I enter value "a1" into field "NYSED_SFSYear__c"
    When I click on "Save" in the page details
    Then I softly see field "Year" as "a1"
    When I click on "Edit" in the page details
    And I clear the value from field "NYSED_SFSYear__c"
    When I click on "Save" in the page details
    Then I softly see field "Year" as ""

  @517283 @Sprint-08 @US-513806 @US-518023 @518417 @518419 @518430 @M04 @M04Planning
  Scenario Outline: Verify that other internal users except the FD user cannot edit the fields below: a. Cst Center, b. Variable, c. Year - Internal funding account
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "FUNDINGSOURCE"
    Given I navigate to "Overview" sub tab
    #518419
    Then I softly see field "Funding Type" added after "Title"
    #518430
    Then I see only the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Actions | Fund Year | Funding Account Title | Cert Level | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance | Status |
    #513804
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "FAEGMSID"
      #518417
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I see the following rows under the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Fund Year |
      | 1990-25   |
    And I click on back arrow
    When I re-login to "As a Grantor" app as "<OtherType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FAEGMSID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Cst Cntr" is not editable
    Then I softly see field "Variable" is not editable
    Then I softly see field "Year" is not editable
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FAEGMSID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I re-login to "As a Grantor" app as "<OtherType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FAEGMSID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Cst Cntr" is not editable
    Then I softly see field "Variable" is not editable
    Then I softly see field "Year" is not editable
    Examples:
      | OtherType |
      | PM        |
#      | PO        |
#      | FO        |
#      | EXE        |
#      | ADMIN     |

  @516535 @516537 @516538 @516540 @516542 @517275 @517280 @518427 @518431 @518437 @Sprint-08 @US-513806 @US-513804 @515972 @518177 @US-518023 @518418 @M04 @M04Planning
  Scenario: Verify that the FD user sees the 'Funding Source Type' field added under Internal Funding Account -> Overview tab -> Basic Information section and that State Fiscal Year values are populated up to SFY-75.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Federal Award Name" as "FederalAwardName"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    #518427
    Then I softly see fields "Title__c" is in edit mode
    And I enter value "Automation Test" into field "Title__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    #518437
    Then I softly see field "Federal Award Name" as "Automation Test"
    Given I navigate to "Overview" sub tab
    Then I softly see field "Federal Award Name" as "Automation Test"
    And I save the field labeled "EGMS ID" as "FUNDINGSOURCE"
    #515972
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:FederalAwardName}" into field "Title__c"
    And I enter value "500.50" into field "FAIN__c"
    When I click on "Save" in the page details
    Then I softly see field "FAIN" as "500.50"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "abc123" into field "FAIN__c"
    When I click on "Save" in the page details
    Then I softly see field "FAIN" as "abc123"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I clear the value from field "FAIN__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "FAIN" as ""
    #518431
    Then I see only the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Actions | Fund Year | Funding Account Title | Cert Level | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Total Obligation | Available Balance | Status |
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Overview" sub tab
    #517280
    Then I softly see field "Liquidate In Days" inside page block
    Then I softly see field "Liquidate In Days" as "120"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "124" into field "NYSED_LiquidateInDays__c"
    When I click on "Save" in the page details
    Then I softly see field "Liquidate In Days" as "124"
    #517275
    Then I softly see field "School Year Level" inside page block
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-100" into field "NYSED_SYAppr__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | School Year Level must be a positive value. |
    And I enter value "100" into field "NYSED_SYAppr__c"
    When I click on "Save" in the page details
    Then I softly see field "School Year Level" as "$100"
    #516535
    Then I softly see field "Funding Source Type" added after "Short Description"
    #516537
    And I click on "Edit" in the page details
    Then I softly see field "Contract?" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_Contract__c" :
      | --None-- | Grant contract | No |
    When I enter value "Grant contract" into field "NYSED_Contract__c"
    And I click on "Save" in the page details
    Then I softly see field "Contract?" as "Grant contract"
    Then I softly do not see "Account Source" page block displayed
    Then I softly do not see "Fund" page block displayed
    Then I softly do not see "Cost Category" page block displayed
    Then I softly do not see "Year Cen" page block displayed
     #516538
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "@#$%" into field "NYSED_CstCntr__c"
    When I click on "Save" in the page details
    Then I softly see field "Cst Cntr" as ""
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "500.50" into field "NYSED_CstCntr__c" page block
    When I click on "Save" in the page details
    Then I softly see field "Cst Cntr" as "500"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-500.55" into field "NYSED_CstCntr__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Cst Cntr must be positive value. |
    And I enter value "12345678" into field "NYSED_CstCntr__c"
    When I click on "Save" in the page details
    Then I softly see field "Cst Cntr" as "123,456"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "12345" into field "NYSED_CstCntr__c"
    When I click on "Save" in the page details
    Then I softly see field "Cst Cntr" as "12,345"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I clear the value from field "NYSED_CstCntr__c"
    When I click on "Save" in the page details
    Then I softly see field "Cst Cntr" as ""
    #516540
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "@#$%" into field "NYSED_Variable__c"
    When I click on "Save" in the page details
    Then I softly see field "Variable" as "@#"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-1" into field "NYSED_Variable__c"
    When I click on "Save" in the page details
    Then I softly see field "Variable" as "-1"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "ab" into field "NYSED_Variable__c"
    When I click on "Save" in the page details
    Then I softly see field "Variable" as "ab"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "12345678" into field "NYSED_Variable__c"
    When I click on "Save" in the page details
    Then I softly see field "Variable" as "12"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "a1" into field "NYSED_Variable__c"
    When I click on "Save" in the page details
    Then I softly see field "Variable" as "a1"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I clear the value from field "NYSED_Variable__c"
    When I click on "Save" in the page details
    Then I softly see field "Variable" as ""
    #516542
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "@#$%" into field "NYSED_SFSYear__c"
    When I click on "Save" in the page details
    Then I softly see field "Year" as "@#"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "-1" into field "NYSED_SFSYear__c"
    When I click on "Save" in the page details
    Then I softly see field "Year" as "-1"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "ab" into field "NYSED_SFSYear__c"
    When I click on "Save" in the page details
    Then I softly see field "Year" as "ab"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "12345678" into field "NYSED_SFSYear__c"
    When I click on "Save" in the page details
    Then I softly see field "Year" as "12"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "a1" into field "NYSED_SFSYear__c"
    When I click on "Save" in the page details
    Then I softly see field "Year" as "a1"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I clear the value from field "NYSED_SFSYear__c"
    When I click on "Save" in the page details
    Then I softly see field "Year" as ""
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    #518418
    Then I see the following rows under the following headers in table with id "---fundingsource:-:fundingAccountTableId---" :
      | Fund Year |
      | 1990-25   |
    And I click on back arrow
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #518177
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "5" seconds
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "FAIN" is not editable
    And I click on back arrow
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I navigate to "Overview" sub tab
    Then I softly do not see "Account Source" page block displayed
    Then I softly do not see "Fund" page block displayed
    Then I softly do not see "Cost Category" page block displayed
    Then I softly do not see "Year Cen" page block displayed
    #517280
    Then I softly see field "Liquidate In Days" inside page block
    When I click on "Edit" in the page details
    And I enter value "124" into field "NYSED_LiquidateInDays__c"
    When I click on "Save" in the page details
    Then I softly see field "Liquidate In Days" as "124"
    #518177
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "5" seconds
    And I refresh the page
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "FAIN" is not editable

  @517284 @Sprint-08 @US-513806 @M04 @M04Planning
  Scenario Outline: Verify that other internal users except the FD user cannot edit the fields below: a. Cst Center, b. Variable, c. Year - Internal funding account
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "FAEGMSID"
    When I re-login to "As a Grantor" app as "<OtherType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FAEGMSID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Cst Cntr" is not editable
    Then I softly see field "Variable" is not editable
    Then I softly see field "Year" is not editable
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FAEGMSID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I re-login to "As a Grantor" app as "<OtherType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - All"
    When I perform quick search for "{SavedValue:FAEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    When I click on "View" icon for "{SavedValue:FAEGMSID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Cst Cntr" is not editable
    Then I softly see field "Variable" is not editable
    Then I softly see field "Year" is not editable
    Examples:
      | OtherType |
      | PM        |
#      | PO        |
#      | FO        |
#      | EXE       |
#      | ADMIN     |

  @498726-2 @498731 @498728 @Sprint-08 @US-513806 @M04 @M04Planning
  Scenario Outline:Verify that 'Able to Pay?' field is added on funding account header row and is a dropdown field - External Funding Account
  |Verify that 'Release Payments' button is visible on page layout when funding account is in 'Active' state, 'Able to Pay?' is set to No and when clicked on Release Payments, 'Able to Pay?' is set to Yes- External Funding Account|
  |Verify that "If 'No', payments can not be made from funding account. Click 'Release Payments' to set as 'Yes'. Click 'Stop Payments' to set as 'No'." text is displaying on help text icon of 'Able to Pay?' - External Funding Account|
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "50" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see field "Able to Pay?" as "No"
    Then I softly can see top right dropdown button "Release Payments" in page detail
    When I click on "Release Payments" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see field "Able to Pay?" as "Yes"
    When I hovering mouse on help text icon inside page block detail "Able to Pay?"
    Then I softly see "If 'No', payments can not be made from funding account. Click 'Release Payments' to set as 'Yes'. Click 'Stop Payments' to set as 'No'." shown as help text
    When I click on "Stop Payments" in the page details
    Then I softly see field "Able to Pay?" as "No"

    Examples:
      | UserType |
      | FD       |

  @498736-2 @498734 @Sprint-08 @US-513806 @M04 @M04Planning
  Scenario Outline: Verify that a 'Release Payments' button is not visible on page layout when funding account is in 'Created' and 'Closed' state - External Funding Account
  |Verify that a 'Stop Payments' button is not visible on page layout when funding account is in 'Created' and 'Closed' state - External Funding Account|
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see field "Able to Pay?" as "No"
    Then I softly cannot see top right dropdown button "Release Payments" in page detail
    Then I softly cannot see top right dropdown button "Stop Payments" in page detail
    When I click on "Activate" in the page details
    When I click on "Release Payments" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    Then I softly see field "Able to Pay?" as "Yes"
    Then I softly cannot see top right dropdown button "Release Payments" in page detail
    Then I softly cannot see top right dropdown button "Stop Payments" in page detail

    Examples:
      | UserType |
      | FD       |

  @498880-2 @498879 @Sprint-08 @US-513806 @M04 @M04Planning
  Scenario Outline:Verify that a 'Release Payments' button is not visible to other internal users except FD user on page layout when funding account is in 'Active' state and 'Able to Pay?' is set to No - External Funding Account
  |Verify that a 'Stop Payments' button is not visible to other internal users except FD user on page layout when funding account is in 'Active' state and 'Able to Pay?' is set to Yes - External Funding Account|
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "fundingAccountEGMSID"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Active"
    When I perform quick search for "{SavedValue:fundingAccountEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:fundingAccountEGMSID}" inside flex table with id "---fundingsource:-:fundingTableId---"
    Then I softly see field "Able to Pay?" as "No"
    Then I softly cannot see top right dropdown button "Release Payments" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Active"
    When I perform quick search for "{SavedValue:fundingAccountEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:fundingAccountEGMSID}" inside flex table with id "---fundingsource:-:fundingTableId---"
    When I click on "Release Payments" in the page details
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Funding Accounts - Active"
    When I perform quick search for "{SavedValue:fundingAccountEGMSID}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:fundingAccountEGMSID}" inside flex table with id "---fundingsource:-:fundingTableId---"
    Then I softly see field "Able to Pay?" as "Yes"
    Then I softly cannot see top right dropdown button "Stop Payments" in page detail

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |
#      | FO       |
#      | Admin    |

  @535881 @535905 @535614 @536289 @535621 @sprint-13 @US-534107 @US-533092 @M04 @M04Planning
  Scenario Outline: Verify that internal users see a new section, 'Funding Account Messages', has been added under the Messages tab on the State Funding Account layout.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    #535614
    Then I softly see field "Blanket Voucher Cut (%)" inside page block
    And I click on "Edit" in the page details
    And I clear the value from field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    #535614
    Then I softly cannot see the following messages in the page details contains:
      | To Save, Blanket Voucher Cut (%) is required in the Overview tab under the Basic Information section. |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "-10" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    #535614
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Blanket Voucher Cut (%) cannot be negative. |
    When I enter value "110" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    #535614
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Blanket Voucher Cut (%) cannot be more than 100%. |
    When I enter value "#2e2" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    Then I softly see field "Blanket Voucher Cut (%)" as ""
    And I click on "Edit" in the page details
    When I enter value "10.90" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    #535614
    Then I softly see field "Blanket Voucher Cut (%)" as "10.90%"
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    #535614
    Then I softly see field "Blanket Voucher Cut (%)" as "10.00%"
    When I navigate to "Messages" sub tab
    #535881
    Then I softly see "Funding Account Message" page block displayed
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536289
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Blanket Voucher Cut (%)" rendered in view mode only
    When I navigate to "Messages" sub tab
    #535881
    Then I softly see "Funding Account Message" page block displayed
    #535905
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Funding Account Message" rendered in view mode only
    And I navigate to "Overview" sub tab
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #535621
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Overview" sub tab
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I softly see that "Blanket Voucher Cut (%)" rendered in view mode only
    When I navigate to "Messages" sub tab
    #535881
    Then I softly see "Funding Account Message" page block displayed
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536289
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Blanket Voucher Cut (%)" rendered in view mode only
    When I navigate to "Messages" sub tab
    #535881
    Then I softly see "Funding Account Message" page block displayed
    #535905
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Funding Account Message" rendered in view mode only
    And I navigate to "Overview" sub tab
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I navigate to "Overview" sub tab
    When I navigate to "Messages" sub tab
    #535881
    Then I softly see "Funding Account Message" page block displayed
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536289
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Blanket Voucher Cut (%)" rendered in view mode only
    When I navigate to "Messages" sub tab
    #535881
    Then I softly see "Funding Account Message" page block displayed
    #535905
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Funding Account Message" rendered in view mode only
    And I navigate to "Overview" sub tab
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only

    Examples:
      | OtherUsers |
      | PM         |
#      | PO         |
#      | EXE        |
#      | FO         |
#      | Admin      |

  @535898 @535903 @535888 @sprint-13 @US-534107 @M04 @M04Planning
  Scenario Outline: Verify that FD users see the following new fields added under the Overview tab -> Chart of Accounts section on the State Funding Account layout and that it is not editable.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FundingSourceID"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    #535898
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    And I enter value "" into field "NYSED_AcctMsg__c" page block
    And I click on "Save" in the page details
    #535888
    Then I softly see field "Funding Account Message" as ""
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "{AUTOEnvData:Char256}" into field "NYSED_AcctMsg__c" page block
    And I click on "Save" in the page details
    #535888
    Then I softly see field "Funding Account Message" as "{AUTOEnvData:Char255}"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #535903
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Funding Account Message" rendered in view mode only
    And I navigate to "Overview" sub tab
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    When I navigate to "Messages" sub tab
    Then I softly see that "Funding Account Message" rendered in view mode only
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I navigate to "Messages" sub tab
    And I click on "Edit" in the page details
    And I enter value "" into field "NYSED_AcctMsg__c" page block
    And I click on "Save" in the page details
    #535888
    Then I softly see field "Funding Account Message" as ""
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "{AUTOEnvData:Char256}" into field "NYSED_AcctMsg__c" page block
    And I click on "Save" in the page details
    #535888
    Then I softly see field "Funding Account Message" as "{AUTOEnvData:Char255}"
    #535905
    Then I softly see that "Funding Account Message" rendered in view mode only
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    #535898
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only

    Examples:
      | UserType |
      | FD       |

  @535624 @535625 @536288 @sprint-13 @US-533092 @M04 @M04Planning
  Scenario Outline:Verify that the FD user sees the new picklist field 'Can Pay?' added after the field 'EDGAPS Date' under Federal Funding Account -> Overview tab -> Basic Information section and that it is editable in a created or closed states.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    #535624
    Then I softly see field "Blanket Voucher Cut (%)" inside page block
    And I click on "Edit" in the page details
    And I clear the value from field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    #535624
    Then I softly cannot see the following messages in the page details contains:
      | To Save, Blanket Voucher Cut (%) is required in the Overview tab under the Basic Information section. |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "-10" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    #535624
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Blanket Voucher Cut (%) cannot be negative. |
    And I wait for "2" seconds
    When I enter value "110" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    And I wait for "4" seconds
    #535624
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Blanket Voucher Cut (%) cannot be more than 100%. |
    When I enter value "#2e2" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    Then I softly see field "Blanket Voucher Cut (%)" as ""
    And I click on "Edit" in the page details
    When I enter value "10.908" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    #535624
    Then I softly see field "Blanket Voucher Cut (%)" as "10.90%"
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    #535624
    Then I softly see field "Blanket Voucher Cut (%)" as "10.00%"
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536288
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Blanket Voucher Cut (%)" rendered in view mode only
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #535625
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I softly see that "Blanket Voucher Cut (%)" rendered in view mode only
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536288
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I softly see that "Blanket Voucher Cut (%)" rendered in view mode only
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I navigate to "Overview" sub tab
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #536288
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Blanket Voucher Cut (%)" rendered in view mode only


    Examples:
      | OtherUsers |
      | PM         |
#      | PO         |
#      | EXE        |
#      | FO         |
#      | Admin      |

  @537497 @537496 @537495 @537494 @540869 @540881 @540868 @NYSEDSprint-14 @NYSEDSprint-16 @US-535784 @US-540396 @M04 @M04Planning @stateFC
  Scenario Outline: Verify that the FD user sees the updated help text of the Outstanding Encumbrance field on the State Funding Source and Account layout.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I hovering mouse on help text icon inside page block detail "Outstanding Encumbrance"
    #537497
    Then I softly see "Amount that one has a legal obligation to spend in the future. Computed from funds committed towards Subawards." shown as help text
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I hovering mouse on help text icon inside page block detail "Outstanding Encumbrance"
    #537497
    Then I softly see "Amount that one has a legal obligation to spend in the future. Computed from funds committed towards Subawards." shown as help text
     #537495
    Then I softly cannot see top right button "Enter Message & Priority" in page detail
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #537496
    Then I softly cannot see top right button "Enter Message & Priority" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #540868
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I see field "Priority" as "Low"
    Then I softly see asterisk mark on "Priority"
    When I click on "Edit" in the page details
    #540868
    Then I see only the following ordered options in dropdown field "NYSED_Priority__c" :
      | --None-- | Low | Medium | High |
    And I enter value "--None--" into field "NYSED_Priority__c"
    When I click on "Save" in the page details
    #540868
    Then I softly see the following messages in the page details contains:
      | To Save, Priority is required in the Overview tab under the Basic Information section. |
    And I enter value "Medium" into field "NYSED_Priority__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #540868
    Then I see field "Priority" as "Medium"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #537494 #540881
    Then I softly can see top right button "Enter Message & Priority" in page detail
    When I click on "Enter Message & Priority" in the page details
    Then I softly see "Enter Funding Account Details" opens in overLay window
    And I navigate to "Funding Account Information" sub tab
    Then I softly see "Add/Edit Details" page block displayed
    #540881
    Then I see only the following ordered options in dropdown field "NYSED_Priority__c" :
      | --None-- | Low | Medium | High |
    When I enter in modal value "--None--" into field "NYSED_Priority__c"
    When I click modal button "Save"
    #540881
    Then I softly see the following messages in the page details contains:
      | To Save, Priority is required. |
    When I enter in modal value "Low" into field "NYSED_Priority__c"
    When I click modal button "Save"
    #537494 #540881
    Then I see field "Priority" as "Low" on modal
    Then I softly see asterisk mark on "Priority"
    When I click modal button "Edit"
    When I enter in modal value "{SavedValue:Char256}" into field "NYSED_AcctMsg__c"
    When I click modal button "Save"
    #537494 #540881
    Then I see field "Funding Account Message" as "{SavedValue:Char255}" on modal
    When I click modal button "Close"
    #540869
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Priority" rendered in view mode only
    #540881
    Then I see field "Priority" as "Low"
    And I navigate to "Messages" sub tab
    #537494
    Then I softly see "Funding Account Message" page block displayed
    Then I softly do not see "Funding Account Messages" page block displayed
    #537494 #540881
    Then I see field "Funding Account Message" as "{SavedValue:Char255}" on modal
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
     #537495
    Then I softly cannot see top right button "Enter Message & Priority" in page detail
    And I navigate to "Overview" sub tab
    #540868
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I see field "Priority" as "Low"
    Then I softly see asterisk mark on "Priority"
    When I click on "Edit" in the page details
    #540868
    Then I see only the following ordered options in dropdown field "NYSED_Priority__c" :
      | --None-- | Low | Medium | High |
    And I enter value "--None--" into field "NYSED_Priority__c"
    When I click on "Save" in the page details
    #540868
    Then I softly see the following messages in the page details contains:
      | To Save, Priority is required in the Overview tab under the Basic Information section. |
    And I enter value "High" into field "NYSED_Priority__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #540868
    Then I see field "Priority" as "High"
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #537496
    Then I softly cannot see top right button "Enter Message & Priority" in page detail

    Examples:
      | OtherUsers |
      | PM         |
#      | PO         |
#      | EXE        |
#      | FO         |
#      | Admin      |

  @537502 @537500 @537499 @537498 @540895 @540896 @540893 @NYSEDSprint-13 @NYSEDSprint-16 @US-535784 @US-540396 @M04 @M04Planning @federalFC
  Scenario Outline: Verify that the FD user sees the help text for the Pre-Encumbrance and Outstanding Encumbrance fields added on the Federal Funding Source Account layout and the help text of the Outstanding Encumbrance field is updated on Federal Funding Account layout.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I hovering mouse on help text icon inside page block detail "Outstanding Encumbrance"
    #537502
    Then I softly see "Amount that one has a legal obligation to spend in the future. Computed from funds committed towards Subawards." shown as help text
    When I hovering mouse on help text icon inside page block detail "Pre-Encumbrance"
    #537502
    Then I softly see "Amount that one expects to spend, but for which one has no legal obligation. Computed from funds committed towards Announcements and FDM." shown as help text
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    #537499
    Then I softly cannot see top right button "Enter Message & Priority" in page detail
    When I hovering mouse on help text icon inside page block detail "Outstanding Encumbrance"
    #537502
    Then I softly see "Amount that one has a legal obligation to spend in the future. Computed from funds committed towards Subawards." shown as help text
    When I hovering mouse on help text icon inside page block detail "Pre-Encumbrance"
    #537502
    Then I softly see "Amount that one expects to spend, but for which one has no legal obligation. Computed from funds committed towards Annoucements and FDM." shown as help text
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #537496
    Then I softly cannot see top right button "Enter Message & Priority" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #540893
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I see field "Priority" as "Low"
    Then I softly see asterisk mark on "Priority"
    When I click on "Edit" in the page details
    #540893
    Then I see only the following ordered options in dropdown field "NYSED_Priority__c" :
      | --None-- | Low | Medium | High |
    And I enter value "--None--" into field "NYSED_Priority__c"
    When I click on "Save" in the page details
    #540893
    Then I softly see the following messages in the page details contains:
      | To Save, Priority is required in the Overview tab under the Basic Information section. |
    And I enter value "Medium" into field "NYSED_Priority__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #540893
    Then I see field "Priority" as "Medium"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #537498 #540896
    Then I softly can see top right button "Enter Message & Priority" in page detail
    When I click on "Enter Message & Priority" in the page details
    Then I softly see "Enter Funding Account Details" opens in overLay window
    And I navigate to "Funding Account Information" sub tab
    Then I softly see "Add/Edit Details" page block displayed
    #540896
    Then I see only the following ordered options in dropdown field "NYSED_Priority__c" :
      | --None-- | Low | Medium | High |
    When I enter in modal value "--None--" into field "NYSED_Priority__c"
    When I click modal button "Save"
    #540896
    Then I softly see the following messages in the page details contains:
      | To Save, Priority is required. |
    When I enter in modal value "Low" into field "NYSED_Priority__c"
    When I click modal button "Save"
    #537498 #540896
    Then I see field "Priority" as "Low" on modal
    Then I softly see asterisk mark on "Priority"
    When I click modal button "Edit"
    When I enter in modal value "{SavedValue:Char256}" into field "NYSED_AcctMsg__c"
    When I click modal button "Save"
    #537498
    Then I see field "Funding Account Message" as "{SavedValue:Char255}" on modal
    When I click modal button "Close"
    #540895
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Priority" rendered in view mode only
    #540896
    Then I see field "Priority" as "Low"
    And I navigate to "Messages" sub tab
    #537498
    Then I softly see "Funding Account Message" page block displayed
    Then I softly do not see "Funding Account Messages" page block displayed
    #537498 #540896
    Then I see field "Funding Account Message" as "{SavedValue:Char255}" on modal
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    #537499
    Then I softly cannot see top right button "Enter Message & Priority" in page detail
    And I navigate to "Overview" sub tab
    #540893
    Then I softly see field "Blanket Voucher Cut (%)" added after "Priority"
    Then I see field "Priority" as "Low"
    Then I softly see asterisk mark on "Priority"
    When I click on "Edit" in the page details
    #540893
    Then I see only the following ordered options in dropdown field "NYSED_Priority__c" :
      | --None-- | Low | Medium | High |
    And I enter value "--None--" into field "NYSED_Priority__c"
    When I click on "Save" in the page details
    #540893
    Then I softly see the following messages in the page details contains:
      | To Save, Priority is required in the Overview tab under the Basic Information section. |
    And I enter value "High" into field "NYSED_Priority__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #540893
    Then I see field "Priority" as "High"
    When I re-login to "As a Grantor" app as "<OtherUsers>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    #537496
    Then I softly cannot see top right button "Enter Message & Priority" in page detail

    Examples:
      | OtherUsers |
      | PM         |
#      | PO         |
#      | EXE        |
#      | FO         |
#      | Admin      |

  @545966 @545947 @NYSEDSprint-19 @US-537663 @GSPS-No @federalFC @October2025
  Scenario:Verify that with FD Profile 'Edit Cap' button unable to see only if 'GSPS?' Value is set to NO for Federal - Funding Source.
  |Verify that the FD users see that the short text field 'GSPS?' added on the Federal Funding Source layout and that it is required to save.- Federal Funding Account|
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "--None--" into field "NYSED_GSPS__c"
    Given I navigate to "Overview" sub tab
    #545947
    Then I see only the following ordered options in dropdown field "NYSED_GSPS__c" :
      | --None-- | Yes | No |
    When I click on "Save" in the page details
     #545947
    Then I softly see the following messages in the page details contains:
      | To Save, GSPS? is required in the Overview tab under the Information section. |
    When I enter value "Yes" into field "NYSED_GSPS__c"
    When I enter value "20" into field "NYSED_Expenditure_Cap__c"
    When I click on "Save" in the page details
    #545947
    Then I softly see asterisk mark on "GSPS?"
    Then I softly see field "GSPS?" as "Yes"
    When I click on "Edit" in the page details
    When I enter value "No" into field "NYSED_GSPS__c"
    When I click on "Save" in the page details
    #545947
    Then I softly see field "GSPS?" as "No"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    #545966 #545947
    Then I softly cannot see top right button "Edit Cap" in page detail

  @546149 @545965 @546166 @NYSEDSprint-19 @US-537663 @GSPS-Yes @federalFC @October2025
  Scenario Outline: Verify that the FD profile 'Edit Cap' button able to see on Active Federal - Funding Source layout.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "No" into field "NYSED_GSPS__c"
    When I click on "Save" in the page details
    #546149
    Then I softly see field "GSPS?" as "No"
    When I click on "Edit" in the page details
    When I enter value "Yes" into field "NYSED_GSPS__c"
    #546149
    Then I softly see field "Expenditure Cap" inside page block
    When I click on "Save" in the page details
    #546149
    Then I softly see the following messages in the page details contains:
      | To Save, Expenditure Cap is required in the Overview tab under the Information section. |
    When I enter value "20" into field "NYSED_Expenditure_Cap__c"
    When I click on "Save" in the page details
    #546149
    Then I softly see field "Expenditure Cap" as "$20"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "fundingAccountEGMSID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "2" seconds
    #546166
    Then I softly cannot see top right button "Edit Cap" in page detail
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I wait for "2" seconds
    #545965 #546166
    Then I softly cannot see top right button "Edit Cap" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "2" seconds
    #545965
    Then I softly can see top right button "Edit Cap" in page detail
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I wait for "2" seconds
    #545965 #546166
    Then I softly cannot see top right button "Edit Cap" in page detail

    Examples:
      | InternalUser |
      | PM           |
#      | PO           |
#      | FO           |
#      | EXE          |
#      | ADMIN        |

  @545959 @545964 @545581 @NYSEDSprint-19 @US-537663 @GSPS-No @federalFC @October2025
  Scenario:Verify that when an FD user creates a new Federal Funding Source and tries to activate the funding account without entering a value in the newly added field on the Funding Source layout, a validation message is displayed.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "--None--" into field "NYSED_GSPS__c"
    Given I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "fundingAccountEGMSID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    #545959
    Then I softly see the following messages in the page details contains:
      | Funding Source - Overview tab - GSPS? value is required for activation. |
    #545581
    Then I softly see the following messages in the page details contains:
      | Funding Source - Overview Tab - Assistance Listing Title is required before activation.     |
      | Funding Source - Overview Tab - Federal Awarding Agency Code is required before activation. |
      | Funding Source - Overview Tab - Is the award R & D? is required before activation.          |
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "Yes" into field "NYSED_GSPS__c"
    When I enter value "20" into field "NYSED_Expenditure_Cap__c"
    And I click on "Save" in the page details
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
    And I click on "Edit Cap" in the page details
    #545964
    Then I softly see "Edit Cap" opens in overLay window
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly see "View/Edit" page block displayed
    And I clear in modal the value from field "NYSED_Expenditure_Cap__c"
    When I click modal button "Save"
    #545964
    Then I softly see the following messages in the page details contains:
      | To Save, Expenditure Cap is required. |
    When I enter in modal value "-1" into field "NYSED_Expenditure_Cap__c"
    When I click modal button "Save"
    #545964
    Then I softly see the following messages in the page details contains:
      | Overview tab - The Expenditure cap cannot be less than 'Expenditure Paid to Date'. |
    When I enter in modal value "1999" into field "NYSED_Expenditure_Cap__c"
    When I click modal button "Save"
    #545964
    Then I softly cannot see the following messages in the page details contains:
      | Overview tab - The Expenditure cap cannot be less than 'Expenditure Paid to Date'. |
    Then I softly see field "Expenditure Cap" as "$1,999"
    When I click modal button "Close"
    Then I softly see field "Expenditure Cap" as "$1,999"

  @545548 @545547 @545546 @545549 @545541 @545545 @545544 @NYSEDSprint-19 @US-544469 @federalFC @October2025
  Scenario:Verify that the FD users see that the short text field 'Federal Message' added on the Federal Funding Source layout and that it is optional.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "--None--" into field "NYSED_RD__c"
    When I enter value "--None--" into field "NYSED_GSPS__c"
    When I clear the value from field "ProgramCode__c"
    When I clear the value from field "PCA__c"
    When I click on "Save" in the page details
    #545547 #545544
    Then I softly see the following messages in the page details contains:
      | To Save, Federal Awarding Agency Code is required in the Overview tab under the Information section. |
    #545546
    Then I softly see the following messages in the page details contains:
      | To Save, Assistance Listing Title is required in the Overview tab under the Information section. |
    #545549
    Then I softly see the following messages in the page details contains:
      | To Save, Is the award R & D? is required in the Overview tab under the Information section. |
    When I enter value "No" into field "NYSED_GSPS__c"
    When I enter value "{SavedValue:Char256}" into field "ProgramCode__c"
    When I enter value "{SavedValue:Char256}" into field "PCA__c"
    When I enter value "{SavedValue:Char256}" into field "OrgCode__c"
    When I enter value "Yes" into field "NYSED_RD__c"
    Then I see only the following ordered options in dropdown field "NYSED_RD__c" :
      | --None-- | Yes | No |
    When I click on "Save" in the page details
    #545547
    Then I softly see field "Federal Awarding Agency Code" as "{SavedValue:Char255}"
    Then I softly see asterisk mark on "Federal Awarding Agency Code"
    Then I softly see field "Federal Awarding Agency Code" inside page block
    #545546
    Then I softly see field "Assistance Listing Title" as "{SavedValue:Char255}"
    Then I softly see asterisk mark on "Assistance Listing Title"
    Then I softly see field "Assistance Listing Title" inside page block
    #545549
    Then I softly see field "Is the award R & D?" as "Yes"
    Then I softly see asterisk mark on "Is the award R & D?"
    Then I softly see field "Is the award R & D?" inside page block
    When I click on "Edit" in the page details
    When I clear the value from field "OrgCode__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #545548
    Then I softly see field "Federal Message" as ""
    When I click on "Edit" in the page details
    When I enter value "{SavedValue:Char256}" into field "OrgCode__c"
    When I click on "Save" in the page details
    #545548
    Then I softly see field "Federal Message" as "{SavedValue:Char255}"
    Then I softly do not see asterisk mark on "Federal Message"
    #545541
    Then I see only the following ordered page blocks :
      | Information | Funding Source - Funding Information | Funding Accounts | System Information |
    #545545 #545544
    Then I see below fields in "Information" page block
      | Federal Award Name | Funding Type | Assistance Listing Number | Assistance Listing Title | Start Date | End Date | FAIN | Federal Award Date | Federal Awarding Agency Code | Federal Awarding Agency Name | Federal Award Amount | Federal Message | Is the award R & D? | GSPS? |
    #545544
    Then I softly cannot see field "Fund Code" inside page block
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "fundingAccountEGMSID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    When I click on "Activate" in the page details
    #545548 #545547 #545546 #545544
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "3" seconds
    #545545
    Then I see below fields in "Information" page block
      | Federal Award Name | Funding Type | Assistance Listing Number | Assistance Listing Title | Start Date | End Date | FAIN | Federal Award Date | Federal Awarding Agency Code | Federal Awarding Agency Name | Federal Award Amount | Federal Message | Is the award R & D? | GSPS? |

  @545550 @545578 @545542 @NYSEDSprint-19 @US-544469 @federalFC @October2025 @Bug-Ticket-NYSED-1206
  Scenario Outline: Verify that the FD users cannot edit the following fields when the federal funding source is in the active or closed state.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "--None--" into field "NYSED_RD__c"
    When I enter value "No" into field "NYSED_GSPS__c"
    When I enter value "{SavedValue:Char256}" into field "ProgramCode__c"
    When I enter value "{SavedValue:Char256}" into field "PCA__c"
    When I enter value "{SavedValue:Char256}" into field "OrgCode__c"
    When I enter value "Yes" into field "NYSED_RD__c"
    When I enter value "{SavedValue:Char256}" into field "OrgCode__c"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I wait for "2" seconds
    #545578
    Then I softly see that "Assistance Listing Title" rendered in view mode only
    Then I softly see that "Federal Awarding Agency Code" rendered in view mode only
    Then I softly see that "Federal Message" rendered in view mode only
    Then I softly see that "Is the award R & D?" rendered in view mode only
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:externalFundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:externalFundingTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    #545550
    Then I softly see that "Assistance Listing Title" rendered in view mode only
    Then I softly see that "Federal Awarding Agency Code" rendered in view mode only
    Then I softly see that "Federal Message" rendered in view mode only
    Then I softly see that "Is the award R & D?" rendered in view mode only
    #545542
    Then I softly see field "School Year Level" as "$0"
    Then I softly see field "Cert Level" as "$10,000,000"
    #545542
    Then I softly see the following messages in the page details contains:
      | The Cert Level amount exceeds the School Year Level amount for this Funding Source. |
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    #545550
    Then I softly see that "Assistance Listing Title" rendered in view mode only
    Then I softly see that "Federal Awarding Agency Code" rendered in view mode only
    Then I softly see that "Federal Message" rendered in view mode only
    Then I softly see that "Is the award R & D?" rendered in view mode only
    #545542
    Then I softly see the following messages in the page details contains:
      | The Cert Level amount exceeds the School Year Level amount for this Funding Source. |

    Examples:
      | InternalUser |
      | PM           |
#      | PO           |
#      | FO           |
#      | EXE          |
#      | ADMIN        |

  @545951 @546167 @NYSEDSprint-19 @US-537663 @GSPS-No @stateFC @October2025
  Scenario Outline: Verify that the FD users see that the short text field 'Expenditure Cap' able to see if GSPS? is set to YES State Funding Source layout and that it is required to save.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "No" into field "NYSED_GSPS__c"
    When I click on "Save" in the page details
    #545951
    Then I softly see field "GSPS?" as "No"
    When I click on "Edit" in the page details
    When I enter value "Yes" into field "NYSED_GSPS__c"
    #545951
    Then I softly see field "Expenditure Cap" inside page block
    When I click on "Save" in the page details
    #545951
    Then I softly see the following messages in the page details contains:
      | To Save, Expenditure Cap is required in the Overview tab under the Information section. |
    When I enter value "20.00" into field "NYSED_Expenditure_Cap__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #545951
    Then I softly see field "Expenditure Cap" as "$2,000"
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingAccountEGMSID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    #545965
    Then I softly cannot see top right button "Edit Cap" in page detail
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    And I wait for "2" seconds
    #545965
    Then I softly cannot see top right button "Edit Cap" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    #545965
    Then I softly can see top right button "Edit Cap" in page detail
    When I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FUNDINGSOURCE}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FUNDINGSOURCE}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    And I wait for "2" seconds
    #545965 #546167
    Then I softly cannot see top right button "Edit Cap" in page detail

    Examples:
      | InternalUser |
      | PM           |
#      | PO           |
#      | FO           |
#      | EXE          |
#      | ADMIN        |

  @546163 @545565 @545570 @545566 @NYSEDSprint-19 @US-544466 @US-537663 @GSPS-No @stateFC @October2025 @Bug-Ticket-NYSED-1206
  Scenario:Verify that with FD Profile 'Edit Cap' button unable to see only if 'GSPS?' Value is set to NO State - Funding Source
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "No" into field "NYSED_GSPS__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #545565
    Then I softly see "Funding Source - Funding Information" page block displayed
    #545570
    Then I see below fields in "Information" page block
      | Title | Funding Type | Start Date | End Date | GSPS? |
    Then I softly cannot see field "Fund Code" inside page block
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "2000" into field "NYSED_SYAppr__c"
    When I enter value "20000" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    #545570
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly cannot see the following messages in the page details contains:
      | Funding Source - Overview Tab - Fund Code is required and must contain 4 digits. |
    Then I softly see field "School Year Level" as "$2,000"
    Then I softly see field "Cert Level" as "$20,000"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
    #546163
    Then I softly cannot see top right button "Edit Cap" in page detail
    #545565
    Then I softly see "Funding Source - Funding Information" page block displayed
    #545570
    Then I see below fields in "Information" page block
      | Title | Funding Type | Start Date | End Date | GSPS? |
      #545566
    Then I softly see the following messages in the page details contains:
      | The Cert Level amount exceeds the School Year Level amount for this Funding Source. |
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
    #545566
    Then I softly see the following messages in the page details contains:
      | The Cert Level amount exceeds the School Year Level amount for this Funding Source. |
    #545565
    Then I softly see "Funding Source - Funding Information" page block displayed

  @546158 @546159 @NYSEDSprint-19 @US-537663 @GSPS-No @stateFC @October2025
  Scenario:Verify that when an FD user creates a new State Funding Source and tries to activate the funding account without entering a value in the newly added field on the Funding Source layout, a validation message is displayed.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "--None--" into field "NYSED_GSPS__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    #546158
    Then I softly see the following messages in the page details contains:
      | Funding Source - Overview tab - GSPS? value is required for activation. |
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I refresh the page
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "Yes" into field "NYSED_GSPS__c"
    When I enter value "20" into field "NYSED_Expenditure_Cap__c"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "4" seconds
    And I click on "Edit Cap" in the page details
    #546159
    Then I softly see "Edit Cap" opens in overLay window
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly see "View/Edit" page block displayed
    And I clear in modal the value from field "NYSED_Expenditure_Cap__c"
    When I click modal button "Save"
    #546159
    Then I softly see the following messages in the page details contains:
      | To Save, Expenditure Cap is required. |
    When I enter in modal value "-1" into field "NYSED_Expenditure_Cap__c"
    When I click modal button "Save"
    #546159
    Then I softly see the following messages in the page details contains:
      | Overview tab - The Expenditure cap cannot be less than 'Expenditure Paid to Date'. |
    When I enter in modal value "1999" into field "NYSED_Expenditure_Cap__c"
    When I click modal button "Save"
    #546159
    Then I softly cannot see the following messages in the page details contains:
      | Overview tab - The Expenditure cap cannot be less than 'Expenditure Paid to Date'. |
    Then I softly see field "Expenditure Cap" as "$1,999"
    When I click modal button "Close"
    Then I softly see field "Expenditure Cap" as "$1,999"

  @545543 @NYSED-1698 @NYSED-1683 @NYSED-1734 @NYSED-1862 @NYSED-1863 @NYSED-1752 @NYSED-1754 @NYSED-1750 @NYSEDSprint-19 @US-544469 @US-NYSED-1494 @NYSEDSprint-22 @federalFC @October2025 @Bug-Ticket-NYSED-1206
  Scenario Outline: Verify that the FD users does not see a warning message on the Federal Funding Source layout when the Cert Level is less than the School Year Level.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "--None--" into field "NYSED_RD__c"
    When I enter value "No" into field "NYSED_GSPS__c"
    When I enter value "{SavedValue:Char256}" into field "ProgramCode__c"
    When I enter value "{SavedValue:Char256}" into field "PCA__c"
    When I enter value "{SavedValue:Char256}" into field "OrgCode__c"
    When I enter value "Yes" into field "NYSED_RD__c"
    When I enter value "{SavedValue:Char256}" into field "OrgCode__c"
    When I click on "Save" in the page details
    #NYSED-1698 #NYSED-1752
    Then I softly see field "Enc Life" added after "Pre-Encumbrance"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I enter value "20000" into field "NYSED_SYAppr__c"
    When I enter value "2000" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    And I wait for "2" seconds
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
    Given I navigate to "Overview" sub tab
    #NYSED-1862
    Then I softly see field "School Year Level" as "$0"
    And I save the value from row "1" for column name "Funding Account Title" as "FundingAccountTitle" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Activate" in the page details without processing
    And I wait for "2" seconds
    #NYSED-1750
    Then I softly see the text containing "Upon activation, the funding account will permit modifications to only the following fields: Able to Pay Flag, Funding Account Message, and Priority. To amend any other attributes, the account must first be deactivated. Are you sure you want to continue with activation?"
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #545543
    Then I softly see field "School Year Level" as "$20,000"
    Then I softly see field "Cert Level" as "$2,000"
    And I save the field labeled "School Year Level" as "SYAppr1"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "5" seconds
    #545543
    Then I softly cannot see the following messages in the page details contains:
      | The Cert Level amount exceeds the School Year Level amount for this Funding Source. |
    #NYSED-1698 #NYSED-1752
    Then I softly see field "Enc Life" added after "Pre-Encumbrance"
    Then I navigate to "Related Log" sub tab
    #NYSED-1683
    Then I see only the following headers in table with id "---fundingsource:-:RelatedSubawardsTableId---" :
      | EGMS ID | Subaward Name | Status | Enc Life | Outstanding Encumbrance | Expenditure Paid to Date | Closeout Deobligation |
    When I navigate to "Overview" sub tab
    #NYSED-1734
    Then I softly see field "School Year Level" as "$20,000"
    Then I softly see field "School Year Level" as "{SavedValue:SYAppr1}"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    When I enter value "20000" into field "NYSED_SYAppr__c"
    When I enter value "2000" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see field "School Year Level" as "$20,000"
    Then I softly see field "Cert Level" as "$2,000"
    And I save the field labeled "School Year Level" as "SYAppr2"
    And I save the field labeled "Title" as "FundingAccountTitle1"
    Then I navigate to "Related Log" sub tab
    #NYSED-1754
    Then I see only the following headers in table with id "---fundingsource:-:RelatedSubawardsFATableId---" :
      | EGMS ID | Subaward Name | Status | Enc Life | Outstanding Encumbrance | Expenditure Paid to Date | Closeout Deobligation |
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "5" seconds
    When I navigate to "Overview" sub tab
    #NYSED-1863
    Then I softly see field "School Year Level" as "$40,000"
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "2" seconds
    #545543
    Then I softly cannot see the following messages in the page details contains:
      | The Cert Level amount exceeds the School Year Level amount for this Funding Source. |
    #NYSED-1698 #NYSED-1752
    Then I softly see field "Enc Life" added after "Pre-Encumbrance"
    Then I navigate to "Related Log" sub tab
    #NYSED-1683
    Then I see only the following headers in table with id "---fundingsource:-:RelatedSubawardsTableId---" :
      | EGMS ID | Subaward Name | Status | Enc Life | Outstanding Encumbrance | Expenditure Paid to Date | Closeout Deobligation |

    Examples:
      | InternalUser |
      | PM           |
#      | PO           |
#      | FO           |
#      | EXE          |
#      | ADMIN        |

  @545567 @NYSED-1701 @NYSED-1690 @NYSED-1753 @NYSED-1751 @NYSED-1749 @NYSED-1655 @NYSED-1669 @NYSEDSprint-19 @US-544466 @US-NYSED-1494 @NYSEDSprint-22 @October2025 @Bug-Ticket-NYSED-1206 @NYSEDSprint-22 @US-NYSED-1495
  Scenario:Verify that the FD users does not see a warning message on the State Funding Source layout when the Cert Level is less than the School Year Level.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "5" seconds
    #NYSED-1701 #NYSED-1751
    Then I softly see field "Enc Life" added after "Pre-Encumbrance"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "$10,000,000" into field "NYSED_SYAppr__c"
    When I enter value "0" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details without processing
    And I wait for "2" seconds
    #NYSED-1749
    Then I softly see the text containing "Upon activation, the funding account will permit modifications to only the following fields: Able to Pay Flag, Funding Account Message, and Priority. To amend any other attributes, the account must first be deactivated. Are you sure you want to continue with activation?"
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "2" seconds
    Then I softly see field "School Year Level" as "$10,000,000"
    Then I softly see field "Cert Level" as "$0"
    #545567
    Then I softly cannot see the following messages in the page details contains:
      | The Cert Level amount exceeds the School Year Level amount for this Funding Source. |
    Then I navigate to "Overview" sub tab
    #NYSED-1701 #NYSED-1751
    Then I softly see field "Enc Life" added after "Pre-Encumbrance"
    Then I navigate to "Related Log" sub tab
    #NYSED-1690
    Then I see only the following headers in table with id "---fundingsource:-:RelatedSubawardsTableId---" :
      | EGMS ID | Subaward Name | Status | Enc Life | Outstanding Encumbrance | Expenditure Paid to Date | Closeout Deobligation |
    Then I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    Then I navigate to "Related Log" sub tab
     #NYSED-1753
    Then I see only the following headers in table with id "---fundingsource:-:RelatedSubawardsFATableId---" :
      | EGMS ID | Subaward Name | Status | Enc Life | Outstanding Encumbrance | Expenditure Paid to Date | Closeout Deobligation |
    #NYSED-1655 #NYSED-1669
    Then I softly see "Related Subawards" page block displayed
    Then I softly do not see "Related Subawards (Grantor)" page block displayed
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "2" seconds
    #545567
    Then I softly cannot see the following messages in the page details contains:
      | The Cert Level amount exceeds the School Year Level amount for this Funding Source. |
    Then I navigate to "Overview" sub tab
    #NYSED-1701 #NYSED-1751
    Then I softly see field "Enc Life" added after "Pre-Encumbrance"
    Then I navigate to "Related Log" sub tab
    #NYSED-1690
    Then I see only the following headers in table with id "---fundingsource:-:RelatedSubawardsTableId---" :
      | EGMS ID | Subaward Name | Status | Enc Life | Outstanding Encumbrance | Expenditure Paid to Date | Closeout Deobligation |
    #NYSED-1655
    Then I softly see "Related Subawards" page block displayed
    Then I softly do not see "Related Subawards (Grantor)" page block displayed

  @545586 @NYSEDSprint-19 @US-544447 @October2025 @state
  Scenario:Verify that when an FD user clicks the ‘Release Payment’ button and the Blanket Voucher Cut (%) field is left blank, a validation message is displayed. - State Funding Account
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I clear the value from field "NYSED_BlanketVoucherCut__c"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Release Payments" in the page details
    #545586
    Then I softly see the following messages in the page details contains:
      | Overview Tab - 'Able to Pay?' cannot be set to Yes because Blanket Voucher Cut is incomplete. |
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Release Payments" in the page details
    #545586
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - 'Able to Pay?' cannot be set to Yes because Blanket Voucher Cut is incomplete. |

  @545603 @NYSEDSprint-19 @US-544447 @October2025 @federal
  Scenario:Verify that when an FD user clicks the ‘Release Payment’ button and the Blanket Voucher Cut (%) field is left blank, a validation message is displayed. - Federal Funding Account
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "No" into field "NYSED_GSPS__c"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I clear the value from field "NYSED_BlanketVoucherCut__c"
    And I enter value "10" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Release Payments" in the page details
    #545603
    Then I softly see the following messages in the page details contains:
      | Overview Tab - 'Able to Pay?' cannot be set to Yes because Blanket Voucher Cut is incomplete. |
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Release Payments" in the page details
    #545603
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - 'Able to Pay?' cannot be set to Yes because Blanket Voucher Cut is incomplete. |

  @545584 @545601 @NYSEDSprint-19 @US-544447 @October2025 @state
  Scenario:Verify that when an FD user clicks the ‘Release Payment’ button and any of the fields - Cst Cntr or Variable, or Year - are left blank, a validation message is displayed. - State Funding Account
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "10.87" into field "NYSED_BlanketVoucherCut__c"
    And I clear the value from field "NYSED_CstCntr__c"
    And I clear the value from field "NYSED_Variable__c"
    And I clear the value from field "NYSED_SFSYear__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    #545601
    Then I softly cannot see field "State Fiscal Year" inside page block
    Then I softly cannot see field "Account Type" inside page block
    Then I softly cannot see field "Can Pay?" inside page block
    Then I softly cannot see field "Liquidate In Days" inside page block
    Then I softly cannot see field "Chg Date?" inside page block
    Then I softly cannot see field "Liq Date" inside page block
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #545601
    Then I softly cannot see field "State Fiscal Year" inside page block
    Then I softly cannot see field "Account Type" inside page block
    Then I softly cannot see field "Can Pay?" inside page block
    Then I softly cannot see field "Liquidate In Days" inside page block
    Then I softly cannot see field "Chg Date?" inside page block
    Then I softly cannot see field "Liq Date" inside page block
    When I click on "Release Payments" in the page details
    #545586
    Then I softly see the following messages in the page details contains:
      | Overview Tab - 'Able to Pay?' cannot be set to Yes because the Chart of Accounts Information (Cst Cntr, Variable, and Year) is incomplete. |
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    #545601
    Then I softly cannot see field "State Fiscal Year" inside page block
    Then I softly cannot see field "Account Type" inside page block
    Then I softly cannot see field "Can Pay?" inside page block
    Then I softly cannot see field "Liquidate In Days" inside page block
    Then I softly cannot see field "Chg Date?" inside page block
    Then I softly cannot see field "Liq Date" inside page block

  @545602 @545604 @NYSEDSprint-19 @US-544447 @October2025 @federal
  Scenario: Verify that when an FD user clicks the ‘Release Payment’ button and any of the fields - Cst Cntr or Variable, or Year - are left blank, a validation message is displayed. - Federal Funding Account
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "No" into field "NYSED_GSPS__c"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I clear the value from field "NYSED_BlanketVoucherCut__c"
    And I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    And I clear the value from field "NYSED_CstCntr__c"
    And I clear the value from field "NYSED_Variable__c"
    And I clear the value from field "NYSED_SFSYear__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    #545604
    Then I softly cannot see field "State Fiscal Year" inside page block
    Then I softly cannot see field "Account Type" inside page block
    Then I softly cannot see field "Can Pay?" inside page block
    Then I softly cannot see field "Exp Date" inside page block
    Then I softly see field "Liquidate In Days" inside page block
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #545604
    Then I softly cannot see field "State Fiscal Year" inside page block
    Then I softly cannot see field "Account Type" inside page block
    Then I softly cannot see field "Can Pay?" inside page block
    Then I softly cannot see field "Exp Date" inside page block
    Then I softly see field "Liquidate In Days" inside page block
    When I click on "Release Payments" in the page details
     #545602
    Then I softly see the following messages in the page details contains:
      | Overview Tab - 'Able to Pay?' cannot be set to Yes because the Chart of Accounts Information (Cst Cntr, Variable, and Year) is incomplete. |
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    #545604
    Then I softly cannot see field "State Fiscal Year" inside page block
    Then I softly cannot see field "Account Type" inside page block
    Then I softly cannot see field "Can Pay?" inside page block
    Then I softly cannot see field "Exp Date" inside page block
    Then I softly see field "Liquidate In Days" inside page block

  @545610 @NYSED-1654 @NYSED-1667 @NYSEDSprint-22 @NYSEDSprint-19 @US-541722 @US-NYSED-1479 @federal
  Scenario Outline: Verify that the Federal Funding account is in closed state, and the FD user can see the 'Activate' button when the Liq Date has not passed.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "--None--" into field "NYSED_RD__c"
    When I enter value "No" into field "NYSED_GSPS__c"
    When I enter value "test" into field "ProgramCode__c"
    When I enter value "Automation" into field "PCA__c"
    When I enter value "manual" into field "OrgCode__c"
    When I enter value "Yes" into field "NYSED_RD__c"
    When I enter value "Funding" into field "OrgCode__c"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    And I enter value "{Date:M/d/yyyy::d+361}" into field "NYSED_LiqDate__c"
    When I click on "Save" in the page details
      #545610
    Then I softly see field "Liq Date" as "{Date:M/d/yyyy::d+361}"
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    And I navigate to "Related Log" sub tab
    #NYSED-1654 #NYSED-1667
    Then I softly see "Related Subawards" page block displayed
    Then I softly do not see "Related Subawards (Grantor)" page block displayed
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I wait for "2" seconds
    #545610
    Then I softly can see top right button "Activate" in page detail
    And I navigate to "Related Log" sub tab
    #NYSED-1654 #NYSED-1667
    Then I softly see "Related Subawards" page block displayed
    Then I softly do not see "Related Subawards (Grantor)" page block displayed
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    #545610
    Then I softly see status in Progress-bar is "Active" and is "dark blue"

    Examples:
      | InternalUser |
      | PM           |
#      | PO           |
#      | FO           |
#      | EXE          |
#      | ADMIN        |

  @NYSED-1744 @NYSED-1748 @NYSED-4913 @NYSED-1743 @NYSEDSprint-22 @US-NYSED-1495 @federal @M04 @passed
  Scenario: Verify that the FD user sees that on the Federal Funding Account layout -> Overview tab -> Basic Information section, Liq Date field and Liquidate In Days field is marked as required to save.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "Yes" into field "NYSED_GSPS__c"
    When I enter value "20" into field "NYSED_Expenditure_Cap__c"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter value "{SavedValue:SDATE}" into field "StartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "EndDate__c"
    When I clear the value from field "NYSED_LiquidateInDays__c"
    When I click on "Save" in the page details
    #NYSED-1744
    Then I softly see the following messages in the page details contains:
      | To Save, Liquidate In Days is required in the Overview tab under the Basic Information section. |
    Then I softly see the following messages in the page details contains:
      | To Save, Liq Date is required in the Overview tab under the Basic Information section. |
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    #NYSED-1744
    Then I softly see field "Liquidate In Days" as "120"
    Then I softly see field "Liq Date" as "{Date:M/d/yyyy::d+361}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{Date:MM/dd/yyyy::d+299}" into field "NYSED_EDGAPSDate__c"
    And I enter value "No" into field "NYSED_GAPE__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    #NYSED-1748
    Then I softly see the following messages in the page details contains:
      | Overview Tab - EDGAPS Date cannot be less than Liq Date. |
    #NYSED-4913
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - GAPE should be 'Yes' for funding account related to federal funding sources. |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{Date:MM/dd/yyyy::d+362}" into field "NYSED_EDGAPSDate__c"
    And I click on "Save" in the page details
    #NYSED-1748
    Then I softly see field "EDGAPS Date" as "{Date:M/d/yyyy::d+362}"
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    #NYSED-1748
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - EDGAPS Date cannot be less than Liq Date. |
    #NYSED-4913
    Then I softly see field "GAPE" as "No"
    And I wait for "2" seconds
    #NYSED-4913 #NYSED-1743
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #NYSED-1743
    Then I softly see field "Liq Date" as "{Date:M/d/yyyy::d+361}"

  @NYSED-1741 @NYSED-1656 @NYSED-1918 @NYSED-1742 @NYSED-1740 @NYSEDSprint-22 @US-NYSED-1495 @M04
  Scenario:Verify that the FD user sees that on the State Funding Account layout -> Overview tab -> Basic Information section, Exp Date field is marked as required to save.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "StartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "EndDate__c"
    When I click on "Save" in the page details
    #NYSED-1741
    Then I softly see the following messages in the page details contains:
      | To Save, Exp Date is required in the Overview tab under the Basic Information section. |
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "No" into field "NYSED_GAPE__c"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    #NYSED-1741
    Then I softly see field "Exp Date" as "{Date:M/d/yyyy::d+300}"
    #NYSED-1742
    Then I softly cannot see field "EDGAPS Date" inside page block
    #NYSED-1918
    Then I softly see field "GAPE" as "No"
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    #NYSED-1656
    When I hovering mouse on help text icon inside page block detail "End Date"
    Then I softly see "Date after which funds are no-longer available" shown as help text
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    #NYSED-1918 #NYSED-1740
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - GAPE should be 'Yes' for funding account related to state funding sources. |
    #NYSED-1740
    Then I softly see field "Exp Date" as "{Date:M/d/yyyy::d+300}"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    And I wait for "5" seconds
    #NYSED-1656
    When I hovering mouse on help text icon inside modal "End Date"
    Then I softly see "Date after which funds are no-longer available" shown as help text

  @NYSED-1743-Closed @NYSEDSprint-22 @US-NYSED-1495 @M04 @passed
  Scenario:Verify that the FD user sees the Activate button, if the funding account has liquidated and the Funding Account is in a closed state, and the FD user stops at the click of the Activate button if the liquidated Date is less than the system date.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I perform quick search for "{SavedValue:AutomationPermanentFederalFALiquidated}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentFederalFALiquidated}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    #NYSED-1743
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Funding account cannot be activated as Liq Date is passed, edit Liq Date before activation. |

  @NYSED-1740-Closed @NYSEDSprint-22 @US-NYSED-1495 @M04
  Scenario:Verify that the FD user sees the Activate button, if the funding account has liquidated and the Funding Account is in a closed state, and the FD user stops at the click of the Activate button if the liquidated Date is less than the system date.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I perform quick search for "{SavedValue:AutomationPermanentStateFAExpired}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentStateFAExpired}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    #NYSED-1740
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Funding account cannot be activated as Exp Date is passed, edit Exp Date before activation. |

  @NYSED-1746-Background1 @NYSED-1745 @NYSEDSprint-22 @US-NYSED-1495 @federal @M04
  Scenario: Verify that the FD user sees that on the Federal Funding Account layout -> Overview tab -> Basic Information section, Liq Date field and Liquidate In Days field is marked as required to save.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "Yes" into field "NYSED_GSPS__c"
    When I enter value "20" into field "NYSED_Expenditure_Cap__c"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "350" into field "NYSED_LiqDate__c"
    When I enter value "Yes" into field "NYSED_ChgDate__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    #NYSED-1745
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Liq Date cannot be less than Funding account End date. |
     #NYSED-1746
    Then I softly see the following messages in the page details contains:
      | Overview Tab - If Chg Date? is set to 'Yes', then Liquidation date should be greater than Funding account End date Liquidate In Days |
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "No" into field "NYSED_ChgDate__c"
    When I enter value "361" into field "NYSED_LiqDate__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
        #NYSED-1745
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Liq Date cannot be less than Funding account End date. |
     #NYSED-1746
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - If Chg Date? is set to 'Yes', then Liquidation date should be greater than Funding account End date Liquidate In Days |


  @NYSED-1746-Background2 @NYSEDSprint-22 @US-NYSED-1495 @federal @M04
  Scenario: Verify that the FD user sees that on the Federal Funding Account layout -> Overview tab -> Basic Information section, if Chg Date? is set to Yes then Liquidation date should be greater than Funding account End date + Liquidate In Days.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "Yes" into field "NYSED_GSPS__c"
    When I enter value "20" into field "NYSED_Expenditure_Cap__c"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "361" into field "NYSED_LiqDate__c"
    When I enter value "Yes" into field "NYSED_ChgDate__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
     #NYSED-1746
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - If Chg Date? is set to 'Yes', then Liquidation date should be greater than Funding account End date Liquidate In Days |

  @NYSED-1813 @NYSED-1814 @NYSED-1815 @NYSEDSprint-22 @US-NYSED-1795 @M04
  Scenario Outline:Verify that the FD user sees when a State Funding account is deactivated and is in the ‘Closed’ state, and that the user can only edit the following fields in the Funding Account Layout->Overview Tab->Basic Information Section.    Given I login to "As a Grantor" app as "<UserType>" user
    Given I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I perform quick search for "{SavedValue:AutomationPermanentStateFAExpired}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentStateFAExpired}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "4" seconds
    And I enter value "11/26/2025" into field "NYSED_ExpDate__c"
    And I enter value "Low" into field "NYSED_Priority__c"
    And I enter value "20" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Exp Date" as "11/26/2025"
    Then I softly see field "Priority" as "Low"
    Then I softly see field "Blanket Voucher Cut (%)" as "20.00%"
    #1814
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    Then I softly see "Chart of Accounts" page block displayed
    And I wait for "3" seconds
    Then I softly see that "Cst Cntr" rendered in view mode only
    Then I softly see that "Variable" rendered in view mode only
    Then I softly see that "Year" rendered in view mode only
    Then I softly see that "Fund" rendered in view mode only
    Then I softly see that "Prog" rendered in view mode only
    Then I softly see that "Bud Ref" rendered in view mode only
    Then I softly see that "Acct" rendered in view mode only
    Then I softly see that "Act" rendered in view mode only
    Then I softly see that "Proj" rendered in view mode only
    Then I softly see that "CF-1" rendered in view mode only
    Then I softly see that "CF-2" rendered in view mode only
    Then I softly see that "CF-3" rendered in view mode only
    Then I softly see that "Status" rendered in view mode only
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    #1815
    Then I softly see "Financials" page block displayed
    And I wait for "2" seconds
    And I enter value "100000" into field "NYSED_SYAppr__c"
    And I enter value "0" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    Then I softly see field "School Year Level" as "$100,000"
    Then I softly see field "Cert Level" as "$0"

    Examples:
      | UserType |
      | FD       |

  @NYSED-1818 @NYSED-1819 @NYSED-1820 @NYSEDSprint-22 @US-NYSED-1795 @M04
  Scenario Outline:Verify that the FD user sees when a Federal Funding account is deactivated and is in the ‘Closed’ state, and that the user can only edit the following fields in the Funding Account Layout->Overview Tab->Basic Information Section.
    Given I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I perform quick search for "{SavedValue:AutomationPermanentFederalFALiquidated}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentFederalFALiquidated}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "4" seconds
    And I enter value "121" into field "NYSED_LiquidateInDays__c"
    And I enter value "No" into field "NYSED_ChgDate__c"
    And I enter value "11/26/2025" into field "NYSED_LiqDate__c"
    And I enter value "Low" into field "NYSED_Priority__c"
    And I enter value "20" into field "NYSED_BlanketVoucherCut__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Liquidate In Days" as "121"
    Then I softly see field "Chg Date?" as "No"
    Then I softly see field "Priority" as "Low"
    Then I softly see field "Blanket Voucher Cut (%)" as "20.00%"
    Then I softly see field "Liq Date" as "11/26/2025"
    #1819s
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    Then I softly see "Chart of Accounts" page block displayed
    And I wait for "3" seconds
    Then I softly see that "Cst Cntr" rendered in view mode only
    Then I softly see that "Variable" rendered in view mode only
    Then I softly see that "Year" rendered in view mode only
    Then I softly see that "Fund" rendered in view mode only
    Then I softly see that "Prog" rendered in view mode only
    Then I softly see that "Bud Ref" rendered in view mode only
    Then I softly see that "Acct" rendered in view mode only
    Then I softly see that "Act" rendered in view mode only
    Then I softly see that "Proj" rendered in view mode only
    Then I softly see that "CF-1" rendered in view mode only
    Then I softly see that "CF-2" rendered in view mode only
    Then I softly see that "CF-3" rendered in view mode only
    Then I softly see that "Status" rendered in view mode only
    Then I softly see that "Dept" rendered in view mode only
    Then I softly see that "SFS Program ID" rendered in view mode only
    Then I softly see that "Oper Unit" rendered in view mode only
    Then I softly see that "Product" rendered in view mode only
    #1820
    Then I softly see "Financials" page block displayed
    And I wait for "2" seconds
    And I enter value "100000" into field "NYSED_SYAppr__c"
    And I enter value "0" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    Then I softly see field "School Year Level" as "$100,000"
    Then I softly see field "Cert Level" as "$0"

    Examples:
      | UserType |
      | FD       |

  @NYSED-1888-state @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify that, except for the FD user, all other users cannot edit the following fields when the state or federal funding account is in the closed state.
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I perform quick search for "{SavedValue:AutomationPermanentStateFAExpired}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentStateFAExpired}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | EXE       |
#      | Admin       |


  @NYSED-1888-federal @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify that, except for the FD user, all other users cannot edit the following fields when the state or federal funding account is in the closed state.
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I perform quick search for "{SavedValue:AutomationPermanentFederalFALiquidated}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentFederalFALiquidated}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | EXE       |
#      | Admin       |

  @NYSED-2890 @NYSED-2884 @NYSED-2471 @NYSED-2469 @NYSEDSprint-24 @US-NYSED-2247 @M04 @federal @StatusChangeReamaining
  Scenario:Verify that the FD user can see that the new ‘Payee Ref’ field is not editable when the State Funding Account is other than the created state.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter value "3650" into field "EndDate__c"
    And I enter value "0" into field "StartDate__c"
    And I enter value "No" into field "NYSED_GSPS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Fed Rev is required in the Overview tab under the Information section. |
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "{SavedValue:Char26}" into field "NYSED_PayeeRef__c"
    #NYSED-2469
    Then I softly do not see asterisk mark on "Payee Ref"
    And I enter value "{SavedValue:Char25}" into field "NYSED_PayeeRef__c"
    And I click on "Save" in the page details
     #NYSED-2469
    Then I softly see field "Payee Ref" as "{SavedValue:Char25}"
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    #NYSED-2884
#    Then I softly see the following messages in the page details contains:
#      | Funding Source - Overview Tab - Provide value for Fed Rev. |
    #NYSED-2469
    Then I softly see field "Payee Ref" added after "Blanket Voucher Cut (%)"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "Yes" into field "NYSED_GSPS__c"
    And I enter value "1000" into field "NYSED_Expenditure_Cap__c"
    And I enter value "abcdef" into field "NYSED_FedRev__c"
    #NYSED-2884
    Then I softly see asterisk mark on "Fed Rev"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #NYSED-2884
    Then I softly see field "Fed Rev" as "abcde"
    Then I softly see field "Fed Rev" added after "Expenditure Cap"
    Then I softly see field "Fed Rev" added after "GSPS?"
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly cannot see the following messages in the page details contains:
      | Funding Source - Overview Tab - Provide value for Fed Rev. |
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
    #NYSED-2471
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "NYSED_FedRev__c" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I wait for "2" seconds
    #NYSED-2890
    Then I softly see that "NYSED_PayeeRef__c" rendered in view mode only
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
#    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "NYSED_FedRev__c" rendered in view mode only

  @NYSED-2470 @NYSED-2889 @NYSED-2468 @NYSED-2467 @NYSEDSprint-24 @US-NYSED-2247 @M04 @federal @StatusChangeReamaining
  Scenario:Verify that the FD user can see that the new ‘Fed Rev’ field is not editable when the Federal Funding Source is other than the created state.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Testing - Title" into field "PCA__c"
    And I enter value "No" into field "NYSED_RD__c"
    And I enter value "No" into field "NYSED_GSPS__c"
    And I enter value "3650" into field "EndDate__c"
    And I enter value "0" into field "StartDate__c"
    And I enter value "12" into field "ProgramCode__c"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Fed Rev is required in the Overview tab under the Information section. |
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I wait for "2" seconds
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "{SavedValue:Char26}" into field "NYSED_PayeeRef__c"
    #NYSED-2468
    Then I softly do not see asterisk mark on "Payee Ref"
    And I click on "Save" in the page details
     #NYSED-2468
    Then I softly see field "Payee Ref" as "{SavedValue:Char25}"
    Then I softly see field "Payee Ref" added after "Blanket Voucher Cut (%)"
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
     #NYSED-2467 #NeedsToRemoveAfterDiscussionWithQA
#    Then I softly see the following messages in the page details contains:
#      | Funding Source - Overview Tab - Provide value for Fed Rev. |
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    #NYSED-2884
    Then I softly see asterisk mark on "Fed Rev"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "abcdef" into field "NYSED_FedRev__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #NYSED-2884
    Then I softly see field "Fed Rev" as "abcde"
    #NYSED-2467
    Then I softly see field "Fed Rev" added after "Federal Award Amount"
    Then I softly see field "Fed Rev" as "abcde"
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly cannot see the following messages in the page details contains:
      | Funding Source - Overview Tab - Provide value for Fed Rev. |
    #NYSED-2889
    Then I softly see that "NYSED_PayeeRef__c" rendered in view mode only
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
    #NYSED-2470
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "NYSED_FedRev__c" rendered in view mode only
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
     #NYSED-2889
    Then I softly see that "NYSED_PayeeRef__c" rendered in view mode only
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
    #NYSED-2470
#    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "NYSED_FedRev__c" rendered in view mode only

  @NYSED-2074 @NYSED-2078 @NYSEDSprint-23 @US-NYSED-1904 @M04
  Scenario Outline:Verify Organization Name field is hidden in State Funding Source from Related Announcements section
  |Verify Organization Name field is hidden in State Funding Account Related Announcements section.|
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I perform quick search for "{SavedValue:ActiveInternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveInternalFundingAccount}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Related Log" sub tab
    Then I see only the following headers in table with id "---fundingsource:-:RelatedAnnouncementsTableId---" :
      | EGMS ID | Fund Year | Announcement Name | Type | Pre-Encumbrance Balance | Status |
    And I save the field labeled "Funding Source" as "FUNDINGSOURCEID"
    And I click "{SavedValue:FUNDINGSOURCEID}" lookup link
    And I wait for "4" seconds
    When I navigate to "Related Log" sub tab
    Then I see only the following headers in table with id "---fundingsource:-:RelatedAnnouncementsTableIdFS---" :
      | EGMS ID | Fund Year | Announcement Name | Type | Pre-Encumbrance Balance | Status |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | EXE       |
#      | Admin       |

  @NYSED-2076 @NYSED-2075 @NYSEDSprint-23 @US-NYSED-1904 @M04
  Scenario Outline:Verify Organization Name field is hidden in Federal Funding Source from Related Announcements section.
  |Verify Organization Name field is hidden in Federal Funding Account Related Announcements section.|
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I perform quick search for "{SavedValue:ActiveExternalFundingAccount}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:ActiveExternalFundingAccount}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Related Log" sub tab
    Then I see only the following headers in table with id "---fundingsource:-:RelatedAnnouncementsTableId---" :
      | EGMS ID | Fund Year | Announcement Name | Type | Pre-Encumbrance Balance | Status |
    And I save the field labeled "Funding Source" as "FUNDINGSOURCEID"
    And I click "{SavedValue:FUNDINGSOURCEID}" lookup link
    And I wait for "4" seconds
    When I navigate to "Related Log" sub tab
    Then I see only the following headers in table with id "---fundingsource:-:RelatedAnnouncementsTableIdFS---" :
      | EGMS ID | Fund Year | Announcement Name | Type | Pre-Encumbrance Balance | Status |

    Examples:
      | UserType |
#      | PM       |
      | PO       |
#      | FO       |
#      | EXE       |
#      | Admin       |

  @NYSED-4916 @NYSEDSprint-19 @US-544447
  Scenario:Verify that the FD user can see the validation message: Overview Tab - Cst Cntr can consist only 6 digits, if fewer than 6 digits- Federal Funding Account
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "No" into field "NYSED_GSPS__c"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "#@vv" into field "NYSED_CstCntr__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    #NYSED-4916
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Cst Cntr can consist only 6 digits. |
    And I enter value "12vv" into field "NYSED_CstCntr__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Cst Cntr can consist only 6 digits. |
    And I enter value "12345" into field "NYSED_CstCntr__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Cst Cntr can consist only 6 digits. |
    And I enter value "1234567" into field "NYSED_CstCntr__c"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Cst Cntr can consist only 6 digits. |
    And I wait for "3" seconds
    Then I softly see field "Cst Cntr" as "123456"

  @NYSED-4926 @NYSED-4925 @NYSEDSprint-28 @US-NYSED-4250
  Scenario:Verify that the FD user can see the validation message: Overview Tab - Cst Cntr can consist only 6 digits, if fewer than 6 digits- Federal Funding Account
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "No" into field "NYSED_GSPS__c"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    And I clear the value from field "NYSED_LiquidateInDays__c"
    And I enter value "--None--" into field "NYSED_ChgDate__c"
    And I clear the value from field "NYSED_LiqDate__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    #NYSED-4916
    Then I softly see the following messages in the page details contains:
      | To Save, Liquidate In Days is required in the Overview tab under the Basic Information section. |
      | To Save, Chg Date? is required in the Overview tab under the Basic Information section.         |
    And I enter value "120" into field "NYSED_LiquidateInDays__c"
    And I enter value "Yes" into field "NYSED_ChgDate__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on "Activate" in the page details
    #NYSED-4926
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Liq Date is required if Chg Date? is set Yes. |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "361" into field "NYSED_LiqDate__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    #NYSED-4916
    Then I softly see field "Liquidate In Days" as "120"
    Then I softly see field "Chg Date?" as "Yes"
    Then I softly see field "Liq Date" as "{Date:M/d/yyyy::d+361}"

  @NYSED-10217 @@NYSED-10216 @NYSED-Sprint-35 @US-NYSED-10008 @M06 @federalFS
    @NYSED-10263 @NYSED-10264 @NYSED-Sprint-36 @US-NYSED-9919 @M06
    @NYSED-5537 @NYSED-Sprint-29 @US-NYSED-5523 @M06
  Scenario Outline:Verify that the FD user sees Cst Cntr fields remain open in active and closed states when Expenditure Paid to Date is $0 on the Funding Account layout -> Overview tab -> Chart of Accounts section - Active Federal Funding Account
  |Verify that the FD user sees Cst Cntr fields remain open in active and closed states when Expenditure Paid to Date is $0 on the Funding Account layout -> Overview tab -> Chart of Accounts section - Closed Federal Funding Account|
  |Verify that the FD user sees that on the Federal Funding Source layout → Overview tab → Information section → ‘Funding Source Type’ field is renamed to ‘Funding Type’.|
  |Verify that the FD user see that on the Funding Account layout, related to Federal Funding Source → Overview tab → Basic Information section → ‘Funding Source Type’ field is renamed to ‘Funding Type’.|
  |Verify that the FD user sees that at the Federal Funding account->Overview tab->Chart of Accounts section, the field names are changed as mentioned.|
    Given I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I generate the random FAIN and save as "uniqueFAIN"
    And I enter value "{SavedValue:uniqueFAIN}" into field "FAIN__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    #NYSED-10263
    Then I softly cannot see field "Funding Source Type" inside page block
    Then I softly see field "Funding Type" inside page block
    And I save the field labeled "EGMS ID" as "FEDERALEGMSID"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter value "1991" into field "Fund_Code__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    #NYSED-10264
    Then I softly see that "FundingSource__r.Type__c" rendered in view mode only
    When I click on "Save" in the page details
    #NYSED-5537
    Then I see below fields in "Chart of Accounts" page block
      | Cst Cntr | Cst Cntr Variable | Cst Cntr Year | Fund | Trans Program | Bud Ref | Acct | Act | Proj | CF-1 | CF-2 | CF-3 | Status | Dept | Budget Program | Oper Unit | Product |
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #NYSED-5537
    Then I see below fields in "Chart of Accounts" page block
      | Cst Cntr | Cst Cntr Variable | Cst Cntr Year | Fund | Trans Program | Bud Ref | Acct | Act | Proj | CF-1 | CF-2 | CF-3 | Status | Dept | Budget Program | Oper Unit | Product |
    And I save the field labeled "EGMS ID" as "FEDERALEFAGMSID"
    When I click on "Edit" in the page details
    #NYSED-10264
    Then I softly see that "FundingSource__r.Type__c" rendered in view mode only
    When I click on "Save" in the page details
    And I click on hyperlink containing value "{SavedValue:FEDERALEGMSID}"
    #NYSED-10263
    Then I softly cannot see field "Funding Source Type" inside page block
    Then I softly see field "Funding Type" inside page block
    And I click on "View" icon for "{SavedValue:FEDERALEFAGMSID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I navigate to "Overview" sub tab
    Then I softly see field "Expenditure Paid to Date" as "$0"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "333333" into field "NYSED_CstCntr__c"
    And I enter value "33" into field "NYSED_Variable__c"
    And I enter value "33" into field "NYSED_SFSYear__c"
    And I click on "Save" in the page details
    #NYSED-10217
    Then I softly see field "Cst Cntr" as "333333"
    Then I softly see field "Cst Cntr Variable" as "33"
    Then I softly see field "Cst Cntr Year" as "33"
    Then I softly see field "Expenditure Paid to Date" as "$0"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "444444" into field "NYSED_CstCntr__c"
    And I enter value "44" into field "NYSED_Variable__c"
    And I enter value "44" into field "NYSED_SFSYear__c"
    And I click on "Save" in the page details
    #NYSED-10216
    Then I softly see field "Cst Cntr" as "444444"
    Then I softly see field "Cst Cntr Variable" as "44"
    Then I softly see field "Cst Cntr Year" as "44"
    #NYSED-5537
    Then I see below fields in "Chart of Accounts" page block
      | Cst Cntr | Cst Cntr Variable | Cst Cntr Year | Fund | Trans Program | Bud Ref | Acct | Act | Proj | CF-1 | CF-2 | CF-3 | Status | Dept | Budget Program | Oper Unit | Product |
    And I click on hyperlink containing value "{SavedValue:FEDERALEGMSID}"
    #NYSED-10263
    Then I softly cannot see field "Funding Source Type" inside page block
    Then I softly see field "Funding Type" inside page block
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:FEDERALEFAGMSID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Edit" in the page details
    #NYSED-10264
    Then I softly see that "FundingSource__r.Type__c" rendered in view mode only
    When I click on "Save" in the page details

    Examples:
      | InternalUser |
      | FD           |

  @NYSED-10215 @NYSED-10214 @NYSED-Sprint-35 @US-NYSED-10008 @M06 @stateFS
    @NYSED-10261 @NYSED-10262 @NYSED-Sprint-36 @US-NYSED-9919 @M06
    @NYSED-5536 @NYSED-Sprint-29 @US-NYSED-5523 @M06
  Scenario Outline: Verify that the FD user sees Cst Cntr fields remain open in active and closed states when Expenditure Paid to Date is $0 on the Funding Account layout -> Overview tab -> Chart of Accounts section - Closed State Funding Account
  |Verify that the FD user sees Cst Cntr fields remain open in active and closed states when Expenditure Paid to Date is $0 on the Funding Account layout -> Overview tab -> Chart of Accounts section - Active State Funding Account|
  |Verify that the FD user sees that on the State Funding Source layout → Overview tab → Information section → ‘Funding Source Type’ field is renamed to ‘Funding Type’.|
  |Verify that the FD user see that on the Funding Account layout, related to State Funding Source → Overview tab → Basic Information section → ‘Funding Source Type’ field is renamed to ‘Funding Type’.|
  |Verify that the FD user sees that at the State Funding account->Overview tab->Chart of Accounts section, the field names are changed as mentioned.|
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter value "1991" into field "Fund_Code__c"
#    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "2005" into field "NYSED_Year__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    #NYSED-10261
    Then I softly cannot see field "Funding Source Type" inside page block
    Then I softly see field "Funding Type" inside page block
    And I save the field labeled "EGMS ID" as "STATEEGMSID"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "20" into field "NYSED_CstCntr__c"
    #NYSED-10262
    Then I softly see that "FundingSource__r.Type__c" rendered in view mode only
    When I click on "Save" in the page details
    #NYSED-5536
    Then I see below fields in "Chart of Accounts" page block
      | Cst Cntr | Cst Cntr Variable | Cst Cntr Year | Fund | Trans Program | Bud Ref | Acct | Act | Proj | CF-1 | CF-2 | CF-3 | Status | Dept | Budget Program | Oper Unit | Product |
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    #NYSED-5536
    Then I see below fields in "Chart of Accounts" page block
      | Cst Cntr | Cst Cntr Variable | Cst Cntr Year | Fund | Trans Program | Bud Ref | Acct | Act | Proj | CF-1 | CF-2 | CF-3 | Status | Dept | Budget Program | Oper Unit | Product |
    And I save the field labeled "EGMS ID" as "STATEEFAGMSID"
    When I click on "Edit" in the page details
    #NYSED-10262
    Then I softly see that "FundingSource__r.Type__c" rendered in view mode only
    When I click on "Save" in the page details
    And I click on hyperlink containing value "{SavedValue:STATEEGMSID}"
    #NYSED-10261
    Then I softly cannot see field "Funding Source Type" inside page block
    Then I softly see field "Funding Type" inside page block
    And I click on "View" icon for "{SavedValue:STATEEFAGMSID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I navigate to "Overview" sub tab
    Then I softly see field "Expenditure Paid to Date" as "$0"
    #NYSED-5536
    Then I see below fields in "Chart of Accounts" page block
      | Cst Cntr | Cst Cntr Variable | Cst Cntr Year | Fund | Trans Program | Bud Ref | Acct | Act | Proj | CF-1 | CF-2 | CF-3 | Status | Dept | Budget Program | Oper Unit | Product |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "333333" into field "NYSED_CstCntr__c"
    And I enter value "33" into field "NYSED_Variable__c"
    And I enter value "33" into field "NYSED_SFSYear__c"
    And I click on "Save" in the page details
    #NYSED-10214
    Then I softly see field "Cst Cntr" as "333333"
    Then I softly see field "Cst Cntr Variable" as "33"
    Then I softly see field "Cst Cntr Year" as "33"
    Then I softly see field "Expenditure Paid to Date" as "$0"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "444444" into field "NYSED_CstCntr__c"
    And I enter value "44" into field "NYSED_Variable__c"
    And I enter value "44" into field "NYSED_SFSYear__c"
    And I click on "Save" in the page details
    #NYSED-10215
    Then I softly see field "Cst Cntr" as "444444"
    Then I softly see field "Cst Cntr Variable" as "44"
    Then I softly see field "Cst Cntr Year" as "44"
    And I click on hyperlink containing value "{SavedValue:STATEEGMSID}"
    #NYSED-10261
    Then I softly cannot see field "Funding Source Type" inside page block
    Then I softly see field "Funding Type" inside page block
    And I navigate to "Overview" sub tab
    And I click on "View" icon for "{SavedValue:STATEEFAGMSID}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Edit" in the page details
    #NYSED-10262
    Then I softly see that "FundingSource__r.Type__c" rendered in view mode only
    When I click on "Save" in the page details

    Examples:
      | UserType |
      | FD       |

  @NYSED-5546 @NYSED-5545 @NYSED-5543 @NYSED-5544 @NYSED-Sprint-29 @US-NYSED-5523 @M04
  Scenario Outline:Verify that the FD user sees on the federal Funding account layout->Overview tab->Information Section->Below values are copied from the create modal and are not editable, and required to submit symbol is removed.
  |Verify that the FD user sees the Year field as a required field, and picklist field value range from Year from 1990 - 2075 on the on the 'Create Funding Account' - (Federal) modal.|
  |Verify that the FD user sees the Fund Code as a required text field, accepting only digits on the 'Create Funding Account' - (Federal) modal.|
    Given I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I generate the random FAIN and save as "uniqueFAIN"
    And I enter value "{SavedValue:uniqueFAIN}" into field "FAIN__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FEDERALEGMSID"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I wait for "2" seconds
    #NYSED-5543
    Then I see on modal below fields in "Information" page block
      | Title | Short Description | Funding Source | Cert Level | Fund Code | Year |
    #NYSED-5545
    Then I see only the following ordered options in dropdown field "NYSED_Year__c" :
      | --None-- | 1990 | 1991 | 1992 | 1993 | 1994 | 1995 | 1996 | 1997 | 1998 | 1999 | 2000 | 2001 | 2002 | 2003 | 2004 | 2005 | 2006 | 2007 | 2008 | 2009 | 2010 | 2011 | 2012 | 2013 | 2014 | 2015 | 2016 | 2017 | 2018 | 2019 | 2020 | 2021 | 2022 | 2023 | 2024 | 2025 | 2026 | 2027 | 2028 | 2029 | 2030 | 2031 | 2032 | 2033 | 2034 | 2035 | 2036 | 2037 | 2038 | 2039 | 2040 | 2041 | 2042 | 2043 | 2044 | 2045 | 2046 | 2047 | 2048 | 2049 | 2050 | 2051 | 2052 | 2053 | 2054 | 2055 | 2056 | 2057 | 2058 | 2059 | 2060 | 2061 | 2062 | 2063 | 2064 | 2065 | 2066 | 2067 | 2068 | 2069 | 2070 | 2071 | 2072 | 2073 | 2074 | 2075 |
    And I enter value "--None--" into field "NYSED_Year__c"
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To save, Year is required. |
    #NYSED-5544
    Then I softly see the following messages in the page details contains:
      | To save, Fund Code is required. |
    And I enter value "123" into field "Fund_Code__c"
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | The program associated with Fund Code 123. is not present in the system. Please create the program before proceeding with funding account creation. |
    And I enter value "12.3" into field "Fund_Code__c"
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | The program associated with Fund Code 12.3 is not present in the system. Please create the program before proceeding with funding account creation. |
    And I enter value "-122" into field "Fund_Code__c"
    When I click modal button "Save and Continue"
      | The program associated with Fund Code -122 is not present in the system. Please create the program before proceeding with funding account creation. |
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter value "1991" into field "Fund_Code__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    #NYSED-5545
    Then I softly see asterisk mark on "Year"
    And I save the field labeled "Year" as "year"
    And I save the field labeled "Fund Code" as "FundCode"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    #NYSED-5546 #NYSED-5544
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    Then I softly see field "Fund Code" as "1991"
    Then I softly see field "Fund Code" as "{SavedValue:FundCode}"
    Then I softly see field "Year" as "{SavedValue:year}"
    Then I softly see field "Fund Year" as "{SavedValue:FundCode}-{SavedValue:year}"
    Then I softly do not see field "Fund_Code__c" is required to submit mark as "This field is required to submit"
    Then I softly do not see field "NYSED_Year__c" is required to submit mark as "This field is required to submit"
    Then I softly do not see field "NYSED_FundYear__c" is required to submit mark as "This field is required to submit"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "FEDERALEFAGMSID"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"

    Examples:
      | InternalUser |
      | FD           |