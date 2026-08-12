@smeRegistration @smeReviewerRegistration @userRegistration @parallel-regression @regression
Feature: Validate all scenarios for SME Registration

  @34872 @34840 @VerifyPageDetailsOnRegistrationStep1of1-SMEReviewerRegistration @smoke
  Scenario: Validate all expected fields are getting populated on page of Registration Step 1 of 1 while SME reviewer registration
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID" for maildrop
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I wait for "3" seconds
    And I click "Send" button in modal
    And I wait for "3" seconds
    And I pause execution for "180" seconds
    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID}" with subject "Sandbox: Notification: You have been Invited to Register in theEnterprise Grants Management System (EGMS)"
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
    Then I softly see field "Email" as "{SavedValue:uniqueEmailID}"

  @34991 @VerifySubjectMatterExpertFieldsDetails-SMEReviewerRegistration @smoke
  Scenario: Validate filled details of subject matter expert fields on page of Registration Step 1 of 1
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I click "Send" button in modal
    And I wait for "2" seconds
    And I refresh the page
    And I pause execution for "180" seconds
    And I navigate to yopmail portal for "{SavedValue:uniqueEmailID}" with subject "Sandbox: Notification: Invitation to be a user of EGMS"
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
    When I click on "Agree" in the page details
    And I enter "SubjectMatterExpertDetails" values from "grantorUserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see the following messages in the page details contains:
      | Confirmation Message                                                                                                                                                                |
      | Your registration request for access to the EGMS has been completed.  You will be sent an email from salesforce.com (technology platform provider) with your Username and Password. |

  @34834 @34836 @34831 @VerifyCreatedSMEUserDetails-SMEReviewerRegistration @smoke
  Scenario: Validate created SME user details on modal after clicking on view row level action
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    Then I softly see "Full Name" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Email" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Invited By" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Status" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Sponsoring Agency" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I click "Send" button in modal
    And I wait for "2" seconds
    #34836 #monu
    Then I see the text "Email Sent Successfully" in modal
    #34831 #monu
    And I wait for "2" seconds
    When I click modal button "Close"
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    Then I softly see value "Invitation Sent" for title "Status" inside table "---grantor_tableId:-:PotentialReviewerContactTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Contact} Contact" inside table
    Then I see field "Type" as "Reviewers" on modal
    Then I see field "Status" as "Invitation Sent" on modal
    Then I softly see the text containing :
      | Overview    |
      | Attachments |

  @35013 @VerifyCreatedSMEUserAtActivePartneruser-SMEReviewerRegistration @smoke  @wip
  Scenario: Validate created SME user should get reflected at salesforce page inside Active Partnet usersall expected fields are getting populated on page of Registration Step 1 of 1 while SME reviewer registration
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I click modal button "Send"
    And I refresh the page
    And I pause execution for "62" seconds
    And I navigate to yopmail portal for "smereviewer@yopmail.com"
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Step 1 of 1" in the page details
    And I enter "OrgProfileCompleteDetail" values from "UserRegistration_Field_Values.xlsx"

  @33847 @VerifyInternalSubricepientAndSMEReviewerContact
  Scenario: Validate user is able to see all expected contacts
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I perform quick search for "Automation PM" in "{grantor_tableId:InternalContactsTableId}" panel
    Then I softly see value "Automation PM" for title "Name" inside table "{grantor_tableId:InternalContactsTableId}"
    When I navigate to "{grantor_sidebar:SubrecipientsLink}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---home:-:subrecipientContactTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Name" inside table "---home:-:subrecipientContactTableId---"
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "Automation SME" in "ActiveAccountReviewer" panel
    Then I softly see value "Automation SME" for title "Name" inside table "ActiveAccountReviewer"

  @33837 @VerifySystemDisplayAllRelatedTasks
  Scenario: Validate user is able to see all expected contacts
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:PendingTaskLink}" content inside "{grantor_sidebar:MyTasksLinkName}" subheader on left panel
    Then I softly see "Pending Tasks (Assigned To Me)" page block displayed
    Then I softly see "Pending Tasks (Assigned By Me)" page block displayed
    And I perform quick search for "In Progress" in "---grantor_tableId:-:PendingTaskAssignedToMeTableId---" panel
    Then I softly see value "In Progress" for title "Status" inside table "---grantor_tableId:-:PendingTaskAssignedToMeTableId---"
    And I perform quick search for "Not Started" in "---grantor_tableId:-:PendingTaskAssignedToMeTableId---" panel
    Then I softly see value "Not Started" for title "Status" inside table "---grantor_tableId:-:PendingTaskAssignedToMeTableId---"
    When I navigate to "{grantor_sidebar:CompletedTaskLink}" content inside "{grantor_sidebar:MyTasksLinkName}" subheader on left panel
    Then I softly see "Completed Tasks (Assigned To Me)" page block displayed
    Then I softly see "Completed Tasks (Assigned By Me)" page block displayed
    Then I softly see value "Completed" for title "Status" inside table "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---"

  @94345 @validatingEmailNotificationForSMEReviewer
  Scenario: To verify Email notification should be received to SME contact after sending invitation by internal  user
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I click "Send" button in modal
    And I wait for "2" seconds
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "200" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: You have been Invited to Register in theEnterprise Grants Management System (EGMS)
      """

  @35012 @VerifySMEReviewerDetailPage-SMEReviewerRegistration @wip @smoke   @onhold
  Scenario: Validate all details of created Sme Reviewer
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I wait for "6" seconds
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"