@smeRegistration @smeReviewerRegistration @userRegistration @parallel-regression @regression @smeRegistrationEmailNotification @EmailNotification @RegistrationmailandPdf  @skipOnJenkins
Feature: Validate all scenarios for SME Registration for Email Notification

  @94345 @validatingEmailNotificationForSMEReviewer
  Scenario: To verify Email notification should be received to SME contact after sending invitation by internal  user
    Given I login to "Grantor" app as "PM" user
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter in modal value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I click "Send" button in modal
    And I wait for "2" seconds
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "60" seconds
    Then I refresh the page
    And I see the maildrop subject is as follows :
      """
      Sandbox: Notification: You have been Invited to Register in theEnterprise Grants Management System (EGMS)
      """

  @34872 @34840 @VerifyPageDetailsOnRegistrationStep1of1-SMEReviewerRegistration @smoke
  Scenario: Validate all expected fields are getting populated on page of Registration Step 1 of 1 while SME reviewer registration
    Given I login to "Grantor" app as "PM" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---home:-:reviewersTableId---" panel
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} Contact" inside flex table with id "---home:-:reviewersTableId---" without waiting for record
    And I click "Send" button in modal
    And I wait for "2" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID}"
    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID}" with subject "Notification: You have been Invited to Register in the"
    And I wait for "3" seconds
    #34840 #monu
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Step 1 of 1" in the page details
    Then I softly see fields "ExternalReviewerPrefix__c" is in edit mode
    Then I softly see fields "ExternalReviewerLastName__c" is in edit mode
    Then I softly see fields "ExternalReviewerLastName__c" is in edit mode
    Then I softly see fields "ExternalReviewerPhone__c" is in edit mode
    Then I softly see value "{SavedValue:uniqueEmailID}" for the edit mode field "ExternalReviewerEmail__c"

  @34991 @VerifySubjectMatterExpertFieldsDetails-SMEReviewerRegistration @smoke
  Scenario: Validate filled details of subject matter expert fields on page of Registration Step 1 of 1
    Given I login to "Grantor" app as "PM" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---home:-:reviewersTableId---" panel
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} Contact" inside flex table with id "---home:-:reviewersTableId---" without waiting for record
    And I click "Send" button in modal
    And I wait for "5" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID}"
    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID}" with subject "Sandbox: Notification: You have been Invited to Register in the"
    And I wait for "3" seconds
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
    When I click on "Agree" in the page details
    And I enter "Edition" values from "PotentialReviewersContact_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Confirmation Message |

  @35013 @VerifyCreatedSMEUserAtActivePartneruser-SMEReviewerRegistration @smoke  @wip
  Scenario: Validate created SME user should get reflected at salesforce page inside Active Partnet usersall expected fields are getting populated on page of Registration Step 1 of 1 while SME reviewer registration
    Given I login to "Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I click modal button "Send"
    And I refresh the page
    And I pause execution for "62" seconds
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Step 1 of 1" in the page details
    And I enter "OrgProfileCompleteDetail" values from "UserRegistration_Field_Values.xlsx"