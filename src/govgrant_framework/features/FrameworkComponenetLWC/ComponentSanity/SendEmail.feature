@SendEmail @ComponentSanity @ComponentSanity3
Feature: Send Email Scenarios
Business Need: to ensure that the Send Email of our web pages meets the needs of different user roles: admin, internal users, and external users.

#Email
  @509845 @SendEmail
  Scenario: 3.0- Send Email- SPI- To verify that Attachments field functions correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Then I see the text "Collective max size of attached files should be 25MB. Single file size attachment limit is upto 1.5MB. Do not attach more than 10 Files." in modal
    And I wait for "3" seconds
    And I hover mouse on text "Attachments" inside Send Email Modal
    Then I softly see help text "File Attachment" is displayed related field "Attachments" inside Send Email
    And I wait for "3" seconds
    When I upload attachment "Xpath CheatSheet(1.8MB).pdf" in Send Email Modal
    Then I softly see "Single File Size Limit is Exceeded" error massage in attachment section
    When I upload attachment "dummy_1533kb.pdf" in Send Email Modal
    When I click on cross icon at "dummy_1533kb.pdf" attachment inside send email modal
    Then I see attached file "dummy_1533kb.pdf" is deleted successfully inside send email modal
    And I wait for "3" seconds
    When I upload attachment "Attachment.pdf" in Send Email Modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    Then I softly see "File with this name already exist." error massage in attachment section
    When I click on cross icon at "Attachment.pdf" attachment inside send email modal
    Then I see attached file "Attachment.pdf" is deleted successfully inside send email modal
    And I wait for "3" seconds
    When I upload attachment "SendEmailAttachment.pdf" in Send Email Modal
    When I upload attachment "DuplicateFile.txt" in Send Email Modal
    When I upload attachment "TestFileSharing.docx" in Send Email Modal
    When I upload attachment "TestAutomationFile.pptx" in Send Email Modal
    When I upload attachment "SendEmailMP4File.mp4" in Send Email Modal
    When I upload attachment "SharingAtCollabTest.png" in Send Email Modal
    When I upload attachment "actionsAtEgrid.png" in Send Email Modal
    When I upload attachment "actionsAtAttachment.png" in Send Email Modal
    When I upload attachment "actionsAtEnhancedDataTable.png" in Send Email Modal
    When I upload attachment "actionsAtMeGridTable.png" in Send Email Modal
    When I upload attachment "captureModalFields.png" in Send Email Modal
    Then I softly see "Do not attach more than 10 Files, Attachment limit is Exceeded." error massage in attachment section

  @509846
  Scenario: 3.0- Send Email- SPI- To verify that Reset Action Working Correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I pause execution for "5" seconds
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    When I click on "Reset" button in send email modal
    And I wait for "3" seconds
    Then I enter value "Test automation mail" into field "Subject" on send email modal

  @509849 @SendEmail
  Scenario: 3.0- Send Email- SPI- To verify that Send Action Working Correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I get current URL
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see the following messages in the page details contains:
      | Please add subject     |
      | Please add a recipient |
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I enter value "dilip.hatagale@reisystems.in" into field "{testData:CcField}" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see the following messages in the page details contains:
      | Please add a recipient |
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "dilip.hatagale@reisystems.in" into field "{testData:ToField}" on send email modal
    And I wait for "35" seconds
    Then I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    Then I softly see value "Test automation mail" for title "Subject" inside table "---program:-:communicationHistoryTableId---"

  @506116 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To verify that Send Email functionality should work as expected from Send email action to Close action ( Positive Flow)
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "Sarah PM" with iconName "User" into field on send email modal
    Then I click on "{testData:CcField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:CcField}" on send email modal
    And I select value "Sarah PM" with iconName "User" into field on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I see "Email Sent Successfully." message is displayed on Send Email Modal
    When I wait for "3" seconds
    And I click modal button "Close"
    When I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see the following messages in the page details contains:
      | Please add subject     |
      | Please add a recipient |

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @509850 @SendEmail
  Scenario: 3.0- Send Email- SPI- To verify that after send mail Recorded added in FLEX TABLE Functioning correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "3" seconds
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    Then I enter value "nikita.sontakke@reisystems.in" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I wait for "3" seconds
    When I click modal button "Close"
    When I perform quick search for "Test automation mail subject 1" in "---program:-:communicationHistoryTableId---" panel
    And I wait for "3" seconds
    When I click on button "resetIcon" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see the following message in the page details :
      | Table has been reset. |
    Then I see Advance Filter box is displayed inside table id "---program:-:communicationHistoryTableId---" in flex table
    When I click on advance filter of table id "---program:-:communicationHistoryTableId---" for LWC
    And I enter advance filter values inside id "---program:-:communicationHistoryTableId---" for LWC
      | To Address | contains | nikita.sontakke@reisystems.in |
    When I click on advance filter of table id "---program:-:communicationHistoryTableId---" for LWC
    And I wait for "3" seconds
    When I click on "Menu" button inside table id "---program:-:communicationHistoryTableId---"
    Then I softly see "Refresh" button is displayed
    And I click on "Refresh" in the page details
    Then I see table is refreshing
    And I click on "Menu" button inside table id "---program:-:communicationHistoryTableId---"
    Then I softly see "Refresh" button is displayed
    Then I softly see "Download as PDF" button is displayed
    When I click on "Download as PDF" in the page details
    Then I softly see new tab is opened
    And I switch to parent tab
    When I perform quick search for "Test automation mail subject 1" in "---program:-:communicationHistoryTableId---" panel
    When I click on "View" icon for "Test automation mail subject 1" inside table
    And I wait for "3" seconds
    Then I softly see "Send Email" opens in overLay window
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I wait for "3" seconds
    And I click modal button "Close"
    Then I softly see "Messages" page block displayed

  @506119 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To Verify that when dropdown of the 'To' field is clicked, then dropdown values are displayed and can be selected
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Automation PM" into field "{testData:ToField}" on send email modal
    When I select value "pm.automation@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    And I hover mouse on text "To" inside Send Email Modal
    Then I softly see help text "Please enter To email address - Use semicolon(;) to separate manual email addresses" is displayed related field "To" inside Send Email
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM" into field "{testData:ToField}" on send email modal
    And I select value "pm.automation@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    And I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Groups"
    When I enter value "Internal group" into field "{testData:ToField}" on send email modal
    When I select value "Internal group" with iconName "User" into field on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "None"
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    Then I softly see "Messages" page block displayed

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506124 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To Verify that the 'Send Copy (Cc) to Me' function works correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    When I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Then I see the text "Send Copy (Cc) to Me" in modal
    And I click on checkbox for field "Send Copy (Cc) to Me"
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see "Email Sent Successfully." message is displayed on Send Email Modal
    Then I softly see value "pm.automation@yopmail.com" for field "Cc" on send email model
    When I click modal button "Close"
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Then I softly see field "Send Copy (Cc) to Me" inside page block
    And I hover mouse on text "Send Copy (Cc) to Me" inside Send Email Modal
#    Then I see help text "Enable this checkbox to include yourself in Cc" is displayed related field "Send Copy (Cc) to Me" inside Send Email
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see "Email Sent Successfully." message is displayed on Send Email Modal
    Then I softly cannot see value "pm.automation@yopmail.com" for field "Cc" on send email model

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506128 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To verify that Attachments field functions correctly
    When I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    When I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Then I see the text "Collective max size of attached files should be 25MB. Single file size attachment limit is upto 1.5MB. Do not attach more than 10 Files." in modal
    And I hover mouse on text "Attachments" inside Send Email Modal
    Then I softly see help text "File Attachment" is displayed related field "Attachments" inside Send Email
    And I wait for "3" seconds
    When I upload attachment "Xpath CheatSheet(1.8MB).pdf" in Send Email Modal
    Then I softly see "Single File Size Limit is Exceeded" error massage in attachment section
    And I wait for "3" seconds
    When I upload attachment "dummy_1533kb.pdf" in Send Email Modal
    When I click on cross icon at "dummy_1533kb.pdf" attachment inside send email modal
    Then I see attached file "dummy_1533kb.pdf" is deleted successfully inside send email modal
    And I wait for "3" seconds
    When I upload attachment "Attachment.pdf" in Send Email Modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    Then I softly see "File with this name already exist." error massage in attachment section
    And I wait for "3" seconds
    When I click on cross icon at "Attachment.pdf" attachment inside send email modal
    Then I see attached file "Attachment.pdf" is deleted successfully inside send email modal
    And I wait for "3" seconds
    When I upload attachment "SendEmailAttachment.pdf" in Send Email Modal
    When I upload attachment "DuplicateFile.txt" in Send Email Modal
    When I upload attachment "TestFileSharing.docx" in Send Email Modal
    When I upload attachment "TestAutomationFile.pptx" in Send Email Modal
    When I upload attachment "SendEmailMP4File.mp4" in Send Email Modal
    When I upload attachment "SharingAtCollabTest.png" in Send Email Modal
    When I upload attachment "actionsAtEgrid.png" in Send Email Modal
    When I upload attachment "actionsAtAttachment.png" in Send Email Modal
    When I upload attachment "actionsAtEnhancedDataTable.png" in Send Email Modal
    When I upload attachment "actionsAtMeGridTable.png" in Send Email Modal
    When I upload attachment "captureModalFields.png" in Send Email Modal
    Then I softly see "Do not attach more than 10 Files, Attachment limit is Exceeded." error massage in attachment section

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506129 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To verify that Reset Action Working Correctly
    When I login to "As a Grantor" app as "<Users>" user
