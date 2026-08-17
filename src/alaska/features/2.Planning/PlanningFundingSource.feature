@AlaskaRegression @AlaskaPlanning @AlaskaProgram @AlaskaAnnouncement
Feature: Funding source releted scenarios

  @Sprint-24-US-482406A @490555
  Scenario: Verify that the Appropriation Code field is required during activation of funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "1004" into field "Fund_Code__c"
    When I enter value "3013" into field "Object_Code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see the text containing :
      | Overview Tab - Appropriation Code is required to activate the funding account. |

  @Sprint-24-US-482406 @497590
  Scenario: To verify that 'Appropriation Code' field in Information Section under Overview tab on Funding Account Layout.
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "DA0101002" into field "Appropriation_code__c"
    Then I softly see lookup field "Appropriation_code__c"
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    And I click on "Save" in the page details
    Then I softly see field "Appropriation Code" as "DA0101002"
    Then I softly see field "Appropriation Code" inside "Information" section

  @Sprint-24-US-482406 @490556
  Scenario: Verify that the Appropriation Code field on Funding Account Layout
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "Appropriation Code" inside page block

  @Sprint-24-US-482406 @490559
  Scenario: Verify that the Budget Fiscal Year field on Funding Account Layout
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "1004" into field "Fund_Code__c"
    When I enter value "3013" into field "Object_Code__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I softly see field "Budget Fiscal Year" inside page block

  @Sprint-24-US-482406 @490561
  Scenario: Verify that the Budget Fiscal Year field is required during activation of funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "1004" into field "Fund_Code__c"
    When I enter value "3013" into field "Object_Code__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see the text containing :
      | Overview Tab -Budget Fiscal Year is required to activate the funding account. |

  @Sprint-24-US-482406 @490562
  Scenario: Verify that the Budget Fiscal Year field limit is 4 characters, numbers only
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "1004" into field "Fund_Code__c"
    When I enter value "3013" into field "Object_Code__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see field "Budget Fiscal Year" as "2025"

  @Sprint-24-US-482406 @497606
  Scenario: Verify that the Budget Fiscal Year field limit is 4 characters, numbers only
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "17AWDDCDOA" into field "Program_Code__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I softly see field "PPC Code" inside "Information" section
    Then I softly see field "Program Code" is not editable

  @Sprint-24-US-482406 @490567
  Scenario: Verify that the Object Code field on Funding Account Layout
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "1004" into field "Fund_Code__c"
    When I enter value "3013" into field "Object_Code__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see field "Object Code" inside page block

  @Sprint-24-US-482406 @497578
  Scenario: To verify that 'Object Code' field in Information Section under Overview tab on Funding Account Layout.
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "1004" into field "Fund_Code__c"
    When I enter value "3013" into field "Object_Code__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    When I enter value "DA0101002" into field "Appropriation_code__c"
    Then I softly see lookup field "Object_Code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see field "Object Code" inside "Information" section

  @Sprint-24-US-482406 @490571
  Scenario: Verify that the Funding Code field on Funding Account Layout
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "1004" into field "Fund_Code__c"
    When I enter value "3013" into field "Object_Code__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see field "Fund Code" inside page block

  @Sprint-24-US-482406 @490572
  Scenario: Verify that the Funding Code field is required during activation of funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    When I enter value "3013" into field "Object_Code__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see the text containing :
      | Overview Tab - Fund Code is required to activate the funding account. |

  @Sprint-24-US-482406 @490566
  Scenario: Verify that the PPC Code field is required if Program Code is present during activation of funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "17AWDDCDOA" into field "Program_Code__c"
    When I enter value "DA0101002" into field "Appropriation_code__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    When I enter value "3013" into field "Object_Code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see the text containing :
      | Overview Tab - PPC code cannot be blank if Program Code is entered |

  @Sprint-24-US-482406 @490563
  Scenario: Verify that the PPC Code field on Funding Account Layout
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see field "PPC Code" inside page block

  @Sprint-24-US-482406 @490600
  Scenario: Verify that the Program Code field on Funding Account Layout
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "17AWDDCDOA" into field "Program_Code__c"
    And I wait for "2" seconds
    Then I softly see field "Program Code" inside page block

  @Sprint-24-US-482406 @490611
  Scenario: Verify that Validation should occur If Budget Fiscal Year contain Special characters and Alphabets
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "1004" into field "Fund_Code__c"
    When I enter value "3013" into field "Object_Code__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    When I enter value "ABCD" into field "Budget_Fiscal_Year__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I softly see the text containing :
      | Budget Fiscal Year should contain numbers only. |

  @Sprint-24-US-482406 @497564
  Scenario: To verify that 'FUND Code' field in Information Section under Overview tab on Funding Account Layout.
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "17AWDDCDOA" into field "Program_Code__c"
    When I enter value "DA0101002" into field "Appropriation_code__c"
    Then I softly see lookup field "Fund_Code__c"
    When I enter value "1004" into field "Fund_Code__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    When I enter value "3013" into field "Object_Code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I softly see field "Fund Code" inside "Information" section

  @Sprint-24-US-482406 @497600
  Scenario: To verify that 'Program Code' field in Information Section under Overview tab on Funding Account Layout.
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    Then I softly see lookup field "Program_Code__c"
    When I enter value "17AWDDCDOA" into field "Program_Code__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    When I enter value "3013" into field "Object_Code__c"
    Then I softly see lookup field "Program_Code__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Program Code" inside "Information" section

  @Sprint-24-US-487202 @490524
  Scenario: Verify validation for empty Appropriation Code field while activating the funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "1004" into field "Fund_Code__c"
    When I enter value "3013" into field "Object_Code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see the text containing :
      | Overview Tab - Appropriation Code is required to activate the funding account. |

  @Sprint-24-US-487202 @490525
  Scenario: Verify validation for empty Budget Fiscal Year field while activating the funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "1004" into field "Fund_Code__c"
    When I enter value "3013" into field "Object_Code__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see the text containing :
      | Overview Tab -Budget Fiscal Year is required to activate the funding account. |

  @Sprint-24-US-487202 @490554
  Scenario: Verify validation for empty Funding Code field while activating the funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    When I enter value "3013" into field "Object_Code__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see the text containing :
      | Overview Tab - Fund Code is required to activate the funding account. |

  @Sprint-24-US-487202 @490526
  Scenario: Verify validation for empty PPC Code field and Program Code is added while activating the funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "PA18042025" into field "Program_Code__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    When I enter value "3013" into field "Object_Code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see the text containing :
      | Overview Tab - PPC code cannot be blank if Program Code is entered |

  @Sprint-24-US-487202 @490527
  Scenario: Verify validation for empty PPC Code field and Program Code is not added while activating the funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    When I enter value "3013" into field "Object_Code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly cannot see the text containing :
      | Overview Tab - PPC code cannot be blank if Program Code is entered |

  @Sprint-19-US-465282 @477299
  Scenario: Verify as Admin, KPI should be created by clicking New button of Key Performance Indicators (KPI) table
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    Then I see "Create KPI" opens in overLay window

  @Sprint-19-US-465282 @477298
  Scenario: Verify as Admin, Strategic Plan/Goals/Objective should be created by clicking New button of Strategic Plan table
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    Then I see "Create Strategic Plan" opens in overLay window

  @Sprint-19-US-465282 @476490
  Scenario Outline: Verify Strategic Plan and KPI fields should be displayed in Create Program Details modal of Planning Module
    Given I login to "As a Grantor" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see field "Objectives Required?" inside page block
    Then I softly see field "KPIs Required?" inside page block
    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | EXE      |
