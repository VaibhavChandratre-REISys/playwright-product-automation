@GranteeNonFederalProgram @GranteePreAwardRegression
Feature: Validate all scenarios for Non Federal Program

  @476976 @NonFederalprogramVerifyvalidationsdisplayedtoPOuseronNonFederalprogram @P3_Grantee @Po_Grantee @GRegression1
  Scenario Outline: Non-Federal program - Verify validations displayed to PO user on Non Federal program
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I wait for "10" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Create Non Federal Program" opens in overLay window
    Then I softly see field on modal "Program Name" inside page block
    Then I softly see field on modal "Abbreviation" inside page block
    Then I softly see field on modal "Type" inside page block
    Then I softly see field on modal "NGO Organization" inside page block
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Program Name is required.     |
      | To Save, Type is required.             |
      | To Save, NGO Organization is required. |
    When I enter "Grantee_nonFed" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"
    Then I softly see fields "FederalProgramCFDA__c" is in edit mode
    Then I softly see fields "ProgramName__c" is in edit mode
    Then I softly see fields "Account__c" is in edit mode
    Then I softly see fields "Objectives__c" is in edit mode
    Then I softly see fields "AssistanceType__c" is in edit mode
    Then I softly see fields "UsesAndUseRestrictions__c" is in edit mode
    Then I softly see fields "CredentialsDocumentation__c" is in edit mode
    Then I softly see fields "ApplicantEligibility__c" is in edit mode
    Then I softly see fields "BeneficiaryEligibility__c" is in edit mode
    Then I softly see fields "PreapplicationCoordination__c" is in edit mode
    Then I softly see fields "ApplicationProcedures__c" is in edit mode
    Then I softly see fields "Deadlines__c" is in edit mode
    Then I softly see fields "AwardProcedure__c" is in edit mode
    Then I softly see fields "RangeofApprovalDisApprovalTime__c" is in edit mode
    Then I softly see fields "Appeals__c" is in edit mode
    Then I softly see fields "Renewals__c" is in edit mode
    Then I softly see fields "CriteriaforSelectingProposals__c" is in edit mode
    Then I softly see fields "RangeofApprovalDisApprovalTime__c" is in edit mode
    Then I softly see fields "Appeals__c" is in edit mode
    Then I softly see fields "Renewals__c" is in edit mode
    Then I softly see fields "CriteriaforSelectingProposals__c" is in edit mode
    Then I softly see fields "FormulaandMatchingRequirements__c" is in edit mode
    Then I softly see fields "LengthandTimePhasingofAssistance__c" is in edit mode
    Then I softly see fields "Reports__c" is in edit mode
    Then I softly see fields "Audits__c" is in edit mode
    Then I softly see fields "Records__c" is in edit mode
    Then I softly see fields "RegulationsGuidelinesAndLiterature__c" is in edit mode
    Then I softly see fields "AccountIdentification__c" is in edit mode
    Then I softly see fields "Obligations__c" is in edit mode
    Then I softly see fields "RangeandAverageofFinancialAssistanc__c" is in edit mode
    Then I softly see fields "ProgramAccomplishments__c" is in edit mode
    Then I softly see fields "RegionalOrLocalOffice__c" is in edit mode
    Then I softly see fields "HeadquartersOffice__c" is in edit mode
    Then I softly see fields "WebsiteAddress__c" is in edit mode
    When I clear the value from field "FederalProgramCFDA__c"
    When I clear the value from field "ProgramName__c"
    And I click on remove for lookup from field "Account__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Program Number is required in the Overview tab under the Information section.       |
      | To Save, Program Name is required in the Overview tab under the Information section.         |
      | To Save, Funding Organization is required in the Overview tab under the Information section. |
      | To Save, Program Objectives is required in the Overview tab under the Information section.   |
    And I click on "Cancel" in the page details
    Then I softly can see top right button "Activate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Activate" in the page details
    Then I softly see the following messages in the page details contains:
      | To Submit, Applicant Eligibility is required in the Overview tab under the Eligibility Requirements section. |
    Examples:
      | User       |
      | GRANTEE PO |

  @476963 @NonFederalprogramVerifyvalidationsdisplayedtoPOuseronNonFederalprogram @PM_Grantee @P3_Grantee @GRegression1
  Scenario Outline: Non-Federal program - Verify validations displayed to PM user on Non Federal program
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I wait for "10" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:nonFederalProgramsTableId---"
    Then I softly see "Create Non Federal Program" opens in overLay window
    Then I softly see field on modal "Program Name" inside page block
    Then I softly see field on modal "Abbreviation" inside page block
    Then I softly see field on modal "Type" inside page block
    Then I softly see field on modal "NGO Organization" inside page block
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Program Name is required.     |
      | To Save, Type is required.             |
      | To Save, NGO Organization is required. |
    When I enter "Grantee_nonFed" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"
    Then I softly see fields "FederalProgramCFDA__c" is in edit mode
    Then I softly see fields "ProgramName__c" is in edit mode
    Then I softly see fields "Account__c" is in edit mode
    Then I softly see fields "Objectives__c" is in edit mode
    Then I softly see fields "AssistanceType__c" is in edit mode
    Then I softly see fields "UsesAndUseRestrictions__c" is in edit mode
    Then I softly see fields "CredentialsDocumentation__c" is in edit mode
    Then I softly see fields "ApplicantEligibility__c" is in edit mode
    Then I softly see fields "BeneficiaryEligibility__c" is in edit mode
    Then I softly see fields "PreapplicationCoordination__c" is in edit mode
    Then I softly see fields "ApplicationProcedures__c" is in edit mode
    Then I softly see fields "Deadlines__c" is in edit mode
    Then I softly see fields "AwardProcedure__c" is in edit mode
    Then I softly see fields "RangeofApprovalDisApprovalTime__c" is in edit mode
    Then I softly see fields "Appeals__c" is in edit mode
    Then I softly see fields "Renewals__c" is in edit mode
    Then I softly see fields "CriteriaforSelectingProposals__c" is in edit mode
    Then I softly see fields "RangeofApprovalDisApprovalTime__c" is in edit mode
    Then I softly see fields "Appeals__c" is in edit mode
    Then I softly see fields "Renewals__c" is in edit mode
    Then I softly see fields "CriteriaforSelectingProposals__c" is in edit mode
    Then I softly see fields "FormulaandMatchingRequirements__c" is in edit mode
    Then I softly see fields "LengthandTimePhasingofAssistance__c" is in edit mode
    Then I softly see fields "Reports__c" is in edit mode
    Then I softly see fields "Audits__c" is in edit mode
    Then I softly see fields "Records__c" is in edit mode
    Then I softly see fields "RegulationsGuidelinesAndLiterature__c" is in edit mode
    Then I softly see fields "AccountIdentification__c" is in edit mode
    Then I softly see fields "Obligations__c" is in edit mode
    Then I softly see fields "RangeandAverageofFinancialAssistanc__c" is in edit mode
    Then I softly see fields "ProgramAccomplishments__c" is in edit mode
    Then I softly see fields "RegionalOrLocalOffice__c" is in edit mode
    Then I softly see fields "HeadquartersOffice__c" is in edit mode
    Then I softly see fields "WebsiteAddress__c" is in edit mode
    When I clear the value from field "FederalProgramCFDA__c"
    When I clear the value from field "ProgramName__c"
    And I click on remove for lookup from field "Account__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Program Number is required in the Overview tab under the Information section.       |
      | To Save, Program Name is required in the Overview tab under the Information section.         |
      | To Save, Funding Organization is required in the Overview tab under the Information section. |
      | To Save, Program Objectives is required in the Overview tab under the Information section.   |
    And I click on "Cancel" in the page details
    Then I softly can see top right button "Activate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Activate" in the page details
    Then I softly see the following messages in the page details contains:
      | To Submit, Applicant Eligibility is required in the Overview tab under the Eligibility Requirements section. |
    Examples:
      | User       |
      | GRANTEE PM |

  @476633 @ValidateNon-FederalprogramAdminusercannotcreateNonFederalprogram  @ADMIN_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Validate Non-Federal program Admin user cannot create Non Federal program
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFederalProgramsTableId---"
    Examples:
      | userType      |
      | GRANTEE ADMIN |

  @476634 @ValidateNon-FederalprogramAdminusercannotcreateNonFederalprogram @FO_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Validate Non-Federal program Admin user cannot create Non Federal program
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFederalProgramsTableId---"
    Examples:
      | userType   |
      | GRANTEE FO |

  @476635 @ValidateNon-FederalprogramAdminusercannotcreateNonFederalprogram @FD_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Validate Non-Federal program FD user cannot create Non Federal program
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFederalProgramsTableId---"
    Examples:
      | userType   |
      | GRANTEE FD |

  @476636 @ValidateNon-FederalprogramAdminusercannotcreateNonFederalprogram @EXE_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Validate Non-Federal program EXE user cannot create Non Federal program
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFederalProgramsTableId---"
    Examples:
      | userType    |
      | GRANTEE EXE |

  @476637 @ValidateNon-FederalprogramAdminusercannotcreateNonFederalprogram @AUDITOR_Grantee @P4_Grantee @GRegression3
  Scenario Outline: Validate Non-Federal program Admin user cannot create Non Federal program
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:nonFederalProgramsTableId---"
    Examples:
      | userType        |
      | GRANTEE AUDITOR |

  @443687 @ValidateNonfederalPOusershouldseeallfieldsandsectionfornonfederalcontacts
  Scenario Outline: Validate Non federal PM user should see all fields and section for non federal contact's
    Given I login to "Grantee" app as "<User>" user
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
    Then I softly see "Non-Federal Contacts" on page "1" of "govgrants" pdf file
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
      | To Save, Organization is required in the Contact Information section.   |
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
    And I click modal button "Close"
    And I perform quick search for "{SavedValue:Title}" in "---grantee_tableId:-:nonFedContactTableId---" panel
    Then I softly see that "{SavedValue:Title}" has been added in flextable with Id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:nonFedContactTableId---"
    Examples:
      | User       |
      | GRANTEE PM |