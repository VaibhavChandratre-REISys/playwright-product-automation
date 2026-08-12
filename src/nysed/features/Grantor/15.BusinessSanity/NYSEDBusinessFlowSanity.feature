@NysedBusinessFlowSanity @grantor-sanity
Feature: Validate sanity testing of Complete Business Flow

  @OrganizationRegistrationFlow @sanitysuiteregistration @NYSED_Automation_Sanity
  Scenario:Verify that the user is able to approve and activate the new organization
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "EINText__c"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "UserRegistrationStep3" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I wait for "10" seconds
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipient Organizations - Pending"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I wait for "2" seconds
    When I click on "Update Organization Fields" in the page details
    When I enter in modal value "1" into field "NYSED_LicenseCap__c"
    And I click modal button "Save and Close"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I pause execution for "300" seconds
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I see the mail subject is as follows :
      """
      Sandbox: Welcome to GovGrants 3.0 Recipient Portal
      """
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    #538634
    Then I see the header is "Subrecipient Organization" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime}" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Active"
    #539780
    Then I softly see field "Not For Profit" as "NA"
    And I refresh the page
    When I navigate to "Applications" tab
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime}" inside table
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I click on "Edit" in the page details
    And I pause execution for "2" seconds
    #539780
    Then I see only the following ordered options in dropdown field "NOT_FOR_PROFIT__c" :
      | --None-- | NA | Yes | No |
    And I enter value "Yes" into field "NOT_FOR_PROFIT__c"
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    #539780
    Then I softly see field "Not For Profit" as "Yes"

  @OrganizationRegistrationRejectionFlow @sanitysuiteregistration @NYSED_Automation_Sanity
  Scenario:Verify that the user can reject the organization
  |Add files while registration, files are carried on pending organization|
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I generate the random EIN and save as "uniqueEIN"
    And I enter value "{SavedValue:uniqueEIN}" into field "EINText__c"
    When I click on "Save" in the page details
    Then I see the sub-header is "2 of 3" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add" in flex table with id "---user:-:orgRegistrationAttachmentTableId---"
    And I wait for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" with description "<input onauxclick=alert(1)>" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Organization Profile" sub tab
    And I enter "UserRegistrationStep2" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "UserRegistrationStep3" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I wait for "10" seconds
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    And I click toggle button to select "Subrecipient Organizations - Pending"
    When I perform quick search for "{SavedValue:Automation Runtime}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    Then I softly see value "Other" for title "Type" inside table "---user:-:OrganizationalFilesTableId---"
    And I wait for "2" seconds
    When I click on "Update Organization Fields" in the page details
    When I enter in modal value "2" into field "NYSED_LicenseCap__c"
    And I click modal button "Save and Close"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"

  @OrganizationRegistrationDuplicateEIN @sanitysuiteregistration @NYSED_Automation_Sanity
  Scenario: Verify that the Grantee user see the validation if duplicate EIN number is entered (for which organization registration request is already approved or pending) on the Organization Registration Step 1 of 3 page
    Given I am on "SUBPORTAL" portal
    Given I begin "Organization" registration as "Register Organization in GFMS"
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    And I enter value "235647871" into field "---home:-:ein---"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #520536
    Then I softly see the text containing "Registration cannot proceed as organization with EIN number already present in the system."

  @OrganizationRegistrationFieldsValidations @sanitysuiteregistration @NYSED_Automation_Sanity
  Scenario Outline: Verify that the admin user sees a new picklist field, 'Is Parent Organization', added after the Location field in the Organization Information section on the Subrecipient Organization layout and that it is editable.
    When I login to "As a Grantor" app as "<UserType>" user
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    Then I see only the following ordered options in dropdown field "NYSED_IsParentOrganization__c" :
      | --None-- | Yes | No |
    And I enter value "--None--" into field "NYSED_IsParentOrganization__c"
    #543069
    Then I softly see the following messages in the page details contains:
      | To Save, Is Parent Organization is required in the Overview tab under the Organization Information section. |
    And I enter value "Yes" into field "NYSED_IsParentOrganization__c"
    And I click on "Save" in the page details
    #543069
    Then I softly see field "Is Parent Organization" as "Yes"

    Examples:
      | UserType |
      | ADMIN    |

  @OrganizationRegistrationwithoutInstitutionId @sanitysuiteregistration @NYSED_Automation_Sanity @withoutInstitutionId
  Scenario: Verify that only the admin user can edit the Institution ID field under the Overview tab -> Organization Information section.
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" inside table
    And I navigate to "Overview" sub tab
    And I pause execution for "2" seconds
    And I click on "Edit" in the page details
    And I pause execution for "2" seconds
    And I clear the value from field "INST_ID__c"
    And I pause execution for "2" seconds
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    #535729
    Then I softly see field "Institution ID" as ""
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "dfgh^&&*" into field "INST_ID__c"
    And I click on "Save" in the page details
    #535729
    Then I softly see field "Institution ID" as ""
    And I click on "Edit" in the page details
    And I enter value "166485411254.55" into field "INST_ID__c"
    And I click on "Save" in the page details
    #535729
    Then I softly see field "Institution ID" as "166,485,411,254"
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
    And I enter value "16648541125154" into field "INST_ID__c"
    And I click on "Save" in the page details
    #535729
    Then I softly see field "Institution ID" as "166,485,411,251"
    And I click on "Edit" in the page details
    And I enter value "166485411254" into field "INST_ID__c"
    And I click on "Save" in the page details
    And I wait for "5" seconds

  @ExternalUserSecondaryContactCreation @sanitysuiteregistration @NYSED_Automation_Sanity @wip @DueToLicenseIssue-WillExecuteOnceinthreeToFourMonths
  Scenario Outline:Verify that on active organization, Submit and Certify OR LEA Admin Role user can create & activate a new User if we use a duplicate Email ID from the another org
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
    And I wait for "2" seconds
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} Contact" inside flex table with id "---home:-:userContactsTableId---"
    And I click modal button "Send"
    And I wait for "7" seconds
    #538600
    Then I see the text "Email Sent Successfully." in modal
    And I wait for "2" seconds
    And I click modal button "Close"
    And I refresh the page
    And I pause execution for "300" seconds
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID1}"
    #536724
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Invitation to be a user of GFMS
      """
    And I click on hyperlink containing value "here"
    And I wait for "15" seconds
    And I switch to tab number "1"
    And I wait for "15" seconds
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Confirmation Message |
    And I pause execution for "300" seconds
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID1}"
    And I see the mail subject is as follows :
      """
      Sandbox: Welcome to GovGrants 3.0 Recipient Portal
      """
    And I pause execution for "5" seconds
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "3" seconds
    Then I softly see field "Status" as "Active"

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA |

  @InternalUserSecondaryContactCreation @sanitysuiteregistration @NYSED_Automation_Sanity @DueToLicenseIssue-WillExecuteOnceinthreeToFourMonths
  Scenario Outline:Verify that on active organization, Internal user can create & activate a new Submit and Certify Role user if we use a duplicate Email ID from another org
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in "ActiveAccount" panel
    And I click on "View" icon for "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" inside table
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    When I enter in modal value "8967859036" into field "Phone"
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I click modal button "Save"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "2" seconds
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} Contact" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "4" seconds
    And I click modal button "Send"
    And I wait for "7" seconds
    #538582
    Then I see the text "Email Sent Successfully." in modal
    And I wait for "2" seconds
    And I click modal button "Close"
    And I refresh the page
    And I pause execution for "300" seconds
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID1}"
    #538582
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Invitation to be a user of GFMS
      """
    And I click on hyperlink containing value "here"
    And I wait for "15" seconds
    And I switch to tab number "1"
    And I wait for "15" seconds
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Confirmation Message |
    And I pause execution for "300" seconds
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID1}"
    And I see the mail subject is as follows :
      """
      Sandbox: Welcome to GovGrants 3.0 Recipient Portal
      """
    And I pause execution for "5" seconds
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "3" seconds
    Then I softly see field "Status" as "Active"

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA |

  @focusareaDeactivation @sanitysuiteplanning  @NYSED_Automation_Sanity
  Scenario Outline: Verify that the Internal user see only Edit button at the Focus Area page layout and other record flow action buttons at page level action dropdown
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I enter value "Automation Test Description" into field "Description__c"
    And I click on "Save" in the page details
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Activate" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---focusarea:-:FocusAreaFilesTableId---"
    When I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly can see top right dropdown button "Deactivate" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    Then I cannot see top right button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Activate" in page detail
    Then I softly cannot see top right dropdown button "Deactivate" in page detail

    Examples:
      | UserType |
      | PM       |

  @KPIDeactivation @sanitysuiteplanning @NYSED_Automation_Sanity
  Scenario Outline: Verify that the Internal user see only Edit button at the KPI page layout and other record flow action buttons at page level action dropdown
    Given I am on "INTERNAL" portal
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Activate" in page detail
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly can see top right dropdown button "Deactivate" in page detail
    And I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Inactive" and is "dark blue"
    And I wait for "2" seconds
    Then I cannot see top right button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Activate" in page detail
    Then I softly cannot see top right dropdown button "Deactivate" in page detail

    Examples:
      | UserType |
      | EXE      |

  @StrategicPlans_Goal_Objective @sanitysuiteplanning @NYSED_Automation_Sanity
  Scenario Outline: Verify that the Internal user see only Edit button at the Strategic Plan page layout and other record flow action buttons at page level action dropdown
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Activate" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Back To Strategic Plan" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Back To Strategic Goal" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType |
      | PM       |

  @InternalProgramFlow @sanitysuiteplanning @NYSED_Automation_Sanity
  Scenario Outline:Verify that fund code field on Internal program is a required text field which allows only 4 digits without decimal.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    When I navigate to "Setup" sub tab
    And I wait for "2" seconds
    #536255
    Then I see the following rows under the following headers in table with id "---program:-:reviewStepTableId---" :
      |        | Actions     | Step Order | Step Name             | Description                                      | Step Weight (%) | # of Panels |
      | extend | Action menu | 1          | Program Office Review | Application completeness and correctness review. | 0.00%           | 2           |
      | extend | Action menu | 2          | Grants Finance Review | Application grants finance review.               | 100.00%         | 1           |
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see field "Fund Code" as "1990"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see field "Fund Code" as "1990"
    And I save the field labeled "Fund Code" as "FundCode"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I clear the value from field "Fund_Code__c"
    Then I softly see fields "Fund_Code__c" is in edit mode
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Fund Code is required in the Overview tab under the Information section. |
    And I enter value "asd" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 character(0-9). |
    And I enter value "11.00" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 character(0-9). |
    And I enter value "-120" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 character(0-9). |
    And I enter value "123" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 character(0-9). |
    And I enter value "{SavedValue:FundCode}" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see field "Fund Code" as "{SavedValue:FundCode}"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - At least one contact should have the 'Fiscal Contact' Role.  |
      | Overview Tab - At least one contact should have the 'Program Contact' Role. |
      | Responsibilities - At least one approver is required                        |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - At least one contact should have the 'Fiscal Contact' Role. |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    And I click on "Submit For Approval" in the page details
    Then I softly cannot see the following messages in the page details :
      | Overview Tab - At least one contact should have the 'Fiscal Contact' Role. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Project Role    |
      | Automation PM  | Program Contact |
      | Automation EXE | Fiscal Contact  |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation PM  | Checked        |
      | Automation EXE | Checked        |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "5" seconds
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:FD Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Program" in "---program:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Send to Owner" in the approval decision
    And I wait for "15" seconds
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I click on "Amend Program" in the page details
    And I wait for "7" seconds
    Then I softly see field "Status" as "Being Amended"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    Then I cannot see top right button "New" in flex table with id "---program:-:programsTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    Then I cannot see top right button "New" in flex table with id "---program:-:programsTableId---"

    Examples:
      | UserType | Approver                 |
      | FO       | {SavedValue:FO Username} |

  @InternalProgramPeerReview @sanitysuiteplanning @NYSED_Automation_Sanity
  Scenario Outline:  program peer review flow
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FD Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    When I click on "Upload Template" icon for "Automation test description" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    Then I softly see value "View" for title "Template Link" against the value "Optional" inside table "---program:-:checklistTableId---"
    And I wait for "2" seconds
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other Artifacts" from computer
    And I pause execution for "5" seconds
    When I click modal button "Close"
    Then I softly see value "Other Artifacts" for title "Classification" against the value "Attachment.pdf" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly can see row level action button "Download" against "Other Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly can see row level action button "View" against "Other Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly can see row level action button "Edit" against "Other Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly can see row level action button "Delete" against "Other Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    And I edit the following rows inline in flex table with id "---program:-:internalProgramNotesTableId---" by clicking "Edit" :
      | Created By               | Title         | Description       |
      | {SavedValue:FD Username} | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---program:-:internalProgramNotesTableId---"
    And I pause execution for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FD Username} | Step 3  |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description                 | Due Date |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "5" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Reviewed"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Project Role    | Is Key Contact |
      | Automation FD  | Program Contact | Checked        |
      | Automation EXE | Fiscal Contact  | Checked        |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    And I click on "Amend Program" in the page details
    Then I softly see field "Status" as "Being Amended"
    And I navigate to "Planning" tab
    Then I softly do not see the left navigation link "External Programs"
    Then I softly see the left navigation link "Internal Programs"

    Examples:
      | UserType |
      | FD       |

  @InternalProgramKeyContactValidations @sanitysuiteplanning @NYSED_Automation_Sanity
  Scenario:Verify with the Program Owner if selecting the 'Key Contact' Check box for multiple contacts in 'Program Contact' and 'Fiscal Contact' triggers the validation message upon clicking 'Submit for Approval'.
  |Verify with the Program Owner that if the 'Key Contact' check box is not selected for 'Program Contact' and 'Fiscal Contact,' the validation message appears upon clicking 'Submit for Approval.'|
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1064
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "FiscaluniqueEmailID"
    And I enter value "{SavedValue:FiscaluniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name               | Is Key Contact |
      | Automation Contact | Checked        |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1064
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "ProgramuniqueEmailID"
    And I enter value "{SavedValue:ProgramuniqueEmailID}" into field "Email"
    And I enter value "Program Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1064
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |

  @StateFundingSourceValidations @sanitysuiteplanning @NYSED_Automation_Sanity
  Scenario Outline: Verify that fund code field is editable at Funding Source when in created state and field is a required text field which allows only 4 digits without decimal - Internal Funding Source
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
    And I enter value "mmmm" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Funding Account - Overview Tab - Fund code can consist only 4 digits. |
    And I enter value "-192" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Funding Account - Overview Tab - Fund code can consist only 4 digits. |
    And I enter value ".99" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Funding Account - Overview Tab - Fund code can consist only 4 digits. |
    And I clear the value from field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see field "Able to Pay?" as "No"
    Then I softly see field "Able to Pay?" is not editable
    When I click on "Activate" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund Code is required and must contain 4 digits. |
    When I click on "Edit" in the page details
    And I enter value "123" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on "Activate" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund Code is required and must contain 4 digits. |
    When I click on "Edit" in the page details
    And I enter value "1234" into field "Fund_Code__c" page block
    When I click on "Save" in the page details
    Then I softly see field "Fund Code" as "1234"
    When I click on "Activate" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Fund Code is required and must contain 4 digits. |
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Active"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail
    Then I softly see field "Fund Code" is not editable
    Then I softly see field "Able to Pay?" added after "Funding Source"
    Then I softly see field "Able to Pay?" as "No"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I softly cannot see top right button "Edit" in page detail
    And I click on back arrow
    When I click on "Deactivate" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    Then I softly see field "Fund Code" is not editable
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I softly cannot see top right button "Edit" in page detail
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Active"
    Then I softly can see top right button "Deactivate" in page detail
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail

    Examples:
      | UserType |
      | FD       |

  @StateFundingSourceFlow @sanitysuiteplanning @NYSED_Automation_Sanity
  Scenario Outline: Verify that fund code field is not editable at Funding Account and funding source for other internal user except Admin and FD - Internal Funding Source
    Given I login to "As a Grantor" app as "FD" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "Yes" into field "NYSED_GSPS__c"
    And I enter value "1000" into field "NYSED_Expenditure_Cap__c"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    Then I softly see fields "Fund_Code__c" is in edit mode
    And I enter value "10" into field "NYSED_Variable__c"
    And I enter value "20" into field "NYSED_SFSYear__c"
    And I enter value "20" into field "NYSED_CstCntr__c"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly cannot see top right button "Stop Payments" in page detail
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly cannot see top right button "Stop Payments" in page detail
    Then I softly can see top right button "Release Payments" in page detail
    When I click on "Release Payments" in the page details
    And I wait for "2" seconds
    Then I softly see field "Able to Pay?" as "Yes"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly cannot see top right button "Release Payments" in page detail
    Then I softly can see top right button "Stop Payments" in page detail
    When I click on "Stop Payments" in the page details
    And I wait for "2" seconds
    Then I softly see field "Able to Pay?" as "No"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly cannot see top right button "Stop Payments" in page detail
    Then I softly can see top right button "Release Payments" in page detail
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    Then I cannot see top right button "Stop Payments" in page detail
    Then I softly cannot see top right button "Release Payments" in page detail

    Examples:
      | UserType |
      | PM       |