#    And I navigate to "Planning" tab
#    And I pause execution for "1" seconds
#    When I click toggle button to select "Internal Programs - Draft"
#    When I click on top right button "New" in flex table with id "{program:programsTableId}"
#    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
#    When I click on "Save and Continue" in the page details
#    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
#    And I click on "Save" in the page details
    
    And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eO1mIAE/view"
    
    And I navigate to "Messages" sub tab
#    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "External"
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Sarah PM" into field "{testData:toField}" on send email modal
    And I select value "Sarah PM" with iconName "User" into field on send email modal
    When I enter value "Sarah PM" into field "{testData:ccField}" on send email modal
    And I select value "Sarah PM" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    When I click on "Reset" button in send email modal
    And I wait for "3" seconds
    And I click on "Reset" button in send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "Please add subject" in modal
    And I click modal button "Close"
    Then I softly see "Messages" page block displayed

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @509842 @SendEmail
  Scenario: 3.0- Send Email- SPI- To Verify that the 'Subject' field functions correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    When I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "3" seconds
    When I hover mouse on text "Subject" inside Send Email Modal
    And I wait for "3" seconds
    Then I softly see help text "Please enter subject" is displayed related field "Subject" inside Send Email
    And I enter value "Test automation mail" into field "Subject" on send email modal

  @509841 @SendEmail
  Scenario: 3.0- Send Email- SPI- To Verify that the 'Send Copy (Cc) to Me' function works correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    When I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    Then I see the text "Send Copy (Cc) to Me" in modal
    And I click on checkbox for field "Send Copy (Cc) to Me"
    And I wait for "3" seconds
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I wait for "3" seconds
    And I hover mouse on text "Send Copy (Cc) to Me" inside Send Email Modal
    Then I softly see help text "Enable this checkbox to include Yourself in Cc" is displayed related field "Send Copy (Cc) to Me" inside Send Email
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    Then I softly see value "automationspi31@yopmail.com" for field "Cc" on send email model
    And I wait for "10" seconds
    When I click modal button "Close"
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "3" seconds
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    Then I see the text "Send Copy (Cc) to Me" in modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I wait for "3" seconds
    And I hover mouse on text "Send Copy (Cc) to Me" inside Send Email Modal
    Then I softly see help text "Enable this checkbox to include Yourself in Cc" is displayed related field "Send Copy (Cc) to Me" inside Send Email
    And I pause execution for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    Then I softly cannot see value "automationspi31@yopmail.com" for field "Cc" on send email model

  @509839 @SendEmail
  Scenario: 3.0- Send Email- SPI- To verify that Send Email functionality should work as expected from Send email action to Close action (Positive Flow)
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I see "Email Sent Successfully." message is displayed on Send Email Modal
    When I wait for "3" seconds
    And I click modal button "Close"
    When I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see the following messages in the page details contains:
      | Please add subject     |
      | Please add a recipient |

  @506135 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To verify that Internal & External picklist can be selected at a time in (TO & CC) field
    When I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Automation PM1" into field "{testData:ToField}" on send email modal
    When I select value "Automation PM1" with iconName "User" into field on send email modal
    When I enter value "pm1.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "External"
    When I enter value "Automation ADMIN" into field "{testData:CcField}" on send email modal
    When I select value "Automation ADMIN" with iconName "User" into field on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    When I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506134 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To verify that None select in search by picklist then Function correctly
    When I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    When I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "None"
    When I enter value "Automation PM" into field "{testData:ToField}" on send email modal
    Then I softly do not see user suggestion box displayed at send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

    Examples:
      | Users |
      | PM    |
#      | Admin |


  @506133 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To verify that Search by Group picklist should show Group users only
    When I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    When I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "Groups"
    When I enter value "Internal group" into field "{testData:ToField}" on send email modal
    And I select value "Internal group" with iconName "User" into field on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

    Examples:
      | Users |
      | PM    |
#      | Admin |
  @506132 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To verify that Search by External picklist should show External users only
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    And I click on "{testData:CcField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I see the text "Email Sent Successfully" in modal

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506136 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To verify that after send mail Record added in FLEX TABLE Functioning correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    When I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "3" seconds
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation FO" into field "{testData:ToField}" on send email modal
    When I select value "fo.automation@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I see the text "Email Sent Successfully" in modal
    And I wait for "3" seconds
    When I click modal button "Close"
    When I perform quick search for "Test automation mail subject 1" in "---program:-:communicationHistoryTableId---" panel
    And I wait for "3" seconds
    And I click on button "resetIcon" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see the following message in the page details :
      | Table has been reset. |
    Then I see Advance Filter box is displayed inside table id "---program:-:communicationHistoryTableId---" in flex table
    And I click on advance filter of table id "---program:-:communicationHistoryTableId---" for LWC
    When I enter advance filter values inside id "---program:-:communicationHistoryTableId---" for LWC
      | Subject | contains | Test automation mail subject 1 |
    When I wait for "3" seconds
    And I click on advance filter of table id "---program:-:communicationHistoryTableId---" for LWC
    And I click on "Menu" button inside table id "---program:-:communicationHistoryTableId---"
    When I softly see "Refresh" button is displayed
    And I click on "Refresh" in the page details
    Then I see table is refreshing
    And I click on "Menu" button inside table id "---program:-:communicationHistoryTableId---"
    Then I softly see "Refresh" button is displayed
    Then I softly see "Download as PDF" button is displayed
    And I click on "Download as PDF" in the page details
    Then I softly see new tab is opened
    And I switch to parent tab
    When I perform quick search for "Test automation mail subject 1" in "---program:-:communicationHistoryTableId---" panel
    When I click on "View" icon for "Test automation mail subject 1" inside table
    And I wait for "3" seconds
    Then I softly see "Send Email" opens in overLay window
    And I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I wait for "3" seconds
    And I click modal button "Close"
    Then I softly see "Messages" page block displayed

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506131 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To verify that Search by Internal picklist should show Internal users only
    When I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    When I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM" into field "{testData:ToField}" on send email modal
    And I select value "pm.automation@yopmail.com" with iconName "User" into field on send email modal
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM" into field "{testData:CcField}" on send email modal
    And I select value "pm.automation@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I see the text "Email Sent Successfully" in modal
    Examples:
      | Users |
      | PM    |
