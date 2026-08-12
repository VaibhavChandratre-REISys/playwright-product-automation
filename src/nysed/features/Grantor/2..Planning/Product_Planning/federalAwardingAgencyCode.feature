@federalAwardingAgencyCode @planning @productplanning @nysed
Feature: Verify Federal Awarding Agency Code is mandatory on Edit Funding Source Details

  Background: Login as FD User and Navigate to Funding Sources
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel

  @NYSED-FAA-001 @ValidateFederalAwardingAgencyCodeMandatory @smoke
  Scenario: Verify Federal Awarding Agency Code field is mandatory and validation message displays
    # Create Active Funding Source
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    And I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Title" as "FundingSourceTitle"
    
    # Open Funding Source in Edit mode
    When I navigate to "Overview" sub tab
    And I click on top right button "Edit" in page detail
    And I wait for "2" seconds
    
    # Verify Federal Awarding Agency Code field exists after Federal Message
    Then I softly see field "Federal Awarding Agency Code" inside page block
    And I softly see field "Federal Message" inside page block
    
    # Attempt to save without Federal Awarding Agency Code (remove value)
    When I clear field "Federal Awarding Agency Code"
    And I click on "Save" in the page details
    And I wait for "1" seconds
    
    # Verify validation error message
    Then I softly see the following messages in the page details contains:
      | To save, Federal Awarding Agency Code is required. |
    
    # Add Federal Awarding Agency Code and save successfully
    When I enter value "USDA-NRCS" into field "Federal Awarding Agency Code"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    
    # Verify field value persists in Overview → Information section
    Then I softly see value "USDA-NRCS" for title "Federal Awarding Agency Code" inside page block

  @NYSED-FAA-002 @ValidateFederalAwardingAgencyCodePersistsOnOverviewTab
  Scenario: Verify Federal Awarding Agency Code value is displayed on Overview page after save
    # Create Active Funding Source
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    And I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Title" as "FundingSourceTitle"
    
    # Edit Funding Source and add Federal Awarding Agency Code
    When I navigate to "Overview" sub tab
    And I click on top right button "Edit" in page detail
    And I wait for "2" seconds
    And I enter value "ED-OESE" into field "Federal Awarding Agency Code"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    
    # Verify field value persists in Overview → Information section
    Then I softly see value "ED-OESE" for title "Federal Awarding Agency Code" inside page block
    
    # Refresh page and verify value still displays
    When I refresh the page
    And I wait for "3" seconds
    Then I softly see value "ED-OESE" for title "Federal Awarding Agency Code" inside page block

  @NYSED-FAA-003 @ValidateFederalAwardingAgencyCodeWithMultipleEdits
  Scenario: Verify Federal Awarding Agency Code can be updated multiple times
    # Create Active Funding Source
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    And I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    
    # First edit - Add Federal Awarding Agency Code
    When I navigate to "Overview" sub tab
    And I click on top right button "Edit" in page detail
    And I wait for "2" seconds
    And I enter value "HHS-ACF" into field "Federal Awarding Agency Code"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see value "HHS-ACF" for title "Federal Awarding Agency Code" inside page block
    
    # Second edit - Update Federal Awarding Agency Code
    When I click on top right button "Edit" in page detail
    And I wait for "2" seconds
    And I clear field "Federal Awarding Agency Code"
    And I enter value "DOL-ETA" into field "Federal Awarding Agency Code"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    
    # Verify updated value displays
    Then I softly see value "DOL-ETA" for title "Federal Awarding Agency Code" inside page block

  @NYSED-FAA-004 @ValidateFederalAwardingAgencyCodeWithClosedFundingSource
  Scenario: Verify Federal Awarding Agency Code field behavior with Closed Funding Source
    # Create and Activate Funding Source
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    And I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    
    # Create and Activate Funding Account
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "FundingAccId"
    
    # Add Federal Awarding Agency Code before closing
    When I navigate to "Overview" sub tab
    And I click on top right button "Edit" in page detail
    And I wait for "2" seconds
    And I enter value "NSF-EHR" into field "Federal Awarding Agency Code"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    
    # Verify value persists after saving
    Then I softly see value "NSF-EHR" for title "Federal Awarding Agency Code" inside page block
    
    # Close Funding Account
    When I click on "Deactivate" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "2" seconds
    
    # Verify Federal Awarding Agency Code still visible in closed state
    Then I softly see value "NSF-EHR" for title "Federal Awarding Agency Code" inside page block
