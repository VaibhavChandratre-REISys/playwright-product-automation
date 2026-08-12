@smeRegistration @smeReviewerRegistration @userRegistration @parallel-regression @regression
Feature: Validate all scenarios for SME Registration

  @34834 @34836 @34831 @VerifyCreatedSMEUserDetails-SMEReviewerRegistration @smoke
  Scenario: Validate created SME user details on modal after clicking on view row level action
    Given I login to "Grantor" app as "PM" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I wait for "3" seconds
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter in modal value "{SavedValue:uniqueEmailID1}" into field "Email"
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
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    Then I softly see value "Invitation Sent" for title "Status" inside table "---grantor_tableId:-:PotentialReviewerContactTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Contact} Contact" inside table
    Then I see field "Type" as "Reviewers" on modal
    Then I see field "Status" as "Invitation Sent" on modal
    Then I softly see the text containing :
      | Overview |
      | Files    |

  @33847 @VerifyInternalSubricepientAndSMEReviewerContact
  Scenario: Validate user is able to see all expected contacts
    Given I login to "Grantor" app as "PM" user
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
    Given I login to "Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:PendingTaskLink}" content inside "{grantor_sidebar:MyTasksLinkName}" subheader on left panel
    And I wait for "2" seconds
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

  @35012 @VerifySMEReviewerDetailPage-SMEReviewerRegistration @wip @smoke   @onhold
  Scenario: Validate all details of created Sme Reviewer
    Given I login to "Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter in modal value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I wait for "6" seconds
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"