#      | Admin |

  @509840 @SendEmail
  Scenario: 3.0- Send Email- SPI- To Verify that user is able to enter 'To' & 'CC' field Email ID
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I hover mouse on text "To" inside Send Email Modal
    Then I softly see help text "Please enter To email address - Use semicolon(;) to separate manual email addresses" is displayed related field "To" inside Send Email
    And I wait for "3" seconds
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I hover mouse on text "Cc" inside Send Email Modal
    Then I softly see help text "Please enter Cc email address - Use semicolon(;) to separate manual email addresses" is displayed related field "Cc" inside Send Email
    And I wait for "3" seconds
    When I enter value "pm.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal

  @506130 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To verify that Send Action Working Correctly
    When I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    When I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I see the text "Please add subject" in modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I see the text "Please add a recipient" in modal
    When I enter value "pm.automationyopmail.com" into field "{testData:ToField}" on send email modal
    Then I see the text "Please add a recipient" in modal
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation FO" into field "{testData:ToField}" on send email modal
    When I select value "fo.automation@yopmail.com" with iconName "User" into field on send email modal
    And I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation FO" into field "{testData:CcField}" on send email modal
    When I select value "fo.automation@yopmail.com" with iconName "User" into field on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "Email Sent Successfully" in modal
    And I wait for "3" seconds
    And I click modal button "Close"
    When I perform quick search for "Test automation mail" in "---program:-:communicationHistoryTableId---" panel
    And I click on "View" icon for "Test automation mail" inside table
    Then I softly see "Send Email" opens in overLay window
    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506121 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To Verify that when dropdown of the 'CC' field is clicked, then dropdown values are displayed and can be selected
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    When I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    And I hover mouse on text "Cc" inside Send Email Modal
    Then I softly see help text "Please enter To email address - Use semicolon(;) to separate manual email addresses" is displayed related field "Cc" inside Send Email
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "External"
    When I enter value "Automation FO" into field "{testData:CcField}" on send email modal
    When I select value "fo.automation@yopmail.com" with iconName "User" into field on send email modal
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:CcField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation EXE" into field "{testData:CcField}" on send email modal
    When I select value "exe.automation@yopmail.com" with iconName "User" into field on send email modal
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM" into field "{testData:ToField}" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "Groups"
    When I enter value "Internal group" into field "{testData:CcField}" on send email modal
    When I select value "Internal group" with iconName "User" into field on send email modal
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "Groups"
    When I enter value "Internal group" into field "{testData:ToField}" on send email modal
    When I select value "Internal group" with iconName "User" into field on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "None"
    When I enter value "exe.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "None"
    When I enter value "exe.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506125 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To Verify that the 'Subject' field functions correctly
    When I login to "As a Grantor" app as "<Users>" user
    When I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    When I enter value "pm.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I hover mouse on text "Subject" inside Send Email Modal
    Then I softly see help text "Please enter subject" is displayed related field "Subject" inside Send Email
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "35" seconds
    Then I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    Then I softly see value "Test automation mail" for title "Subject" inside table "---program:-:communicationHistoryTableId---"


    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506127 @SendEmail @needmanuallycheck
  Scenario Outline:  3.0- Send Email- Admin/PM- To verify that all features of Body content field functions correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM1" into field "{testData:CcField}" on send email modal
    When I select value "Automation PM1" with iconName "User" into field on send email modal
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM1" into field "{testData:ToField}" on send email modal
    When I select value "Automation PM1" with iconName "User" into field on send email modal
    And I hover mouse on text "Body Content" inside Send Email Modal
    Then I softly see help text "Enter email content here" is displayed related field "Body Content" inside Send Email
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I click dropdown value as "Salesforce Sans" inside body content
    And I select dropdown value as font style "Courier" inside body content
    When I click dropdown value as "Courier" inside body content
    And I select dropdown value as font style "Salesforce Sans" inside body content
    When I click dropdown value as "Salesforce Sans" inside body content
    And I select dropdown value as font style "Arial" inside body content
    When I click dropdown value as "Arial" inside body content
    And I select dropdown value as font style "Verdana" inside body content
    When I click dropdown value as "Verdana" inside body content
    And I select dropdown value as font style "Tahoma" inside body content
    When I click dropdown value as "Tahoma" inside body content
    And I select dropdown value as font style "Garamond" inside body content
    When I click dropdown value as "Garamond" inside body content
    And I select dropdown value as font style "Times New Roman" inside body content
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Body Content" on send email modal
    And I wait for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "12" inside body content
    And I select dropdown value as font style "16" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Strikethrough" inside body content
    And I pause execution for "3" seconds
#    Then I see "Test automation mail" displayed in "Strikethrough" format inside CK editor
    When I click dropdown value as "Strikethrough" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Bold" inside body content
    And I pause execution for "3" seconds
#    Then I see "Test automation mail" displayed in "Bold" format inside CK editor
    When I click dropdown value as "Bold" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Italic" inside body content
    And I pause execution for "3" seconds
#    Then I see "Test automation mail" displayed in "Italic" format inside CK editor
    When I click dropdown value as "Italic" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Underline" inside body content
    And I wait for "3" seconds
  #  Then I see "Test automation mail" displayed in "Underline" format inside CK editor
    When I click dropdown value as "Underline" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Bulleted list" inside body content
    And I pause execution for "5" seconds
#    Then I see "Test automation mail" displayed in "Bulleted list" format inside CK editor
    When I click dropdown value as "Bulleted list" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Numbered list" inside body content
#    Then I see "Test automation mail" displayed in "Numbered list" format inside CK editor
    When I click dropdown value as "Numbered list" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Indent" inside body content
#    Then I see "Test automation mail" displayed in "Indent" format inside CK editor
    When I click dropdown value as "Indent" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Outdent" inside body content
#    Then I see "Test automation mail" displayed in "Outdent" format inside CK editor
    When I click dropdown value as "Outdent" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    Then I see "Test automation mail" displayed in "Left align text" format inside CK editor
    When I click dropdown value as "Left align text" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Center align text" inside body content
    Then I see "Test automation mail" displayed in "Center align text" format inside CK editor
    When I click dropdown value as "Center align text" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Right align text" inside body content
    Then I see "Test automation mail" displayed in "Right align text" format inside CK editor
    When I click dropdown value as "Right align text" inside body content
    And I wait for "3" seconds
    When I click dropdown value as "Link" inside body content
    When I enter value "Google" into field "Link Title" on send email modal
    When I enter value "https://www.google.com/" into field "Link URL" on send email modal
    And I click modal button "Save"
    When I click dropdown value as "Link" inside body content
    When I enter value "Google" into field "Link Title" on send email modal
    When I enter value "https://www.google.com/" into field "Link URL" on send email modal
    And I click modal button "Cancel"
    When I click dropdown value as "Image" inside body content
    When I upload attachment "green.png" in Send Email Modal
    When I click on cross icon at "green.png" attachment inside send email modal
    When I click dropdown value as "Remove formatting" inside body content
    When I upload attachment "1.2MB.png" in Send Email Modal
    Then I see the text "The image exceeded the maximum size of 1 MB." in modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @510871 @SendEmail @needmanuallycheck
  Scenario Outline: 3.0- Send Email- Admin/PM- To verify that load scenario for all fields Functioning correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM1" into field "{testData:CcField}" on send email modal
    When I select value "Automation PM1" with iconName "User" into field on send email modal
    When I upload attachment "SendEmailAttachment.pdf" in Send Email Modal
    When I upload attachment "DuplicateFile.txt" in Send Email Modal
    When I upload attachment "TestFileSharing.docx" in Send Email Modal
    When I upload attachment "TestAutomationFile.pptx" in Send Email Modal
    When I upload attachment "SendEmailMP4File.mp4" in Send Email Modal
    When I upload attachment "actionsAtEgrid.png" in Send Email Modal
    When I upload attachment "actionsAtAttachment.png" in Send Email Modal
    When I upload attachment "actionsAtEnhancedDataTable.png" in Send Email Modal
    When I upload attachment "actionsAtMeGridTable.png" in Send Email Modal
    When I upload attachment "captureModalFields.png" in Send Email Modal
    And I pause execution for "3" seconds
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com;testuser05@example.com;testuser06@example.com;testuser07@example.com;testuser08@example.com;testuser09@example.com;testuser10@example.com;testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "To Address: data value too large: testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com;testuser05@example.com;testuser06@example.com;testuser07@example.com;testuser08@example.com;testuser09@example.com;testuser10@example.com;testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com (max length=255)" in modal
    When I enter value "testuser01@example.com;testuser02@example.com;testuser103@example.com;testuser04@example.com;testuser05@example.com;testuser06@example.com;testuser107@example.com;testuser08@example.com;testuser09@example.com;testuser10@example.com;testuser101@example.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

    Examples:
      | Users |
