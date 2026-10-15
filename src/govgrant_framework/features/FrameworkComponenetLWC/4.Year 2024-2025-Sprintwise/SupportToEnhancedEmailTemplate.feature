@Sprint-2025 @Emailtemplatelwc @US-543578 @SupportToEnhancedEmailTemplate
Feature: The user must create an Email Template at the LWC Object level.
  After creating the template, the user needs to specify the template name in the Action URL (Long) field within the LWC configuration.

  @547284
  Scenario: LWC: Send Invitation: Admin: To verify that as a user, I can be able to create email template from LWC object level.
    When I login to "App Launcher" app as "Admin" user
    And I click on "Email Templates"
    And I click on "New Email Template"
    And I enter "Automation Runtime" into the field label "Email Template Name"
    And I select in dropdown "Agreement Type" into the field label "Related Entity Type"
    And I enter "email template Runtime" into the field label "Subject"
    And I select in dropdown "Public Email Templates" into the field label "Folder"
    And I click modal button "Save"
    And I pause execution for "2" seconds

  @547798
  Scenario: LWC: Send Invitation: Admin: To verify that as a user, I should be able to select an LWC email template type.
    Given I login to "As a Grantor" app as "EXE" user
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

  @547799
  Scenario: LWC: Send Invitation: Admin: To verify that as a user, I should be able to select an LWC email template name.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                               | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:DefaultAutomationEmailTemplate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AutomationEmailTemplate | Reviewers          | Name                      | Send Invitation            |
    Given I login to "As a Grantor" app as "EXE" user
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
    Then I softly see the text containing "Notification: Program has been Created and Waiting for Your Approval"
    Then I softly see the text containing "This email is to notify you that Automation email template"
    Then I softly see the text containing "Please do not reply to this system-generated email. You may contact the GovGrants Support Team at"
    Then I softly see the text containing "Thank you."
    Then I softly see the text containing "The EGMS Team"

  @547800 @547802
  Scenario: LWC: Send Invitation: Admin: To verify that as a user, I should be able to send an Invitation with a lightning email template.
  |LWC: Send Invitation: Admin: To Verify that as a user, I can be able to see "Email Sent Successfully" Message after Sending an Invitation|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                        | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:DefaultAutomationEmailTemplate | ApiGeneratedId:0 |
   #547800
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AutomationEmailTemplate | Reviewers          | Name                      | Send Invitation            |
    Given I login to "As a Grantor" app as "EXE" user
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
    #547802
    Then I see the text "Email Sent Successfully." in modal

  @547801 @547809
  Scenario: LWC: Send Invitation: Admin: To Verify that as a User, I can be able to add attachments under LWC email Template.
  |LWC: Send Invitation: PM: To Verify that as a User, I can be able to add attachments under LWC email Template.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                               | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:DefaultAutomationEmailTemplate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AutomationEmailTemplate | Reviewers          | Name                      | Send Invitation            |
    Given I login to "As a Grantor" app as "EXE" user
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
    When I upload attachment "SendEmailAttachment.pdf" in Send Email Modal
    And I click "Send" button in modal
    Then I see the text "SendEmailAttachment.pdf" in modal

  @547803 @547806 @547807 @547808 @547870 @547871
  Scenario: LWC: Send Invitation: Admin: To Verify that as a user, I can be able to see record status changes from “NEW” to “Invitation Sent” after sending an invitation
  | LWC: Send Invitation: Admin: To verify that as a user, I should be able to select an LWC email template type.|
  | LWC: Send Invitation: PM: To verify that as a user, I should be able to select an LWC email template type.|
  |LWC: Send Invitation: PM: To verify that as a user, I should be able to select an LWC email template name. |
  |LWC: Send Invitation: PM: To verify that as a user, I should be able to send an Invitation with a lightning email template.|
  |LWC: Send Invitation: Admin: To verify that clicking on the “Close” action closes the validation modal window.|
  |LWC: Send Invitation: PM: To verify that clicking on the “Close” action closes the validation modal window.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                               | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:DefaultAutomationEmailTemplate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AutomationEmailTemplate | Reviewers          | Name                      | Send Invitation            |
    Given I login to "As a Grantor" app as "EXE" user
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
   #547870
    When I close "Reviewers" modal by clicking the top right x button
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---home:-:reviewersTableId---" panel
    Then I softly see value "Invitation Sent" for title "Status" against the value "{SavedValue:Automation Runtime} Contact" inside table "---home:-:reviewersTableId---"

  @547858 @547859
  Scenario Outline: LWC: Send Invitation: Admin: To Verify that as a user can successfully create a new Potential Reviewer Contact using the “New” action and save the record.
  |LWC: Send Invitation: PM : To Verify that as a user can successfully create a new Potential Reviewer Contact using the “New” action and save the record.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                        | filterId         |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:DefaultAutomationEmailTemplate | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | govgrants_config:AutomationEmailTemplate | Reviewers          | Name                      | Send Invitation            |
    Given I login to "As a Grantor" app as "<users>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    Then I softly see field label "Prefix" inside page block
    Then I softly see field label "First Name" inside page block
    Then I softly see field label "Last Name" inside page block
    Then I softly see field label "Phone" inside page block
    Then I softly see field label "Email" inside page block
    Then I softly see field label "Affiliated Institution" inside page block
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---home:-:reviewersTableId---" panel
    Then I softly see value "Invitation Sent" for title "Status" against the value "{SavedValue:Automation Runtime} Contact" inside table "---home:-:reviewersTableId---"
    Examples:
      | users |
      | EXE   |
