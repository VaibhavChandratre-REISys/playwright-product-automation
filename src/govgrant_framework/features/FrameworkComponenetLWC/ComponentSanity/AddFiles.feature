@ComponentSanity @addfiles @ComponentSanity1

Feature: Component Sanity Testing 1. Add Files
  In this feature file, we use the following tags for component-wise execution:@addfiles

  #####Test suite: 3.0 Add Files (Suite ID: 503667) - 19 test Scenario ######
  @503705 @503707 @addfiles
  Scenario:3.0- Add Files - Add New File - using Upload button under (Upload file from computer) Tab
  |3.0- Add Files- Add File Action- Do not enter or select file- using Upload button under (Upload file from computer) Tab|
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
   #503707
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Financial Artifacts" has been added in "Program Files" flex table
    Then I softly see "pdf" has been added in "Program Files" flex table
    Then I softly see "AttachmentTesting.pdf" has been added in "Program Files" flex table

  @503708 @addfiles
  Scenario: 3.0- Add Files- Add File Action- Do not Select checkbox under Upload file from Library & click on Attach.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I click on "Upload File from Library" tab at files library upload modal
    Then I see "Attach" button is disabled at modal under library

  @503709 @503710 @addfiles
  Scenario: 3.0- Add Files- Edit Action- Edit Program Files Record
  |3.0- Add Files- Download action- Download Program Files Record|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Edit" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I see field "Title" is editable
    And I enter value "Description test" inside "Description" in LWC modal
    When I click modal button "Save"
    Then I see value "Description test" for title "Description" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly see the following messages in the page details contains:
      | File updated successfully. |

  @503715 @503716 @550023 @550024 @addfiles
  Scenario:3.0- Add Files- Admin/PM- To verify that Add New Files using same chosen file.(Upload file from computer) functioning correctly
  |3.0- Add Files- Admin/PM- To verify that View Program Files Record functioning correctly|
  |3.0- Add Files- Admin/PM- Add File Action-Verify Success Validation Message After Adding a File|
  |3.0- Add Files- Admin/PM- Add File Action-Verify “Export” Functionality for Program Files Table|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "1" seconds
    And I softly see the following message in the page details :
      | File AttachmentTesting.pdf Uploaded successfully. |
    And I wait for "5" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Edit" icon for "AttachmentTesting.pdf" inside table
    Then I see field "Title" is editable
    And I click on top right button "Save" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