#      | PM    |
      | Admin |

  @510879 @SendEmail
  Scenario Outline: 3.0- Send Email- Admin/PM- To verify that manual enter Email is Functioning correctly after click on Send
    When I login to "As a Grantor" app as "<Users>" user
    Then I navigate to "Planning" tab
    When I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "nikita.sontakke@reisystems.in" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

    Examples:
      | Users |
      | PM    |

  @510883 @SendEmail @needmanuallycheck
  Scenario: 3.0- Send Email- SPI- To verify that load scenario for all fields Functioning correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "{flexgrid:LTA32768}" into field "Body Content" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "Email body character limit is excceded" in modal
    And I click modal button "Close"
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "{flexgrid:char255}" into field "Body Content" on send email modal
    When I enter value "{flexgrid:char255}" into field "Subject" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "Please add valid subject" in modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I upload attachment "SendEmailAttachment.pdf" in Send Email Modal
    When I upload attachment "DuplicateFile.txt" in Send Email Modal
    When I upload attachment "TestFileSharing.docx" in Send Email Modal
    When I upload attachment "TestAutomationFile.pptx" in Send Email Modal
    When I upload attachment "SendEmailMP4File.mp4" in Send Email Modal
    When I upload attachment "SharingAtCollabTest.png" in Send Email Modal
    When I upload attachment "actionsAtEgrid.png" in Send Email Modal
    When I upload attachment "actionsAtAttachment.png" in Send Email Modal
    When I upload attachment "actionsAtEnhancedDataTable.png" in Send Email Modal
    When I upload attachment "actionsAtMeGridTable.png" in Send Email Modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    When I enter value "Demo test" into field "Subject" on send email modal
    When I enter value "testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com;testuser05@example.com;testuser06@example.com;testuser07@example.com;testuser08@example.com;testuser09@example.com;testuser10@example.com;testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "To Address: data value too large: testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com;testuser05@example.com;testuser06@example.com;testuser07@example.com;testuser08@example.com;testuser09@example.com;testuser10@example.com;testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com (max length=255)" in modal
    When I enter value "testuser01@example.com;testuser02@example.com;testuser103@example.com;testuser04@example.com;testuser05@example.com;testuser06@example.com;testuser107@example.com;testuser08@example.com;testuser09@example.com;testuser10@example.com;testuser101@example.com" into field "{testData:ToField}" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

  @510887 @SendEmail
  Scenario: 3.0- Send Email- SPI- To verify that manual enter Email is Functioning correctly after click on send
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

  @509844 @SendEmail @needmanuallycheck
  Scenario: 3.0- Send Email- SPI- To verify that all features of Body content field functions correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I hover mouse on text "Body Content" inside Send Email Modal
    Then I softly see help text "Enter email content here" is displayed related field "Body Content" inside Send Email
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Body Content" on send email modal
#    When I click dropdown value as "Salesforce Sans" inside body content
#    And I select dropdown value as font style "Courier" inside body content
#    When I click dropdown value as "Courier" inside body content
#    And I select dropdown value as font style "Salesforce Sans" inside body content
#    When I click dropdown value as "Salesforce Sans" inside body content
#    And I select dropdown value as font style "Arial" inside body content
#    When I click dropdown value as "Arial" inside body content
#    And I select dropdown value as font style "Verdana" inside body content
#    When I click dropdown value as "Verdana" inside body content
#    And I select dropdown value as font style "Tahoma" inside body content
#    When I click dropdown value as "Tahoma" inside body content
#    And I select dropdown value as font style "Garamond" inside body content
#    When I click dropdown value as "Garamond" inside body content
#    And I select dropdown value as font style "Times New Roman" inside body content
#    And I wait for "3" seconds
#    When I change formatting of all text to "Test automation mail" inside CK editor
#    When I click dropdown value as "12" inside body content
#    And I select dropdown value as font style "16" inside body content
#    When I change formatting of all text to "Test automation mail" inside CK editor
#    When I click dropdown value as "Strikethrough" inside body content
#    And I pause execution for "3" seconds
#    Then I see "Test automation mail" displayed in "Strikethrough" format inside CK editor
#    When I click dropdown value as "Strikethrough" inside body content
#    When I change formatting of all text to "Test automation mail" inside CK editor
#    When I click dropdown value as "Bold" inside body content
#    And I pause execution for "3" seconds
#    Then I see "Test automation mail" displayed in "Bold" format inside CK editor
#    When I click dropdown value as "Bold" inside body content
#    When I change formatting of all text to "Test automation mail" inside CK editor
#    When I click dropdown value as "Italic" inside body content
#    And I pause execution for "3" seconds
#    Then I see "Test automation mail" displayed in "Italic" format inside CK editor
#    When I click dropdown value as "Italic" inside body content
#    When I change formatting of all text to "Test automation mail" inside CK editor
#    When I click dropdown value as "Underline" inside body content
#    And I wait for "3" seconds
  #  Then I see "Test automation mail" displayed in "Underline" format inside CK editor
