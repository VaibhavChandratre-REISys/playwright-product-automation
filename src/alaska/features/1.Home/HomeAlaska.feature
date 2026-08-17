@AlaskaHome @AlaskaRegression
Feature: Validate all scenarios in the home tab

  @TermsAndConditionsViewCreateAdminEdit
  Scenario Outline: Verifying all Internal Users has View, Create and Edit access to Terms and Conditions
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:termsAndConditionsTableId---"
    And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
    When I click modal button "Save"
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I click modal button "Close"
    And I pause execution for "3" seconds
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---home:-:termsAndConditionsTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---home:-:termsAndConditionsTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---home:-:termsAndConditionsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---home:-:termsAndConditionsTableId---"
    Examples:
      | User  |
      | ADMIN |

  @EINRegistration
  Scenario Outline: Validate whether all users have view access to EINRegistration
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "EIN Registration" content inside "Useful Links" subheader on left panel
    Then I navigate to url "https://www.irs.gov/businesses/small-businesses-self-employed/apply-for-an-employer-identification-number-ein-online"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @UEIRegistration
  Scenario Outline: Validate whether ADMIN have view access to DUNSRegistration
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "UEI Registration" content inside "Useful Links" subheader on left panel
    Then I navigate to url "https://sam.gov/content/entity-registration"

    Examples:
      | User  |
      | ADMIN |

  @SamGovRegistration
  Scenario Outline: Validate whether all users have view access to SAM.Gov Registration
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SAM.gov Registration" content inside "Useful Links" subheader on left panel
    Then I navigate to url "https://www.sam.gov/SAM/"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @ContactUs
  Scenario Outline: Validate whether all users have view access to Contactview
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Contact Us" content inside "Technical Support" subheader on left panel
    And I see "Customer_Support" in current url
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @deletionOfRelatedContact
  Scenario:  Validate whether the admin is able to Delete Related Contacts
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I pause execution for "5" seconds
    When I click on "View" icon for "SYSTEM" inside table without waiting for record
    And I click on top right button "New" in flex table with id "---home:-:relatedContactsTableId---"
    And I enter in modal "RelatedContactsCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I select value inside table "---home:-:relatedContactsTableId---" is "All"
    And I pause execution for "7" seconds
    And I click on "Delete" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:relatedContactsTableId---" without waiting for record

  @PerformGlobalSearchOnHomeTab
  Scenario: Verify Global search on Home Tab
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I save the field labeled "EGMS ID" as "ProgramID"
    And I click on "Save" in the page details
    And I navigate to "Home" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramID}"
    Then I see value "{SavedValue:ProgramID}" for title "EGMS ID" inside table "Programs||List View"

  @ValidateGranteeUserCanEditTheAccessibilityModeFieldOnExternalProfileUser
  Scenario Outline: Validate Grantee user can edit the 'Accessibility Mode' field on external profile user
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<userType>" user
    And I select "Profile" from user dropdown
    And I click on "Edit" in the page details
    Then I softly see checkbox field "Accessibility Mode" is editable
    Examples:
      | userType |
      | CITY1    |

  @ValidateGranteeUserShouldDoNotSeeTheProfileDescriptionSectionOnExternalProfileUserOnExternalProfileUser
  Scenario Outline: Validate Grantee user I should not see the 'Profile Description' section on external profile user on external profile user
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<userType>" user
    And I select "Profile" from user dropdown
    And I click on "Edit" in the page details
    Then I softly do not see "Profile Description" page block displayed
    Examples:
      | userType |
      | CITY1     |