#    And I softly see the following message in the page details contains:
#      | File updated Successfully. |
    And I wait for "5" seconds
    When I click on "Download" icon for "AttachmentTesting.pdf" inside table
    Then I softly see new tab is opened
    And I switch to parent tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "AttachmentTesting.pdf" inside table
    Then I see below buttons on standard salesforce format
      | Download           |
      | Share              |
      | View File Details  |

  @503717 @addfiles
  Scenario: 3.0- Add Files- Add New Files using same chosen file.(Upload file from Library)
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
#    And I upload attachment without random number "Attachment.pdf" of type "Financial Artifacts" from computer
    And I click on "Upload File from Library" tab at files library upload modal
    And I perform quick search for workspace file search "Attachment.pdf"
    And I pause execution for "5" seconds
    And I select file "Attachment.pdf" for workspace
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    Then I softly see "Attachment.pdf" has been added in "Program Files" flex table

  @503719 @503720 @503721 @503723 @503724 @addfiles
  Scenario:3.0- Add Files- Add New Files & Check which type of file is supported (Upload file from computer)
  |3.0- Add Files- Add New Files- under (Upload file from computer)- click on close|
  |3.0- Add Files- Add New Files with (Upload file from Library)- click on close|
  |3.0- Add Files- Add New Files- under (Upload file from computer)- click on close- Then click on Add button|
  |3.0- Add Files- Add New Files with (Upload file from Library)- click on close- Then click on Add button|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "pdf" has been added in "Program Files" flex table
    Then I softly see "AttachmentTesting.pdf" has been added in "Program Files" flex table
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "actionsAtEgrid.png" of type "Financial Artifacts" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "actionsAtEgrid.png" has been added in "Program Files" flex table
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "Award_Field_Values.xlsx" of type "Financial Artifacts" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "Award_Field_Values.xlsx" has been added in "Program Files" flex table
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "TestAutomation.txt" of type "Financial Artifacts" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "TestAutomation.txt" has been added in "Program Files" flex table
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "SendEmailMP4File.mp4" of type "Financial Artifacts" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "SendEmailMP4File.mp4" has been added in "Program Files" flex table

  @503725 @addfiles
  Scenario: 3.0- Add Files- Download Zip File
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Flex Table:General    | Enable Record Selection | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Enable Record Selection | true          | GrantorInternalProgramFiles | Name                      |                            |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "Award_Field_Values.xlsx" of type "Financial Artifacts" from computer
    And I click modal button "Close"
    When I check "AttachmentTesting.pdf" boxes in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on top right button "Download as Zip Folder" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly see new tab is opened

  @507212 @507214 @507233 @addfiles
  Scenario: 3.0- Add Forms & Files- SPI- Add File Action- To verify that using Upload button under (Upload file from computer) Tab functioning correctly
  |3.0- Add Files- SPI- Add File Action- To verify that Do not enter or select file- using Upload button under (Upload file from computer) Tab functioning correctly|
  |3.0- Add Files- SPI- Add New Files- To verify that under (Upload file from computer)- click on close- Then click on Add button functioning correctly|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    And I enter value "Description test" inside "Description" in LWC modal
    Then I see "Upload File from Library" subtab is present in page details
    Then I see "Upload File from Computer" subtab is present in page details
    Then I see "Upload" button is disabled at modal under library
    And I wait for "5" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "AttachmentTesting.pdf" has been added in "Pre-Application Files" flex table
    Then I softly see "Description test" has been added in "Pre-Application Files" flex table
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "TestAutomation.txt" of type "Other" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "TestAutomation.txt" has been added in "Pre-Application Files" flex table
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    And I upload attachment without random number "SendEmailMP4File.mp4" of type "Other" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "SendEmailMP4File.mp4" has been added in "Pre-Application Files" flex table

  @507213 @507231 @507235 @bug-504831 @addfiles
  Scenario: 3.0- Add Files- SPI- Add File Action- To verify that using Attach button under (Upload file from Library) Tab functioning correctly
  |3.0- Add Files- SPI- To verify that Add New Files with (Upload file from Library)- click on close functioning correctly|
  |3.0- Add Files- SPI- To verify that Add New Files with (Upload file from Library)- click on close- Then click on Add button functioning correctly|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    And I click on "Upload File from Library" tab at files library upload modal
    And I perform quick search for workspace file search "Attachment.pdf"
    And I pause execution for "5" seconds
    And I select file "Attachment.pdf" for workspace
    And I wait for "2" seconds
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see "Attachment.pdf" has been added in "Pre-Application Files" flex table

  @507215 @addfiles
  Scenario: 3.0- Add Files- SPI- Add File Action- To verify that Do not Select checkbox under Upload file from Library & click on Attach functioning correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    Then I softly see "Add File" opens in overLay window
    When I navigate to "Upload File from Library" sub tab
    Then I see "Attach" button is disabled at modal under library

  @507217 @550028 @addfiles
  Scenario: 3.0- Add Files- SPI- Download action- To verify that Download Program Files Record functioning correctly
  |3.0- Add Files- SPI- Add File Action-Verify Success Validation Message After Adding a File|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Edit" icon for "AttachmentTesting.pdf" inside table
    Then I see field "Title" is editable
    And I click on top right button "Save" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