#    When I click dropdown value as "Underline" inside body content
#    When I change formatting of all text to "Test automation mail" inside CK editor
#    When I click dropdown value as "Bulleted list" inside body content
#    And I pause execution for "5" seconds
#    Then I see "Test automation mail" displayed in "Bulleted list" format inside CK editor
#    When I click dropdown value as "Bulleted list" inside body content
#    And I pause execution for "3" seconds
#    When I change formatting of all text to "Test automation mail" inside CK editor
#    When I click dropdown value as "Numbered list" inside body content
#    Then I see "Test automation mail" displayed in "Numbered list" format inside CK editor
#    When I click dropdown value as "Numbered list" inside body content
#    And I pause execution for "3" seconds
#    When I change formatting of all text to "Test automation mail" inside CK editor
#    When I click dropdown value as "Indent" inside body content
#    Then I see "Test automation mail" displayed in "Indent" format inside CK editor
#    When I click dropdown value as "Indent" inside body content
#    And I pause execution for "3" seconds
#    When I change formatting of all text to "Test automation mail" inside CK editor
#    When I click dropdown value as "Outdent" inside body content
#    Then I see "Test automation mail" displayed in "Outdent" format inside CK editor
#    When I click dropdown value as "Outdent" inside body content
#    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    Then I see "Test automation mail" displayed in "Left align text" format inside CK editor
    When I click dropdown value as "Left align text" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Center align text" inside body content
    Then I see "Test automation mail" displayed in "Center align text" format inside CK editor
    When I click dropdown value as "Center align text" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Right align text" inside body content
    Then I see "Test automation mail" displayed in "Right align text" format inside CK editor
    When I click dropdown value as "Right align text" inside body content
    And I wait for "3" seconds
    When I click dropdown value as "Link" inside body content
    When I enter value "Google" into field "Link Title" on send email modal
    When I enter value "https://www.google.com/" into field "Link URL" on send email modal
    And I click modal button "Save"
    When I click dropdown value as "Link" inside body content
    When I enter value "Google" into field "Link Title" on send email modal
    When I enter value "https://www.google.com/" into field "Link URL" on send email modal
    And I click modal button "Cancel"
    When I click dropdown value as "Image" inside body content
    When I upload attachment "green.png" in Send Email Modal
    When I click on cross icon at "green.png" attachment inside send email modal
    When I click dropdown value as "Remove formatting" inside body content
    When I upload attachment "1.2MB.png" in Send Email Modal
    Then I see the text "The image exceeded the maximum size of 1 MB." in modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal


    #reply email
  @506274 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that Reply Email functionality should work as expected from Reply email action to Close action ( Positive Flow)
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "nikita.sontakke@reisystems.in" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I click modal button "Close"
    Then I softly see "Messages" page block displayed

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506275 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To Verify that when dropdown of the 'To' field is clicked, then dropdown values are displayed and can be selected
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM" into field "{testData:ToField}" on send email modal
    When I select value "Automation PM" with iconName "User" into field on send email modal
    And I wait for "3" seconds
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on cross icon at "Remove Automation PM" send email reply model
    Then I softly see value "Automation PM" for field "To" on send email model
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM" into field "{testData:ToField}" on send email modal
    And I select value "pm.automation@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    And I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Groups"
    When I enter value "Internal group" into field "{testData:ToField}" on send email modal
    When I select value "Internal group" with iconName "User" into field on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I hover mouse on text "To" inside Send Email Modal
    Then I softly see help text "Please enter To email address - Use semicolon(;) to separate manual email addresses" is displayed related field "To" inside Send Email
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "None"
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    Then I softly see "Messages" page block displayed

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506276 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To Verify that when dropdown of the 'CC' field is clicked, then dropdown values are displayed and can be selected
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM1" into field "{testData:ToField}" on send email modal
    When I select value "Automation PM1" with iconName "User" into field on send email modal
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM" into field "{testData:CcField}" on send email modal
    When I select value "Automation PM" with iconName "User" into field on send email modal
    And I wait for "3" seconds
    When I enter value "Automation TC" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    And I click on "Reply" icon for "Automation TC" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on cross icon at "Remove Automation PM" send email reply model
    Then I softly see value "Automation PM" for field "Cc" on send email model
    When I enter value "pm.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I hover mouse on text "Cc" inside Send Email Modal
    Then I softly see help text "Please enter Cc email address - Use semicolon(;) to separate manual email addresses" is displayed related field "Cc" inside Send Email
    When I enter value "Automation TC" into field "Subject" on send email modal
    And I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    And I click on "{testData:CcField}" email Search By field and select dropdown value as "External"
    When I enter value "Automation FO" into field "{testData:CcField}" on send email modal
    When I select value "fo.automation@yopmail.com" with iconName "User" into field on send email modal
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Automation TC" inside flex table with id "---program:-:communicationHistoryTableId---"
    When I enter value "Automation TC" into field "Subject" on send email modal
    And I click on "{testData:CcField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:CcField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Reply" icon for "Automation TC" inside flex table with id "---program:-:communicationHistoryTableId---"
    When I enter value "Automation TC" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation EXE" into field "{testData:CcField}" on send email modal
    When I select value "exe.automation@yopmail.com" with iconName "User" into field on send email modal
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM" into field "{testData:ToField}" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Automation TC" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Automation TC" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "Groups"
    When I enter value "Internal group" into field "{testData:CcField}" on send email modal
    When I select value "Internal group" with iconName "User" into field on send email modal
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Groups"
    When I enter value "Internal group" into field "{testData:ToField}" on send email modal
    When I select value "Internal group" with iconName "User" into field on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Reply" icon for "Automation TC" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Automation TC" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "None"
    When I enter value "exe.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "None"
    When I enter value "exe.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506277 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To Verify that the 'Reply Copy (Cc) to Me' function works correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I see the text "Send Copy (Cc) to Me" in modal
    And I click on checkbox for field "Send Copy (Cc) to Me"
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    And I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see "Email Sent Successfully." message is displayed on Send Email Modal
    Then I softly see value "pm.automation@yopmail.com" for field "Cc" on send email model
    And I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Then I softly see field "Send Copy (Cc) to Me" inside page block
    And I hover mouse on text "Send Copy (Cc) to Me" inside Send Email Modal
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I see "Email Sent Successfully." message is displayed on Send Email Modal
    Then I softly cannot see value "pm.automation@yopmail.com" for field "Cc" on send email model

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506278 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To Verify that the 'Subject' field functions correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM" into field "{testData:ToField}" on send email modal
    When I select value "pm.automation@yopmail.com" with iconName "User" into field on send email modal
    And I hover mouse on text "Subject" inside Send Email Modal
    Then I softly see help text "Please enter subject" is displayed related field "Subject" inside Send Email
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    Then I softly see "Messages" page block displayed

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506279 @SendEmail @ReplyEmail @needmanuallycheck
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that all features of Body content field functions correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM1" into field "{testData:CcField}" on send email modal
    When I select value "Automation PM1" with iconName "User" into field on send email modal
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM1" into field "{testData:ToField}" on send email modal
    When I select value "Automation PM1" with iconName "User" into field on send email modal
    And I hover mouse on text "Body Content" inside Send Email Modal
    Then I softly see help text "Enter email content here" is displayed related field "Body Content" inside Send Email
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I click dropdown value as "Salesforce Sans" inside body content
    And I select dropdown value as font style "Courier" inside body content
    When I click dropdown value as "Courier" inside body content
    And I select dropdown value as font style "Salesforce Sans" inside body content
    When I click dropdown value as "Salesforce Sans" inside body content
    And I select dropdown value as font style "Arial" inside body content
    When I click dropdown value as "Arial" inside body content
    And I select dropdown value as font style "Verdana" inside body content
    When I click dropdown value as "Verdana" inside body content
    And I select dropdown value as font style "Tahoma" inside body content
    When I click dropdown value as "Tahoma" inside body content
    And I select dropdown value as font style "Garamond" inside body content
    When I click dropdown value as "Garamond" inside body content
    And I select dropdown value as font style "Times New Roman" inside body content
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Body Content" on send email modal
    And I wait for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "12" inside body content
    And I select dropdown value as font style "16" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Strikethrough" inside body content
    And I pause execution for "3" seconds
#    Then I see "Test automation mail" displayed in "Strikethrough" format inside CK editor
    When I click dropdown value as "Strikethrough" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Bold" inside body content
    And I pause execution for "3" seconds
#    Then I see "Test automation mail" displayed in "Bold" format inside CK editor
    When I click dropdown value as "Bold" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Italic" inside body content
    And I pause execution for "3" seconds
#    Then I see "Test automation mail" displayed in "Italic" format inside CK editor
    When I click dropdown value as "Italic" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Underline" inside body content
    And I wait for "3" seconds
  #  Then I see "Test automation mail" displayed in "Underline" format inside CK editor
    When I click dropdown value as "Underline" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Bulleted list" inside body content
    And I pause execution for "5" seconds
#    Then I see "Test automation mail" displayed in "Bulleted list" format inside CK editor
    When I click dropdown value as "Bulleted list" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Numbered list" inside body content
#    Then I see "Test automation mail" displayed in "Numbered list" format inside CK editor
    When I click dropdown value as "Numbered list" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Indent" inside body content
#    Then I see "Test automation mail" displayed in "Indent" format inside CK editor
    When I click dropdown value as "Indent" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Outdent" inside body content