#      | Admin |

  @547864
  Scenario: LWC: Send Invitation: Admin: To verify that, as a user I can be able to “Download as PDF/CSV” functionality for Potential Reviewer Contact Table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue                               | filterId         |
      | Flex Table Action     | Action URL Long LWC       | govgrants_config:DefaultAutomationEmailTemplate | ApiGeneratedId:0 |
      | Flex Table            | Enable Export (XLS / CSV) | false                                           | ApiGeneratedId:1 |
      | Flex Table            | Enable Export (PDF)       | true                                            | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC       | govgrants_config:AutomationEmailTemplate | Reviewers          | Name                      | Send Invitation            |
      | Flex Table:General    | Enable Export (XLS / CSV) | true                                     | Reviewers          | Name                      |                            |
      | Flex Table:General    | Enable Export (PDF)       | true                                     | Reviewers          | Name                      |                            |
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on "Menu" button inside table id "---home:-:reviewersTableId---"
    Then I softly see "Download as PDF" button is displayed
    Then I softly see "Download as CSV" button is displayed

  @547866
  Scenario: LWC: Send Invitation: PM : To verify that, as a user I can be able to “Download as PDF/CSV” functionality for Potential Reviewer Contact Table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue                        | filterId         |
      | Flex Table Action     | Action URL Long LWC       | govgrants_config:DefaultAutomationEmailTemplate | ApiGeneratedId:0 |
      | Flex Table            | Enable Export (XLS / CSV) | false                                    | ApiGeneratedId:1 |
      | Flex Table            | Enable Export (PDF)       | true                                     | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC       | govgrants_config:AutomationEmailTemplate | Reviewers          | Name                      | Send Invitation            |
      | Flex Table:General    | Enable Export (XLS / CSV) | true                                     | Reviewers          | Name                      |                            |
      | Flex Table:General    | Enable Export (PDF)       | true                                     | Reviewers          | Name                      |                            |
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    When I click on parallel menu button in flex table title "Potential Reviewer Contacts"
    And I select "Download as PDF" from parallel lines dropdown of "Potential Reviewer Contacts"
    And I wait for "3" seconds
    And I download the file
    And I wait for "3" seconds
    Then I softly see "{SavedValue:Automation Runtime} Contact" on page "1" of "govgrants" pdf file