#      | FO       |
#      | PO       |
#      | ADMIN    |
#      | EXE      |

  @FederalFundingSourceFlow @sanitysuiteplanning @NYSED_Automation_Sanity
  Scenario Outline:Verify that snapshot history is available when the funding account is activated. - External funding source
    Given I login to "As a Grantor" app as "<UserType>" user
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
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter value "1991" into field "Fund_Code__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Total Records: 1" inside flex table with id "---fundingsource:-:grantorSnapshotTableId---"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "History" sub tab
    Then I softly see "Total Records: 1" inside flex table with id "---fundingsource:-:grantorSnapshotTableId---"
    And I navigate to "Overview" sub tab
    When I save the value from row "1" for column name "Funding Account Title" as "FundingAccId" from flex table "---fundingsource:-:fundingAccountTableId---"
    And I click on "View" icon for "{SavedValue:FundingAccId}" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    When I navigate to "History" sub tab
    Then I softly see "Total Records: 1" inside flex table with id "---fundingsource:-:grantorSnapshotTableId---"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "History" sub tab
    And I refresh the page
    And I wait for "4" seconds
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

  @federalFS_CertLevelExceedWarningMessage @sanitysuiteplanning @NYSED_Automation_Sanity @Bug-Ticket-NYSED-1206
  Scenario: Verify that the FD users cannot edit the following fields when the federal funding source is in the active or closed state.
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I generate the random FAIN and save as "uniqueFAIN"
    And I enter value "{SavedValue:uniqueFAIN}" into field "FAIN__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
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
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I wait for "2" seconds
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter value "1991" into field "Fund_Code__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
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
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
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
    And I wait for "4" seconds
    #545542
    Then I softly see the following messages in the page details contains:
      | The Cert Level amount exceeds the School Year Level amount for this Funding Source. |

  @stateFS_CertLevelExceedWarningMessage @sanitysuiteplanning @NYSED_Automation_Sanity @Bug-Ticket-NYSED-1206
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
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see field "School Year Level" as "$2,000"
    Then I softly see field "Cert Level" as "$20,000"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
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

  @stateFS_CertLevelLessarWarningMessageDontShow @sanitysuiteplanning @NYSED_Automation_Sanity
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
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
    Then I softly see field "School Year Level" as "$10,000,000"
    Then I softly see field "Cert Level" as "$0"
    #545567
    Then I softly cannot see the following messages in the page details contains:
      | The Cert Level amount exceeds the School Year Level amount for this Funding Source. |
    And I click on "View" icon for "{SavedValue:FundingAccountTitle}" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I wait for "4" seconds
    #545567
    Then I softly cannot see the following messages in the page details contains:
      | The Cert Level amount exceeds the School Year Level amount for this Funding Source. |

  @federalFS_BlankVoucherCutValidationMessage @sanitysuiteplanning @NYSED_Automation_Sanity
  Scenario:Verify that when an FD user clicks the ‘Release Payment’ button and the Blanket Voucher Cut (%) field is left blank, a validation message is displayed. - Federal Funding Account
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I generate the random FAIN and save as "uniqueFAIN"
    And I enter value "{SavedValue:uniqueFAIN}" into field "FAIN__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    When I enter value "No" into field "NYSED_GSPS__c"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter value "1991" into field "Fund_Code__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
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
    And I wait for "2" seconds
    And I enter value "16.8" into field "NYSED_BlanketVoucherCut__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Release Payments" in the page details
    #545603
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - 'Able to Pay?' cannot be set to Yes because Blanket Voucher Cut is incomplete. |

  @FormulaAnnouncementsFlowAllocationLevelNA @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline:Verify that Internal user should not see validation if user not enter value in field  'Maximum Indirect Rate %' for the optional type 'Restricted'  - Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_LS" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I wait for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Fund Code" inside page block
    Then I softly see field "Fund Code" as "1990"
    Then I softly see field "Year" as "2030"
    Then I softly see field "Fund Year" as "1990-30"
    When I click on "Edit" in the page details
    Then I softly see field "Fund Year" is not editable
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    Then I softly cannot see field "OSC Approved?" inside page block
    And I wait for "3" seconds
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "{SavedValue:SubrecipientOrg}" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Title                        | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly can see top right button "Update Details" in page detail
    When I click on "Update Details" in the page details
    Then I softly see "Update Details" opens in overLay window
    Then I softly see "Edit Budget/Payment Hold" page block displayed
    Then I softly cannot see field "OSC Approved?" inside page block
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    Then I softly see field "Bud Stop" as "{Date:M/d/yyyy::d+1}"
    Then I softly see field "Pay Stop" as "{Date:M/d/yyyy::d+20}"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | The announcement cannot be published because OSC approval is not received. Please contact the FD user to update the 'OSC Approved?' value using the Update Details button. |
    Then I see status in Progress-bar is "Published" and is "dark blue"
    And I click on "Unpublish" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Under Revision"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |

  @FormulaAnnouncementsDirectGrantYesByApplicantandFocusArea @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline: Verify that the Announcement Owner can see 'Is Announcement for Direct Grant?' as a picklist field with Yes/No dropdown options is added at the create announcement modal->Information Section: Formula
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    Then I softly see field "Is Announcement for Direct Grant?" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_IsDirecGrant__c" :
      | --None-- | Yes | No |
    When I enter in modal value "--None--" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Is Announcement for Direct Grant? is required. |
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    Then I softly see field "Is Announcement for Direct Grant?" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_IsDirecGrant__c" :
      | --None-- | Yes | No |
    When I enter in modal value "--None--" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Is Announcement for Direct Grant? is required in the Information section. |
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see field "Is Announcement for Direct Grant?" added after "Link For Additional Information"
    Then I softly see field "Is Announcement for Direct Grant?" is not editable
    Then I softly see field "Is Announcement for Direct Grant?" as "Yes"
    Then I softly cannot see field "Application Due Date" inside page block
    Then I softly do not see "Eligibility Details" page block displayed
    Then I softly do not see "Contacts section" page block displayed
    Then I softly do not see "Q & A Information" page block displayed
    Then I softly cannot see field "Maximum # Applications Allowed" inside page block
    Then I softly cannot see field "Is Application Deadline Soft?" inside page block
    And I click on "Edit" in the page details
    Then I softly see field "Is Announcement for Direct Grant?" added after "Link For Additional Information"
    Then I softly see field "Is Announcement for Direct Grant?" is not editable
    Then I softly see field "Is Announcement for Direct Grant?" as "Yes"
    Then I softly cannot see field "Application Due Date" inside page block
    Then I softly do not see "Eligibility Details" page block displayed
    Then I softly do not see "Contacts section" page block displayed
    Then I softly do not see "Q & A Information" page block displayed
    Then I softly cannot see field "Maximum # Applications Allowed" inside page block
    Then I softly cannot see field "Is Application Deadline Soft?" inside page block
    And I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #518756
    Then I softly do not see "Contacts" inside page block detail
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    #518733
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I close "Add Organizations" modal by clicking the top right x button
    #518738
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations Direct Grant Yes.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    #517858
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    Then I softly verify that the file "Applicants and Allocations.xlsx" is downloaded
    #517861
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "2" contains value "{SavedValue:SubrecipientHealthOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "3" contains value "{SavedValue:SubrecipientSchoolOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
      #517318
    And I wait for "2" seconds
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Delete Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I see only the following headers in table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" :
      |  |  | Actions | Institution ID | SED Code | Applicants |
    #517320
    Then I see the following rows under the following headers in table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" :
      |        |  | Actions     | Institution ID | SED Code | Applicants                   |
      | extend |  | Action menu | 166485411256   | CACP12   | {SavedValue:SubrecipientOrg} |
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see only the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Actions | Focus Area | Allocation Amount | Last Updated By | Last Updated |
    #517323
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $0                |
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    When I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly see fields "AllocatedAmount__c" is in edit mode
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | 90.00             |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $9,000            |
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | -44               |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Allocation Amount can not be less than zero. |
    When I click on "Undo" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | #$^&              |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $0                |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I refresh the page
    And I wait for "5" seconds
    And I expand nested table containing column value "{SavedValue:SubrecipientSchoolOrg}"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area |                   |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $0                |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PM | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                       |
      | Automation FD | Grants Finance Coordinator |
    And I wait for "2" seconds
    When I click on "Submit For Approval" in the page details
    #518725
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Select Eligible Applicant Types in the Eligibility Details section. |
    #518756
      | Overview Tab - At least one contact should have the 'Fiscal Contact' Role.         |
      | Overview Tab - At least one contact should have the 'Program Contact' Role.        |
    #518774
      | Overview Tab - Provide the Application Due Date.                                   |
      | Overview Tab - 'Is Application Deadline Soft?' is required to submit for approval. |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    #517314
    Then I softly cannot see top right dropdown button "Publish" in page detail
    Then I softly cannot see top right dropdown button "Revise" in page detail
    Then I softly cannot see top right dropdown button "Extend Dates" in page detail

    Examples:
      | UserType | Approver      |
      | PO       | Automation PO |
#      | PM       | Automation PM|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @FormulaAnnouncementsFundingAccount @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline: Verify that apart from FD users, other users cannot edit, remove, associate 'Funding Account' when Directed/Formula announcement is in status- Created, Under Revision, Submitted for Review, Review Completed, Publish and Closed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I wait for "3" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount2---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 100             |
    #Owner- Created state
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    #owner - Submit for Approval
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    #NYSED-1097
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    #owner - Send back / Under revision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "4" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I "Send to Owner" in the approval decision
    And I wait for "1" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    #Owner- Approved state
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I "Approve" in the approval decision
    And I wait for "1" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on "Publish" in the page details
    #owner- Publish State
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount2}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "---AUTOEnvData:-:ClosedFormulaAnnouncement---" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "---AUTOEnvData:-:ClosedFormulaAnnouncement---" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount1}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:fundingAccount1}" in flex table with id "---announcement:-:fundingAccountsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |

  @FormulaAnnouncementsKeyContactValidations @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline:Verify with the Program Owner that if the 'Key Contact' check box is not selected for 'Program Contact' and 'Fiscal Contact,' the validation message appears upon clicking 'Submit for Approval' for Formula announcement - By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Unchecked      |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Unchecked      |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1092
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #NYSED-1092##
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Unchecked      |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1092
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FD Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I perform quick search for "{SavedValue:FD1 Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FD1 Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:FD Username} | Program Contact |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:FD1 Username} | Fiscal Contact |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:FD Username} | Checked        |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:FD1 Username} | Checked        |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1092
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:FD Username} | Unchecked      |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1092
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:FD Username} | Checked        |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:contactTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:FD1 Username} | Unchecked      |
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1092
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |

    Examples:
      | UserType |
      | PO       |
#      | PM       |
#      | FO       |
#      | FD       |

  @FormulaAnnouncementsFlowAllocationLevelByApplicant @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline:Verify that grantee user can see read-only field for "Maximum Indirect Rate%" on Opportunity layout (publish & qualify), when indirect rate is 'Unrestricted'- Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I pause execution for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I enter value "100" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    When I click on "Upload Template" icon for "Automation test description" inside flex table with id "---announcement:-:annChecklist---" without waiting for record
    And I pause execution for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    Then I softly see value "View" for title "Template Link" against the value "Optional" inside table "---announcement:-:annChecklist---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    And I pause execution for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I pause execution for "5" seconds
    When I click modal button "Close"
    Then I softly see value "Other" for title "Classification" against the value "Attachment.pdf" inside table "---announcement:-:AnnouncementAttachmentTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Edit" :
      | Created By               | Title         | Description       |
      | {SavedValue:FO Username} | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I navigate to "Financials" sub tab
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Unrestricted"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Maximum Indirect Rate%" is not editable
    Then I softly see field "Maximum Indirect Rate%" as "100.00%"
    When I click on "Qualify" in the page details
    And I wait for "10" seconds
    Then I softly see field "Status" as "Qualified"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @DirectedAnnouncementsDownloadinExcelValidations @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline: Verify that user can add rows or update existing rows in Excel, and upload the updated data in the Excel to the Applicants section. If the upload is successful, I see that the Applicants section refreshes and shows updated - Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I wait for "5" seconds
    And I click modal button "Continue"
    When I enter "Creation_Allocation_NA_DG_Yes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "1234567891231" value in "2" row and "1" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    And I click modal button "Close"
    #518976
    And I delete the excel file "Applicants.xlsx"
    And I wait for "3" seconds
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "" value in "2" row and "1" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below. |
      | Row #2 - The Institution ID is missing.      |
    When I click modal button "Close"
    And I delete the excel file "Applicants.xlsx"

    Examples:
      | UserType |
      | FD       |
#      | PO       |
#      | FO       |
#      | PM       |

  @AnnouncementsCreationNewButttonAccess @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline: Verify that the PM/PO/FD/FO profile users only can see the 'New' button on the Announcement phase->Competitive announcement list view.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    Then I softly cannot see top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"

    Examples:
      | UserType |
      | EXE      |
      | ADMIN    |

  @CompetitiveAnnouncementsFlow @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline:Verify that grantee user can see read-only field for "Maximum Indirect Rate%" on Opportunity layout (Publish & Qualify), when indirect rate is 'Restricted'- Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I click on "Update Details" in the page details
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Financials" sub tab
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I pause execution for "3" seconds
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    And I enter value "Justified" into field "Justification__c"
    Then I softly see fields "Indirect_Rate__c" is in edit mode
    And I enter value "100" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
    When I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I navigate to "Financials" sub tab
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Restricted"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Maximum Indirect Rate%" is not editable
    Then I softly see field "Maximum Indirect Rate%" as "100.00%"
    When I click on "Qualify" in the page details
    And I wait for "10" seconds
    And I navigate to "Financials" sub tab
    And I wait for "10" seconds
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Restricted"
    Then I softly see field "Maximum Indirect Rate%" is not editable
    Then I softly see field "Maximum Indirect Rate%" as "100.00%"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @DirectedAnnouncementsFlow @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline:Verify that grantee user can see read-only field for "Indirect Rate Type- Not Allowed" on Opportunity layout which is converted to application- Directed Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I pause execution for "3" seconds
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    When I click on "Upload Template" icon for "Automation test description" inside flex table with id "---announcement:-:annChecklist---" without waiting for record
    And I wait for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    Then I softly see value "View" for title "Template Link" against the value "Optional" inside table "---announcement:-:annChecklist---"
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    And I pause execution for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I pause execution for "5" seconds
    When I click modal button "Close"
    Then I softly see value "Other" for title "Classification" against the value "Attachment.pdf" inside table "---announcement:-:AnnouncementAttachmentTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Edit" :
      | Created By               | Title         | Description       |
      | {SavedValue:FO Username} | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "5" seconds
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I click toggle button to select "Opportunities Converted to Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I navigate to "Financials" sub tab
    Then I softly see "Budget Specific Settings" page block displayed
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Not Allowed"
    Then I softly do not see "Maximum Indirect Rate%" page block displayed

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE      |

  @OpportunitiesIndirectrate_notallowed @sanitysuiteOpportunities @NYSED_Automation_Sanity
  Scenario:Verify that grantee user can not see read-only field  ''Maximum Indirect Rate%'' on published opportunities that  can access from the grantee login page if indirect rate is not allowed - Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I click on "Update Details" in the page details
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I get the "EGMS ID"
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I click on "Submit For Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    Given I am on "SUBPORTAL" portal
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:publishAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:publishAnnouncementTableId---" without waiting for record
    #497808
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "Not Allowed"
    Then I softly do not see "Maximum Indirect Rate%" page block displayed

  @OpportunitiesIndirectrate_otheroptions @sanitysuiteOpportunities @NYSED_Automation_Sanity
  Scenario Outline:Verify that grantee user can see read-only field for "Indirect Rate Type" and 'Maximum Indirect Rate%' on Opportunity layout which is converted to application- Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccountsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I click on "Update Details" in the page details
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "<IndirectType>" into field "Indirect_Rate_Type__c"
    Then I softly see fields "Indirect_Rate__c" is in edit mode
    And I enter value "50" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    Given I am on "SUBPORTAL" portal
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:publishAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:publishAnnouncementTableId---" without waiting for record
    #496091
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Indirect Rate Type" is not editable
    Then I softly see field "Indirect Rate Type" as "<IndirectType>"
    Then I softly see field "Maximum Indirect Rate%" is not editable
    Then I softly see field "Maximum Indirect Rate%" as "50.00%"

    Examples:
      | UserType   | IndirectType |
      | GRANTEE_SC | Restricted   |
      | GRANTEE_SC | Unrestricted |

  @ApplicationAllocationZeroValidation @sanitysuiteApplication @NYSED_Automation_Sanity
  Scenario: Verify that the Grantee user with the create and edit role, not able to create the Application from opportunity if allocation is zero, validation appears. Formula: By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_FOCUS_NO_ZERO_ALLOCATION"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_CE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    #516287
    And I wait for "3" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | The application cannot be created because the allocation amount is zero. |

  @ApplicationSubmitApplicationButtonHideForUsers @sanitysuiteApplication @NYSED_Automation_Sanity
  Scenario Outline:Verify that other than the 'Submit and Certify' Role user cannot see the 'Submit Application' button at the application layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BYAPPLICANTFOCUSAREA_INDIRECTRATE_NOTALLOWED"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    #532223
    Then I softly cannot see top right button "Submit Application" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #532223
    Then I softly cannot see top right button "Submit Application" in page detail
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #532223
    Then I softly cannot see top right button "Submit Application" in page detail

    Examples:
      | UserType   |
      | GRANTEE_CE |

  @ApplicationAllocationZeroValidationmessage @sanitysuiteApplication @NYSED_Automation_Sanity
  Scenario: Verify that the Grantee user with the submit and certify role, not able to Submit the Application where the allocation amount is zero, validation appears. Formula: By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget |
      | Equipment     | 1000   |
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 0                 |
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I click on "Submit Application" in the page details
    #516311
    Then I softly see the following messages in the page details contains:
      | The application cannot be submitted to the grantor because the allocation amount is zero. |

  @ApplicationValidationmessage @sanitysuiteApplication @NYSED_Automation_Sanity @Indirect_Rate_Type_Restricted
  Scenario Outline:Verify that the 'Submit and Certify' user see the validation message after clicking the Submit Application button when the Requested Indirect Amount is greater than the Maximum Indirect Allowed at focus area level. - Competitive
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "SECOND_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget |
      | Professional Staff Salaries | 500    |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget |
      | Indirect Cost   | 500    |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    #545636
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Requested Indirect Amount must be less than or equal to the Maximum Indirect Allowed amount for Automation Permanent Focus Area. |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @CompetitiveDirectGrantAnnouncement @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline: Verify that the user can Create and approved Direct Grant of Competitive type with Yes setting -PM User (Upload Excel) ( Carry Over Yes ) (FS-10)
  |Verify that the user can see Fields are visible on Direct Grant- Grant Abbrevation|
  |Verify that Deputy Area field value should carried from the associated program|
  |Fields Not Visible on Direct Grant - Eligible Applicant Types, Eligibility Information|
  |Verify that the user can see Section not visible on direct grant--Setup subtab- Review Steps, FDM Review Step|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Allocation_NA_DG_Yes" values from "Announcement_Field_Values.xlsx"
    And I enter value "Yes" into field "RiskAssessment_Required__c"
    And I enter value "Yes" into field "IsAdvancePermitted__c"
    And I enter value "Yes" into field "FocusAreaRequired__c"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I enter value "Yes" into field "Carry_Over__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Financials" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    Then I softly see field "Grant Abbreviation" as "GA"
    And I save the field labeled "Program ID" as "ProgramID"
    And I click "{SavedValue:ProgramID}" lookup link
    And I wait for "2" seconds
    Then I softly see field "Deputy Area" as "OHE"
    And I save the field labeled "Deputy Area" as "ProgramDeputyArea"
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Deputy Area" as "{SavedValue:ProgramDeputyArea}"
    Then I softly see field "Deputy Area" as "OHE"
    Then I softly cannot see field "Eligible Applicant Types" inside page block
    Then I softly cannot see field "Eligibility Information" inside page block
    Then I softly do not see "Eligibility Details" page block displayed
    When I navigate to "Setup" sub tab
    Then I softly do not see "Review Steps" page block displayed
    Then I softly do not see "FDM Review Step" page block displayed
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I enter value "No" into field "NYSED_FARequiredForAmendment__c"
    And I enter value "10" into field "First_Payment__c"
    And I enter value "Justified" into field "AnnouncementDescription__c"
    When I navigate to "Financials" sub tab
    And I enter value "1000" into field "AwardFloor__c"
    And I enter value "2000" into field "AwardCeiling__c"
    And I enter value "1000" into field "TotalCommittedAmount__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I enter value "100" into field "Indirect_Rate__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PM | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                       |
      | Automation FD | Grants Finance Coordinator |
    And I wait for "3" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload file "Applicants_DirectGrantYes.xlsx" into library
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "7" seconds
    Then I softly see value "{SavedValue:SubrecipientHealthOrg}" for title "Applicants" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see value "{SavedValue:SubrecipientSchoolOrg}" for title "Applicants" inside table "---announcement:-:directedInvitedApplicatsTableId---"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"

    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | PO       | Automation PO|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @FormulaDirectGrantAnnouncementByApplicant-FS-10 @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline:Verify that the user can Create and approved Direct Grant of Formula BA type with No setting -FD User (Upload Excel) ( Carry Over No)  (FS-10)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I enter value "No" into field "IsMatchRequired__c"
    And I enter value "No" into field "IsGoalsRequired__c"
    And I enter value "No" into field "KPIsRequired__c"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I enter value "No" into field "Carry_Over__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I pause execution for "2" seconds
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "1000" value in "2" row and "4" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "2" seconds
    When I upload the excel file "Applicants and Allocations.xlsx"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PM | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                       |
      | Automation FD | Grants Finance Coordinator |
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "<ApproverUser>" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"

    Examples:
      | UserType | ApproverUser |
      | FD       | PO           |