#    Then I see "Test automation mail" displayed in "Outdent" format inside CK editor
    When I click dropdown value as "Outdent" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    Then I see "Test automation mail" displayed in "Left align text" format inside CK editor
    When I click dropdown value as "Left align text" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Center align text" inside body content
    Then I see "Test automation mail" displayed in "Center align text" format inside CK editor
    When I click dropdown value as "Center align text" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Right align text" inside body content
    Then I see "Test automation mail" displayed in "Right align text" format inside CK editor
    When I click dropdown value as "Right align text" inside body content
    And I wait for "3" seconds
    When I click dropdown value as "Link" inside body content
    When I enter value "Google" into field "Link Title" on send email modal
    When I enter value "https://www.google.com/" into field "Link URL" on send email modal
    And I click modal button "Save"
    When I click dropdown value as "Link" inside body content
    When I enter value "Google" into field "Link Title" on send email modal
    When I enter value "https://www.google.com/" into field "Link URL" on send email modal
    And I click modal button "Cancel"
    When I click dropdown value as "Image" inside body content
    When I upload attachment "green.png" in Send Email Modal
    When I click on cross icon at "green.png" attachment inside send email modal
    When I click dropdown value as "Remove formatting" inside body content
    When I upload attachment "1.2MB.png" in Send Email Modal
    Then I see the text "The image exceeded the maximum size of 1 MB." in modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506280 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that Attachments field functions correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Then I see the text "Collective max size of attached files should be 25MB. Single file size attachment limit is upto 1.5MB. Do not attach more than 10 Files." in modal
    And I hover mouse on text "Attachments" inside Send Email Modal
    Then I softly see help text "File Attachment" is displayed related field "Attachments" inside Send Email
    And I wait for "3" seconds
    When I upload attachment "Xpath CheatSheet(1.8MB).pdf" in Send Email Modal
    Then I softly see "Single File Size Limit is Exceeded" error massage in attachment section
    And I wait for "3" seconds
    When I upload attachment "dummy_1533kb.pdf" in Send Email Modal
    And I click on cross icon at "dummy_1533kb.pdf" attachment inside send email modal
    Then I see attached file "dummy_1533kb.pdf" is deleted successfully inside send email modal
    And I wait for "3" seconds
    When I upload attachment "Attachment.pdf" in Send Email Modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    Then I softly see "File with this name already exist." error massage in attachment section
    And I wait for "3" seconds
    When I click on cross icon at "Attachment.pdf" attachment inside send email modal
    Then I see attached file "Attachment.pdf" is deleted successfully inside send email modal
    And I wait for "3" seconds
    When I upload attachment "SendEmailAttachment.pdf" in Send Email Modal
    When I upload attachment "DuplicateFile.txt" in Send Email Modal
    When I upload attachment "TestFileSharing.docx" in Send Email Modal
    When I upload attachment "TestAutomationFile.pptx" in Send Email Modal
    When I upload attachment "SendEmailMP4File.mp4" in Send Email Modal
    When I upload attachment "SharingAtCollabTest.png" in Send Email Modal
    When I upload attachment "actionsAtEgrid.png" in Send Email Modal
    When I upload attachment "actionsAtAttachment.png" in Send Email Modal
    When I upload attachment "actionsAtEnhancedDataTable.png" in Send Email Modal
    When I upload attachment "actionsAtMeGridTable.png" in Send Email Modal
    When I upload attachment "captureModalFields.png" in Send Email Modal
    Then I softly see "Do not attach more than 10 Files, Attachment limit is Exceeded." error massage in attachment section

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506281 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that Reset Action Working Correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "External"
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "test.user1@example.com" into field "{testData:CcField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "External"
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "test.user1@example.com" into field "{testData:CcField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I wait for "3" seconds
    When I click on "Reset" button in send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "Please add subject" in modal
    And I click modal button "Close"
    Then I softly see "Messages" page block displayed

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506282 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that Send Action Working Correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "Sarah PM" with iconName "User" into field on send email modal
    And I click on "{testData:CcField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:CcField}" on send email modal
    And I select value "Sarah PM" with iconName "User" into field on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "" into field "Subject" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "Please add subject" in modal
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "Sarah PM" with iconName "User" into field on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I see "Email Sent Successfully." message is displayed on Send Email Modal
    And I wait for "3" seconds
    And I click modal button "Close"
    When I perform quick search for "Test automation mail" in "---program:-:communicationHistoryTableId---" panel
    And I click on "View" icon for "pm.automation@yopmail.com" inside table
    Then I softly see "Send Email" opens in overLay window

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506283 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that Search by Internal picklist should show Internal users only
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM" into field "{testData:ToField}" on send email modal
    When I select value "Automation PM" with iconName "User" into field on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM" into field "{testData:CcField}" on send email modal
    When I select value "Automation PM" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "Automation PM" into field "{testData:ToField}" on send email modal
    When I select value "pm.automation@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "Email Sent Successfully" in modal

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506284 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that Search by External picklist should show External users only
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "Sarah PM" with iconName "User" into field on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I see the text "Email Sent Successfully" in modal

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506285 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that Search by Group picklist should show Group users only
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "Groups"
    When I enter value "Internal group" into field "{testData:ToField}" on send email modal
    When I select value "Internal group" with iconName "User" into field on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506286 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that None select in search by picklist then Function correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "35" seconds
    Then I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "3" seconds
    Then I click on "{testData:ToField}" email Search By field and select dropdown value as "None"
    When I enter value "Automation PM" into field "{testData:ToField}" on send email modal
    Then I softly do not see user suggestion box displayed at send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506287 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that Internal & External picklist can be selected at a time in (TO & CC) field
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    And I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    When I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    And I wait for "3" seconds
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Automation PM1" into field "{testData:ToField}" on send email modal
    When I select value "Automation PM1" with iconName "User" into field on send email modal
    When I enter value "pm1.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I click on "{testData:CcField}" email Search By field and select dropdown value as "Internal"
    And I click on "{testData:CcField}" email Search By field and select dropdown value as "External"
    When I enter value "Automation ADMIN" into field "{testData:CcField}" on send email modal
    When I select value "Automation ADMIN" with iconName "User" into field on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506289 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that after Reply mail Recorded added in FLEX TABLE Functioning correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "3" seconds
    When I click on "{testData:ToField}" email Search By field and select dropdown value as "Internal"
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "Email Sent Successfully" in modal
    And I wait for "3" seconds
    When I click modal button "Close"
    When I perform quick search for "Test automation mail subject 1" in "---program:-:communicationHistoryTableId---" panel
    And I wait for "3" seconds
    When I click on button "resetIcon" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see the following message in the page details :
      | Table has been reset. |
    Then I see Advance Filter box is displayed inside table id "---program:-:communicationHistoryTableId---" in flex table
    And I click on advance filter of table id "---program:-:communicationHistoryTableId---" for LWC
    And I enter advance filter values inside id "---program:-:communicationHistoryTableId---" for LWC
      | Subject | contains | Test automation mail subject 1 |
    And I wait for "3" seconds
    And I click on advance filter of table id "---program:-:communicationHistoryTableId---" for LWC
    And I click on "Menu" button inside table id "---program:-:communicationHistoryTableId---"
    Then I softly see "Refresh" button is displayed
    And I click on "Refresh" in the page details
    Then I see table is refreshing
    And I click on "Menu" button inside table id "---program:-:communicationHistoryTableId---"
    Then I softly see "Refresh" button is displayed
    Then I softly see "Download as PDF" button is displayed
    When I click on "Download as PDF" in the page details
    Then I softly see new tab is opened
    And I switch to parent tab
    When I perform quick search for "Test automation mail subject 1" in "---program:-:communicationHistoryTableId---" panel
    And I click on "View" icon for "Test automation mail subject 1" inside table
    And I wait for "3" seconds
    Then I softly see "Send Email" opens in overLay window
    And I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I wait for "3" seconds
    And I click modal button "Close"
    Then I softly see "Messages" page block displayed

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @506290 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that after Reply mail form OUTLOOK Recorded added in FLEX TABLE Functioning correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    When I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    When I perform quick search for "Test automation mail subject 1" in "---program:-:communicationHistoryTableId---" panel
    When I click on "View" icon for "Test automation mail subject 1" inside table
    When I click modal button "Close"
    Then I softly see value "Test automation mail subject 1" for title "Email Subject" inside table "---program:-:communicationHistoryTableId---"
    Then I softly see value "RE: Test automation mail subject 1" for title "Email Subject" inside table "---program:-:communicationHistoryTableId---"
    Then I softly see "Subject" in flex table header "---program:-:communicationHistoryTableId---"
    Then I softly see "From Address" in flex table header "---program:-:communicationHistoryTableId---"
    Then I softly see "To Address" in flex table header "---program:-:communicationHistoryTableId---"
    Then I softly see "CC Address" in flex table header "---program:-:communicationHistoryTableId---"
    Then I softly see "Attention To" in flex table header "---program:-:communicationHistoryTableId---"
    Then I softly see "Email Subject" in flex table header "---program:-:communicationHistoryTableId---"
    Then I softly see "Preview" in flex table header "---program:-:communicationHistoryTableId---"

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @509962 @SendEmail @ReplyEmail
  Scenario: 3.0- Reply Email- SPI-To verify that Reset Action Working Correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    When I click on "Reset" button in send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "Please add subject" in modal

  @509964 @SendEmail @ReplyEmail
  Scenario: 3.0- Reply Email- SPI- To verify that Send Action Working Correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "" into field "Subject" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "Please add subject" in modal
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
#    And I wait for "3" seconds
#    When I enter value "" into field "{testData:ToField}" on send email modal
#    And I wait for "3" seconds
#       And I wait for "30" seconds
    When I click on "Send" button in send email modal
#    Then I see the text "Please add a recipient" in modal
    And I wait for "3" seconds
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see "Email Sent Successfully." message is displayed on Send Email Modal
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "3" seconds
    When I perform quick search for "Test automation mail" in "---program:-:communicationHistoryTableId---" panel
    Then I click on "View" icon for "pm.automation@yopmail.com" inside table

  @509966 @SendEmail @ReplyEmail
  Scenario: 3.0- Reply Email- SPI- To verify that after Reply mail Recorded added in FLEX TABLE Functioning correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I enter value "nikita.sontakke@reisystems.in" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I wait for "35" seconds
    Then I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I wait for "3" seconds
    Then I click modal button "Close"
    When I perform quick search for "Test automation mail" in "---program:-:communicationHistoryTableId---" panel
    And I wait for "3" seconds
    When I click on button "resetIcon" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see the following message in the page details :
      | Table has been reset. |
    Then I see Advance Filter box is displayed inside table id "---program:-:communicationHistoryTableId---" in flex table
    When I click on advance filter of table id "---program:-:communicationHistoryTableId---" for LWC
    Then I enter advance filter values inside id "---program:-:communicationHistoryTableId---" for LWC
      | To Address | contains | nikita.sontakke@reisystems.in |
    Then I click on advance filter of table id "---program:-:communicationHistoryTableId---" for LWC
    And I wait for "3" seconds
    When I click on "Menu" button inside table id "---program:-:communicationHistoryTableId---"
    Then I softly see "Refresh" button is displayed
    And I click on "Refresh" in the page details
    Then I see table is refreshing
    And I click on "Menu" button inside table id "---program:-:communicationHistoryTableId---"
    Then I softly see "Refresh" button is displayed
    Then I softly see "Download as PDF" button is displayed
    When I click on "Download as PDF" in the page details
    And I softly see new tab is opened
    And I switch to parent tab
    When I perform quick search for "Test automation mail" in "---program:-:communicationHistoryTableId---" panel
    When I click on "View" icon for "Test automation mail" inside table
    And I wait for "3" seconds
    Then I softly see "Send Email" opens in overLay window
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I wait for "3" seconds
    When I click modal button "Close"
    Then I softly see "Messages" page block displayed

  @510835 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that load scenario for all fields Functioning correctly
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Then I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    Then I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail" into field "Subject" on send email modal
#    When I enter value "{flexgrid:LTA32768}" into field "Body Content" on send email modal
    And I wait for "3" seconds