#    And I see the following message in the page details :
#      | File updated successfully. |
    When I click on "Download" icon for "AttachmentTesting.pdf" inside table
    Then I softly see new tab is opened

  @507220 @addfiles
  Scenario: 3.0- Add Files- SPI- To verify that View Application Files Record functioning correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I pause execution for "6" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View" icon for "AttachmentTesting.pdf" inside table
    Then I softly see "View" opens in overLay window

  @507221 @507230 @addfiles
  Scenario: 3.0- Add Files- SPI- To verify that Add New Files using same chosen file.(Upload file from computer) functioning correctly
  |3.0- Add Files- SPI- To verify that Add New Files- under (Upload file from computer)- click on close functioning correctly|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    Then I softly see "Add File" opens in overLay window
    And I enter value "Description test" inside "Description" in LWC modal
    Then I see "Upload File from Library" subtab is present in page details
    Then I see "Upload File from Computer" subtab is present in page details
    Then I see "Upload" button is disabled at modal under library
    And I wait for "5" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "AttachmentTesting.pdf" has been added in "Pre-Application Files" flex table

  @507227 @addfiles
  Scenario: 3.0- Add Files- SPI- To verify that Add New Files & Check which type of file is supported (Upload file from computer) functioning correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    And I enter value "Description test" inside "Description" in LWC modal
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "pdf" has been added in "Pre-Application Files" flex table
    Then I softly see "AttachmentTesting.pdf" has been added in "Pre-Application Files" flex table
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    And I enter value "Description test1" inside "Description" in LWC modal
    And I upload attachment without random number "actionsAtEgrid.png" of type "Other" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "actionsAtEgrid.png" has been added in "Pre-Application Files" flex table
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    And I enter value "Description test2" inside "Description" in LWC modal
    And I upload attachment without random number "Award_Field_Values.xlsx" of type "Other" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "Award_Field_Values.xlsx" has been added in "Pre-Application Files" flex table
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    And I enter value "Description test3" inside "Description" in LWC modal
    And I upload attachment without random number "TestAutomation.txt" of type "Other" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "TestAutomation.txt" has been added in "Pre-Application Files" flex table
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I enter value "Description test4" inside "Description" in LWC modal
    And I upload attachment without random number "SendEmailMP4File.mp4" of type "Other" from computer
    And I click modal button "Close"
    And I refresh the page
    Then I softly see "SendEmailMP4File.mp4" has been added in "Pre-Application Files" flex table

  @507236 @addfiles
  Scenario: 3.0- Add Files- SPI- To verify that Refresh functioning correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I pause execution for "3" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Edit" icon for "AttachmentTesting.pdf" inside table
    Then I see field "Title" is editable
    And I click modal button "Close"
    And I click on "Menu" button inside table id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I select "Refresh" from parallel lines dropdown of "Pre-Application Files"
    Then I see table is refreshing

  @507218 @550025 @550026 @550027 @550029 @addfiles
  Scenario: 3.0- Add Files- SPI- Download action- To verify that Download Program Files Record functioning correctly
  |3.0- Add Files- SPI- Add File Action- Verify “Add File” action on Application Files Table|
  |3.0- Add Files- SPI- Add File Action- Verify Row-Level Delete Action Functionality|
  |3.0- Add Files- SPI- Add File Action- Verify Row-Level view Action Functionality|
  |3.0- Add Files- SPI- Add File Action-Verify “Export” Functionality for Program Files Table|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    Then I see field "Pre-Application Files" inside page block
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    And I upload attachment without random number "ScrollableTesting.pdf" of type "Other" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see row level action button "Delete" against "ScrollableTesting.pdf" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    Then I softly can see row level action button "Edit" against "ScrollableTesting.pdf" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    Then I softly can see row level action button "View" against "ScrollableTesting.pdf" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    Then I softly can see row level action button "Download" against "ScrollableTesting.pdf" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I click on "Upload File from Library" tab at files library upload modal
    And I perform quick search for workspace file search "ScrollableTesting.pdf"
    And I pause execution for "5" seconds
    And I select file "ScrollableTesting.pdf" for workspace
    Then I softly see the following messages in the page details contains:
      | The File attached is already present. Select a different file. |

  @550020 @550021 @550022
  Scenario:3.0- Add Files- Admin/PM- Add File Action- Verify “Add File” action on Program Files Table
  |3.0- Add Files- Admin/PM- Add File Action- Verify Row-Level Delete Action Functionality|
  |3.0- Add Files- Admin/PM- Add File Action- Verify Row-Level view Action Functionality|
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
   #503707
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"

  @550028
  Scenario: 3.0- Add Files- SPI- Add File Action-Verify Success Validation Message After Adding a File
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    Then I see field "Pre-Application Files" inside page block
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I pause execution for "5" seconds
    Then I softly see "Add File" opens in overLay window
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "1" seconds
    And I softly see the following message in the page details contains:
      | File AttachmentTesting.pdf Uploaded successfully. |

  @550319
  Scenario: LWC - PM/SPI - Add Files - To verify that, if "GNT.Upload File To Private Library" custom permission is enabled then on add files modal, Selected Folder option should not be display on add files modal
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I see "Upload" button is disabled at modal under library
    Then I do not see the field text containing "Selected Folder" on modal

  @550320SPI
  Scenario: LWC - PM/SPI - Add Files - To verify that, if "GNT.Upload File To Private Library" custom permission is disabled then on add files modal, Selected Folder option should be display on add files modal
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    Then I softly see "Add File" opens in overLay window
    Then I do not see the field text containing "Selected Folder" on modal
    Then I see "Upload" button is disabled at modal under library