#      | PO       | FO           |
#      | FO       | FD           |
#      | PM       | EXE          |
#      | EXE      | PM           |

  @FormulaDirectGrantAnnouncementByApplicantAndFocusArea-Lumpsum @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline:Verify that the user can Create and approved Direct Grant of Formula BAFA type with yes setting -FO User (Without Upload Excel) ( Carry Over Yes ) (Lump Sum)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Second_Module_LS_DG_Ye" values from "Announcement_Field_Values.xlsx"
    And I enter value "Yes" into field "RiskAssessment_Required__c"
    And I enter value "Yes" into field "IsAdvancePermitted__c"
    And I enter value "Yes" into field "FocusAreaRequired__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Formula_Edition_LS_DG_Yes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I enter value "Yes" into field "Carry_Over__c"
    And I enter value "Testing" into field "AnnouncementDescription__c"
    And I enter value "Yes" into field "NYSED_FARequiredForAmendment__c"
    And I enter value "10.87" into field "First_Payment__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    Then I softly see field "Budget Type" as "Lump Sum"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PM | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                       |
      | Automation FD | Grants Finance Coordinator |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "1000" into field "TotalCommittedAmount__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"

    Examples:
      | UserType | Reviewer |
      | FO       | FD       |
#      | PO       | PM       |
#      | PM       | PO       |
#      | FD       | FO       |

  @DirectedDirectGrantAnnouncement-Lumpsum-UploadExcel @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline: Verify that the user can Create and approved Direct Grant of Directed type with No setting -PO User (Upload Excel)  ( Carry Over No) (Lump Sum)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_CompDir_DG_Yes_Lumpsum" values from "Announcement_Field_Values.xlsx"
    And I enter value "No" into field "IsMatchRequired__c"
    And I enter value "No" into field "IsGoalsRequired__c"
    And I enter value "No" into field "KPIsRequired__c"
    And I enter value "No" into field "FocusAreaRequired__c"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I enter value "No" into field "Carry_Over__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I wait for "3" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I navigate to "Financials" sub tab
    When I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "2000" into field "AwardCeiling__c"
    And I enter value "1000" into field "AwardFloor__c"
    And I enter value "1000" into field "TotalCommittedAmount__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    When I navigate to "Overview" sub tab
    And I enter value "No" into field "NYSED_FARequiredForAmendment__c"
    And I enter value "10" into field "First_Payment__c"
    And I enter value "Justified" into field "AnnouncementDescription__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PM | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                       |
      | Automation FD | Grants Finance Coordinator |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"

    Examples:
      | UserType | Approver      |
      | PO       | Automation PO |
#      | PM       | Automation PM|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @Application_MaximiumApplicationAllowed-LUMPSUM @sanitysuiteApplication @NYSED_Automation_Sanity
  Scenario Outline:Verify that the grantee user can create applications equal to the 'Maximum # Applications Allowed' at the related competitive opportunity for self when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Award" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUMCOMP_DIREC_MAXIMUM_APPLICATION_ALLOWED_2"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID2"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID2"
    Then I softly see field "Status" as "Created"
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget |
      | Lump Sum      | 1000   |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "3" seconds
    Then I softly see value "Review Completed" for title "Decision Status" inside table "---applicationReview:-:applicationAssignTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:FO Username} | Step 1 |
    And I navigate to "Funding Decision Memo" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "AWS" into field "GrantCode__c"
    And I enter value "Yes" into field "NYSED_OSCApproved__c"
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "FundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000               | 1000                    | Yes                   | Recommended |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - Approved"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I wait for "3" seconds
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I save the value from row "1" for column name "Grant" as "GrantID" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on hyperlink containing value "{SavedValue:GrantID}"
    And I wait for "7" seconds
    And I switch to tab number "1"
    And I wait for "7" seconds
    #543027
    Then I softly see field "Status" as "Draft"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ParentAppEGMSID2}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ParentAppEGMSID2}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget |
      | Lump Sum      | 1000   |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #543027
    Then I softly see field "Status" as "Review Initiated"

    Examples:
      | UserType   | Announcement Name                                              |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application Award} |

  @Application_MaximiumApplicationAllowed-FS10 @sanitysuiteApplication @NYSED_Automation_Sanity
  Scenario Outline:Verify that the grantee user can create applications equal to the 'Maximum # Applications Allowed' at the related competitive opportunity for child organization when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Award" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMP_DIREC_MAXIMUM_APPLICATION_ALLOWED_2"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID2"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID2"
    Then I softly see field "Status" as "Created"
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name               | Budget |
      | Professional Staff Salaries | 1000   |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "3" seconds
    Then I softly see value "Review Completed" for title "Decision Status" inside table "---applicationReview:-:applicationAssignTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:FO Username} | Step 1 |
    And I navigate to "Funding Decision Memo" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "AWS" into field "GrantCode__c"
    And I enter value "Yes" into field "NYSED_OSCApproved__c"
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000                    | Yes                   | Recommended |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - Approved"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I wait for "3" seconds
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I save the value from row "1" for column name "Grant" as "GrantID" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on hyperlink containing value "{SavedValue:GrantID}"
    And I wait for "7" seconds
    And I switch to tab number "1"
    And I wait for "7" seconds
    #543029
    Then I softly see field "Status" as "Draft"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ParentAppEGMSID2}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ParentAppEGMSID2}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name               | Budget |
      | Professional Staff Salaries | 1000   |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #543029
    Then I softly see field "Status" as "Review Initiated"

    Examples:
      | UserType   | Announcement Name                                              |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application Award} |

  @Application_MaximiumApplicationAllowedFormulaAnnouncement @sanitysuiteApplication @NYSED_Automation_Sanity
  Scenario Outline:Verify that the grantee user can create applications equal to the 'Maximum # Applications Allowed' at the related competitive opportunity when the 'Is Parent Organization' flag on the organization profile is set to 'No'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMP_DIREC_MAXIMUM_APPLICATION_ALLOWED"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID2"
    Then I softly see field "Status" as "Created"

    Examples:
      | UserType   | Announcement Name                                        |
      | GRANTEE_CE | {SavedValue:Automation Runtime Announcement Application} |
#      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} |

  @CertLevelZeroAssociateFAOnAnnouncement @applicationValidationMessage @sanitysuiteannouncements @NYSED_Automation_Sanity
  Scenario Outline:Associate funding account with 0 balance and use that announcement on further modules
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I generate the random FAIN and save as "uniqueFAIN"
    And I enter value "{SavedValue:uniqueFAIN}" into field "FAIN__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "Yes" into field "NYSED_GSPS__c"
    And I enter value "1000" into field "NYSED_Expenditure_Cap__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I enter value "1991" into field "Fund_Code__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    And I enter value "0" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:FundingAccountID}" in "---announcement:-:fundingAccTableId---" panel
    Then I softly see value "$0" for title "Total Obligation" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccTableId---"
    Then I softly see value "$0" for title "Available Balance" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccTableId---"
    When I click "Associate" after selection of "{SavedValue:FundingAccountID}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Then I softly see value "{SavedValue:FundingAccountID}" for title "Funding Account" against the value "{SavedValue:FundingAccountTitle}" inside table "---announcement:-:fundingAccountsTableId---"
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I enter value "100" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    And I wait for "2" seconds
        #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:AnnouncementReviewPanel---" :
      | Actions     | Step Order | Step Name             | Description                                      | Step Weight (%) | # of Panels |
      | Action menu | 1          | Program Office Review | Application completeness and correctness review. | 50.00%          | 2           |
      | Action menu | 2          | Grants Finance Review | Application grants finance review.               | 50.00%          | 1           |
    And I expand nested table containing column value "Program Office Review"
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:annReviewFormsTableId---" :
      | Actions     | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Action menu | Group 2   | 50.00%          | 1                                         | True      | Yes                    |
      | Action menu | Group 1   | 50.00%          | 1                                         | True      | Yes                    |
    And I click on "Review Form" icon for "Group 2" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header                                   | Section Weight (%) |
      | Action menu | 1             | General Preparation                              | 0%                 |
      | Action menu | 2             | Assurances & Consultation                        | 0%                 |
      | Action menu | 3             | Intent to Apply                                  | 0%                 |
      | Action menu | 4             | Title I, Part A – Fiscal Information             | 0%                 |
      | Action menu | 5             | Title I, Part A – LEA Reserves                   | 0%                 |
      | Action menu | 6             | Title I, Part A – Distribution of Funds          | 0%                 |
      | Action menu | 7             | Title I, Part A – Neglected Facilities           | 0%                 |
      | Action menu | 8             | Title I, Part D – Program/Fiscal Information     | 0%                 |
      | Action menu | 9             | Title II, IV, and V – Program/Fiscal Information | 0%                 |
      | Action menu | 10            | Equitable Services                               | 0%                 |
    And I click on page navigation arrow "---announcement:-:reviewPanelTableId---" for table id "Next"
    And I wait for "5" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header         | Section Weight (%) |
      | Action menu | 11            | Budgets and Narratives | 0%                 |
      | Action menu | 12            | Overall Score          | 100%               |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Review Form" icon for "Group 1" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header                                | Section Weight (%) |
      | Action menu | 1             | General Preparation                           | 0%                 |
      | Action menu | 2             | Assurances & Consultation                     | 0%                 |
      | Action menu | 3             | Intent to Apply                               | 0%                 |
      | Action menu | 4             | Title I, Part A – Program Information         | 0%                 |
      | Action menu | 5             | Title I, Part A – Fiscal Information          | 0%                 |
      | Action menu | 6             | Title I, Part A – LEA Reserves                | 0%                 |
      | Action menu | 7             | Title I, Part A – Distribution of Funds       | 0%                 |
      | Action menu | 8             | Title I, Part A – Neglected Facilities        | 0%                 |
      | Action menu | 9             | Title I, Part D – Program/Fiscal Information  | 0%                 |
      | Action menu | 10            | Title II, Part A – Program/Fiscal Information | 0%                 |
    And I wait for "5" seconds
    And I click on page navigation arrow "---announcement:-:reviewPanelTableId---" for table id "Next"
    And I wait for "5" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header                                | Section Weight (%) |
      | Action menu | 11            | Title IV, Part A – Program/Fiscal Information | 0%                 |
      | Action menu | 12            | Title V RLIS – Program/Fiscal Information     | 0%                 |
      | Action menu | 13            | Equitable Services                            | 0%                 |
      | Action menu | 14            | Budgets and Narratives                        | 0%                 |
      | Action menu | 15            | Overall Score                                 | 100%               |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I collapse nested table containing column value "Program Office Review"
    And I expand nested table containing column value "Grants Finance Review"
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:annReviewFormsTableId---" :
      | Actions     | Form Name                 | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Action menu | Grant Finance Review Form | 100.00%         | 1                                         | True      | Yes                    |
    And I click on "Review Form" icon for "Grant Finance Review Form" inside flex table with id "---announcement:-:annReviewFormsTableId---" without waiting for record
    And I wait for "5" seconds
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelTableId---" :
      | Actions     | Section Order | Section Header     | Section Weight (%) |
      | Action menu | 1             | Application Review | 0%                 |
      | Action menu | 2             | Overall Score      | 100%               |
    And I expand nested table containing column value "Application Review"
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelQuestionsTableId---" :
      | Actions     | Question Order | Question                                                    | Type   | Max Score |
      | Action menu | 1              | Is the grants finance review complete for this application? | Yes/No | 10        |
    And I collapse nested table containing column value "Application Review"
    And I expand nested table containing column value "Overall Score"
    #536457
    Then I see the following rows under the following headers in table with id "---announcement:-:reviewPanelQuestionsTableId---" :
      | Actions     | Question Order | Question                   | Type    | Max Score |
      | Action menu | 1              | Additional inputs (if any) | Written | 100       |
    And I collapse nested table containing column value "Overall Score"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I collapse nested table containing column value "Grants Finance Review"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    And I wait for "2" seconds
    Then I softly see value "Notes Record" for title "Title" inside table "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    When I click on "Delete" icon for "Notes Record" inside flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    And I wait for "2" seconds
    #533554
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I wait for "5" seconds
    And I upload attachment "AttachmentTesting.pdf" of type "General Assurances" from computer
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly see "General Assurances" has been added in "Application Files" flex table
    And I click on "Edit" icon for "General Assurances" inside flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Suspension" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    #533552
    Then I softly see value "Automation.pdf" for title "Title" inside table "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly see value "Suspension" for title "Classification" inside table "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly can see row level action button "Edit" against "Suspension" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly can see row level action button "View" against "Suspension" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly can see row level action button "Download" against "Suspension" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly can see row level action button "Delete" against "Suspension" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I wait for "3" seconds
    When I click on "Delete" icon for "Suspension" inside flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    #533552
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide the Project Abstract before submitting this Application.                                |
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                                  |
      | Budget Tab - Enter a Justification for project cost before submitting this Application.                        |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                 |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                   |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                             |
      | Overview Tab - Provide Target Values for all Key Performance Indicators.                                       |
      | Forms and Files Tab - Complete each mandatory item listed in the checklist before submitting this Application. |


    Examples:
      | UserType |
      | PM       |

  @Application_NotForProfitNAValidationonCreateApplication @sanitysuiteApplication @NYSED_Automation_Sanity
  Scenario Outline:Verify that the Grantee user is stopped when clicking on the Save and Continue button on the Create Application modal if the 'Not For Profit' flag is set to NA at the organization profile.
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:AutomationPermanentNotforProfitNAOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:AutomationPermanentNotforProfitNAOrg---" inside table
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I enter value "Yes" into field "NYSED_IsParentOrganization__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Is Parent Organization" as "Yes"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I enter value "100" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:AutomationPermanentNotforProfitNAOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                                        | Allocation Amount |
      | {SavedValue:AutomationPermanentNotforProfitNAOrg} | 1000              |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I wait for "2" seconds
    And I collapse nested table containing column value "Grants Finance Review"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    #543145
    Then I softly see field "Not For Profit" as "NA"
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    #543145
    Then I softly see the following messages in the page details contains:
      | 'Not For Profit' value is not available for the organization. Contact LEA Admin or Submit and Certify user to update the value at the organization profile. |

    Examples:
      | ExternalUser                |
      | PARENT_ORG_EXTERNAL_USER_SC |

  @ApplicationRequestRevisionValidationmessage @sanitysuiteApplication
  Scenario Outline:Verify that the 'Submit and Certify' user see the validation message after clicking the Submit to Grantor button when the Requested Indirect Amount is greater than the Maximum Indirect Allowed at focus area level. - Formula By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "SECOND_FOCUS_AREA"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "3" seconds
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                                | Allocation Amount |
      | {SavedValue:AutomationPermanentFocusArea} | 500               |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                                 | Allocation Amount |
      | {SavedValue:AutomationPermanentFocusArea2} | 500               |
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget |
      | Professional Staff Salaries | 500    |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Cancel Revision" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID             | Task Type        | Subject                                                                                 | Due Date Only          | Status      |
      | Action menu | {SavedValue:EGMSID} | Revision Request | Revise Application #{SavedValue:EGMSID} for Funding Opportunity #{SavedValue:ANNEGMSID} | {Date:MM/dd/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Revision Initiated"
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget |
      | Indirect Cost   | 1500   |
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    #545641
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Requested Indirect Amount must be less than or equal to the Maximum Indirect Allowed amount for Automation Permanent Focus Area. |

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @AwardActivationFromFDM_FS10 @yugaC
  Scenario Outline: Award activation from FDM [for FS10]
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "GrantorActiveGrants" without waiting for record
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Grant_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter "FDM_Award_Edit" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:approversTableId---" by clicking "Edit" :
      | Name          | Name          | Award  |
      | Automation PM | Automation FD | Step 1 |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Generate GAN" in the page details
    And I pause execution for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @DirectGrantAwardActivation_FS10 @santosh
  Scenario Outline: Direct Grant Award Activation- FS10
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter "DG_Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "awardName"
    When I click on "Edit" in the page details
    And I enter unique value in field with apiName "NYSED_ProjectID__c"
    And I enter "DG_Award_Edit" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Enc Life |
      | {SavedValue:fundingAccount} | 1000     |
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardProfessionalSalariesTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role             | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Program Reviewer | Review  details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    When I click on "Enter Review" icon for "Program Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | Name                                | Target |
      | {SavedValue:AutomationPermanentKPI} | 10     |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Project Role    |
      | {SavedValue:GRANTEE_SC Username} | Program Contact |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Personnel |
      | {SavedValue:GRANTEE_SC Username} | Checked          |
    And I click on "Send to Grant Finance Office" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Grant Finance Office"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description     | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review  details | 10       | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I click on "Enter Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    When I click on submit review
    And I pause execution for "3" seconds
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Accepted"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:approversTableId---" by clicking "Edit" :
      | Name                     | Name                     | Award  |
      | {SavedValue:PM Username} | {SavedValue:PO Username} | Step 1 |
    And I wait for "2" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Low" into field "Risk_Level__c"
    And I enter value "Justified" into field "GMComments__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Generate GAN" in the page details
    And I pause execution for "10" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---" without waiting for record
    And I wait for "3" seconds
    When I click on "Accept after Approval" in the page details
    When I click alert button "OK"
    When I enter "Automation" in rich text prompt input
    When I click alert button "OK"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"

    Examples:
      | Announcement Name                                         | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | PO          | GRANTEE_SC   |

  @createProgram @yugaC
  Scenario: test Program API and then create annpouncement base on program
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_RISK_ASSESSMENT_NO"
#    Commented this code - required for the API testing
    When I login to "As a Grantor" app as "PM" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - All"