#       And I wait for "30" seconds
    When I click on "Send" button in send email modal
#    Then I see the text "Email body character limit is excceded" in modal
    When I enter value "testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com;testuser05@example.com;testuser06@example.com;testuser07@example.com;testuser08@example.com;testuser09@example.com;testuser10@example.com;testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com" into field "{testData:CcField}" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "CC Address: data value too large: testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com;testuser05@example.com;testuser06@example.com;testuser07@example.com;testuser08@example.com;testuser09@example.com;testuser10@example.com;testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com (max length=255)" in modal
    And I wait for "3" seconds
    When I enter value "testuser01@example.com;testuser02@example.com;testuser103@example.com;testuser04@example.com;testuser05@example.com;testuser06@example.com;testuser107@example.com;testuser08@example.com;testuser09@example.com;testuser10@example.com;testuser101@example.com" into field "{testData:CcField}" on send email modal
    And I wait for "3" seconds
    When I upload attachment "SendEmailAttachment.pdf" in Send Email Modal
    When I upload attachment "DuplicateFile.txt" in Send Email Modal
    When I upload attachment "TestFileSharing.docx" in Send Email Modal
    When I upload attachment "TestAutomationFile.pptx" in Send Email Modal
    When I upload attachment "SendEmailMP4File.mp4" in Send Email Modal
    When I upload attachment "actionsAtEgrid.png" in Send Email Modal
    When I upload attachment "actionsAtAttachment.png" in Send Email Modal
    When I upload attachment "actionsAtEnhancedDataTable.png" in Send Email Modal
    When I upload attachment "actionsAtMeGridTable.png" in Send Email Modal
    When I upload attachment "captureModalFields.png" in Send Email Modal
    And I pause execution for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @510844 @SendEmail @ReplyEmail
  Scenario Outline: 3.0- Reply Email- Admin/PM- To verify that manual enter Email is Functioning correctly after Click on Send
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Then I click on "{testData:ToField}" email Search By field and select dropdown value as "External"
    When I enter value "Sarah PM" into field "{testData:ToField}" on send email modal
    Then I select value "sarah.pm@yopmail.com" with iconName "User" into field on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "sarah.pm@yopmail.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I checkout to yopmail with mailid "sarah.pm@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Test automation mail
      """
    Examples:
      | Users |
      | PM    |
#      | Admin |

  @510849 @SendEmail @ReplyEmail
  Scenario: 3.0- Reply Email- SPI- To verify that load scenario for all fields Functioning correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "35" seconds
    Then I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "3" seconds
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "fo.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    When I enter value "{flexgrid:LTA32768}" into field "Body Content" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "Email body character limit is excceded" in modal
    And I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "{flexgrid:char255}" into field "Body Content" on send email modal
    When I enter value "{flexgrid:char255}" into field "Subject" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "Please add valid subject" in modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I upload attachment "SendEmailAttachment.pdf" in Send Email Modal
    When I upload attachment "DuplicateFile.txt" in Send Email Modal
    When I upload attachment "TestFileSharing.docx" in Send Email Modal
    When I upload attachment "TestAutomationFile.pptx" in Send Email Modal
    When I upload attachment "SendEmailMP4File.mp4" in Send Email Modal
    When I upload attachment "SharingAtCollabTest.png" in Send Email Modal
    When I upload attachment "actionsAtEgrid.png" in Send Email Modal
    When I upload attachment "actionsAtAttachment.png" in Send Email Modal
    When I upload attachment "actionsAtEnhancedDataTable.png" in Send Email Modal
    When I upload attachment "actionsAtMeGridTable.png" in Send Email Modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    When I enter value "Demo test" into field "Subject" on send email modal
    When I enter value "testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com;testuser05@example.com;testuser06@example.com;testuser07@example.com;testuser08@example.com;testuser09@example.com;testuser10@example.com;testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    Then I see the text "To Address: data value too large: testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com;testuser05@example.com;testuser06@example.com;testuser07@example.com;testuser08@example.com;testuser09@example.com;testuser10@example.com;testuser01@example.com;testuser02@example.com;testuser03@example.com;testuser04@example.com (max length=255)" in modal
    When I enter value "testuser01@example.com;testuser02@example.com;testuser103@example.com;testuser04@example.com;testuser05@example.com;testuser06@example.com;testuser107@example.com;testuser08@example.com;testuser09@example.com;testuser10@example.com;testuser101@example.com" into field "{testData:ToField}" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

  @510861 @SendEmail @ReplyEmail
  Scenario: 3.0- Reply Email- SPI- To verify that manual enter Email is Functioning correctly after click on send
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I click modal button "Close"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Test automation mail
      """


  @509954 @SendEmail @ReplyEmail
  Scenario: 3.0- Reply Email- SPI- To verify that Reply Email functionality should work as expected from Reply email action to Close action (Positive Flow)
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "35" seconds
    Then I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Then I enter value "Test automation mail" into field "Subject" on send email modal
    Then I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    Then I enter value "pm.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    Then I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "3" seconds
    Then I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Then I enter value "Test automation mail" into field "Subject" on send email modal


  @509955 @SendEmail @ReplyEmail
  Scenario: 3.0- Reply Email- SPI- To Verify that user is able to enter 'To' to 'Cc' field Email ID
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I pause execution for "3" seconds
    When I enter value "pm.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "3" seconds
    And I wait for "35" seconds
    Then I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail" into field "Subject" on send email modal
    Then I softly see value "pm.automation@yopmail.com" for field "To" on send email model
    When I enter value "" into field "{testData:ToField}" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I hover mouse on text "To" inside Send Email Modal
    Then I softly see help text "Please enter To email address - Use semicolon(;) to separate manual email addresses" is displayed related field "To" inside Send Email
    And I wait for "3" seconds
    Then I softly see value "pm.automation@yopmail.com" for field "Cc" on send email model
    When I enter value "" into field "{testData:CcField}" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    And I hover mouse on text "Cc" inside Send Email Modal
    Then I softly see help text "Please enter Cc email address - Use semicolon(;) to separate manual email addresses" is displayed related field "Cc" inside Send Email
    And I wait for "3" seconds
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "35" seconds
    Then I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    And I click modal button "Close"
    Then I softly see "Messages" page block displayed

  @509956 @SendEmail @ReplyEmail
  Scenario: 3.0- Reply Email- SPI- To Verify that the 'Reply Copy (Cc) to Me' function works correctly.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "35" seconds
    Then I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    And I wait for "3" seconds
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    And I wait for "3" seconds
    Then I see the text "Send Copy (Cc) to Me" in modal
    And I click on checkbox for field "Send Copy (Cc) to Me"
    And I wait for "3" seconds
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I wait for "3" seconds
    And I hover mouse on text "Send Copy (Cc) to Me" inside Send Email Modal
    Then I softly see help text "Enable this checkbox to include Yourself in Cc" is displayed related field "Send Copy (Cc) to Me" inside Send Email
    And I wait for "3" seconds
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    Then I softly see value "automationspi31@yopmail.com" for field "Cc" on send email model
    And I wait for "10" seconds
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "3" seconds
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    Then I see the text "Send Copy (Cc) to Me" in modal
    When I enter value "Test automation mail" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I wait for "3" seconds
    And I hover mouse on text "Send Copy (Cc) to Me" inside Send Email Modal
    Then I softly see help text "Enable this checkbox to include Yourself in Cc" is displayed related field "Send Copy (Cc) to Me" inside Send Email
    And I pause execution for "3" seconds
    And I wait for "35" seconds
    Then I click on "Send" button in send email modal
    And I wait for "3" seconds
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    Then I softly cannot see value "automationspi31@yopmail.com" for field "Cc" on send email model

  @509957 @SendEmail @ReplyEmail
  Scenario: 3.0- Reply Email- SPI- To Verify that the 'Subject' field functions correctly.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "35" seconds
    Then I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I wait for "3" seconds
    Then I hover mouse on text "Subject" inside Send Email Modal
    And I wait for "3" seconds
    Then I softly see help text "Please enter subject" is displayed related field "Subject" inside Send Email
    Then I enter value "Test automation mail" into field "Subject" on send email modal
    And I wait for "35" seconds
    Then I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

  @509958 @SendEmail @ReplyEmail
  Scenario: 3.0- Reply Email- SPI- To verify that all features of Body content field functions correctly.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "35" seconds
    Then I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    And I hover mouse on text "Body Content" inside Send Email Modal
    Then I softly see help text "Enter email content here" is displayed related field "Body Content" inside Send Email
    And I wait for "3" seconds
    When I enter value "Test automation mail" into field "Body Content" on send email modal
    When I click dropdown value as "Salesforce Sans" inside body content
    And I select dropdown value as font style "Courier" inside body content
    When I click dropdown value as "Courier" inside body content
    And I select dropdown value as font style "Salesforce Sans" inside body content
    When I click dropdown value as "Salesforce Sans" inside body content
    And I select dropdown value as font style "Arial" inside body content
    When I click dropdown value as "Arial" inside body content
    And I select dropdown value as font style "Verdana" inside body content
    When I click dropdown value as "Verdana" inside body content
    And I select dropdown value as font style "Tahoma" inside body content
    When I click dropdown value as "Tahoma" inside body content
    And I select dropdown value as font style "Garamond" inside body content
    When I click dropdown value as "Garamond" inside body content
    And I select dropdown value as font style "Times New Roman" inside body content
    And I wait for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "12" inside body content
    And I select dropdown value as font style "16" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Strikethrough" inside body content
    And I pause execution for "3" seconds
