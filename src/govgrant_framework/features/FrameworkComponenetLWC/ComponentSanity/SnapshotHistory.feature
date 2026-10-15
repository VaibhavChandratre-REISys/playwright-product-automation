@ComponentSanity @SnapshotHistoryTable @SnapshotHistoryTableComponent @ComponentSanity3
Feature: Component Sanity Testing
  In this feature file, we use the following tags for component-wise execution:@SnapshotHistory

  @513638 @SnapshotHistoryTable
  Scenario: 3.0- Snapshot- Admin/PM- To verify that after click on Take Snapshot the Snapshot History Table functioning correctly
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "4" seconds
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "History" sub tab
    And I click on Menu icon present on top right corner of the page
    And I click on "Take Snapshot" in the page details without processing
    Then I see confirmation box with message "You are attempting to take a snapshot of the current record. The PDF will be attached in Snapshot History. Do you want to proceed?" is displayed
    And I click "Continue" on modal confirmation box
    And I pause execution for "7" seconds
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SnapShot on" as name

  @513639 @SnapshotHistoryTable
  Scenario:3.0- Snapshot- Admin/PM- To verify that Auto Snapshot functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                            | fieldOrignalValue                            | filterId         |
      | Page Layout Action    | History Snapshot-Action PDF Filename | Subaward Auto-Snapshot - Submit For Approval | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                            | fieldNewValue                | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | History Snapshot-Action PDF Filename | Subaward_Submit_for_Approval | Awards             | Name                      | Submit For Approval        |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I click modal button "Close"
    And I refresh the page
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 1 |
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Send back | Forward |
    And I wait for "3" seconds
    And I navigate to "History" sub tab
    Then I softly see column "Assigned To" at position "2" contains text "Automation EXE"
    Then I softly see column "Overall Status" at position "1" contains text "Pending"
    Then I softly see column "Status" at position "2" contains text "Pending"
    Then I softly see snapshot with name containing "Subaward_Submit_for_Approval.pdf" as name

  @513651 @SnapshotHistoryTable
  Scenario: 3.0- Snapshot- SPI- To verify that the Snapshot History Table functioning correctly after click on Take Snapshot
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | filterId         |
      | Page Layout           | Hide On Demand Snaphot | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Hide On Demand Snaphot | false         | Annoucement External Profile-FOA | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I navigate to "History" sub tab
    And I click on Menu icon present on top right corner of the page
    And I click on "Take Snapshot" in the page details without processing
    Then I see confirmation box with message "You are attempting to take a snapshot of the current record. The PDF will be attached in Snapshot History. Do you want to proceed?" is displayed
    And I click "Continue" on modal confirmation box
    And I pause execution for "3" seconds
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SnapShot on" as name

  @513683 @SnapshotHistoryTable
  Scenario:3.0- Snapshot- SPI- To verify that Auto Snapshot functioning correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I switch to parent tab
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I refresh the page
    And I navigate to "History" sub tab
    And I get current URL
    Then I softly see snapshot with name containing "Snapshot_Pre-Application_Submission.pdf" as name

  @513640 @SnapshotHistoryTable
  Scenario: 3.0- Snapshot- Admin/PM- To verify that the Take Snapshot functioning correctly
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "3" seconds
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "History" sub tab
    And I click on Menu icon present on top right corner of the page
    And I click on "Take Snapshot" in the page details without processing
    Then I see confirmation box with message "You are attempting to take a snapshot of the current record. The PDF will be attached in Snapshot History. Do you want to proceed?" is displayed
    And I click "Continue" on modal confirmation box
    And I pause execution for "4" seconds
    Then I softly see the following messages in the page details contains:
      | SnapShot created successfully. Please refresh the page. |
      | Please click here to download.                          |
    And I pause execution for "7" seconds
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SnapShot on" as name
    And I click on hyperlink containing value "SnapShot on"
    And I click on "Download" button for snapshot view
    Then I softly see new tab is opened

  @513642 @SnapshotHistoryTable
  Scenario: 3.0- Snapshot- Admin/PM- To verify that the Take Snapshot functioning correctly for large data
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "3" seconds
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "History" sub tab
    And I click on Menu icon present on top right corner of the page
    And I click on "Take Snapshot" in the page details without processing
    Then I see confirmation box with message "You are attempting to take a snapshot of the current record. The PDF will be attached in Snapshot History. Do you want to proceed?" is displayed
    And I click "Continue" on modal confirmation box
    And I pause execution for "7" seconds
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SnapShot on" as name
    And I click on hyperlink containing value "SnapShot on"
    Then I see no new tab is opened

  @513643 @SnapshotHistoryTable
  Scenario:3.0- Snapshot- Admin/PM- To verify that the Hide on Demand Snapshot functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | filterId         |
      | Page Layout           | Hide On Demand Snaphot | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Hide On Demand Snaphot | true          | Grantor State Program |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "3" seconds
    Then I softly cannot see top right button "Take Snapshot" in page detail
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | filterId         |
      | Page Layout           | Hide On Demand Snaphot | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Hide On Demand Snaphot | false         | Grantor State Program |                           |                            |
    And I refresh the page
    And I wait for "3" seconds
    Then I softly can see top right button "Take Snapshot" in page detail

  @513644 @SnapshotHistoryTable
  Scenario Outline: 3.0- Snapshot- Admin/PM- To verify that the Skip for Export functioning correctly for snapshot
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Tabs Config      | Skip for Export | false             | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName       | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                                   |
      | Page Tabs Config:Page Layout Action | Skip for Export | true          | Grantor State Program | Name                      | {CommonConfigFileTest:ProgramGrantorStateProgramOverviewTab} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "History" sub tab
    And I click on Menu icon present on top right corner of the page
    And I click on "Take Snapshot" in the page details without processing
    Then I see confirmation box with message "You are attempting to take a snapshot of the current record. The PDF will be attached in Snapshot History. Do you want to proceed?" is displayed
    And I click "Continue" on modal confirmation box
    And I pause execution for "4" seconds
    Then I softly see the following messages in the page details contains:
      | Snapshot created successfully. Please refresh the page. |
      | Please click here to download.                          |
    And I pause execution for "7" seconds
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SnapShot on" as name
    And I click on hyperlink containing value "SnapShot on"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I softly cannot see "Overview" on page "1" of "govgrants" pdf file

    Examples:
      | User |
      | PM   |

  @513697 @SnapshotHistoryTable
  Scenario: 3.0- Snapshot- SPI- To verify that the Skip for Export functioning correctly for snapshot
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | coreComponentField               | filterId         |
      | Page Tabs Config      | Skip for Export | false             | Annoucement External Profile-FOA | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName       | fieldNewValue | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue                                      |
      | Page Tabs Config:Page Layout Action | Skip for Export | false         | Annoucement External Profile-FOA | Name                      | {CommonConfigFileTest:AnnoucementExternalProfileFOAOverviewTab} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I navigate to "History" sub tab
    And I wait for "3" seconds
    Then I softly can see top right button "Take Snapshot" in page detail
    And I click on Menu icon present on top right corner of the page
    And I click on "Take Snapshot" in the page details without processing
    Then I see confirmation box with message "You are attempting to take a snapshot of the current record. The PDF will be attached in Snapshot History. Do you want to proceed?" is displayed
    And I click "Continue" on modal confirmation box
    And I pause execution for "4" seconds
    And I pause execution for "7" seconds
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SnapShot on" as name
    And I click on hyperlink containing value "SnapShot on"
    And I switch to tab number "1"
    And I click on "View File" button for snapshot view
    And I wait for "3" seconds
    When I download the file for snapshot
    And I wait for "3" seconds
    Then I softly see "Overview" on page "1" of "govgrants" pdf file

  @513654 @SnapshotHistoryTable
  Scenario:3.0- Snapshot- SPI- To verify that the Take Snapshot functioning correctly
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I navigate to "History" sub tab
    And I click on Menu icon present on top right corner of the page
    And I click on "Take Snapshot" in the page details without processing
    Then I see confirmation box with message "You are attempting to take a snapshot of the current record. The PDF will be attached in Snapshot History. Do you want to proceed?" is displayed
    And I click "Continue" on modal confirmation box
    And I pause execution for "7" seconds
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SnapShot on" as name

  @513670 @SnapshotHistoryTable
  Scenario:3.0- Snapshot- SPI- To verify that the Take Snapshot functioning correctly for large data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I navigate to "History" sub tab
    And I click on Menu icon present on top right corner of the page
    And I click on "Take Snapshot" in the page details without processing
    Then I see confirmation box with message "You are attempting to take a snapshot of the current record. The PDF will be attached in Snapshot History. Do you want to proceed?" is displayed
    And I click "Continue" on modal confirmation box
    And I pause execution for "4" seconds
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SnapShot on" as name

  @513695 @513695_1 @SnapshotHistoryTable
  Scenario: 3.0- Snapshot- SPI- To verify that the Hide on Demand Snapshot functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | coreComponentField               | filterId         |
      | Page Layout           | Hide On Demand Snaphot | false             | Annoucement External Profile-FOA | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Hide On Demand Snaphot | true          | Annoucement External Profile-FOA |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I navigate to "History" sub tab
    And I wait for "3" seconds
    And I click on Menu icon present on top right corner of the page
    Then I softly cannot see top right button "Take Snapshot" in page detail

  @513695 @513695_2 @SnapshotHistoryTable
  Scenario: 3.0- Snapshot- SPI- To verify that the Hide on Demand Snapshot functioning correctly
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | coreComponentField               | filterId         |
      | Page Layout           | Hide On Demand Snaphot | false             | Annoucement External Profile-FOA | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Hide On Demand Snaphot | false         | Annoucement External Profile-FOA |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I navigate to "History" sub tab
    And I wait for "3" seconds
    Then I softly can see top right button "Take Snapshot" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I softly can see top right button "Take Snapshot" in page detail
    And I click on "Take Snapshot" in the page details without processing
    Then I see confirmation box with message "You are attempting to take a snapshot of the current record. The PDF will be attached in Snapshot History. Do you want to proceed?" is displayed
    And I click "Continue" on modal confirmation box
    And I pause execution for "3" seconds
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SnapShot on" as name