#    When I perform quick search for "{SavedValue:Automation Runtime Active Program}" in "---program:-:programsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Active Program}" inside table
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab

#  @SubrecipientContactCreation @EXE1
#  Scenario: Subrecipient Contact Creation
#    Given I login to "As a Grantor" app as "PM" user
#    When I navigate to "Home" tab
#    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
#    And I pause execution for "3" seconds
#    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
#    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
#    And I generate the random EmailID and save as "uniqueEmailID"
#    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
#    When I click modal button "Save"
#    And I wait for "2" seconds
#    And I close "Create Subrecipient Contact" modal by clicking the top right x button
#    And I save the contact name as "Automation Runtime Contact"
#    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
#    And I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---home:-:subrecipientContactTableId---" panel
#    When I click on "View" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:subrecipientContactTableId---" without waiting for record
#    Then I softly see field "Organization" as "Automation Permanent Subrecipient Org"
#    When I click modal button "Edit"
##    And I click on "Edit" in the page details
#    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
#    And I click modal button "Save"
#    And I close "View Subrecipient Contact" modal by clicking the top right x button
#    And I wait for "2" seconds
#    Then I softly see value "New" for title "Status" inside table "---home:-:subrecipientContactTableId---"

#    @72345 @submitApplication @ProdSan1
#  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted
#    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
#    Given I am on "SUBPORTAL" portal
#    When I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Opportunities" tab
#    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
#    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
#    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
#    When I click on "Qualify" in the page details
#    When I click on "Create Application" in the page details
#    And I wait for "6" seconds
#    And I click modal button "Save and Continue"
#    And I wait for "2" seconds
#    When I enter "Edition" values from "Application_Field_Values.xlsx"
##    And I navigate to "Overview" sub tab
##    And I enter value "VA" into field "Addressline1__c"
#    When I click on "Save" in the page details
#    And I wait for "3" seconds
#    And I navigate to "Budget" sub tab
#    When I expand nested table containing column value "BP01"
#    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
#      | Category Name | Budget | Cash Match | Non-Cash Match |
#      | Construction  | 1000   | 100        | 100            |
#    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
#      | Name                       | Is Key Contact |
#      | {SavedValue:SPI1 Username} | Checked        |
#    When I navigate to "Proposal" sub tab
#    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
#      | EGMS ID                  | Target |
#      | Automation Permanent KPI | 10     |
#    And I navigate to "Forms and Files" sub tab
#    And I navigate to "Quickview" sub tab in split screen
#    And I click on "Splitview" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
#    And I click on "Edit" in the split screen page details
#    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
#    And I click on "Save" in the split screen page details
#    And I wait for "3" seconds
##    To Do:- Button is not display hence commented also added below step for now
##    And I click on "Back" in the page details
#    And I navigate to "Quickview" sub tab in split screen
#    And I click on "Splitview" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
#    And I click on "Edit" in the split screen page details
#    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
#    And I click on "Save" in the split screen page details
#    And I wait for "3" seconds
##    To Do:- Button is not display hence commented also added below step for now
##    And I click on "Back" in the page details
#    And I get the "EGMS ID"
#    When I click on "Submit Application" in the page details
#    And I wait for "5" seconds
#    Then I see status in Progress-bar is "Submitted" and is "dark blue"
#
#  @72346 @applicationReviewHappyPath @ProdSan2
#  Scenario Outline: Validate the complete review process for an application
#    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
#    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
#    And I login to "As a Grantor" app as "PM" user
#    When I navigate to "Applications" tab
#    And I navigate to "Applications" content inside "Applications" subheader on left panel
#    When I click toggle button to select "Applications - All"
#    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
#    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
#    And I get the "EGMS ID"
#    And I wait for "3" seconds
#    When I navigate to "Applications" tab
#    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
#    When I click toggle button to select "Application Reviews - All"
#    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
#    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
#    And I navigate to "Related Log" sub tab
#    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
#    And I wait for "2" seconds
#    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
#      | Form Name  | Due in Days |
#      | Pre-Screen | 5           |
#    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
#      | Reviewer                 |
#      | {SavedValue:FO Username} |
#    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
#    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
#    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
#    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
#    When I close "Assign Applications" modal by clicking the top right x button
#    And I refresh the page
#    And I wait for "2" seconds
#    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
#    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Applications" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
#    And I click on "Edit" in the page details
#    When I complete filling in the Review form with recommendation "Recommended"
#    And I wait for "5" seconds
#    And I click on "Save" in the page details
#    And I wait for "6" seconds
#    When I click on "Submit" in the page details without processing
#    When I click alert button "OK"
#    Then I see that "Status" is in "Review Completed" status
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    When I navigate to "Applications" tab
#    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
#    When I click toggle button to select "Application Reviews - All"
#    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
#    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
#    And I navigate to "Related Log" sub tab
#    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
#    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
#    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
#    And I wait for "2" seconds
#    And I click on "Next Review Step" in the page details
#    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
#      | Form Name         | Due in Days |
#      | Program Review    | 5           |
#      | Fiscal Review     | 5           |
#      | Compliance Review | 5           |
#    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
#      | Reviewer                  |
#      | {SavedValue:EXE Username} |
#      | {SavedValue:FO Username}  |
#      | {SavedValue:PM Username}  |
#    When I expand nested table containing column value "<Announcement Name>"
#    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
#    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
#    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
#    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
#    When I click modal button "Close"
#    And I refresh the page
#    And I wait for "2" seconds
#    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
#    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
#    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
#    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
#    When I click modal button "Close"
#    And I refresh the page
#    And I wait for "2" seconds
#    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
#    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
#    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
#    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
#    When I click modal button "Close"
#    And I refresh the page
#    And I wait for "4" seconds
#    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
#    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Applications" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
#    And I click on "Edit" in the page details
#    When I complete filling in the Review form with recommendation "Recommended"
#    And I wait for "3" seconds
#    And I click on "Save" in the page details
#    And I wait for "5" seconds
#    When I click on "Submit" in the page details without processing
#    When I click alert button "OK"
#    And I wait for "5" seconds
#    Then I softly see field "Status" as "Review Completed"
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Applications" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
#    When I click on "Edit" in the page details
#    When I complete filling in the Review form with recommendation "Recommended"
#    And I click on "Save" in the page details
#    And I wait for "5" seconds
#    When I click on "Submit" in the page details without processing
#    When I click alert button "OK"
#    And I wait for "5" seconds
#    Then I see field "Status" as "Review Completed"
#    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Applications" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
#    When I click on "Edit" in the page details
#    When I complete filling in the Review form with recommendation "Recommended"
#    And I click on "Save" in the page details
#    And I wait for "6" seconds
#    When I click on "Submit" in the page details without processing
#    When I click alert button "OK"
#    And I wait for "5" seconds
#    Then I see field "Status" as "Review Completed"
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Applications" tab
#    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
#    When I click toggle button to select "Application Reviews - All"
#    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
#    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
#    And I navigate to "Related Log" sub tab
#    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
#    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
#    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
#    And I wait for "2" seconds
#    And I click on "Next Review Step" in the page details
#    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
#      | Form Name         | Due in Days |
#      | Management Review | 5           |
#    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
#      | Reviewer                 |
#      | {SavedValue:FO Username} |
#    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
#    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
#    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
#    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
#    When I click modal button "Close"
#    And I refresh the page
#    And I wait for "2" seconds
#    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
#    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Applications" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
#    When I click on "Edit" in the page details
#    When I complete filling in the Review form with recommendation "Recommended"
#    And I click on "Save" in the page details
#    And I wait for "6" seconds
#    When I click on "Submit" in the page details without processing
#    When I click alert button "OK"
#    And I wait for "5" seconds
#    Then I see field "Status" as "Review Completed"
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Applications" tab
#    And I wait for "1" seconds
#    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
#    And I wait for "2" seconds
#    When I click toggle button to select "Application Reviews - All"
#    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
#    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
#    And I navigate to "Related Log" sub tab
#    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
#    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
#    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
#    And I wait for "2" seconds
#    When I click on "Funding Decision Memo" in the page details
#    Then I see status in Progress-bar is "Created" and is "dark blue"
#    And I click on "Edit" in the page details
#    When I enter values into fields
#      | Value                       | Field            |
#      | AuGr                        | GrantCode__c     |
#      | Automation Test Description | Justification__c |
#    And I click on "Save" in the page details
#    Then I softly see field "Status" as "Created"
#    And I edit the following rows inline in flex table with id "FundingDecisionMemoApplications" by clicking "Edit" :
#      | Application Title   | Recommended Budget | Recommend for Funding | Comments    | Total Commitment Amount |
#      | <Announcement Name> | 500                | Yes                   | Recommended | 500                     |
#    And I refresh the page
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
#      | Name                     | FDM |
#      | {SavedValue:FO Username} | NA  |
#    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
#      | Name                     | FDM    |
#      | {SavedValue:FO Username} | Step 1 |
#    And I click on "Submit for Approval" in the page details
#    And I get the "EGMS ID"
#    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
#    When I navigate to "Applications" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
#    When I "Approve" in the approval decision
#    Then I softly see field "Status" as "Approved"
#
#    Examples:
#      | Announcement Name                                               | Application Name                                                |
#      | {SavedValue:Automation Runtime Announcement Application Review} | {SavedValue:Automation Runtime Announcement Application Review} |
#
#  @72347 @negotiationComplete @ProdSan1
#  Scenario: Validate once the Negotiation Request is completed then the record owner can view the record under Completed Negotiations
#    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
#    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
#    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
#    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
#    Given I login to "As a Grantor" app as "dynamicUser" user
#    And I navigate to "Applications" tab
#    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
#    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
#    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
#    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
#    When I save the field labeled "EGMS ID" as "EGMSID"
#    And I pause execution for "10" seconds
#    And I navigate to "Negotiations" sub tab
#    And I wait for "2" seconds
#    When I clear the value from field "ApplicationSectionsForRevision__c"
#    When  I enter "Edition_Sanity" values from "Negotiations_Field_Values.xlsx"
#    And I wait for "3" seconds
#    When I click on "Save" in the page details
#    And I wait for "4" seconds
#    When I click on "Send to Subrecipient" in the page details
#    And I wait for "4" seconds
#    Then I see field "Status" as "Negotiation Initiated"
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Home" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
#    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
#    And I navigate to "Negotiations" sub tab
#    When I click on "Edit" in the page details
#    And I enter values into fields
#      | Value                              | Field                |
#      | Automation Negotiation Iniatiation | ApplicantResponse__c |
#    When I click on "Save" in the page details
#    When I click on "Submit to Grantor" in the page details
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Applications" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
#    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
#    When I click on "Complete Negotiation" in the page details
#    And I navigate to "Negotiations" sub tab
#    Then I softly see field "Negotiation Request Status" as "Complete" in "Negotiation Request Details" pageblock
#    And I navigate to "Applications" tab
#    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
#    Then I can see row level action button "View" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---negotiation:-:negotiationCompletedTaskTableId---"
#
#  @38224 @awardHappyPathFromFDM @ProdSan2
#  Scenario Outline: Validate  the activation of subaward from FDM happy path and the status changes to Activated
#    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NO_RISK_ASSESSMENT"
#    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
#    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
#    When I login to "As a Grantor" app as "dynamicUser" user
#    And I navigate to "Applications" tab
#    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
#    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
#    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
#    And I wait for "3" seconds
#    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
#    And I pause execution for "5" seconds
#    And I enter "Edition" values from "Award_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I navigate to "Budget" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
#      | Funding Account             | Encumbrance |
#      | {SavedValue:fundingAccount} | 1000        |
#    And I navigate to "Terms" sub tab
#    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
#    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
#    When I click modal button "Save"
#    And I wait for "2" seconds
#    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
#    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
#    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
#    When I click modal button "Save"
#    And I wait for "2" seconds
#    And I navigate to "Responsibilities" sub tab
#    And I get the "EGMS ID"
#    When I enter the following values into flex table with id "---subAwardFromFDM:-:GrantsRolesAndResponsibilitiesTableId---" by clicking "New" :
#      | Name                     | Award  |
#      | {SavedValue:PM Username} | Step 1 |
#    When I enter the following values into flex table with id "---subAwardFromFDM:-:GrantsRolesAndResponsibilitiesTableId---" by clicking "New" :
#      | Name                      | Award  |
#      | {SavedValue:EXE Username} | Step 2 |
#    When I enter the following values into flex table with id "---subAwardFromFDM:-:GrantsRolesAndResponsibilitiesTableId---" by clicking "New" :
#      | Name                     | Award  |
#      | {SavedValue:FO Username} | Step 3 |
#    And I click on "Send to Subrecipient" in the page details
#    Then I softly see field "Status" as "Sent To Subrecipient"
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:subrecipientPendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:subrecipientPendingTaskTableId---" without waiting for record
#    And I click on "Accept" in the page details
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
#    And I click on "View" icon for "<Grant Name>" inside table
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
#      | Reviewer Name            | Role            | Description            | Due Date | Allow Record Editing |
#      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Description | 5        | No                   |
#    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
#    And I pause execution for "3" seconds
#    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "Responsibilities" sub tab
#    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
#    And I enter a review as "Passed"
#    When I click modal button "Save"
#    And I click on submit review
#    And I wait for "1" seconds
##    When I click modal button "Close"
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
#    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
#    And I click on "Complete Review" in the page details
#    And I wait for "2" seconds
#    When I navigate to "Terms" sub tab
#    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
#    And I wait for "3" seconds
#    And I click on "Submit for Approval" in the page details
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    When I navigate to "Grants" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    When I navigate to "Grants" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
#    When I navigate to "Grants" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
#    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
#    When I click on "Send to Subrecipient" in the page details
#    And I wait for "2" seconds
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:subrecipientPendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside table
#    And I click on "Accept after Approval" in the page details
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
#    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
#    And I click on "Activate" in the page details
#    Then I see status in Progress-bar is "Activated" and is "dark blue"
#    Examples:
#      | Award Name                                       | Grant Name                                       |
#      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |
#
#  @72348 @awardHappyPathStandAlone @ProdSan1
#  Scenario: Validate the activation of subaward Happy path stand alone and status changes to Activated | Validate subaward Happy path stand alone
#    When I login to "As a Grantor" app as "PM" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
#    And I wait for "2" seconds
#    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
#    And I click modal button "Continue"
#    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    And I navigate to "Subawards" sub tab
#    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "AwardEGMSID"
#    And I navigate to "Overview" sub tab
#    And I save the field labeled "Subaward Title" as "Automation Runtime award"
#    And I click on "Edit" in the page details
#    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I navigate to "Budget" sub tab
#    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
#    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
#    And I wait for "3" seconds
#    And I click modal button "Close"
#    And I navigate to "Budget" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
#      | Title                           | Start Date | End Date |
#      | Automation Permanent Focus Area | 0          | 3650     |
#    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
#      | Funding Account             | Encumbrance |
#      | {SavedValue:fundingAccount} | 1000        |
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
#      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
#      | Construction    | 1000         | 100        | 100            |
#    When I navigate to "Performance" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
#      | EGMS ID                  | Target |
#      | Automation Permanent KPI | 10     |
#    And I navigate to "Terms" sub tab
#    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
#    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
#    And I wait for "3" seconds
#    And I click modal button "Save"
#    And I wait for "3" seconds
#    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
#    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
#    And I wait for "3" seconds
#    And I click modal button "Save"
#    Then I refresh the page
#    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
#      | Name                       | Project Role             | Is Key Personnel |
#      | {SavedValue:SPI1 Username}  | Project Director/Manager | Checked          |
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
#      | Name                      | Award  |
#      | {SavedValue:EXE Username} | Step 1 |
#    And I wait for "3" seconds
#    And I click on "Send to Subrecipient" in the page details
#    And I wait for "3" seconds
#    And I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    When I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
#    When I click on "Accept" in the page details
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    When I navigate to "Terms" sub tab
#    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
#    And I pause execution for "3" seconds
#    And I click on "Submit for Approval" in the page details
#    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I click on "Send to Subrecipient" in the page details
#    And I wait for "2" seconds
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
#    And I wait for "5" seconds
#    And I click on "Accept after Approval" in the page details
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I click on "Activate" in the page details
#    And I wait for "3" seconds
#    Then I see that "Subaward" is in "Activated" status
#
#  @72360 @activeRiskAssessment @ProdSan2
#  Scenario: Validate the Activation of Risk Assessment and the status changes to Active
#    Given I login to "As a Grantor" app as "dynamicUser" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
#    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
#    And I click modal button "Continue"
#    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I navigate to "Subawards" sub tab
#    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    When I get the "EGMS ID"
#    And I click on "Edit" in the page details
#    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
#    And I wait for "2" seconds
#    And I click on "Save" in the page details
#    And I wait for "2" seconds
#    And I navigate to "Management" sub tab
#    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
#    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I navigate to "Assessment" sub tab
#    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    When I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "RAEGMSID"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
#      | Name                     | Risk Assessment |
#      | {SavedValue:PM Username} | NA              |
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
#      | Name                     | Risk Assessment |
#      | {SavedValue:PM Username} | Step 1          |
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
#      | Name                     | Risk Assessment |
#      | {SavedValue:FO Username} | Step 2          |
#    When I navigate to "Responsibilities" sub tab
#    And I enter the following values into flex table with id "RiskAssessmentApproverRoles" by clicking "New" :
#      | Name                     | Responsibility  | Description                 | Due Date | Allow Record Editing |
#      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
#    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "RiskAssessmentApproverRoles" without waiting for record
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside table
#    When I navigate to "Responsibilities" sub tab
#    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "RiskAssessmentApproverRoles" without waiting for record
#    And I enter a review as "Passed"
#    When I click modal button "Save"
#    And I pause execution for "5" seconds
#    And I click on submit review
##    When I click modal button "Close"
#    When I re-login to "As a Grantor" app as "DynamicUser" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
#    And I click toggle button to select "Subaward Risk Assessments - All"
#    And I perform quick search for "Record Id" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
#    When I click on "View" icon for "Record Id" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
#    And I click on "Complete Review" in the page details
#    When I click on "Submit for Approval" in the page details
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
#    And I perform quick search for "Record Id" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
#    When I click on "View" icon for "Record Id" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
#    Then I softly see status in Progress-bar is "Active" and is "dark blue"
#
#  @72361 @activeOrgRiskAssessment @ProdSan2 @wip
#  Scenario: Validate the Activation of Org Risk Assessment and the status changes to Active
#    Given I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"
##    Given I create a risk assessment record for organization "Automation Permanent Organization for Risk Assessment"
#    Given I am on "SUBPORTAL" portal
#    When I login to "Grants Portal" app as "SA" user
#    And I navigate to "Home" tab
#    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
#    And I navigate to "Risk Assessment" sub tab
#    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Home" tab
#    And I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
#    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
#    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
#    And I navigate to "Risk Assessment" sub tab
#    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
#    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
#    And I wait for "3" seconds
#    When I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
#    And I navigate to "Home" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "Risk Assessment" sub tab
#    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
#    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I navigate to "Assessment" sub tab
#    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    When I save the field labeled "EGMS ID" as "EGMSID"
#    When I click on "Submit" in the page details
#    And I wait for "3" seconds
#    And I navigate to "Home" tab
#    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
#    And I navigate to "Risk Assessment" sub tab
#    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Home" tab
#    And I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
#    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
#    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
#    And I navigate to "Risk Assessment" sub tab
#    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
#    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
#    And I wait for "3" seconds
#    When I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
#    And I navigate to "Home" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "Risk Assessment" sub tab
#    When I click on top right button "Create Risk Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
#    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I wait for "5" seconds
#    When I navigate to "Assessment" sub tab
#    And I enter value "Checked" into field "Acknowledgement__c"
#    And I click on "Save" in the page details
#    And I wait for "2" seconds
#    When I click on "Submit" in the page details
#    And I wait for "3" seconds
#    And I navigate to "Home" tab
#    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
#    And I navigate to "Risk Assessment" sub tab
#    And I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
#    When I click on "View" icon for "Active" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
#    Then I softly see field "State" as "Active"
#
#  @72349 @adhocReimbursementHappyPath @ProdSan1
#  Scenario: Validate the Reimbursement Payment Request happy path and the status changes to 'Paid'
#    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
#    And I am on "SUBPORTAL" portal
#    And I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
#    When I navigate to "Actuals" sub tab
#    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
#    When I enter value "Automation Runtime Payment Request" into field "Title__c"
#    And I click modal button "Save and Continue"
#    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I save the field labeled "EGMS ID" as "PayreqId"
#    And I navigate to "Financials" sub tab
#    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
#    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
#      | Title        | Narrative     | Unit Price | Quantity | Measurement |
#      | Extra Salary | The narrative | 30         | 1        | Feet        |
#    When I close "Add Line Items" modal by clicking the top right x button
#    And I click on "Submit to Grantor" in the page details
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "Financials" sub tab
#    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
#      | Funding Account             | Net Spent This Action |
#      | {SavedValue:fundingAccount} | 30                    |
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
#      | Name                      | Reimbursement |
#      | {SavedValue:EXE Username} | NA            |
#    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
#      | Name                      | Reimbursement |
#      | {SavedValue:EXE Username} | Step 1        |
#    When I get the "EGMS ID"
#    When I click on "Submit for Approval" in the page details
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
#    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
#    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
#    When I click on "Mark As Paid" in the page details
#    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
#    When I click modal button "Save"
#    And I pause execution for "2" seconds
#    When I click modal button "Close"
#    Then I see status in Progress-bar is "Paid" and is "dark blue"
#
#  @72350 @adhocAdvanceHappyPath @ProdSan1
#  Scenario: Validate the Advance Payment Request happy path and the status changes to 'Paid'
#    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
#    And I am on "SUBPORTAL" portal
#    When I login to "Grants Portal" app as "SPI1" user
#    And I wait for "2" seconds
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
#    And I save the field labeled "EGMS ID" as "AwardEGMSID"
#    When I navigate to "Actuals" sub tab
#    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
#    When I enter value "Automation Runtime Payment Request" into field "Title__c"
#    And I click modal button "Save and Continue"
#    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I save the field labeled "EGMS ID" as "PayreqId"
#    And I navigate to "Financials" sub tab
#    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
#      | Budget Category | Advance Requested This Action |
#      | Construction    | 10                            |
#    When I navigate to "Forms and Files" sub tab
#    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
#    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
#    And I wait for "2" seconds
#    When I click modal button "Close"
#    And I wait for "2" seconds
#    When I click on "Submit to Grantor" in the page details
#    And I wait for "2" seconds
#    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "Financials" sub tab
#    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
#      | Funding Account             | Advance Requested This Action |
#      | {SavedValue:fundingAccount} | 10                            |
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
#      | Name                     | Advance |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
#      | Name                     | Advance |
#      | {SavedValue:FO Username} | Step 1  |
#    When I click on "Submit for Approval" in the page details
#    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Advances" content inside "Payments" subheader on left panel
#    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
#    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
#    When I click on "Mark As Paid" in the page details
#    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
#    When I click modal button "Save"
#    And I wait for "2" seconds
#    When I click modal button "Close"
##   To Do:- Remove the refresh step once bug resolve for refresh behavior
#    And I refresh the page
#    Then I softly see field "Status" as "Paid"
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
#    When I navigate to "Actuals" sub tab
#    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
#    When I enter value "Automation Runtime Payment Request" into field "Title__c"
#    And I click modal button "Save and Continue"
#    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I save the field labeled "EGMS ID" as "PayreqId1"
#    And I navigate to "Financials" sub tab
#    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
#    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
#      | Title        | Narrative     | Unit Price | Quantity | Measurement | Advance Applied |
#      | Extra Salary | The narrative | 30         | 1        | Feet        | 10              |
#    When I close "Add Line Items" modal by clicking the top right x button
#    And I wait for "2" seconds
#    And I click on "Submit to Grantor" in the page details
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "Financials" sub tab
#    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
#      | Funding Account             | Net Spent This Action | Advance Applied This Action |
#      | {SavedValue:fundingAccount} | 30                    | 10                          |
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
#      | Name                     | Reimbursement |
#      | {SavedValue:PM Username} | NA            |
#    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
#      | Name                      | Reimbursement |
#      | {SavedValue:EXE Username} | Step 1        |
#    When I get the "EGMS ID"
#    When I click on "Submit for Approval" in the page details
#    Then I softly see field "Status" as "Submitted for Approval"
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
#    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
#    And I click on "View" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
#    When I click on "Mark As Paid" in the page details
#    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
#    When I click modal button "Save"
#    And I pause execution for "2" seconds
#    When I click modal button "Close"
##   To Do:- Remove the refresh step once bug resolve for refresh behavior
#    Then I softly see field "Status" as "Paid"
#
#  @72351 @scheduledReimbursementPaymentRequestHappyPath @ProdSan1
#  Scenario Outline: Validate the Scheduled Payment Request happy path and the status changes to 'Paid' and is green
#    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Formula_By_Applicant"
#    Given I delete the record "<Award Name>" from the object "Payment Request"
#    When I create a post award record "PaymentRequest" for the Award "<Award Name>" having object api name as "PaymentRequest__c"
#    And I am on "SUBPORTAL" portal
#    When I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---paymentRequest:-:subrecipientPendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside table
#    And I click on "Edit" in the page details
#    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I save the field labeled "EGMS ID" as "PayreqId"
#    And I navigate to "Financials" sub tab
#    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
#    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
#      | Title        | Narrative     | Unit Price | Quantity | Measurement |
#      | Extra Salary | The narrative | 30         | 1        | Feet        |
#    When I close "Add Line Items" modal by clicking the top right x button
#    And I click on "Submit to Grantor" in the page details
#    And I wait for "2" seconds
#    Then I softly see field "Status" as "Submitted to Grantor"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "Financials" sub tab
#    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
#      | Funding Account             | Net Spent This Action |
#      | {SavedValue:fundingAccount} | 30                    |
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
#      | Name                      | Reimbursement |
#      | {SavedValue:EXE Username} | NA            |
#    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
#      | Name                      | Reimbursement |
#      | {SavedValue:EXE Username} | Step 1        |
#    When I get the "EGMS ID"
#    When I click on "Submit for Approval" in the page details
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
#    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
#    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
#    When I click on "Mark As Paid" in the page details
#    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
#    When I click modal button "Save"
#    And I pause execution for "2" seconds
#    When I click modal button "Close"
#    Then I see status in Progress-bar is "Paid" and is "dark blue"
#    Examples:
#      | Award Name                            | Grant Name                            |
#      | {SavedValue:Automation Runtime award} | {SavedValue:Automation Runtime award} |
#
#  @72352 @progressReportHappyPath @ProdSan1
#  Scenario: Validate once the Progress Report approval process is completed then the status changes to approved
#    Given I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
#    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
#    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
#    Given I am on "SUBPORTAL" portal
#    When I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:subrecipientPendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:subrecipientPendingTaskTableId---" without waiting for record
#    When I navigate to "Forms and Files" sub tab
#    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
#    And I upload attachment "Attachment.pdf" of type "Others" from computer
#    And I click modal button "Close"
##    And I click on "Save" in the page details
#    When I get the "EGMS ID"
#    And I click on "Edit" in the page details
#    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I navigate to "Performance" sub tab
#    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
#      | Title                    | Reported Date | Actual |
#      | Automation Permanent KPI | 7             | 7      |
#    When I navigate to "Forms and Files" sub tab
#    And I select value inside table "---progressReport:-:formTableId---" is "All"
#    And I navigate to "Quickview" sub tab in split screen
#    And I click on "Splitview" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
#    And I click on "Edit" in the split screen page details
#    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
#    And I click on "Save" in the split screen page details
##    And I click on "Back" in the page details
#    When I click on "Submit to Grantor" in the page details
#    Then I softly see field "Status" as "Submitted to Grantor"
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
#      | Name                      | Progress Report |
#      | {SavedValue:EXE Username} | NA              |
#    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
#      | Name                      | Progress Report |
#      | {SavedValue:EXE Username} | Step 1          |
#    When I click on "Submit for Approval" in the page details
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Submitted for Approval"
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    When I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:Record Id}" inside table
#    When I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
#    And I click toggle button to select "Progress Reports - Approved"
#    Then I see value "Approved" for title "Status" against the value "{SavedValue:Record Id}" inside table "---progressReport:-:internalProgressReportFlexTableId---"
#
#  @72353 @siteVisitAcceptAndClose @ProdSan1 @wip
#  Scenario: Validate once the Award level Site Visit is clicked on Accept and Close butted then sttaus changes to closed
#    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
#    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
#    When I login to "As a Grantor" app as "EXE" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
#    Given I navigate to "Management" sub tab
#    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
#    And I pause execution for "4" seconds
#    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "SitevVisitId"
#    Given I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
#      | Name                     | Site Visit |
#      | {SavedValue:PM Username} | NA         |
#    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
#      | Name                     | Site Visit |
#      | {SavedValue:PM Username} | Step 1     |
#    Given I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
#    And I pause execution for "5" seconds
#    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
#    And I pause execution for "5" seconds
#    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
#    And I click on "Notify" in the page details
#    When I click on "Conduct" in the page details
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
#    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
#    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
#    And I navigate to "Reports and Outcomes" sub tab
#    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
#    And I switch to tab number "1"
#    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I close the tab
#    And I save the field labeled "EGMS ID" as "SitevVisitId"
#    And I navigate to "Reports and Outcomes" sub tab
#    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
#      | Title                  | Description            | Type        |
#      | Automation Finding     | Automation Description | Finding     |
#      | Automation Concern     | Automation Description | Concern     |
#      | Automation Observation | Automation Description | Observation |
#    When I click on "Submit for Approval" in the page details
#    Then I softly see field "Status" as "Submitted for Approval"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
#    And I "Approve" in the approval decision
#    And I pause execution for "3" seconds
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
#    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
#    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
#    Given I click on "Send to Subrecipient" in the page details
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    When I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
#    When I navigate to "Reports and Outcomes" sub tab
#    And I expand nested table containing column value "Automation Observation"
#    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
#      | Title                               | Description            | Status      | Due Date | Assigned To                |
#      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    When I collapse nested table containing column value "Automation Observation"
#    And I wait for "2" seconds
#    And I expand nested table containing column value "Automation Concern"
#    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
#      | Title                           | Description            | Status      | Due Date | Assigned To                |
#      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    When I collapse nested table containing column value "Automation Concern"
#    And I wait for "2" seconds
#    And I expand nested table containing column value "Automation Finding"
#    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
#      | Title                           | Description            | Status      | Due Date | Assigned To                |
#      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    And I collapse nested table containing column value "Automation Finding"
#    And I wait for "2" seconds
#    Then I softly can see top right button "Submit to Grantor" in page detail
#    And I click on "Submit to Grantor" in the page details
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
#    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
#    And I click on "Accept and Close" in the page details
#    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
#
#  @72354 @deskReviewAcceptAndClose @ProdSan2 @wip
#  Scenario: Validate once the Award level Desk Review is clicked on Accept and Close butted then status changes to closed
#    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Formula_By_Applicant"
#    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant"
#    When I login to "As a Grantor" app as "PM" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
#    Given I navigate to "Management" sub tab
#    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
#    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "DeskReview"
#    Given I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
#      | Name                     | Desk Review |
#      | {SavedValue:PM Username} | NA          |
#    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
#      | Name                     | Desk Review |
#      | {SavedValue:PM Username} | Step 1      |
#    When I get the "EGMS ID"
#    Given I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
#    And I pause execution for "5" seconds
#    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
#    And I click on "Notify" in the page details
#    And I click on "Conduct" in the page details
#    And I navigate to "Reports and Outcomes" sub tab
#    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
#      | Title                  | Description            | Type        |
#      | Automation Finding     | Automation Description | Finding     |
#      | Automation Concern     | Automation Description | Concern     |
#      | Automation Observation | Automation Description | Observation |
#    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
#    And I switch to tab number "1"
#    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I close the tab
#    And I wait for "1" seconds
#    When I click on "Submit for Approval" in the page details
#    And I pause execution for "5" seconds
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Home" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---deskreview:-:homePendingTasksTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:homePendingTasksTableId---"
#    And I "Approve" in the approval decision
#    When I click on "Send to Subrecipient" in the page details
#    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    When I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
#    When I navigate to "Reports and Outcomes" sub tab
#    And I expand nested table containing column value "Automation Observation"
#    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
#      | Title                               | Description            | Status      | Due Date | Assigned To                |
#      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    When I collapse nested table containing column value "Automation Observation"
#    And I expand nested table containing column value "Automation Concern"
#    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
#      | Title                           | Description            | Status      | Due Date | Assigned To                |
#      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    When I collapse nested table containing column value "Automation Concern"
#    And I expand nested table containing column value "Automation Finding"
#    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
#      | Title                           | Description            | Status      | Due Date | Assigned To                |
#      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    And I collapse nested table containing column value "Automation Finding"
#    When I click on "Submit to Grantor" in the page details
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:DeskReview}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
#    And I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
#    And I click on "Accept And Close" in the page details
#    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
#
#  @72355 @siteVisitAcceptAndCloseOrgLevel @ProdSan2 @wip
#  Scenario: Validate once the Org Level Site Visit is clicked on Accept and Close butted then status changes to closed
#    When I login to "As a Grantor" app as "PM" user
#    And I navigate to "Home" tab
#    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
#    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
##    When I click on "Approved Date" column header inside table with id "ActiveAccount"
#    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
#    And I navigate to "Related Log" sub tab
#    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
#    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
#    When I click "Associate" after selection of "{SavedValue:SPI1 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "SitevVisitId"
#    And I click on "Notify" in the page details
#    And I click on "Conduct" in the page details
#    And I wait for "3" seconds
#    Given I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
#      | Name                     | Site Visit |
#      | {SavedValue:PM Username} | NA         |
#    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
#      | Name                     | Site Visit |
#      | {SavedValue:PM Username} | Step 1     |
#    And I navigate to "Reports and Outcomes" sub tab
#    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
#    And I switch to tab number "1"
#    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I close the tab
#    And I refresh the page
#    And I navigate to "Reports and Outcomes" sub tab
#    When I enter the following values into flex table with id "---sitevisits:-:orgCorrectiveTableId---" by clicking "New" :
#      | Title                  | Description            | Type        |
#      | Automation Finding     | Automation Description | Finding     |
#      | Automation Concern     | Automation Description | Concern     |
#      | Automation Observation | Automation Description | Observation |
#    When I click on "Submit for Approval" in the page details
#    And I pause execution for "2" seconds
#    And I "Approve" in the approval decision
#    And I pause execution for "2" seconds
#    And I click on "Send to Subrecipient" in the page details
#    Then I softly see field "Status" as "Sent to Subrecipient"
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    When I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
#    When I navigate to "Reports and Outcomes" sub tab
#    And I expand nested table containing column value "Automation Observation"
#    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
#      | Title                               | Description            | Status      | Due Date | Assigned To                |
#      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    When I collapse nested table containing column value "Automation Observation"
#    And I expand nested table containing column value "Automation Concern"
#    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
#      | Title                           | Description            | Status      | Due Date | Assigned To                |
#      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    When I collapse nested table containing column value "Automation Concern"
#    And I expand nested table containing column value "Automation Finding"
#    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
#      | Title                           | Description            | Status      | Due Date | Assigned To                |
#      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    And I collapse nested table containing column value "Automation Finding"
#    Then I softly can see top right button "Submit to Grantor" in page detail
#    And I click on "Submit to Grantor" in the page details
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
#    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---sitevisits:-:monitoringTabPhasePendingTasks---"
#    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
#    And I click on "Accept and Close" in the page details
#    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
#
#  @72357 @deskReviewAcceptAndCloseOrgLevel @ProdSan2 @wip
#  Scenario: Validate once the Org level Desk Review is clicked on Accept and Close butted then status changes to closed
#    Given I login to "As a Grantor" app as "PM" user
#    And I navigate to "Home" tab
#    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
#    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
#    When I click on "Approved Date" column header inside table with id "ActiveAccount"
#    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
#    Given I navigate to "Related Log" sub tab
#    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
#    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:SPI1 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "DeskReviewID"
#    Then I softly see status in Progress-bar is "Created" and is "dark blue"
#    And I click on "Notify" in the page details
#    And I click on "Conduct" in the page details
#    And I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
#      | Name                     | Desk Review |
#      | {SavedValue:PM Username} | NA          |
#    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
#      | Name                     | Desk Review |
#      | {SavedValue:PM Username} | Step 1      |
#    And I navigate to "Reports and Outcomes" sub tab
#    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
#      | Title                  | Description            | Type        |
#      | Automation Finding     | Automation Description | Finding     |
#      | Automation Concern     | Automation Description | Concern     |
#      | Automation Observation | Automation Description | Observation |
#    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
#    And I switch to tab number "1"
#    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I close the tab
#    And I wait for "2" seconds
#    When I click on "Submit for Approval" in the page details
#    And I pause execution for "5" seconds
#    And I "Approve" in the approval decision
#    And I pause execution for "5" seconds
#    When I click on "Send to Subrecipient" in the page details
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    When I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
#    When I navigate to "Reports and Outcomes" sub tab
#    And I expand nested table containing column value "Automation Observation"
#    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
#      | Title                               | Description            | Status      | Due Date | Assigned To                |
#      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    When I collapse nested table containing column value "Automation Observation"
#    And I expand nested table containing column value "Automation Concern"
#    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
#      | Title                           | Description            | Status      | Due Date | Assigned To                |
#      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    When I collapse nested table containing column value "Automation Concern"
#    And I expand nested table containing column value "Automation Finding"
#    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
#      | Title                           | Description            | Status      | Due Date | Assigned To                |
#      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
#    And I collapse nested table containing column value "Automation Finding"
#    When I click on "Submit to Grantor" in the page details
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Submitted to Grantor"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
#    Then I see value "{SavedValue:DeskReviewID}" for title "EGMS ID" inside table "---sitevisits:-:monitoringTabPhasePendingTasks---"
#    And I click on "Start" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
#    And I click on "Accept And Close" in the page details
#    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
#
#  @72358 @activationOfBudgetPeriodAmendmentRequest @ProdSan2
#  Scenario: Validate the Budget period amendment activation
#    And I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST" of type "Competitive"
#    When I login to "As a Grantor" app as "dynamicUser" user
#    And I navigate to "Grants" tab
#    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
#    When I navigate to "Subawards" sub tab
#    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
#    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    When I navigate to "Management" sub tab
#    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
#    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "3" seconds
#    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
#    And I enter value "3800" into field "NewBudgetPeriodEndDate__c"
#    When I click on "Save" in the page details
#    And I wait for "4" seconds
#    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
#    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
#      | Title                           | End Date                             |
#      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PM Username} | NA                |
#    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PM Username} | Step 1            |
#    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:FO Username} | Step 2            |
#    When I get the "EGMS ID"
#    And I click on "Send to Subrecipient" in the page details
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---amendment:-:subrecipientPendingTask---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:subrecipientPendingTask---" without waiting for record
#    And I click on "Acknowledge" in the page details
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I click on "Submit for Approval" in the page details
#    And I wait for "5" seconds
#    Then I softly see field "Status" as "Submitted for Approval"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Approve Amendment Request" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Approved"
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
#    When I navigate to "Subawards" sub tab
#    And I get the "EGMS ID"
#    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
#    And I navigate to "Management" sub tab
#    And I click on "View" icon for "Approved" inside flex table with id "---amendment:-:amendmentRequestTableId---" without waiting for record
#    When I click on "Amend Subaward" in the page details
#    When I click on "Activate" in the page details
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Activated"
#    And I navigate to "Grants" tab
#    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
#    When I navigate to "Subawards" sub tab
#    When I perform quick search for "Amended" in "---subAwardStandAlone:-:GrantsSubAwardsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---" without waiting for record
#    Then I softly see field "Status" as "Amended"
#    Then I see status in Progress-bar is "Amended" and is "dark blue"
#
#  @72359 @completeCloseout @ProdSan1
#  Scenario: Validate the Closeout is submitted for approval and the status changes to Submitted for Approval
#    And I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation PO user" of type "Competitive"
#    When I login to "As a Grantor" app as "PO" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
#    When I navigate to "Requests" sub tab
#    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
#    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
#    And I wait for "2" seconds
#    And I enter value "Automation Test justification" into field "Justification__c"
#    And I wait for "2" seconds
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "closeoutID"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
#      | Name                      | Closeout |
#      | {SavedValue:EXE Username} | NA       |
#    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
#      | Name                      | Closeout |
#      | {SavedValue:EXE Username} | Step 1   |
#    And I click on "Send To Subrecipient" in the page details
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    When I navigate to "Closeout" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:subrecpientPendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:subrecpientPendingTaskTableId---"
#    When I click on "Edit" in the page details
#    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I click on "Acknowledge" in the page details
#    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
#    When I navigate to "Closeout" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
#    When I click on "Override" in the page details
#    When I click on "Submit for Approval" in the page details
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    When I navigate to "Closeout" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
#    When I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
#    And I navigate to "Closeout" tab
#    And I click toggle button to select "Closeouts - All"
#    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
#    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
#    Then I softly see field "Status" as "Completed"
#
#  @CompletedSchedulesCloseout @ProdSan2
#  Scenario: Validate Complete Scheduled Closeout End to End flow
#    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
#    Given I delete the record "{SavedValue:Automation Runtime Award for closeout}" from the object "Closeout"
#    When I create a post award record "Closeout" for the Award "{SavedValue:Automation Runtime Award for closeout}" having object api name as "Closeout"
#    When I login to "As a Grantor" app as "dynamicUser" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
#    When I navigate to "Requests" sub tab
#    When I click on "View" icon for "Scheduled" inside flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
#      | Name                     | Closeout |
#      | {SavedValue:FO Username} | NA       |
#    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
#      | Name                     | Closeout |
#      | {SavedValue:FO Username} | Step 1   |
#    When I click on "Edit" in the page details
#    And I navigate to "Overview" sub tab
#    And I enter value "Automation Test Reason" into field "Reason__c"
#    And I enter value "Automation Test justification" into field "Justification__c"
#    When I navigate to "Checklist" sub tab
#    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
#    And I wait for "2" seconds
#    When I click on "Save" in the page details
#    And I save the field labeled "EGMS ID" as "closeoutID"
#    And I click on "Send To Subrecipient" in the page details
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    When I navigate to "Closeout" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
#    When I click on "Edit" in the page details
#    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I click on "Acknowledge" in the page details
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    When I navigate to "Closeout" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
#    When I click on "Override" in the page details
#    And I wait for "3" seconds
#    When I click on "Submit for Approval" in the page details
#    Then I softly see field "Status" as "Submitted for Approval"
#    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
#    When I navigate to "Closeout" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
#    When I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
#    And I navigate to "Closeout" tab
#    And I click toggle button to select "Closeouts - All"
#    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
#    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
#    Then I softly see field "Status" as "Completed"
#
#  @FundingChangeAmendmentRequest @ProdSan1
#  Scenario Outline: validate the end to end flow for Funding change amendment request
#    And I activated standalone subaward "Automation Runtime Award" with properties "<Properties>-Automation EXE user" of type "Formula_By_Applicant"
#    When I login to "As a Grantor" app as "EXE" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I save the field labeled "EGMS ID" as "AwardEGMSID"
#    When I navigate to "Management" sub tab
#    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
#    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    When I enter values into fields
#      | Value                       | Field                         |
#      | Automation Test Description | FundingChangeJustification__c |
#      | 2000                        | RequestedChangeInBudget__c    |
#    And I click on "Save" in the page details
#    And I save the field labeled "EGMS ID" as "FundingID"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PM Username} | NA                |
#    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PM Username} | Step 1            |
#    When I get the "EGMS ID"
#    And I click on "Send to Subrecipient" in the page details
#    Then I see field "Status" as "Sent to Subrecipient"
#    When I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
#      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
#      | Construction  | 3000                 | 150        | 150            |
#    And I refresh the page
#    And I click on "Submit to Grantor" in the page details
#    And I wait for "3" seconds
#    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "Overview" sub tab
#    And I click on "Edit" in the page details
#    When I enter values into fields
#      | Value | Field                |
#      | 3000  | RevisedCommitment__c |
#    And I click on "Save" in the page details
#    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
#      | Funding Account             | Revised Encumbrance |
#      | {SavedValue:fundingAccount} | 3000                |
#    And I click on "Submit for Approval" in the page details
#    And I wait for "3" seconds
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Approved"
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Amendment Requests - All"
#    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
#    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
#    And I click on "Amend Subaward" in the page details
#    And I pause execution for "10" seconds
#    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
#    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
#    When I click on "Activate" in the page details
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Activated"
#    Examples:
#      | User | Properties                            |
#      | SPI1  | ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO |
#
#  @PeriodicRenewalAmendmentRequests @ProdSan2
#  Scenario: validate the end to end flow for Periodic Renewal Amendment Request
#    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
#    When I login to "As a Grantor" app as "PM" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I save the field labeled "EGMS ID" as "AwardEGMSID"
#    And I navigate to "Management" sub tab
#    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
#    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I wait for "3" seconds
#    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
#    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
#    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
#    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
#      | Title                           | Start Date         | End Date           |
#      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
#    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
#      | Title                       | Revised Encumbrance |
#      | {SavedValue:fundingAccount} | 1000                |
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name          | Amendment Request |
#      | Automation PM | NA                |
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name          | Amendment Request |
#      | Automation PM | Step 1            |
#    And I click on "Send to Subrecipient" in the page details
#    And I wait for "3" seconds
#    Then I see field "Status" as "Sent to Subrecipient"
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I click on "Submit to Grantor" in the page details
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I click on "Submit for Approval" in the page details
#    And I pause execution for "3" seconds
#    And I "Approve" in the approval decision
#    And I pause execution for "3" seconds
#    And I click on "Amend Subaward" in the page details
#    And I pause execution for "10" seconds
#    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
#    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
#    And I click on "Activate" in the page details
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Activated"
#
#  @ScopeOfWorkChangeAmendmentRequest @ProdSan2
#  Scenario Outline: Validate end to end flow for scope of work change amendment request
#    Given I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
#    And I login to "As a Grantor" app as "PM" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "<Grant Name>" inside table
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I navigate to "Management" sub tab
#    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
#    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "8" seconds
#    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I save the field labeled "EGMS ID" as "scopeWorkId"
#    Then I see status in Progress-bar is "Created" and is "dark blue"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PM Username} | NA                |
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PM Username} | Step 1            |
#    And I click on "Send to Subrecipient" in the page details
#    Then I see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
#    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
#    And I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    When I click on "Submit to Grantor" in the page details
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    When I click on "Submit for Approval" in the page details
#    And I wait for "3" seconds
#    And I "Approve" in the approval decision
#    Then I softly see field "Status" as "Approved"
#    And I pause execution for "3" seconds
#    And I click on "Amend Subaward" in the page details
#    And I pause execution for "10" seconds
#    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
#    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
#    And I click on "Activate" in the page details
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Activated"
#
#    Examples:
#      | Award Name                                      | Grant Name                                      |
#      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |
#
# @SubrecipientKeyPersonnelChangeAmendmentRequest @ProdSan2
#  Scenario: Validate end to end flow for key personnel change amendment request
#    Given I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
#    And I am on "SUBPORTAL" portal
#    And I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---" without waiting for record
#    Given I navigate to "Management" sub tab
#    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
#    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "3" seconds
#    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
#    When I click on "Save" in the page details
#    And I save the field labeled "EGMS ID" as "AmendmentId"
#    When I click on "Submit to Grantor" in the page details
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Submitted to Grantor"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I wait for "3" seconds
#    And I click toggle button to select "Amendment Requests - All"
#    When I perform quick search for "{SavedValue:AmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
#    And I click on "View" icon for "{SavedValue:AmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PM Username} | NA                |
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PM Username} | Step 1            |
#    And I click on "Submit for Approval" in the page details
#    And I pause execution for "3" seconds
#    And I "Approve" in the approval decision
#    And I pause execution for "3" seconds
#    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
#    And I click on "Amend Subaward" in the page details
#    And I pause execution for "3" seconds
#    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
#    And I pause execution for "3" seconds
#    And I click on "Activate" in the page details
#    And I wait for "3" seconds
#    Then I softly see that "Subaward" is in "Activated" status
#
# @SubrecipientBudgetRedirection @ProdSan1
#  Scenario: Validate Subrecipient side Budget Redirection Amendment End to End flow
#    And I activated standalone subaward "Automation Runtime Award" with properties "IS_BUILDUP_FUNCTIONALITY_YES" of type "Formula_By_Applicant_Focus_Area"
#    Given I am on "SUBPORTAL" portal
#    When I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---" without waiting for record
#    And I save the field labeled "EGMS ID" as "AwardEGMSID"
#    And I save the field labeled "Grant ID" as "GrantEGMSID"
#    Given I navigate to "Management" sub tab
#    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
#    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I enter value "Automation Justification" into field "Justification__c"
#    And I wait for "3" seconds
#    When I click on "Save" in the page details
#    Then I softly see status in Progress-bar is "Created" and is "dark blue"
#    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
#    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
#    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
#      | Title        | Award Amount |
#      | Construction | 900          |
#    When I close "Add Line Items" modal by clicking the top right x button
#    And I wait for "2" seconds
#    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---amendment:-:budgetChangeTableId---"
#    And I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
#      | Title        | Narrative     | Award Amount |
#      | Construction | The Narrative | 100          |
#    When I close "Add Line Items" modal by clicking the top right x button
#    And I click on "Submit to Grantor" in the page details
#    And I wait for "2" seconds
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PO Username} | NA                |
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PO Username} | Step 1            |
#    And I click on "Submit for Approval" in the page details
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Submitted for Approval"
#    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Amendment Requests - Approved"
#    And I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
#    When I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
#    And I click on "Amend Subaward" in the page details
#    And I wait for "4" seconds
#    When I click on "Activate" in the page details
#    And I wait for "3" seconds
#    Then I softly see that "Subaward" is in "Activated" status
#
#  @ValidatedDetailBudgetYesScenarioInAward @ProdSan2
#  Scenario: Validate Detail Budget Yes Scenario In Award
#    When I login to "As a Grantor" app as "PM" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
#    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
#    And I click modal button "Continue"
#    And I enter "Grant_Edition_By_Applicant" values from "Award_Field_Values.xlsx"
#    And I enter value "Yes" into field "IsBuildUpFunctionality__c"
#    When I click modal button "Save and Continue"
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    And I navigate to "Subawards" sub tab
#    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I get the "EGMS ID"
#    And I navigate to "Budget" sub tab
#    And I save the field labeled "EGMS ID" as "AwardEGMSID"
#    And I click on "Edit" in the page details
#    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I navigate to "Budget" sub tab
#    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
#    And I wait for "2" seconds
#    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
#      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
#      | Extra Salary | The narrative | 1000         | 100        | 100            |
#    Then I softly can see row level action button "Edit" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    Then I softly can see row level action button "Delete" against "Extra Salary" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    Then I softly see value "$1,000.00" for title "Award Amount" against the value "Extra Salary" inside table "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    Then I softly see value "$100.00" for title "Cash Match" against the value "Extra Salary" inside table "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    Then I softly see value "$100.00" for title "Non-Cash Match" against the value "Extra Salary" inside table "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
#      | Title        | Award Amount | Cash Match | Non-Cash Match |
#      | Extra Salary | 700          | 50         | 50             |
#    Then I softly see value "$700.00" for title "Award Amount" against the value "Extra Salary" inside table "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    Then I softly see value "$50.00" for title "Cash Match" against the value "Extra Salary" inside table "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    Then I softly see value "$50.00" for title "Non-Cash Match" against the value "Extra Salary" inside table "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    When I click on "Edit" icon for "Extra Salary" inside flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    And I clear in modal the value from table field "BudgetRequest__c"
#    And I clear in modal the value from table field "CashMatch__c"
#    And I clear in modal the value from table field "NonCashMatch__c"
#    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    And I wait for "5" seconds
#    Then I softly see value "$0.00" for title "Award Amount" against the value "Extra Salary" inside table "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    Then I softly see value "$0.00" for title "Cash Match" against the value "Extra Salary" inside table "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    Then I softly see value "$0.00" for title "Non-Cash Match" against the value "Extra Salary" inside table "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    When I click on "Delete" icon for "Extra Salary" inside flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
#    And I wait for "5" seconds
#    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
#
#  @TermsandConditionAmendmentRequest @ProdSan2
#  Scenario: Validate Terms and Conditions Amendment Request End to End flow
#    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
#    When I am on "INTERNAL" portal
#    And I login to "As a Grantor" app as "PM" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I navigate to "Management" sub tab
#    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
#    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    When I enter value "Automation Justification" into field "TncComments__c"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PM Username} | NA                |
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PM Username} | Step 1            |
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name                      | Amendment Request |
#      | {SavedValue:EXE Username} | Step 2            |
#    When I navigate to "Files" sub tab
#    And I click on top right button "Add Files" in flex table with id "---progressreport:-:AmendmentAttachmentTableId---"
#    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
#    When I click modal button "Close"
#    And I wait for "2" seconds
#    Then I softly see value "Attachment.pdf" for title "Title" inside table "---progressreport:-:AmendmentAttachmentTableId---"
#    And I click on "Send to Subrecipient" in the page details
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I click on "Acknowledge" in the page details
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I click on "Submit for Approval" in the page details
#    And I wait for "3" seconds
#    And I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Amendment Requests - Approved"
#    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
#    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
#    And I click on "Amend Subaward" in the page details
#    And I wait for "3" seconds
#    When I click on "Activate" in the page details
#    And I wait for "3" seconds
#    Then I softly see that "Subaward" is in "Activated" status
#
#  @SubrecipientBudgetPeriodAmendmentRequest @ProdSan2
#  Scenario: Validate Subrecipient Amendment Request End to End flow
#    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Competitive"
#    When I am on "SUBPORTAL" portal
#    And I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Grants" tab
#    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards  - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
#    And I navigate to "Management" sub tab
#    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
#    When I enter "SubRecipientBPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I save the field labeled "EGMS ID" as "budgetPChangeId"
#    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
#    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
#    And I click on "Save" in the page details
#    And I wait for "3" seconds
#    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
#    And I click on "Submit to Grantor" in the page details
#    Then I softly see field "Status" as "Submitted to Grantor"
#    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
#      | Title                           | End Date                             |
#      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
#    And I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
#      | Name                      | Amendment Request |
#      | {SavedValue:EXE Username} | NA                |
#    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
#      | Name                      | Amendment Request |
#      | {SavedValue:EXE Username} | Step 1            |
#    When I click on "Submit for Approval" in the page details
#    And I pause execution for "3" seconds
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    Then I softly see field "Status" as "Approved"
#    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Amendment Requests - All"
#    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
#    And I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
#    And I click on "Amend Subaward" in the page details
#    And I wait for "3" seconds
#    When I click on "Activate" in the page details
#    And I wait for "3" seconds
#    Then I softly see that "Subaward" is in "Activated" status
#
#  @FundingChangeandTermsandConditions @ProdSan4
#  Scenario: Validate Funding Change and Terms & Conditions End to End flow
#    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "SECOND_FOCUS_AREA_BUD_CAT_BUILDUP_YES-Automation EXE user" of type "Competitive"
#    When I login to "As a Grantor" app as "EXE" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    When I navigate to "Management" sub tab
#    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
#    When I enter "Funding_Terms_creation" values from "AmendmentRequest_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    When I enter values into fields
#      | Value                       | Field                         |
#      | Automation Test Description | FundingChangeJustification__c |
#      | 2000                        | RequestedChangeInBudget__c    |
#    When I enter values into fields
#      | Value                    | Field          |
#      | Automation Justification | TncComments__c |
#    And I click on "Save" in the page details
#    And I save the field labeled "EGMS ID" as "FundTermsID"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PM Username} | NA                |
#    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PM Username} | Step 1            |
#    When I get the "EGMS ID"
#    And I click on "Send to Subrecipient" in the page details
#    Then I softly see field "Status" as "Sent to Subrecipient"
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
#    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
#      | Title        | Award Amount |
#      | Construction | 1500         |
#    And I wait for "2" seconds
#    When I close "Add Line Items" modal by clicking the top right x button
#    And I wait for "2" seconds
#    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
#    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
#    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
#      | Title        | Award Amount |
#      | Construction | 1500         |
#    And I wait for "2" seconds
#    When I close "Add Line Items" modal by clicking the top right x button
#    And I wait for "2" seconds
#    And I refresh the page
#    And I click on "Submit to Grantor" in the page details
#    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "Overview" sub tab
#    And I click on "Edit" in the page details
#    When I enter values into fields
#      | Value | Field                |
#      | 4000  | RevisedCommitment__c |
#    And I click on "Save" in the page details
#    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
#      | Funding Account             | Revised Encumbrance |
#      | {SavedValue:fundingAccount} | 3000                |
#    And I click on "Submit for Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:FundTermsID}" in "---amendment:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:FundTermsID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    Then I softly see field "Status" as "Approved"
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Amendment Requests - All"
#    When I perform quick search for "{SavedValue:FundTermsID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
#    And I click on "View" icon for "{SavedValue:FundTermsID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
#    And I click on "Amend Subaward" in the page details
#    And I wait for "3" seconds
#    When I click on "Activate" in the page details
#    And I wait for "3" seconds
#    Then I softly see that "Subaward" is in "Activated" status
#
#  @CombinationOfSubrecipientBRandKPCandSOW @ProdSan2
#  Scenario: Validate Combinations of Subrecipient BR and KPC and SOW
#    Given I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUD_CAT_BUILDUP_YES-Automation PO user" of type "Formula_By_Applicant"
#    When I am on "SUBPORTAL" portal
#    When I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Grants" tab
#    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards - All"
#    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
#    Given I navigate to "Management" sub tab
#    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
#    When I enter "Sub_BR_KPC_SOW_creation" values from "AmendmentRequest_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I enter value "Automation Justification" into field "Justification__c"
#    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
#    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I save the field labeled "EGMS ID" as "budRedKPCSOWId"
#    And I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
#      | Name                       | Project Role |
#      | {SavedValue:SPI1 Username} | Other        |
#    And I wait for "2" seconds
#    And I refresh the page
#    Then I softly see status in Progress-bar is "Created" and is "dark blue"
#    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
#    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
#      | Title        | Award Amount |
#      | Construction | 450          |
#    And I wait for "2" seconds
#    When I close "Add Line Items" modal by clicking the top right x button
#    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---amendment:-:budgetChangeTableId---"
#    And I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
#      | Title        | Narrative     | Award Amount |
#      | Construction | The Narrative | 50           |
#    And I wait for "2" seconds
#    When I close "Add Line Items" modal by clicking the top right x button
#    And I wait for "3" seconds
#    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
#    And I wait for "3" seconds
#    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
#    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
#      | Title        | Award Amount |
#      | Construction | 450          |
#    And I wait for "2" seconds
#    When I close "Add Line Items" modal by clicking the top right x button
#    And I wait for "3" seconds
#    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---amendment:-:budgetChangeTableId---"
#    And I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
#      | Title        | Narrative     | Award Amount |
#      | Construction | The Narrative | 50           |
#    And I wait for "2" seconds
#    When I close "Add Line Items" modal by clicking the top right x button
#    And I wait for "2" seconds
#    And I click on "Submit to Grantor" in the page details
#    Then I softly see field "Status" as "Submitted to Grantor"
#    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:budRedKPCSOWId}" in "---amendment:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:budRedKPCSOWId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name                      | Amendment Request |
#      | {SavedValue:EXE Username} | NA                |
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name                      | Amendment Request |
#      | {SavedValue:EXE Username} | Step 1            |
#    When I click on "Submit for Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:budRedKPCSOWId}" in "---amendment:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:budRedKPCSOWId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    Then I softly see field "Status" as "Approved"
#    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Amendment Requests - All"
#    When I perform quick search for "{SavedValue:budRedKPCSOWId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
#    And I click on "View" icon for "{SavedValue:budRedKPCSOWId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
#    And I click on "Amend Subaward" in the page details
#    And I wait for "3" seconds
#    When I click on "Activate" in the page details
#    And I wait for "3" seconds
#    Then I softly see that "Subaward" is in "Activated" status
#
#  @CarryForwardAmendmentRequest @ProdSan2
#  Scenario: Validate Carry Forward Amendment Request End to End flow
#    And I activated standalone subaward "Automation Runtime award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Competitive"
#    When I login to "As a Grantor" app as "PM" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I save the field labeled "EGMS ID" as "AwardEGMSID"
#    Then I softly see that "Subaward" is in "Activated" status
#    And I navigate to "Management" sub tab
#    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
#    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
#    When I enter values into fields
#      | Value | Field                      |
#      | 4000  | RevisedCommitment__c       |
#      | 2000  | RequestedChangeInBudget__c |
#    When I click on "Save" in the page details
#    And I wait for "3" seconds
#    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
#    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
#    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
#    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
#      | Title                           | Start Date         | End Date           |
#      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
#    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
#      | Title                            | Start Date         | End Date           |
#      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
#    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
#      | Title                       | Revised Encumbrance |
#      | {SavedValue:fundingAccount} | 2000                |
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name          | Amendment Request |
#      | Automation PM | NA                |
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name          | Amendment Request |
#      | Automation PM | Step 1            |
#    And I click on "Send to Subrecipient" in the page details
#    Then I softly see field "Status" as "Sent to Subrecipient"
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
#      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
#      | Construction    | 1000                 | 100        | 0              |
#    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
#    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
#      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
#      | Construction  | 1000                 | 100        | 0              |
#    And I wait for "2" seconds
#    And I refresh the page
#    And I click on "Submit to Grantor" in the page details
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I click on "Submit for Approval" in the page details
#    And I pause execution for "3" seconds
#    And I "Approve" in the approval decision
#    And I pause execution for "3" seconds
#    And I click on "Amend Subaward" in the page details
#    And I pause execution for "5" seconds
#    When I click on "Activate" in the page details
#    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Subawards  - Active"
#    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
#    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
#    Given I navigate to "Management" sub tab
#    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
#    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I enter value "Automation Justification" into field "PurposeRTA__c"
#    And I enter value "700" into field "RequestedChangeInBudget__c"
#    And I wait for "5" seconds
#    When I click on "Save" in the page details
#    And I save the field labeled "EGMS ID" as "CFAmendmentId"
#    Then I softly see status in Progress-bar is "Created" and is "dark blue"
#    And I expand nested table containing column value "BP01"
#    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
#      | Budget Category | Carry Forward |
#      | Construction    | 200           |
#    And I wait for "2" seconds
#    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
#    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
#      | Budget Category | Carry Forward |
#      | Construction    | 500           |
#    When I click on button "resetIcon" in flex table with id "---progressReport:-:budgetChangeTableId---"
#    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
#      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
#      | Construction    | 1200                 | 120        | 0              |
#    And I wait for "2" seconds
#    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
#    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
#      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
#      | Construction    | 1500                 | 150        | 0              |
#    And I wait for "2" seconds
#    And I refresh the page
#    And I click on "Submit to Grantor" in the page details
#    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
#    And I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
#      | Title                       | Revised Encumbrance |
#      | {SavedValue:fundingAccount} | 2700                |
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PO Username} | NA                |
#    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
#      | Name                     | Amendment Request |
#      | {SavedValue:PO Username} | Step 1            |
#    And I wait for "2" seconds
#    When I click on "Submit for Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Amendment Requests - All"
#    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
#    And I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
#    And I click on "Amend Subaward" in the page details
#    And I wait for "3" seconds
#    When I click on "Activate" in the page details
#    And I wait for "3" seconds
#    Then I softly see that "Subaward" is in "Activated" status
#
#  @SF429-B_FillFullForm @ProdSan3
#  Scenario: Validate SF429-B_Fill Full Form
#    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
#    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
#    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
#    And I am on "SUBPORTAL" portal
#    And I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    And I wait for "2" seconds
#    And I click on "Edit" in the page details
#    When I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "progID"
#    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I wait for "2" seconds
#    When I navigate to "Forms and Files" sub tab
#    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
#    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
#    When I click modal button "Close"
#    And I wait for "2" seconds
#    And I select value inside table "---progressReport:-:formTableId---" is "All"
#    And I wait for "2" seconds
#    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
#    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
#    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
#    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
#    And I click on "View" icon for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside flex table with id "---progressReport:-:formTableId---" without Split
#    And I switch to tab number "1"
#    Then I softly see the text containing "OMB Number: 4040-0016"
#    Then I see the page contains text "Expiration Date: 02/28/2025"
#    And I click on "Edit" in the page details
#    And I enter "SF429B_Form" values from "ProgressReport_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I wait for "2" seconds
##    Then I softly see the following messages in the page details :
##      | Form saved successfully. |
#    And I refresh the page
#    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
#    And I upload attachment without random number "AttachmentTesting.pdf" of type "14i. NHPA Description" from computer
#    When I click modal button "Close"
#    And I wait for "2" seconds
#    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
#    And I upload attachment without random number "AttachmentTesting.pdf" of type "14h. Environmental Compliance Requirements" from computer
#    When I click modal button "Close"
#    And I wait for "9" seconds
#    When I click on "Validate" in the page details
#    Then I softly see the following messages in the page details :
#      | Form validated successfully. |
#
#  @SF428_B_Form_Fill @ProdSan3
#  Scenario: Validate SPI1 user can able to save & validate form after entering correct & valid data on all fields present on SF-428-B form
#    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
#    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
#    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
#    And I am on "SUBPORTAL" portal
#    And I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    And I wait for "2" seconds
#    When I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "progID"
#    And I click on "Edit" in the page details
#    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    When I navigate to "Forms and Files" sub tab
#    And I select value inside table "---progressReport:-:formTableId---" is "All"
#    And I wait for "2" seconds
#    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
#    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
#    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
#    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
#    And I click on "View" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
#    And I switch to tab number "1"
#    Then I softly see the text containing "OMB Number: 4040-0018"
#    Then I see the page contains text "Expiration Date: 11/30/2024"
#    When I click on "Edit" in the page details
#    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
#    And I upload attachment without random number "AttachmentTesting.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
#    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
#    And I upload attachment without random number "AttachmentTesting.pdf" of type "2. Additional File for Comments" from computer
#    And I refresh the page
#    And I wait for "4" seconds
#    Then I softly can see top right button "Validate" in page detail
#    Then I softly can see top right button "Edit" in page detail
#    Then I softly can see top right button "Back" in page detail
#    When I click on "Validate" in the page details
#    Then I softly see the following messages in the page details :
#      | Form validated successfully. |
#
#  @SF428_B_ErrorValidation @ProdSan3
#  Scenario:
#    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
#    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
#    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
#    And I am on "SUBPORTAL" portal
#    And I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    And I wait for "2" seconds
#    When I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "progID"
#    And I click on "Edit" in the page details
#    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    When I navigate to "Forms and Files" sub tab
#    And I select value inside table "---progressReport:-:formTableId---" is "All"
#    And I wait for "2" seconds
#    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
#    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
#    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
#    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
#    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
#    And I switch to tab number "1"
#    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
#    When I enter value "UnChecked" into field "FederallyownedProperty__c"
#    When I enter value "UnChecked" into field "AcquiredEquipment__c"
#    When I enter value "UnChecked" into field "ResidualUnusedSupplies__c"
#    When I click on "Save" in the page details
#    And I wait for "3" seconds
#    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
#    And I upload attachment without random number "AttachmentTesting.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
#    When I click modal button "Close"
#    And I wait for "2" seconds
#    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
#    And I upload attachment without random number "AttachmentTesting.pdf" of type "2. Additional File for Comments" from computer
#    When I click modal button "Close"
#    And I wait for "9" seconds
#    When I click on "Validate" in the page details
#    Then I softly see the following messages in the page details :
#      | Selecting at least one that apply in 'Report' is required. |
#    When I click on "Edit" in the page details
#    When I enter value "Checked" into field "FederallyownedProperty__c"
#    When I enter value "Checked" into field "AcquiredEquipment__c"
#    When I enter value "Checked" into field "ResidualUnusedSupplies__c"
#    When I enter value "Checked" into field "NoneoftheAbove__c"
#    And I clear the value from field "FederalAwardIdentifier__c"
#    When I enter value "UnChecked" into field "RequestTransfertoAward__c"
#    When I enter value "UnChecked" into field "RequestFederalAgency__c"
#    When I enter value "UnChecked" into field "Other__c"
#    When I enter value "UnChecked" into field "AcknowledgeEquipment__c"
#    When I enter value "UnChecked" into field "RequestFederalAgencyDispositionInstr__c"
#    And I clear the value from field "TotalAmount__c"
#    And I clear the value from field "PercentageofFederalParticipation__c"
#    And I clear the value from field "FederalShare__c"
#    And I clear the value from field "SellingandHandlingAllowance__c"
#    When I click on "Save" in the page details
#    And I wait for "9" seconds
#    When I click on "Validate" in the page details
#    Then I softly see the following messages in the page details :
#      | If "1d" is checked, uncheck "1a", "1b" and "1c" in 'Report' section.                                                                            |
#      | One selection is required in "2a. Federally-owned Property", if "1a" is checked in 'Report' section.                                            |
#      | One selection is required in "2b. Acquired Equipment with current fair market value of $5,000 or more", if "1b" is checked in 'Report' section. |
#      | "Total Amount" is required in "2c. Reportable Residual Unused Supplies", if "1c" is checked in 'Report' section.                                |
#      | "Percentage of Federal participation" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.         |
#      | "Federal share" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.                               |
#      | "Selling and handling allowance" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.              |
#
#  @SF428_B_Dependent_fields @ProdSan3
#  Scenario:
#    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
#    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
#    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
#    And I am on "SUBPORTAL" portal
#    And I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    And I wait for "2" seconds
#    When I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "progID"
#    And I click on "Edit" in the page details
#    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    When I navigate to "Forms and Files" sub tab
#    And I select value inside table "---progressReport:-:formTableId---" is "All"
#    And I wait for "2" seconds
#    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
#    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
#    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
#    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
#    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
#    And I switch to tab number "1"
#    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
#    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
#    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
#    Then I softly see "d. None of the above" inside page block detail
#    When I enter value "1234" into field "FederalGrantIdentifyingNumbe__c"
#    When I enter value "Checked" into field "FederallyownedProperty__c"
#    Then I softly see fields "RequestTransfertoAward__c" is in edit mode
#    Then I softly see fields "RequestFederalAgency__c" is in edit mode
#    Then I softly see fields "Other__c" is in edit mode
#    Then I softly see that "AcknowledgeEquipment__c" rendered in view mode only
#    Then I softly see that "RequestFederalAgency__c" rendered in view mode only
#    Then I softly see that "Total Amount" rendered in view mode only
#    Then I softly see fields "PercentageofFederalParticipation__c" is in edit mode
#    Then I softly see fields "FederalShare__c" is in edit mode
#    Then I softly see fields "SellingandHandlingAllowance__c" is in edit mode
#    Then I softly see fields "FederalAwardIdentifier__c" is in edit mode
#    Then I softly see that "(ii) Percentage of Federal participation" rendered in view mode only
#    Then I softly see that "(iii) Federal Share" rendered in view mode only
#    Then I softly see that "(iv) Selling and handling allowance" rendered in view mode only
#    Then I softly see field "(i) Request transfer to Award" inside page block
#    Then I softly see field "Federal Award Identifier" inside page block
#    Then I softly see field "(ii) Request Federal Agency disposition instructions" inside page block
#    Then I softly see field "(iii) Other (Provide detail in Block 3 or attach request)" inside page block
#    Then I softly see that "Federal Award Identifier" rendered in view mode only
#
#  @SF428_B_dependentField_2 @ProdSan3
#  Scenario:
#    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
#    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
#    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
#    And I am on "SUBPORTAL" portal
#    And I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    And I wait for "2" seconds
#    When I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "progID"
#    And I click on "Edit" in the page details
#    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    When I navigate to "Forms and Files" sub tab
#    And I select value inside table "---progressReport:-:formTableId---" is "All"
#    And I wait for "2" seconds
#    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
#    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
#    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
#    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
#    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
#    And I switch to tab number "1"
#    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
#    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
#    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
#    Then I softly see "d. None of the above" inside page block detail
#    When I enter value "1234" into field "FederalGrantIdentifyingNumbe__c"
#    When I enter value "Checked" into field "AcquiredEquipment__c"
#    Then I softly see that "RequestTransfertoAward__c" rendered in view mode only
#    Then I softly see fields "FederalAwardIdentifier__c" is in edit mode
#    Then I softly see that "RequestTransfertoAward__c" rendered in view mode only
#    Then I softly see that "Other__c" rendered in view mode only
#    Then I softly see that "Total Amount" rendered in view mode only
#    Then I softly see that "(ii) Percentage of Federal participation" rendered in view mode only
#    Then I softly see that "(iii) Federal Share" rendered in view mode only
#    Then I softly see that "(iv) Selling and handling allowance" rendered in view mode only
#    Then I softly see fields "PercentageofFederalParticipation__c" is in edit mode
#    Then I softly see fields "FederalShare__c" is in edit mode
#    Then I softly see fields "SellingandHandlingAllowance__c" is in edit mode
#    Then I softly see "(i) Acknowledge equipment acquired under this federal award will be retained for use as originally approved" inside page block detail
#    Then I softly see "(ii) Request Federal Agency disposition instructions" inside page block detail
#    Then I softly see fields "AcknowledgeEquipment__c" is in edit mode
#    Then I softly see fields "RequestFederalAgencyDispositionInstr__c" is in edit mode
#
#  @programRejection @ProdSan3
#  Scenario: Validate the Rejectionof Internal Program and redirecting to same page
#    When I login to "As a Grantor" app as "dynamicUser" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Created"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I get the "EGMS ID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
#    When I click modal button "Close"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
#    When I click modal button "Close"
#    And I wait for "2" seconds
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
#    When I click modal button "Close"
#    And I wait for "2" seconds
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
#    When I click modal button "Close"
#    And I wait for "2" seconds
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 1  |
#    When I get the "EGMS ID"
#    When I navigate to "Setup" sub tab
#    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
#      | Description                 | Required | Applies To  | Status |
#      | Automation test description | Optional | Application | Active |
#    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
#    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
#    When I click modal button "Close"
#    And I navigate to "Files" sub tab
#    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
#    And I pause execution for "5" seconds
#    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
#    When I click modal button "Close"
#    And I click on "Submit For Approval" in the page details
#    And I wait for "3" seconds
#    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I select radio button "Reject" in the approval decision
#    When I enter comment "Automation testing" in the approval decision
#    And I submit the approval in the approval decision without processing
#    And I wait for "2" seconds
#    Then I softly see confirmation box with body "This action cannot be undone. Do you really want to Reject?" is displayed
#    And I click "Cancel" on modal confirmation box
#    And I wait for "3" seconds
#    Then I see only the following ordered radio buttons in the approval decision :
#      | Approve | Reject | Forward | Send back |
#
#  @OwnershipReasignment @ProdSan4
#  Scenario: Validate Grants Ownership Reassignment
#    When I login to "As a Grantor" app as "PM" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
#    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
#    And I click modal button "Continue"
#    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    And I navigate to "Subawards" sub tab
#    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "AwardEGMSID"
#    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
#    And I navigate to "Home" tab
#    Then I see "Ownership" inside "Reassign" is displayed
#    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
#    And I select value "Automation PM" into field "input-1"
#    And I select value "Automation PM1" into field "input-2"
#    And I select module "Grant" from reassign ownership dropdown
#    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:grantSourceOwnerTableId---" panel
#    When I check "{SavedValue:GrantEGMSID}" boxes in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
#    When I click table top right button "Transfer Ownership" in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
#    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
#    And I click "OK" on modal confirmation box
#    And I pause execution for "30" seconds
#    When I navigate to "Records of Target User" sub tab
#    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:grantTargetOwnerTableId---" panel
#    Then I see value "{SavedValue:GrantEGMSID}" for title "Grant ID" inside table "---subAwardStandAlone:-:grantTargetOwnerTableId---"
#    And I pause execution for "2" seconds
#    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    When I navigate to "Responsibilities" sub tab
#    Then I softly see value "Automation PM1" for title "Name" inside table "---subAwardStandAlone:-:subawardOwnerTableId---"
#
#  @TaskReassignment @ProdSan4
#  Scenario: Validate Task Reassignment Scenario
#    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
#    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
#    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
#    And I am on "SUBPORTAL" portal
#    And I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    And I click on "Edit" in the page details
#    When I navigate to "Forms and Files" sub tab
#    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
#    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
#    When I click modal button "Close"
#    And I wait for "2" seconds
#    And I click on "Save" in the page details
#    When I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "progID"
#    And I click on "Edit" in the page details
#    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I navigate to "Performance" sub tab
#    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
#      | Title                    | Reported Date | Actual |
#      | Automation Permanent KPI | 7             | 7      |
#    When I navigate to "Forms and Files" sub tab
#    And I select value inside table "---progressReport:-:formTableId---" is "All"
#    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
#    And I switch to tab number "1"
#    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I close the tab
#    And I wait for "2" seconds
#    When I click on "Submit to Grantor" in the page details
#    Then I softly see field "Status" as "Submitted to Grantor"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Home" tab
#    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
#    When I reassign task to "Automation PM1"
#    When I perform quick search for "{SavedValue:progID}" in "---program:-:grantorTaskReassignTableId---" panel
#    Then I softly see value "{SavedValue:progID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
#    When I check "{SavedValue:progID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
#    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
#    And I pause execution for "30" seconds
#    And I reset the table
#    When I perform quick search for "{SavedValue:progID}" in "---program:-:grantorTaskReassignTableId---" panel
#    Then I softly do not see value "{SavedValue:progID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
#    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
#    And I navigate to "Monitoring" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:progID}" in "---paymentRequest:-:pendingTaskTableId---" panel
#    Then I see value "{SavedValue:progID}" for title "EGMS ID" inside table "---paymentRequest:-:pendingTaskTableId---"
#
#  @SendToOwner @ProdSan4
#  Scenario: Validate Send to Owner scenario
#    When I login to "As a Grantor" app as "PM" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
#    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
#    And I click modal button "Continue"
#    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    And I navigate to "Subawards" sub tab
#    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "AwardEGMSID"
#    When I navigate to "Overview" sub tab
#    And I save the field labeled "Subaward Title" as "Automation Runtime Direct Award"
#    And I click on "Edit" in the page details
#    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I navigate to "Budget" sub tab
#    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
#    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
#    When I close "Associate Funding Accounts" modal by clicking the top right x button
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
#      | Title                           | Start Date | End Date |
#      | Automation Permanent Focus Area | 0          | 3650     |
#    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
#      | Funding Account             | Encumbrance |
#      | {SavedValue:fundingAccount} | 1000        |
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
#      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
#      | Construction    | 1000         | 100        | 100            |
#    When I navigate to "Performance" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
#      | EGMS ID                  | Target |
#      | Automation Permanent KPI | 10     |
#    And I navigate to "Terms" sub tab
#    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
#    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
#    And I wait for "3" seconds
#    And I click modal button "Save"
#    And I wait for "3" seconds
#    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
#    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
#    And I wait for "3" seconds
#    And I click modal button "Save"
#    And I wait for "2" seconds
#    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
#      | Name                       | Project Role             | Is Key Personnel |
#      | {SavedValue:SPI1 Username} | Project Director/Manager | Checked          |
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
#      | Name           | Award  |
#      | Automation PM1 | Step 1 |
#    And I click on "Send to Subrecipient" in the page details
#    And I wait for "3" seconds
#    And I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    When I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
#    When I click on "Accept" in the page details
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Home" tab
#    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
#    When I reassign task to "Automation PM1"
#    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
#    Then I softly see value "Initial Acceptance of Subaward by Subrecipient" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"
#    When I check "{SavedValue:AwardEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
#    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
#    And I pause execution for "30" seconds
#    And I reset the table
#    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
#    Then I softly do not see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
#    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    When I navigate to "Terms" sub tab
#    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
#    And I click on "Submit for Approval" in the page details
#    And I wait for "2" seconds
#    And I "Send back" in the approval decision
#    And I wait for "5" seconds
#    Then I softly see field "Status" as "Created"
#
#  @SitevisitOpenThroughManagementTabFromAward @ProdSan4 @wip
#  Scenario: Validate Sitevisit Open Through Management Tab From Award
#    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
#    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
#    When I login to "As a Grantor" app as "EXE" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
#    Given I navigate to "Management" sub tab
#    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
#    And I pause execution for "4" seconds
#    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "SitevVisitId"
#    Given I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
#      | Name                     | Site Visit |
#      | {SavedValue:PM Username} | Step 1     |
#    Given I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
#    And I pause execution for "5" seconds
#    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
#    And I pause execution for "5" seconds
#    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
#    And I click on "Notify" in the page details
#    When I click on "Conduct" in the page details
#    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
#    And I wait for "3" seconds
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
#    Given I navigate to "Management" sub tab
#    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
#    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
#    Then I softly see field "EGMS ID" as "{SavedValue:SitevVisitId}"
#
#  @DeskReviewOpenThroughManagementTabFromAward @ProdSan4 @wip
#  Scenario: Validate Desk Review Open Through Management Tab From Award
#    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Formula_By_Applicant"
#    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant"
#    When I login to "As a Grantor" app as "PM" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
#    Given I navigate to "Management" sub tab
#    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
#    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "DeskReview"
#    Given I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
#      | Name                     | Desk Review |
#      | {SavedValue:PM Username} | Step 1      |
#    When I get the "EGMS ID"
#    Given I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
#    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
#    And I pause execution for "5" seconds
#    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
#    And I click on "Notify" in the page details
#    And I click on "Conduct" in the page details
#    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
#    And I wait for "3" seconds
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
#    Given I navigate to "Management" sub tab
#    And I click on "View" icon for "{SavedValue:DeskReview}" inside flex table with id "---deskreview:-:managementInitiateDRtableid---"
#    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
#    Then I softly see field "EGMS ID" as "{SavedValue:DeskReview}"
#
#  @SF425FormsNegativeValidationCheckAndSF428ABlankvalueValidationCheckAlsoSF429Bformnegativevaluesenteredvalidationcheck @ProdSan4
#  Scenario: SF425 Forms Negative Validation Check and SF 428 A Blank value Validation Check also SF429B form negative values entered validation check
#    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
#    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
#    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
#    And I am on "SUBPORTAL" portal
#    And I login to "Grants Portal" app as "SPI1" user
#    And I navigate to "Monitoring" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
#    And I wait for "2" seconds
#    When I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "progID"
#    And I click on "Edit" in the page details
#    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I wait for "2" seconds
#    When I navigate to "Forms and Files" sub tab
#    And I select value inside table "---progressReport:-:formTableId---" is "All"
#    And I wait for "2" seconds
#    And I click on "View" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
#    And I switch to tab number "1"
#    And I click on "Edit" in the page details
#    And I enter "SF425_Form" values from "ProgressReport_Field_Values.xlsx"
#    And I edit the following rows inline in flex table with id "---progressReport:-:sf425TransactionTableID---" by clicking "Edit" :
#      | Classification                                                          | Cumulative |
#      | a. Cash Receipts                                                        | -30        |
#      | b. Cash Disbursements                                                   | -10        |
#      | d. Total Federal funds authorized                                       | -30        |
#      | e. Federal share of expenditures                                        | -20        |
#      | f. Federal share of unliquated obligations                              | -5         |
#      | i. Total recipient share required                                       | -30        |
#      | j. Recipient share of expenditures                                      | -20        |
#      | l. Total Federal share of program income earned                         | -30        |
#      | m. Program income expended in accordance with the deduction alternative | -20        |
#      | n. Program income expended in accordance with the addition alternative  | -5         |
#    Then I softly see the following messages in the page details :
#      | The amount cannot be less than zero. |
#    And I close the tab
#    #SF-428-A Blank value validation check
#    When I navigate to "Forms and Files" sub tab
#    And I select value inside table "---progressReport:-:formTableId---" is "All"
#    And I click on "Edit" icon for "Tangible Personal Property Report - Annual Report - SF-428-A" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
#    And I switch to tab number "1"
#    And I enter value "1234" into field "FederalGrantSF428A__c"
#    And I enter value "(a) Individual (Reporting Federally-owned property for one award)" into field "ReportTypePiclikist__c"
#    And I enter value "30 SEP" into field "ReportAsOf__c"
#    And I enter value "Test" into field "CommentsSF428__c"
#    When I click on "Save" in the page details
#    And I wait for "2" seconds
#    And I refresh the page
#    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
#    When I enter in modal "SF428A_Federal_Property" values from "ProgressReport_Field_Values.xlsx"
#    And I click modal button "Save"
#    And I refresh the page
#    And I wait for "5" seconds
#    When I click on "Validate" in the page details
#    Then I softly see the following messages in the page details :
#      | If year is selected, report type As of Year is required. |
#    And I close the tab
#    #SF429B form negative values entered validation check
#    When I navigate to "Forms and Files" sub tab
#    And I wait for "2" seconds
#    And I select value inside table "---progressReport:-:formTableId---" is "All"
#    And I wait for "2" seconds
#    And I click on "View" icon for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside flex table with id "---progressReport:-:formTableId---" without Split
#    And I switch to tab number "1"
#    And I enter "SF429B_Form_incorrect_data" values from "ProgressReport_Field_Values.xlsx"
#    And I wait for "3" seconds
#    When I click on "Save" in the page details
#    When I click on "Validate" in the page details
#    Then I softly see the following messages in the page details :
#      | If "Other" option is selected in "14k", Justification in specify is required.                                                                |
#      | If "Other" option is selected in "14l", Justification in specify is required.                                                                |
#      | If "Other" is selected in "Real Property Ownership Type", Description is required.                                                           |
#      | Unit type is required, if amount entered in "14d. Land Acreage or Square Units".                                                             |
#      | Unit type is required, if amount entered in "14e. Gross and Usable Square Footage/Meters".                                                   |
#      | Values can only be entered against the Electric (KWh) or Electric (Btu) in section "14k"                                                     |
#      | Values can only be entered against the Electric (KWh) or Electric (Btu) in section "14l"                                                     |
#      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                                        |
#      | Federal Percentage cannot be less than zero.                                                                                                 |
#      | Non Federal Percentage cannot be less than zero.                                                                                             |
#      | The Land Acreage Amount cannot be less than zero.                                                                                            |
#      | The Gross Amount cannot be less than zero.                                                                                                   |
#      | The Usable Amount cannot be less than zero.                                                                                                  |
#      | Federal Share cannot be less than zero.                                                                                                      |
#      | Non Federal Share cannot be less than zero.                                                                                                  |
#      | Value in "Electric" in "14k" cannot be less than zero.                                                                                       |
#      | Value in "Btu" in "14k" cannot be less than zero.                                                                                            |
#      | Value in "Petroleum" in "14k" cannot be less than zero.                                                                                      |
#      | Value in "Natural Gas" in "14k" cannot be less than zero.                                                                                    |
#      | Value in "Other" in "14k" cannot be less than zero.                                                                                          |
#      | Value in "Electric" in "14l" cannot be less than zero.                                                                                       |
#      | Value in "Btu" in "14l" cannot be less than zero.                                                                                            |
#      | Value in "Petroleum" in "14l" cannot be less than zero.                                                                                      |
#      | Value in "Natural Gas" in "14l" cannot be less than zero.                                                                                    |
#      | Value in "Other" in "14l" cannot be less than zero.                                                                                          |
#      | Adding file is required in "Files section" with classification "Environmental Compliance Requirements", if "Yes" option in "14h" is checked. |
#      | Adding file is required in "Files section" with classification "NHPA", if "Yes" option in "14i" is checked.                                  |
#
#  @AwardWithFocusNo
#  Scenario: Award with focus area no
#    When I login to "As a Grantor" app as "PM" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
#    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
#    And I click modal button "Continue"
#    And I enter "Grant_Edition_ByApp_Focus_No" values from "Award_Field_Values.xlsx"
#    When I click modal button "Save and Continue"
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    And I navigate to "Subawards" sub tab
#    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I get the "EGMS ID"
#    And I navigate to "Budget" sub tab
#    Then I see status in Progress-bar is "Created" and is "dark blue"
#    And I save the field labeled "EGMS ID" as "AwardEGMSID"
#    And I click on "Edit" in the page details
#    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I navigate to "Budget" sub tab
#    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
#    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
#    When I close "Associate Funding Accounts" modal by clicking the top right x button
#    And I navigate to "Budget" sub tab
#    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
#      | Funding Account             | Encumbrance |
#      | {SavedValue:fundingAccount} | 1000        |
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
#      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
#      | Construction    | 1000         | 100        | 100            |
#    When I navigate to "Performance" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
#      | EGMS ID                  | Target |
#      | Automation Permanent KPI | 10     |
#    And I navigate to "Terms" sub tab
#    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
#    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
#    And I click modal button "Save"
#    And I wait for "2" seconds
#    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
#    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
#    And I click modal button "Save"
#    And I wait for "2" seconds
#    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
#      | Name                       | Project Role             | Is Key Personnel |
#      | {SavedValue:SPI1 Username} | Project Director/Manager | Checked          |
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
#      | Name                      | Award  |
#      | {SavedValue:EXE Username} | Step 1 |
#    And I click on "Send to Subrecipient" in the page details
#    And I wait for "2" seconds
#    Then I softly see field "Status" as "Sent to Subrecipient"
#    And I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    When I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
#    When I click on "Accept" in the page details
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    When I navigate to "Terms" sub tab
#    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
#    And I click on "Submit for Approval" in the page details
#    And I wait for "3" seconds
#    Then I softly see field "Status" as "Submitted for Approval"
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
#    And I click on "Send to Subrecipient" in the page details
#    And I wait for "2" seconds
#    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
#    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
#    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
#    And I click on "Accept after Approval" in the page details
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
#    When I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    And I click on "Activate" in the page details
#    Then I softly see that "Subaward" is in "Activated" status