#    Then I see "Test automation mail" displayed in "Strikethrough" format inside CK editor
    When I click dropdown value as "Strikethrough" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Bold" inside body content
    And I pause execution for "3" seconds
#    Then I see "Test automation mail" displayed in "Bold" format inside CK editor
    When I click dropdown value as "Bold" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Italic" inside body content
    And I pause execution for "3" seconds
#    Then I see "Test automation mail" displayed in "Italic" format inside CK editor
    When I click dropdown value as "Italic" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Underline" inside body content
    And I wait for "3" seconds
  #  Then I see "Test automation mail" displayed in "Underline" format inside CK editor
    When I click dropdown value as "Underline" inside body content
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Bulleted list" inside body content
    And I pause execution for "5" seconds
#    Then I see "Test automation mail" displayed in "Bulleted list" format inside CK editor
    When I click dropdown value as "Bulleted list" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Numbered list" inside body content
#    Then I see "Test automation mail" displayed in "Numbered list" format inside CK editor
    When I click dropdown value as "Numbered list" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Indent" inside body content
#    Then I see "Test automation mail" displayed in "Indent" format inside CK editor
    When I click dropdown value as "Indent" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Outdent" inside body content
#    Then I see "Test automation mail" displayed in "Outdent" format inside CK editor
    When I click dropdown value as "Outdent" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    Then I see "Test automation mail" displayed in "Left align text" format inside CK editor
    When I click dropdown value as "Left align text" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Center align text" inside body content
    Then I see "Test automation mail" displayed in "Center align text" format inside CK editor
    When I click dropdown value as "Center align text" inside body content
    And I pause execution for "3" seconds
    When I change formatting of all text to "Test automation mail" inside CK editor
    When I click dropdown value as "Right align text" inside body content
    Then I see "Test automation mail" displayed in "Right align text" format inside CK editor
    When I click dropdown value as "Right align text" inside body content
    And I wait for "3" seconds
    When I click dropdown value as "Link" inside body content
    When I enter value "Google" into field "Link Title" on send email modal
    When I enter value "https://www.google.com/" into field "Link URL" on send email modal
    And I click modal button "Save"
    When I click dropdown value as "Link" inside body content
    When I enter value "Google" into field "Link Title" on send email modal
    When I enter value "https://www.google.com/" into field "Link URL" on send email modal
    And I click modal button "Cancel"
    When I click dropdown value as "Image" inside body content
    When I upload attachment "green.png" in Send Email Modal
    When I click on cross icon at "green.png" attachment inside send email modal
    When I click dropdown value as "Remove formatting" inside body content
    When I upload attachment "1.2MB.png" in Send Email Modal
    Then I see the text "The image exceeded the maximum size of 1 MB." in modal
    And I wait for "30" seconds
    When I click on "Send" button in send email modal
    And I wait for "3" seconds
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

  @509959 @SendEmail @ReplyEmail
  Scenario: 3.0- Reply Email- SPI-To verify that Attachments field functions correctly.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    Then I see the text "Collective max size of attached files should be 25MB. Single file size attachment limit is upto 1.5MB. Do not attach more than 10 Files." in modal
    And I wait for "3" seconds
    And I hover mouse on text "Attachments" inside Send Email Modal
    Then I softly see help text "File Attachment" is displayed related field "Attachments" inside Send Email
    And I wait for "3" seconds
    When I upload attachment "Xpath CheatSheet(1.8MB).pdf" in Send Email Modal
    Then I softly see "Single File Size Limit is Exceeded" error massage in attachment section
    When I upload attachment "dummy_1533kb.pdf" in Send Email Modal
    When I click on cross icon at "dummy_1533kb.pdf" attachment inside send email modal
    Then I see attached file "dummy_1533kb.pdf" is deleted successfully inside send email modal
    And I wait for "3" seconds
    When I upload attachment "Attachment.pdf" in Send Email Modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    Then I softly see "File with this name already exist." error massage in attachment section
    When I click on cross icon at "Attachment.pdf" attachment inside send email modal
    When I see attached file "Attachment.pdf" is deleted successfully inside send email modal
    And I wait for "3" seconds
    When I upload attachment "SendEmailAttachment.pdf" in Send Email Modal
    When I upload attachment "DuplicateFile.txt" in Send Email Modal
    When I upload attachment "TestFileSharing.docx" in Send Email Modal
    When I upload attachment "TestAutomationFile.pptx" in Send Email Modal
    When I upload attachment "SendEmailMP4File.mp4" in Send Email Modal
    When I upload attachment "SharingAtCollabTest.png" in Send Email Modal
    When I upload attachment "actionsAtEgrid.png" in Send Email Modal
    When I upload attachment "actionsAtAttachment.png" in Send Email Modal
    When I upload attachment "actionsAtEnhancedDataTable.png" in Send Email Modal
    When I upload attachment "actionsAtMeGridTable.png" in Send Email Modal
    When I upload attachment "captureModalFields.png" in Send Email Modal
    Then I softly see "Do not attach more than 10 Files, Attachment limit is Exceeded." error massage in attachment section

  @509967 @SendEmail @ReplyEmail
  Scenario: 3.0- Reply Email- SPI- To verify that after Reply mail form OUTLOOK Recorded added in FLEX TABLE Functioning correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    And I click on "Reply" icon for "Test automation mail subject 1" inside flex table with id "---program:-:communicationHistoryTableId---"
    Then I softly see "Send Email" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:ToField}" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I wait for "30" seconds
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal
    When I click modal button "Close"
    When I perform quick search for "Test automation mail subject 1" in "---program:-:communicationHistoryTableId---" panel
    When I click on "View" icon for "Test automation mail subject 1" inside table
    When I click modal button "Close"
    Then I softly see value "Test automation mail subject 1" for title "Email Subject" inside table "---program:-:communicationHistoryTableId---"
    Then I softly see value "RE: Test automation mail subject 1" for title "Email Subject" inside table "---program:-:communicationHistoryTableId---"
    Then I softly see "Subject" in flex table header "---program:-:communicationHistoryTableId---"
    Then I softly see "From Address" in flex table header "---program:-:communicationHistoryTableId---"
    Then I softly see "To Address" in flex table header "---program:-:communicationHistoryTableId---"
    Then I softly see "CC Address" in flex table header "---program:-:communicationHistoryTableId---"
    Then I softly see "Attention To" in flex table header "---program:-:communicationHistoryTableId---"
    Then I softly see "Email Subject" in flex table header "---program:-:communicationHistoryTableId---"
    Then I softly see "Preview" in flex table header "---program:-:communicationHistoryTableId---"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Test automation mail
      """
