@US-FW-2195 @Supporttoselectemailtemplatedynamically. @SendEmailTemplate
Feature:  Support to select email template dynamically.
Business Need: to ensure that thLayout, Support to select email template dynamically.

  @FW-2196
  Scenario:LWC: Send Email : PM: To verify that When the user clicks on the “Send Email” action Then the send email modal should display email templates.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Then I softly see "Email Template" option on modal

  @FW-2641
  Scenario: LWC: Send Email : PM: To verify that user should be able to select specific email template from list.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    Then I softly see "Email Template" option on modal
    And I expand option "Email Templates" on modal
    Then I softly see "Public Email Templates" option on modal
    And I expand option "Public Email Templates" on modal
    Then I softly see "Automation" option on modal
    Then I softly see "Automation Email Template" option on modal
    And I pause execution for "4" seconds
    And I click radio button "Automation Email Template" in modal
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    Then I softly see value "Notification: Program  has been Created and Waiting for Your Approval" for field "Subject" on send email model
    Then I softly see value "Sender:" for field "Body Content" on send email model
    Then I softly see value "Sender Organization:" for field "Body Content" on send email model
    Then I softly see value "Internal Link to the record:" for field "Body Content" on send email model
    Then I softly see value "Recipient Link to the record:" for field "Body Content" on send email model
    Then I softly see value "This email is to notify you that Automation email template" for field "Body Content" on send email model

  @FW-2642
  Scenario: LWC: Send Email : PM: To verify that user can able to send email using selected Public or Private email template successfully.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    Then I softly see "Email Template" option on modal
    And I expand option "Email Templates" on modal
    Then I softly see "Public Email Templates" option on modal
    And I expand option "Public Email Templates" on modal
    Then I softly see "Automation" option on modal
    Then I softly see "Automation Email Template" option on modal
    And I pause execution for "4" seconds
    And I click radio button "Automation Email Template" in modal
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

  @FW-2643
  Scenario: LWC: Send Email : PM: To verify that When the user clicks on the “Reply” action Then the send email modal should not display email templates.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    Then I softly see "Email Template" option on modal
    And I expand option "Email Templates" on modal
    Then I softly see "Public Email Templates" option on modal
    And I expand option "Public Email Templates" on modal
    Then I softly see "Automation" option on modal
    Then I softly see "Automation Email Template" option on modal
    And I pause execution for "4" seconds
    And I click radio button "Automation Email Template" in modal
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly do not see "Email Template" option on modal

  @FW-2644
  Scenario: LWC: Send Email : Admin: To verify that When the user clicks on the “Send Email” action Then the send email modal should display email templates.
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Then I softly see "Email Template" option on modal

  @FW-2646
  Scenario: LWC: Send Email : Admin: To verify that user should be able to select specific email template from list.
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    Then I softly see "Email Template" option on modal
    And I expand option "Email Templates" on modal
    Then I softly see "Public Email Templates" option on modal
    And I expand option "Public Email Templates" on modal
    Then I softly see "Automation" option on modal
    Then I softly see "Automation Email Template" option on modal
    And I pause execution for "4" seconds
    And I click radio button "Automation Email Template" in modal
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    Then I softly see value "Notification: Program  has been Created and Waiting for Your Approval" for field "Subject" on send email model
    Then I softly see value "Sender:" for field "Body Content" on send email model
    Then I softly see value "Sender Organization:" for field "Body Content" on send email model
    Then I softly see value "Internal Link to the record:" for field "Body Content" on send email model
    Then I softly see value "Recipient Link to the record:" for field "Body Content" on send email model
    Then I softly see value "This email is to notify you that Automation email template" for field "Body Content" on send email model

  @FW-2647
  Scenario: LWC: Send Email : Admin: To verify that user can able to send email using selected Public or Private email template successfully.
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    Then I softly see "Email Template" option on modal
    And I expand option "Email Templates" on modal
    Then I softly see "Public Email Templates" option on modal
    And I expand option "Public Email Templates" on modal
    Then I softly see "Automation" option on modal
    Then I softly see "Automation Email Template" option on modal
    And I pause execution for "4" seconds
    And I click radio button "Automation Email Template" in modal
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

  @FW-2648
  Scenario: LWC: Send Email : Admin: To verify that When the user clicks on the “Reply” action Then the send email modal should not display email templates.
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    Then I softly see "Email Template" option on modal
    And I expand option "Email Templates" on modal
    Then I softly see "Public Email Templates" option on modal
    And I expand option "Public Email Templates" on modal
    Then I softly see "Automation" option on modal
    Then I softly see "Automation Email Template" option on modal
    And I pause execution for "4" seconds
    And I click radio button "Automation Email Template" in modal
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly do not see "Email Template" option on modal
