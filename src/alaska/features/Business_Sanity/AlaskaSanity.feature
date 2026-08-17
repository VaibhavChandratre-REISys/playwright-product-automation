@AlaskaSanity
Feature: Validate sanity testing of Complete Business Flow

  @LoginTestInternalUser
  Scenario Outline: Verify Login is working in QA Org
    When I login to "As a Grantor" app as "<userType>" user
    And I pause execution for "3" seconds
    And I navigate to "Planning" tab
    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | EXE      |

  @LogintestExternalUser
  Scenario Outline: Verify Login is working in Training Org for External user
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<userType>" user
    And I pause execution for "3" seconds
    And I navigate to "Opportunities" tab

    Examples:
      | userType |
      | CITY1    |
#      | CITY2    |
      | BOROUGH  |
      | ANCO     |
      | REAA     |
      | NPO      |
      | ANT      |
      | ANV      |

  @activationOfFundingSource @VaibhavSanity @Sanity_October
  Scenario: Validate the activation of Funding Source HappyPath and the status is Active
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"

  @activateKPI @VaibhavSanity @Sanity_October
  Scenario: Validate the activation of KPI and the status changes to Active
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"

  @StrategicPlanCreation @VaibhavSanity @Sanity_October
  Scenario: Creation of Strategic plan
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---strategicplan:-:ObjectivesKPITableId---"
    When I click "Add" after selection of "Automation Permanent KPI" in the table "---strategicplan:-:ListOfActiveKPITableId---"
    Then I see that "Automation Permanent KPI" has been added in flextable with Id "---strategicplan:-:ObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    And I click on "Back To Strategic Goal" in the page details
    Then I softly see field "Status" as "Draft"
    When I click on "Back To Strategic Plan" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"

  @GranteesContactCreation @VaibhavSanity @Bug-AD-1346 @Sanity_October
  Scenario: Grantees Contact Creation
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    And I navigate to "Grantees" content inside "Contacts" subheader on left panel
    And I pause execution for "3" seconds
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I close "Create Grantee Contact" modal by clicking the top right x button
    And I save the contact name as "Automation Runtime Contact"
    And I navigate to "Grantees" content inside "Contacts" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---home:-:subrecipientContactTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:subrecipientContactTableId---" without waiting for record
    Then I softly see field "Organization" as "First Class Organization"
    When I click modal button "Edit"
    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
    And I click modal button "Save"
    And I close "View Grantee Contact" modal by clicking the top right x button
    And I wait for "2" seconds
    Then I softly see value "New" for title "Status" inside table "---home:-:subrecipientContactTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "999003722" in "---grantee_tableId:-:activeAccount---" panel
    When I click on "View" icon for "999003722" inside flex table with id "---grantee_tableId:-:activeAccount---"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---home:-:userContactsTableId---" panel
    And I click on "Delete" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:userContactsTableId---"
    And I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---home:-:userContactsTableId---" panel
    Then I softly do not see value "{SavedValue:Automation Runtime Contact} Contact" for title "Full Name" inside table "---home:-:userContactsTableId---"

  @programActivationWithoutSharedRevenue @VaibhavSanity @Sanity_October
  Scenario: Validate the activation of Internal Program and the status changes to Active - Program Type:NFR without Shared revenue
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
#    When I navigate to "Setup" sub tab
##    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
##    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
##    When I click modal button "Close"
#    And I wait for "2" seconds
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
#    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | {SavedValue:PM Username} | Step 1  | Step 1       | Step 1 | Step 1 | Step 1                  | Step 1   |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 2  |
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
#    And I pause execution for "6" seconds
#    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
#    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    And I wait for "5" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I wait for "3" seconds
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - All"
#    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
#    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Active" and is "dark blue"

  @programActivationWithSharedRevenueNFR @VaibhavSanity @Sanity_October
  Scenario: Validate the activation of Internal Program and the status changes to Active - Program Type:NFR with Shared revenue
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition1" values from "Program_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
#    And I check the checkbox in modal with field value "Is this a Shared Revenue Program?"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Active" and is "dark blue"

  @publishingCompetitiveAnnouncement @VaibhavSanity @Sanity_October
  Scenario: Validate once the Competitive Announcement is Published by Grantor and then status changes to Published
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal Ann" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "---AUTOEnvData:-:fundingAccount---" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Then I refresh the page
    When I navigate to "Financials" sub tab
    Then I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                    | Pre-Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 2000            |
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    And I perform quick search for "{SavedValue:EXE Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I wait for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I wait for "5" seconds
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 90         | 350      |
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I perform quick search for "Acquisition / Lease" in "---announcement:-:selectProgramBudgetCategory---" panel
    When I click "Associate" after selection of "Acquisition / Lease" in the table "---announcement:-:selectProgramBudgetCategory---"
    When I close "Associate Budget Categories" modal by clicking the top right x button
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I enter value "Justified" into field "AnnouncementDescription__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"

  @publishingSharedRevenueAnnouncement @VaishaliD @VaibhavSanity @Sanity_October
  Scenario: Validate once the Competitive Announcement is Published by Grantor and then status changes to Published
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "SharedRevenueAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
#    When I enter "SharedRevenue Second Modal" values from "Announcement_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
    And I halt execution
    When I navigate to "Overview" sub tab
    And I enter "SharedRevenue_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Type" as "Directed"
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I wait for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    And I refresh the page
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I click modal button "Close"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Directed Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:subReviewPanelTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Completeness   | 50                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    When I close "Review Form" modal by clicking the top right x button
    And I wait for "3" seconds
    When I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "3" seconds
    And I expand nested table containing column value "ASC Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Environment    | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Permits        | 40                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    And I pause execution for "2" seconds
    And I collapse nested table containing column value "ASC Review"
    And I pause execution for "2" seconds
    And I expand nested table containing column value "ASC Review"
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 40                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 30                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    And I pause execution for "2" seconds
    And I collapse nested table containing column value "ASC Review"
    And I pause execution for "2" seconds
    And I expand nested table containing column value "ASC Review"
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Approach       | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Impact         | 40                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    And I pause execution for "2" seconds
    When I collapse nested table containing column value "ASC Review"
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:subReviewPanelTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header      | Section Weight (%) |
      | Strategic Alignment | 50                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    When I close "Review Form" modal by clicking the top right x button
    And I pause execution for "2" seconds
    When I collapse nested table containing column value "Management Review"
    And I pause execution for "2" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I perform quick search for "AUTOMATION LIGHTHOUSE VOC-ED CENTER," in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "AUTOMATION LIGHTHOUSE VOC-ED CENTER," by showing entries "All" in flex table with id "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I wait for "4" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"

  @publishingDirectedAnnouncement @VaibhavSanity @Sanity_October
  Scenario: Validate once the Directed Announcement is Published by Grantor and then status changes to Published
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Directed_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Type" as "Directed"
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---announcement:-:annoucementContactTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I wait for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    And I refresh the page
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I click modal button "Close"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Directed Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:subReviewPanelTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Completeness   | 50                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    When I close "Review Form" modal by clicking the top right x button
    And I wait for "3" seconds
    When I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "3" seconds
    And I expand nested table containing column value "ASC Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Environment    | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Permits        | 40                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    And I pause execution for "2" seconds
    And I collapse nested table containing column value "ASC Review"
    And I pause execution for "2" seconds
    And I expand nested table containing column value "ASC Review"
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 40                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 30                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    And I pause execution for "2" seconds
    And I collapse nested table containing column value "ASC Review"
    And I pause execution for "2" seconds
    And I expand nested table containing column value "ASC Review"
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Approach       | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Impact         | 40                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    And I pause execution for "2" seconds
    When I collapse nested table containing column value "ASC Review"
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:subReviewPanelTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header      | Section Weight (%) |
      | Strategic Alignment | 50                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    When I close "Review Form" modal by clicking the top right x button
    And I pause execution for "2" seconds
    When I collapse nested table containing column value "Management Review"
    And I pause execution for "2" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I perform quick search for "AUTOMATION LIGHTHOUSE VOC-ED CENTER," in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "AUTOMATION LIGHTHOUSE VOC-ED CENTER," by showing entries "All" in flex table with id "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I wait for "4" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I click on "View" icon for "Record id" inside table
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"

  @publishingFormulaAnnouncementByApplicant @VaibhavSanity @Sanity_October
  Scenario: Validate the activation of Formula By Applicant Announcement and the status changes to published and is green
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I click modal button "Close"
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "{amendment:JustificationFieldID}"
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "AUTOMATION LIGHTHOUSE VOC-ED CENTER," in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "AUTOMATION LIGHTHOUSE VOC-ED CENTER," by showing entries "All" in flex table with id "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I pause execution for "4" seconds
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                           | Allocated Amount |
      | AUTOMATION LIGHTHOUSE VOC-ED CENTER, | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    And I perform quick search for "Acquisition / Lease" in "---announcement:-:selectProgramBudgetCategory---" panel
    When I click "Associate" after selection of "Acquisition / Lease" by showing entries "All" in flex table with id "---announcement:-:selectProgramBudgetCategory---"
    When I close "Associate Budget Categories" modal by clicking the top right x button
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    And I refresh the page
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"

  @preApplicationSubmittedToGrantor_Sanity @city1User @VaibhavSanity @Sanity_October
  Scenario: Validate once the Grantor accepts the submitted pre-application then the changes status to Accepted
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "CITY1" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I navigate to "Overview" sub tab
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
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
    And I wait for "5" seconds
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    And I switch to parent tab
    When I click on "Submit to Grantor" in the page details
    Then I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I pause execution for "5" seconds
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Accept" in the page details
    Then I see status in Progress-bar is "Accepted" and is "dark blue"

  @submitApplicationNFR-City1 @nfrForm @city1User @VaishaliD @VaibhavSanity @Sanity_October
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for Program type NFR - City1 user
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "View" icon for "NFR - 1st Class Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    When I enter "NFRCity1FormFields" values from "ApplicationForm_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    And I get the "EGMS ID"
    When I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationSharedRevenueNFR-City1 @nfrFormSR @city1User @VaishaliD @VaibhavSanity @Sanity_October
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type NFR with Shared Revenue user city1
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "NFR - 1st Class Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    When I enter "NFRCity1FormFields" values from "ApplicationForm_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationCAP-City1 @capForm @city1User @VaishaliD @VaibhavSanity
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type CAP user city1
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_CAP"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "CAP - City Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    When I enter "CAPCityFormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "AssistanceProgramBudget" by clicking "Edit" :
      | Category  | Amount |
      | Education | 1000   |
    And I edit the following rows inline in flex table with id "AssistanceProgramStatement" by clicking "Edit" :
      | Category    | Amount |
      | Electricity | 1000   |
    And I wait for "3" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    And I switch to parent tab
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationDirectedSFT @city1User @sftForm @VaishaliD @bug-488508 @VaibhavSanity
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type SFT user city1
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_SFT_SR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachments" page block displayed
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:sFTApplicationFiles---"
    And I upload attachment "Attachment.pdf" of type "Significant Effects" from computer
    And I wait for "2" seconds
    And I upload attachment "Attachment.pdf" of type "Resolution" from computer
    And I wait for "2" seconds
    And I upload attachment "Attachment.pdf" of type "Significant Effects" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "View" icon for "SFT Long Form Application" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    When I enter "SFTCityFormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "3" seconds
    And I click on "Validate" in the split screen page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationCDBG @cdbgForm @city1User @RushikeshM @VaibhavSanity
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type CDBG user city1
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "Default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachments" page block displayed
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:cdbgApplicationFiles---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Public Notice" from computer
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Minutes of Meeting" from computer
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Map" from computer
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Deed" from computer
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Lease" from computer
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Easement" from computer
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Feasibility or Marketing Studies" from computer
    And I wait for "4" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Authority to Participate (Resolution)" from computer
    And I wait for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Statement of Assurances and Certification" from computer
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Job Description" from computer
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Applicant/Recipient Disclosure/Update Report" from computer
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "ADA Certification" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I navigate to "Forms and Files" sub tab
  #    Then I softly see "All Files" page block displayed
  #    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:cdbgApplicationFiles---"
  #    And I upload attachment "Attachment.pdf" of type "Certification Regarding Debarment" from computer
  #    And I wait for "2" seconds
  #    When I click modal button "Close"
  #    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "CDBG Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Application Part 1" sub tab
    When I enter "CDBG-Form Fields 1" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 2" sub tab
    When I enter "CDBG-Form Fields 2" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 3" sub tab
    When I enter "CDBG-Form Fields 3" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Validate" in the page details
    And I wait for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Created"

  @submitApplicationNPRA @npraForm @city1User @RushikeshM @VaibhavSanity
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type NPRA user city1
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NPRA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachments" page block displayed
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:nPRAApplicationFormFiles---"
    And I upload attachment without random number "Attachment.pdf" of type "Deed" from computer
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Lease" from computer
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Easement" from computer
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Resume" from computer
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Engineering Estimates, Quotes, or Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "NPRA Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    When I enter "NPRA-Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationBEAD-City1 @beadForm @city1User @VaibhavSanity
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for Program type BEAD - City1 user
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_BEAD"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Alaska Broadband Grant Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "BEAD City1 Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I navigate to "Scoring" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:low-CostOption-DataEntry---" by clicking "Edit" :
      | 1.Speed scales to the current FCC Broadband Benchmark | 1.Speed scales to the current FCC Broadband Benchmark | 2.Adhere to FCC's Measuring fixed Broadband -11th Report | 3. A Low-Cost Option Rate is provided |
      |                                                       | Yes                                                   | Yes                                                      | Yes                                   |
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Created"

  @ApplicationReviewHappyPathNFR-city1 @city1User @VaishaliD
  Scenario Outline: Validate the complete review process for an application program type NFR user city1
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "PROGRAM_TYPE_NFR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "PROGRAM_TYPE_NFR"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I wait for "2" seconds
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "4" seconds
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "1"
    When I edit the following rows inline in flex table with id "---applicationReview:-:reviewStepFormId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I switch to tab number "2"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    And I check the checkbox in modal with field value "I Agree"
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "ASC Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "3"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field            |
      | AuGr                        | GrantCode__c     |
      | Automation Test Description | Justification__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I edit the following rows inline in flex table with id "FundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Recommend for Funding | Comments    | Total Commitment Amount |
      | <Announcement Name> | 500                | Yes                   | Recommended | 500                     |
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                     | FDM |
      | {SavedValue:PM Username} | NA  |
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "Announcement EGMS ID" as "AnnID"
    And I refresh the page
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "3" seconds
    When I perform quick search for "{SavedValue:AnnID}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AnnID}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"

    Examples:
      | Announcement Name                                               | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Review} | {SavedValue:Automation Runtime Announcement Application Review} |

  @ApplicationReviewHappyPathCDBG @city1User @VaishaliD @test
  Scenario Outline: Validate the complete review process for an application program type CDBG
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "Default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "Default"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "4" seconds
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | CDBG ASC Score Sheet Form | 5           |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I wait for "2" seconds
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "CDBG ASC Score Sheet Form" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "ASC Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | CDBG ASC Score Sheet Form | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field            |
      | AuGr                        | GrantCode__c     |
      | Automation Test Description | Justification__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I edit the following rows inline in flex table with id "FundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Recommend for Funding | Comments    | Total Commitment Amount |
      | <Announcement Name> | 500                | Yes                   | Recommended | 500                     |
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                     | FDM |
      | {SavedValue:PM Username} | NA  |
    And I click on "Submit for Approval" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "Announcement EGMS ID" as "AnnID"
    And I refresh the page
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:AnnID}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AnnID}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"

    Examples:
      | Announcement Name                                               | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Review} | {SavedValue:Automation Runtime Announcement Application Review} |

  @ApplicationReviewHappyPathNPRA @city1User @VaishaliD
  Scenario Outline: Validate the complete review process for an application program type NPRA
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "PROGRAM_TYPE_NPRA"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "4" seconds
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I pause execution for "10" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                       | Due in Days |
      | NPRA ASC Score and Comment Form | 5           |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I wait for "2" seconds
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "NPRA ASC Score and Comment Form" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "ASC Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                       | Due in Days |
      | NPRA ASC Score and Comment Form | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field            |
      | AuGr                        | GrantCode__c     |
      | Automation Test Description | Justification__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I edit the following rows inline in flex table with id "FundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Recommend for Funding | Comments    | Total Commitment Amount |
      | <Announcement Name> | 500                | Yes                   | Recommended | 500                     |
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                     | FDM |
      | {SavedValue:PM Username} | NA  |
    And I click on "Submit for Approval" in the page details
    And I get the "Announcement EGMS ID"
    And I save the field labeled "Announcement EGMS ID" as "FDMID"
    And I refresh the page
    When I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:FDMID}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FDMID}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"

    Examples:
      | Announcement Name                                               | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Review} | {SavedValue:Automation Runtime Announcement Application Review} |

  @negotiationComplete-CDBG @city1User @VaishliD
  Scenario: Validate once the Negotiation Request is completed then the record owner can view the record under Completed Negotiations Program type CDBG
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CDBG"
#    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I pause execution for "10" seconds
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition_Sanity" values from "Negotiations_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "4" seconds
    When I click on "Send to Grantee" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I click on "Edit" in the page details
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    And I refresh the page
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Negotiation Request Status" as "Complete" in "Negotiation Request Details" pageblock
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    Then I can see row level action button "View" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---negotiation:-:negotiationCompletedTaskTableId---"

  @negotiationCompleteOnReviewSteps-CDBG @city1User
  Scenario: Validate once the Negotiation Request is completed then the record owner can view the record under Completed Negotiations Program type CDBG
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "PROGRAM_TYPE_CDBG"
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I click on "Request Negotiation" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "2" seconds
    And I pause execution for "10" seconds
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition_Sanity" values from "Negotiations_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "4" seconds
    When I click on "Send to Grantee" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I click on "Edit" in the page details
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    And I refresh the page
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Negotiation Request Status" as "Complete" in "Negotiation Request Details" pageblock
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    Then I can see row level action button "View" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---negotiation:-:negotiationCompletedTaskTableId---"

  @submitApplicationNFR-City2 @nfrForm @city2User
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for Program type NFR user city2
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY2" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City2 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "NFR - 2nd Class Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "NFRCity2-Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationSharedRevenueNFR-City2 @nfrFormSR @city2User
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type NFR with Shared Revenue user city2
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SR_CITY2"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY2" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click "Add" after selection of "Automation City2 SPI" by showing entries "All" in flex table with id "---applicationIntake:-:selectAssociateAppContacts---"
    When I close "Associate Contacts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City2 SPI | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "NFR - 2nd Class Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "NFRCity2-Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationCAP-City2 @capForm @city2User
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type CAP user city2
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_CAP"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY2" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click "Add" after selection of "Automation SecondClassSPI" by showing entries "All" in flex table with id "---applicationIntake:-:selectAssociateAppContacts---"
    When I close "Associate Contacts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | Automation SecondClassSPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "CAP - City Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    When I enter "CAPCityFormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "AssistanceProgramBudget" by clicking "Edit" :
      | Category  | Amount |
      | Education | 1000   |
    And I edit the following rows inline in flex table with id "AssistanceProgramStatement" by clicking "Edit" :
      | Category    | Amount |
      | Electricity | 1000   |
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    And I get the "EGMS ID"
    When I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationSharedRevenueCAP-City2 @capFormSR @city2User
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type CAP with Shared Revenue user city2
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_CAP_SR_CITY2"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY2" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click "Add" after selection of "Automation SecondClassSPI" by showing entries "All" in flex table with id "---applicationIntake:-:selectAssociateAppContacts---"
    When I close "Associate Contacts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | Automation SecondClassSPI | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "CAP - City Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "CAPCityFormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationNFR-Borough @nfrForm @boroughUser
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for Program type NFR user borough
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_BOROUGH"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "BOROUGH" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                  | Is Key Contact |
      | Automation boroughspi | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "NFR - Borough Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "NFRBorough Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationSharedRevenueNFR-Borough @nfrFormSR @boroughUser
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type NFR with Shared Revenue user borough
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SR_BOROUGH"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "BOROUGH" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "5" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name        | Is Key Contact |
      | Borough SPI | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "NFR - Borough Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "NFRBorough Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationCAP-Borough @capForm @boroughUser
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type CAP user borough
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_CAP_BOROUGH"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "BOROUGH" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                  | Is Key Contact |
      | Automation boroughspi | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "CAP - Borough" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "CAPBoroughFormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "AssistanceProgramBudget" by clicking "Edit" :
      | Category  | Amount |
      | Education | 1000   |
    And I edit the following rows inline in flex table with id "AssistanceProgramStatement" by clicking "Edit" :
      | Category    | Amount |
      | Electricity | 1000   |
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationSharedRevenueCAP-Borough @boroughFormSR @boroughUser
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type CAP with Shared Revenue user borough
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_CAP_SR_BOROUGH"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "BOROUGH" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                  | Is Key Contact |
      | Automation boroughspi | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "CAP - Borough" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "CAPBoroughFormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationNFR-REAA @reaaForm @reaaUser
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for Program type NFR user REAA
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_REAA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "REAA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name            | Is Key Contact |
      | Automation REAA | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "NFR - REAA Schools" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "NFR REAA Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationSharedRevenueNFR-REAA @reaaFormSR @reaaUser
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type NFR with Shared Revenue user REAA
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SR_REAA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "REAA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name     | Is Key Contact |
      | REAA SPI | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "NFR - REAA Schools" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "NFR REAA Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationNFR-ANCO @ancoForm @alaskaNativeCorpUser
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for Program type NFR user ANCO
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_ANCO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "ANCO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                                | Is Key Contact |
      | Automation Alaska NativeCorporation | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachments" page block displayed
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:recipientorganizationApplicationFiles---"
    And I upload attachment "Attachment.pdf" of type "Sovereign Immunity" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I click on "Edit" icon for "NFR - Corporation/Alaska Native Tribes Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "NFR ANCO Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationSharedRevenueNFR-ANCO @ancoFormSR @ancoUser
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type NFR with Shared Revenue user ANCO
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SR_ANCO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "ANCO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                           | Is Key Contact |
      | Alaska Native Corporations SPI | Checked        |
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachments" page block displayed
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:recipientorganizationApplicationFiles---"
    And I upload attachment "Attachment.pdf" of type "Sovereign Immunity" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I click on "Edit" icon for "NFR - Corporation Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "NFR ANCO Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationCAP-NPO @npoForm @npoUser
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type CAP user Non Profit Organization
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_CAP_NPO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "NPO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name               | Is Key Contact |
      | Non Profit Org SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "CAP - Non-Profit Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    When I enter "CAP NPO Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "AssistanceProgramBudget" by clicking "Edit" :
      | Category  | Amount |
      | Education | 1000   |
    And I edit the following rows inline in flex table with id "AssistanceProgramStatement" by clicking "Edit" :
      | Category    | Amount |
      | Electricity | 1000   |
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    And I get the "EGMS ID"
    When I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationSharedRevenueCAP-NPO @npoFormSR @npoUser
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type CAP with Shared Revenue user Non Profit Organization
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_CAP_SR_NPO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "NPO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name               | Is Key Contact |
      | Non Profit Org SPI | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "CAP - Non-Profit Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "CAP NPO Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationCAP-AlaskaNativeVillage @capForm @alaskaNativeVillageUser
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type CAP user Alaska Native Village
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_CAP_ANV"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "ANV" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | Alaska Native Village SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachments" page block displayed
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:recipientorganizationApplicationFiles---"
    And I wait for "2" seconds
    And I upload attachment "Attachment.pdf" of type "Sovereign Immunity" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I click on "Edit" icon for "CAP - Native Village Council Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "CAP ANV FormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "AssistanceProgramBudget" by clicking "Edit" :
      | Category  | Amount |
      | Education | 1000   |
    And I edit the following rows inline in flex table with id "AssistanceProgramStatement" by clicking "Edit" :
      | Category    | Amount |
      | Electricity | 1000   |
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationSharedRevenueCAP-AlaskaNativeVillage @capFormSR @alaskaNativeVillageUser @bugID-493449
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type CAP with Shared Revenue user Alaska Native Village
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_CAP_SR_ANV"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "ANV" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | Alaska Native Village SPI | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:recipientorganizationApplicationFiles---"
    And I wait for "2" seconds
    And I upload attachment "Attachment.pdf" of type "Sovereign Immunity" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I click on "Edit" icon for "CAP - Native Village Council Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "CAP ANV FormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationCAP-AlaskaNativeTribe @capForm @alaskaNativeTribeUser
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type CAP user Alaska Native Tribe
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_CAP_ANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "ANT" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click "Add" after selection of "Alaska Native Tribe SPI" by showing entries "All" in flex table with id "---applicationIntake:-:selectAssociateAppContacts---"
    When I close "Associate Contacts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                    | Is Key Contact | Project Role         |
      | Alaska Native Tribe SPI | Checked        | Authorized Signatory |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:recipientorganizationApplicationFiles---"
    And I wait for "2" seconds
    And I upload attachment "AttachmentTesting.pdf" of type "Sovereign Immunity" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I click on "Edit" icon for "CAP - Reserve Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "CAP ANT FormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "AssistanceProgramBudget" by clicking "Edit" :
      | Category  | Amount |
      | Education | 1000   |
    And I edit the following rows inline in flex table with id "AssistanceProgramStatement" by clicking "Edit" :
      | Category    | Amount |
      | Electricity | 1000   |
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
  #    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"

  @submitApplicationSharedRevenueCAP-AlaskaNativeTribe @capFormSR @alaskaNativeTribeUser
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for program type CAP with Shared Revenue user Alaska Native Tribe
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_CAP_SR_ANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "ANT" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click "Add" after selection of "Alaska Native Tribe SPI" by showing entries "All" in flex table with id "---applicationIntake:-:selectAssociateAppContacts---"
    When I close "Associate Contacts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                    | Is Key Contact | Project Role         |
      | Alaska Native Tribe SPI | Checked        | Authorized Signatory |
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachments" page block displayed
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:recipientorganizationApplicationFiles---"
    And I upload attachment "Attachment.pdf" of type "Sovereign Immunity" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I click on "Edit" icon for "CAP - Reserve Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "CAP ANT FormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "AssistanceProgramBudget" by clicking "Edit" :
      | Category  | Amount |
      | Education | 1000   |
    And I edit the following rows inline in flex table with id "AssistanceProgramStatement" by clicking "Edit" :
      | Category    | Amount |
      | Electricity | 1000   |
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"

  @VaishliD11
  Scenario: Validate once the Negotiation Request is completed then the record owner can view the record under Completed Negotiations Program type CDBG
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "Default"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "Default"
    And I created approved CDBGFDM on application "{SavedValue:Automation Runtime FDM Announcement}"

  @421675_Sanity
  Scenario: To verify that after clicking on Send button of Send Invitation modal, Email should be sent to user and success message should be displayed
    Given I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "474738292" in "---grantee_tableId:-:activeAccount---" panel
    When I click on "Edit" icon for "474738292" inside flex table with id "---grantee_tableId:-:activeAccount---"
  #  421733
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Full Name" as "Automation Runtime Contact" from flex table "---home:-:userContactsTableId---"
    Then I softly can see row level action button "Send Invitation" against "{SavedValue:Automation Runtime Contact}" in flex table with id "---home:-:userContactsTableId---"
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "2" seconds
    Then I see modal box with body "Send Invitation" is displayed
    And I click "Send" button in modal
    And I wait for "3" seconds
    Then I see the following messages in the page details :
      | Email Sent Successfully. |
    When I click modal button "Close"
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "1" seconds
    Then I refresh the page
    And I wait for "2" seconds
      #421675 #WIP #step not developed in LWC
    And I see the mail subject is as follows :
        """
        Sandbox: Notification from DCRAGrants: Invitation to be a User of DCRAGrants
        """
    Then I see the mail text is as follows :
        """
        Hello,

        You are invited to become an DCRAGrants user.

        Please click here to create your login account to register as a user in the DCRAGrants.

        You will be prompted to sign a Legal Disclaimer upon registration.

        Please do not reply to this system-generated email. You may contact the DCRAGrants Support Team at CAA@Alaska.Gov if you have any questions or need assistance with this task.

        Thank you,
        DCRA Grants and Funding
        """

  @421727_Sanity
  Scenario:To verify that Grant Administrator should be able to add the Primary users by the New button functionality of Contacts table
    Given I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "234567567" in "---grantee_tableId:-:activeAccount---" panel
    When I click on "View" icon for "234567567" inside flex table with id "---grantee_tableId:-:activeAccount---"
     #421727
    And I click on "Edit" in the page details
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Primary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Full Name" as "Automation Runtime Contact" from flex table "---home:-:userContactsTableId---"
    Then I softly see value "Primary" for title "Role" against the value "{SavedValue:Automation Runtime Contact}" inside table "---home:-:userContactsTableId---"

  @422414_Sanity @VaibhavSanity
  Scenario:  To verify GA user can updated EIN number and UEI Number
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY2" user
    When I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    Then I softly see "Description" page block displayed
    Then I softly see fields "DUNSExpirationDate__c" is visible
    Then I softly see fields "EINText__c" is visible
    Then I softly see fields "UEISam__c" is visible
    And I click on "Update Sam.Gov Info" in the page details
       #447428
    Then I softly see fields "UEISam__c" is visible
    Then I softly see fields "EINText__c" is visible
    When I clear the value from field "UEISam__c"
    When I enter value as "RH9EAN346PM9" into "UEI" on old form
    And I click modal button "Save and Close Modal"
    And I pause execution for "5" seconds
    Then I softly see fields "UEISam__c" is visible
       #421812
    Then I softly see "Sam.gov Verification" page block displayed
    And I click on top right button "Verify" in flex table with id "{grantee_tableId:organizationIntegrationDetail}"
    And I wait for "5" seconds
    Then I softly see "Sam.gov Verification" page block displayed

  @490566_sanity @VaibhavSanity
  Scenario: Verify that the PPC Code field is required if Program Code is present during activation of funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I wait for "5" seconds
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "17AWDDCDOA" into field "Program_Code__c"
    When I enter value "DA0101002" into field "Appropriation_code__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    When I enter value "3013" into field "Object_Code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    And I wait for "5" seconds
    #490526
    Then I softly see the text containing :
      | Overview Tab - PPC code cannot be blank if Program Code is entered |

  @490524_sanity @VaibhavSanity
  Scenario: Verify validation for empty Appropriation Code field while activating the funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "1004" into field "Fund_Code__c"
    When I enter value "3013" into field "Object_Code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    And I wait for "5" seconds
    Then I softly see the text containing :
      | Overview Tab - Appropriation Code is required to activate the funding account. |

  @490525_sanity @VaibhavSanity
  Scenario: Verify validation for empty Budget Fiscal Year field while activating the funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "1004" into field "Fund_Code__c"
    When I enter value "3013" into field "Object_Code__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see the text containing :
      | Overview Tab -Budget Fiscal Year is required to activate the funding account. |

  @490554_Sanity @VaibhavSanity
  Scenario: Verify validation for empty Funding Code field while activating the funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "StartDate__c"
    When I enter value "3600" into field "EndDate__c"
    When I enter value "2025" into field "Budget_Fiscal_Year__c"
    When I enter value "3013" into field "Object_Code__c"
    Then I enter value "DA0101002" into field "Appropriation_code__c"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    And I wait for "5" seconds
    Then I softly see the text containing :
      | Overview Tab - Fund Code is required to activate the funding account. |

  @439725_sanity @VaibhavSanity
  Scenario: Verify that user is able to see the below mention picklist options for 'Program Type' under 'program specific details' section
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
      #439725
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    Then I softly see "Program Specific Settings" page block displayed

  @427366_sanity @VaibhavSanity
  Scenario: To Verify Grantee Match % field is disable when optional is selected in ‘Grantee Match Required?’ field on Create Announcement window.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
      #427358
    Then I softly see "Announcement Specific Settings" page block displayed
    When I enter "Creation Modal" values from "Announcement_Field_Values.xlsx"
      #427366
    Then I see field "Grantee Match (%)" is not editable
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    Then I softly see "Announcement Specific Settings" page block displayed
    Then I softly see field "Grantee Match Required?" as "Optional"

  @404224_sanity @VaibhavSanity
  Scenario: Verify that Internal users see Validation while creating announcement if 'Is this a Shared Revenue Program?' is checked on associated program and Type is not 'Directed'
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
      #404224
    And I enter "CompetitiveSR" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I see the following messages in the page details :
      | Only Directed type announcements can be created for Shared Revenue Programs. |

  @404247_Sanity @VaibhavSanity
  Scenario:Verify that Internal users see "Grantee Match Required?" and "Grantee Match (%)" fields are hidden if 'Is this a Shared Revenue Program?' is checked on associated program while creating announcement
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly do not see "Financials" sub tab in page detail
    When I navigate to "Overview" sub tab
      #404247
    Then I softly see "Announcement Specific Settings" page block displayed
    Then I softly do not see fields "IsMatchRequired__c" is visible
    Then I softly do not see fields "GranteeMatch__c" is visible

  @408572_sanity @VaibhavSanity
  Scenario:Verify that GA user see below fields are Editable in Budget tab on Application edit layout created by GA user
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NPRA"
    Given I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I wait for "4" seconds
    And I click on top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I wait for "3" seconds
    And I enter value "Automation Direct Application" into field "Title__c"
    And I enter value "Automation Alaska Native Corporataion" into field "ExternalOrganization__c"
    And I enter value "{SavedValue:Automation Runtime Announcement Application Intake}" into field "Announcement__c"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    When I enter values into fields
      | Value                      | Field                     |
      | RN 34, Siege Social        | Addressline1__c           |
      | Address line2              | Addressline2__c           |
      | Anchorage                  | City__c                   |
      | Nome Census Area           | County__c                 |
      | 777                        | CongressionalDistrict1__c |
      | 12346                      | Zip4__c                   |
      | USA                        | Country__c                |
      | 4563                       | ZipCode4Extension__c      |
      | AK                         | State__c                  |
      | Automation New Application | Title__c                  |
      | Automation Data            | ProjectAbstract__c        |
      | Checked                    | Acknowledgment4__c        |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click "Add" after selection of "Automation Alaska NativeCorporation" by showing entries "All" in flex table with id "---applicationIntake:-:selectAssociateAppContacts---"
    When I close "Associate Contacts" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                                | Is Key Contact | Project Role         |
      | Automation Alaska NativeCorporation | Checked        | Authorized Signatory |
    And I wait for "2" seconds
    Then I softly see "check" symbol against the value "Automation Alaska NativeCorporation" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
      #408572
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    When I expand nested table containing column value "BP01"
    Then I can see row level action button "Edit" against "Construction" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    Then I softly see value "$1,000.00" for title "Budget" inside table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see value "$100.00" for title "Cash Match" inside table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see value "$100.00" for title "Non-Cash Match" inside table "---applicationIntake:-:budgetPeriodTableId---"

  @443403_Sanity @448861 @448811 @448838 @448841 @448836 @448868 @448865 @448855 @448845 @448824 @448830 @448839 @448846 @448828 @VaishaliD @VaibhavSanity
  Scenario: Application: Add new classification and validations for CDBG program
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "Default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachments" page block displayed
      #448811
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:cdbgApplicationFiles---"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification                   |
      | Joint Application/Cooperative Agreement      |
      | Public Notice                                |
      | Minutes of Meeting                           |
      | Map                                          |
      | Deed                                         |
      | Lease                                        |
      | Easement                                     |
      | Job Description                              |
      | Feasibility or Marketing Studies             |
      | Authority to Participate (Resolution)        |
      | Statement of Assurances and Certification    |
      | Applicant/Recipient Disclosure/Update Report |
      | ADA Certification                            |
      | Sovereign Immunity                           |
    When I click modal button "Close"
  #    And I navigate to "Forms and Files" sub tab
  #    Then I softly see "Application Files" page block displayed
  #    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
  #    And I upload attachment "Attachment.pdf" of type "Certification Regarding Debarment" from computer
  #    And I wait for "2" seconds
  #    When I click modal button "Close"
    And I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    And I click on "Edit" icon for "CDBG Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Application Part 1" sub tab
    When I enter "CDBG-Form1" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 2" sub tab
    When I enter "CDBG-Form2" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 3" sub tab
    When I enter "CDBG-Form Fields 3" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Validate" in the page details
    And I wait for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "2" seconds
      #448824 #448830 #448836 #448838 #448839 #448841 #448845 #448855 #448846 #448861 #448865 #448868 #448828
    Then I softly see the following messages in the page details contains:
      | Forms and Files Tab - Upload a Public Notice file in the attachments section.                                 |
      | Forms and Files Tab - Upload a Joint Application/Cooperative Agreement file in the attachments section.       |
      | Forms and Files Tab - Upload a Minutes of Meeting file in the attachments section.                            |
      | Forms and Files Tab - Upload a Map file in the attachments section.                                           |
      | Forms and Files Tab - Upload a Deed file in the attachments section.                                          |
      | Forms and Files Tab - Upload a Lease file in the attachments section.                                         |
      | Forms and Files Tab - Upload an Easement file in the attachments section.                                     |
      | Forms and Files Tab - Upload a Feasibility or Marketing Studies file in the attachments section.              |
      | Forms and Files Tab - Upload a Job Description file in the attachments section.                               |
      | Forms and Files Tab - Upload an Authority to Participate (Resolution) file in the attachments section.        |
      | Forms and Files Tab - Upload a Statement of Assurances and Certification file in the attachments section.     |
      | Forms and Files Tab - Upload an Applicant/Recipient Disclosure/Update Report file in the attachments section. |
      | Forms and Files Tab - Upload an ADA Certification file in the attachments section.                            |

  @407479_Sanity @VaibhavSanity
  Scenario:Verify that Internal users see Validations related to below GovGrants fields if data in Excel for that field is not correct
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                    | Is Key Contact |
      | Alaska Native Tribe SPI | Checked        |
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachments" page block displayed
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:recipientorganizationApplicationFiles---"
    And I upload attachment "Attachment.pdf" of type "Sovereign Immunity" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I click on "Edit" icon for "CAP - Reserve Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    And I wait for "2" seconds
    When I enter "CAP ANT FormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "AssistanceProgramBudget" by clicking "Edit" :
      | Category  | Amount |
      | Education | 1000   |
    And I edit the following rows inline in flex table with id "AssistanceProgramStatement" by clicking "Edit" :
      | Category    | Amount |
      | Electricity | 1000   |
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"

  @438788_Sanity @VaibhavSanity
  Scenario:Applications: Require Sovereign Immunity document for specific organization types
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachments" page block displayed
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "Sovereign Immunity" from computer

  @427435_Sanity @VaibhavSanity
  Scenario: To verify user can Submit application when user not entered ‘Cash-Match’, ’Non-Cash match’ details in application budget which is created for an opportunity with optional match required.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Then I refresh the page
    When I navigate to "Financials" sub tab
    Then I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                    | Pre-Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 2000            |
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I wait for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I refresh the page
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I wait for "5" seconds
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 90         | 350      |
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I perform quick search for "Acquisition / Lease" in "---announcement:-:selectProgramBudgetCategory---" panel
    When I click "Associate" after selection of "Acquisition / Lease" in the table "---announcement:-:selectProgramBudgetCategory---"
    When I close "Associate Budget Categories" modal by clicking the top right x button
    And I wait for "2" seconds
    And I enter value "Justified" into field "{amendment:JustificationFieldID}"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    And I save the field containing "EGMS ID" as "AnnouncementId"
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnouncementId}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnouncementId}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name       | Budget |
      | Acquisition / Lease | 1000   |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    And I click on "View" icon for "NFR - 1st Class Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "5" seconds
    And I click on "Edit" in the page details
    When I enter "NFRCity1FormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Validate" in the page details
    And I switch to parent tab
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @427510_Sanity @VaibhavSanity
  Scenario: To verify user can Submit application after Revision/Negotiation without entered ‘Cash-Match’, ’Non-Cash match’ details in application budget which is created for an opportunity with optional match required.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Negotiation" and properties "GRANTEE_MATCH_OPTIONAL"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Negotiation}" on announcement "{SavedValue:Automation Runtime Announcement Application Negotiation}" with properties "GRANTEE_MATCH_OPTIONAL"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name       | Budget |
      | Acquisition / Lease | 1000   |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    And I click on "Edit" icon for "CDBG Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Application Part 1" sub tab
    When I enter "CDBG-Form1" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 2" sub tab
    When I enter "CDBG-Form2" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 3" sub tab
    When I enter "CDBG-Form Fields 3" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Validate" in the page details
    And I wait for "3" seconds
    And I switch to parent tab
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Field Name      | Value                         |
      | Review Decision | Revise / Negotiate            |
      | Review Comments | Please revise the application |
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application Negotiation}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime Announcement Application Negotiation}" boxes in flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I click on "Request Negotiation" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "2" seconds
    And I pause execution for "10" seconds
    When I navigate to "Applications" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationIntake:-:grantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    When I save the field labeled "EGMS ID" as "ApplicationId"
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    When  I enter "Edit_2" values from "Negotiations_Field_Values.xlsx"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---negotiation:-:NegotiationFormsTableId---" by clicking "Edit" :
      | Name                  | Needs Negotiation |
      | CDBG Application Form | Checked           |
    When I click on "Save" in the page details
    And I wait for "4" seconds
    When I click on "Send to Grantee" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ApplicationId}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:ApplicationId}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name       | Budget |
      | Acquisition / Lease | 1500   |
    And I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submit to Grantor"

  @446116_Sanity @VaibhavSanity
  Scenario: Verify that user should be able to see SME to ASC changes throughout the review process
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application}" on announcement "{SavedValue:Automation Runtime Announcement Application}" with properties "default"
    And I delete the record "{SavedValue:Automation Runtime Announcement Application}" from the object "FDM"
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    When I save the field labeled "EGMS ID" as "AppEGMSID"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    Then I softly see value "ASC Review" for title "Step Name" inside table "---announcement:-:reviewStepTableId---"
    When I click on "View" icon for "ASC Review" inside flex table with id "---announcement:-:reviewStepTableId---"
    And I switch to parent tab
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    When I check "{SavedValue:Automation Runtime Announcement Application}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEGMSID}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
      #463754
    Then I see below options in "What is Project Complexity?" dropdown
      | Low    |
      | Medium |
      | High   |
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    And I switch to parent tab
    Then I softly see value "ASC Review" for title "Step Name" inside table "---announcement:-:reviewStepTableId---"
    When I click on "View" icon for "ASC Review" inside flex table with id "---announcement:-:reviewStepTableId---"

  @448517_Sanity @VaibhavSanity
  Scenario: To verify sections on CDBG ASC Score Sheet Form
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    And I wait for "5" seconds
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I wait for "5" seconds
    And I delete the record "{SavedValue:Automation Runtime Announcement Application}" from the object "FDM"
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    When I save the field labeled "EGMS ID" as "AppEGMSID"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEGMSID}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Fully Fund"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    And I switch to parent tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    Then I softly see value "ASC Review" for title "Step Name" inside table "---announcement:-:reviewStepTableId---"
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | CDBG ASC Score Sheet Form | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    And I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEGMSID}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    And I click on "Edit" in the page details
    Then I softly see "1. Project Description & Selection / Citizen Participation Plan - Max Points 15 (Weight: 15%)" page block displayed
    Then I softly see "2. Project Plan / Readiness - Max Points 25 (Weight: 25%)" page block displayed
    Then I softly see "3. Project Impact - Max Points 25 (Weight: 25%)" page block displayed
    Then I softly see "4. Budget / Match / Non-Cash Match - Max Points 25 (Weight: 25%)" page block displayed
    Then I softly see "5. Administrative Capabilities - Max Points 10 (Weight: 10%)" page block displayed

  @465216_Sanity @VaibhavSanity
  Scenario: Verify that, user is able to see the validation message after clicking the create award button on recommended application section, when the grantee's external organization SAM.Gov Expiration Date is expired
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I wait for "5" seconds
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    And I wait for "5" seconds
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I wait for "5" seconds
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "All Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"

  @465237_Sanity @VaibhavSanity
  Scenario: Verify that, user is able to see validation message After clicking continue button on create grant modal, when the grantee's external organization SAM.Gov Expiration Date is expired
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_Directed" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see the following messages in the page details :
      | The grantees SAM.Gov Expiration Date is expired |

  @497721_Sanity @VaibhavSanity
  Scenario: As a grantor, verify that mention validation should be come if recommended budget is empty before creating an award on approved FDM
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I wait for "5" seconds
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I wait for "5" seconds
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "All Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I navigate to "Funding Decision Memo" sub tab
    And I wait for "9" seconds
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    Then I softly see the following messages in the page details contains:
      | Recommended Application Section-Provide a value greater than zero dollar for recommended budget for the application that is recommended for subaward. |

  @410019_Sanity @VaibhavSanity
  Scenario: Verify that External users DO NOT see 'Amendments' section in Management tab for the Award created from Shared Revenue Program
    And I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NFR_CITY2"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NFR_CITY2"
    And I wait for "5" seconds
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I wait for "5" seconds
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I enter value "Automation Test Description" into field "GrantAwardDescription__c"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "SubawardEGMSID"
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardEGMSID}" in "---amendment:-:recipientsSubawardTableId---" panel
    When I click on "View" icon for "{SavedValue:SubawardEGMSID}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" with wait for record
    And I navigate to "Management" sub tab
    Then I softly do not see "Amendments" in flex table header "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"

  @410018_Sanity @VaibhavSanity
  Scenario: Verify that Internal users DO NOT see 'Amendments' section in Management tab for the Award created from Shared Revenue Program
    And I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NFR_CITY2"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NFR_CITY2"
    And I wait for "5" seconds
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I wait for "5" seconds
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title                            | Grant Number |
      | {SavedValue:Automation Runtime Announcement} | 1234         |
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I navigate to "Subawards" sub tab
    And I enter value "Automation Test Description" into field "GrantAwardDescription__c"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "SubawardEGMSID"
    And I navigate to "Management" sub tab
    Then I softly do not see "Amendment Requests" in flex table header "---amendment:-:amendmentRequestTableId---"

  @430017_Sanity @VaibhavSanity
  Scenario: To verify that once GA and DCCED have clicked "Sign Warrant" and acknowledged (two records in the table), the award should be flag as "Warrant Signed"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_CAP"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_CAP"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:externalPendingTasktableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---home:-:externalPendingTasktableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Budget" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Audit/Certified Financial Statement" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Resolution" from computer
    When I click modal button "Close"
    When I click on "Submit for Document Verification" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:planningPendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---home:-:planningPendingTaskTableId---"
    When I click on "Sign Warrant" in the page details
    And I enter value "Checked" into field "AcknowledgeByDCCED_DCRA__c"
    And I enter value "Automation Description" into field "DCCEDComments_DCRA__c"
    When I click on "Submit for Document Verification" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:planningPendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---home:-:planningPendingTaskTableId---"
    When I click on "Sign Warrant" in the page details
    And I enter value "Checked" into field "AcknowledgeByDCCED_DCRA__c"
    And I enter value "Automation Description" into field "DCCEDComments_DCRA__c"
    Then I softly see field "IsWarrantSigned_DCRA__c" as "checked"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:planningPendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---home:-:planningPendingTaskTableId---"
    Then I softly see field "IsWarrantSigned_DCRA__c" as "checked"

  @463850_Sanity
  Scenario: CAP-->As a GA, verify that validation should be occur for "Budget" Classification If program is Shared Revenue and Program Type is "CAP" when award is in 'Activated' State
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_CAP"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_CAP"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:planningPendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---home:-:planningPendingTaskTableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Audit/Certified Financial Statement" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Resolution" from computer
    When I click modal button "Close"
    When I click on "Submit for Document Verification" in the page details
    Then I see the following messages in the page details :
      | Files Tab - Upload a file with Budget Classification to Award Files section. |

  @463858_Sanity
  Scenario: CAP-->As a GA, verify that validation should be occur for "Audit/Certified Financial Statement" Classification If program is Shared Revenue and Program Type is "CAP" when award is in 'Activated' State
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:externalPendingTasktableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---home:-:externalPendingTasktableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Budget" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Resolution" from computer
    When I click modal button "Close"
    When I click on "Submit for Document Verification" in the page details
    Then I see the following messages in the page details :
      | Files Tab - Upload a file with Audit/Certified Financial Statement Classification to Award Files section. |

  @463870_Sanity
  Scenario: CAP-->As a GA, verify that validation should be occur for "Resolution" Classification If program is Shared Revenue and Program Type is "CAP" when award is in 'Activated' State
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:externalPendingTasktableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---home:-:externalPendingTasktableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Budget" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Audit/Certified Financial Statement" from computer
    When I click modal button "Close"
    When I click on "Submit for Document Verification" in the page details
    Then I see the following messages in the page details :
      | Files Tab - Upload a file with Resolution Classification to Award Files section. |

  @463849_Sanity @463862_Sanity @463852_Sanity
  Scenario: CAP-->As a Grantee, verify that validation should be occur for 'Budget' Classification If program is Shared Revenue and Program Type is "CAP" when award is in 'Activated' State
  |CAP-->As a Grantee, verify that validation should be occur for "Audit/Certified Financial Statement" Classification If program is Shared Revenue and Program Type is "CAP" when award is in 'Activated' State|
  |CAP-->As a Grantee, verify that validation should be occur for "Resolution" Classification If program is Shared Revenue and Program Type is "CAP" when award is in 'Activated' State|
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:externalPendingTasktableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---home:-:externalPendingTasktableId---"
    And I navigate to "Files" sub tab
      #463849_Sanity
    When I click on "Submit for Document Verification" in the page details
      | Files Tab - Upload a file with Budget Classification to Award Files section. |
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Budget" from computer
    When I click modal button "Close"
    #463852_Sanity
    When I click on "Submit for Document Verification" in the page details
      | Files Tab - Upload a file with Audit/Certified Financial Statement Classification to Award Files section. |
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Audit/Certified Financial Statement" from computer
    When I click modal button "Close"
      #463862_Sanity
    When I click on "Submit for Document Verification" in the page details
    Then I see the following messages in the page details :
      | Files Tab - Upload a file with Resolution Classification to Award Files section. |

  @463884_Sanity @463881_Sanity
  Scenario: CAP-->Verify that task should be create to DCCED user If program is Shared Revenue and Program Type is "CAP"
  |CAP-->Verify that task should be create to GA user If program is Shared Revenue and Program Type is "CAP"|
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:externalPendingTasktableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---home:-:externalPendingTasktableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Budget" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Audit/Certified Financial Statement" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Resolution" from computer
    When I click modal button "Close"
    When I click on "Submit for Document Verification" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:planningPendingTaskTableId---" panel
    Then I softly see value "Sign Warrant" for title "Task Type" inside table "---home:-:planningPendingTaskTableId---"
      #463881_Sanity
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:planningPendingTaskTableId---" panel
    Then I softly see value "Sign Warrant" for title "Task Type" inside table "---home:-:planningPendingTaskTableId---"

  @463891_Sanity
  Scenario: CAP-->Verify that email notification should be create to DCCED user If program is Shared Revenue and Program Type is "CAP"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I checkout to yopmail with mailid "automationpm@yopmail.com"
    And I pause execution for "1" seconds
    Then I refresh the page
    And I wait for "2" seconds
    And I see the mail subject is as follows :
        """
        Sandbox: Notification from DCRAGrants: Subaward {SavedValue:Automation Runtime Announcement} has been Issued – Sign Warrant
        """
    Then I see the mail text is as follows :
        """
       Hello,

       This email to notify you that you that award {SavedValue:Automation Runtime Announcement} has been issued and will require warrant signature.

       Log in to the EGMS to view the award and perform the warrant signature task.

       Please do not reply to this system-generated email. You may contact the DCRAGrants Support Team at CAA@alaska.gov if you have any questions or need assistance with this task.

      Thank you.
      DCRA Grants and Funding
      """

  @463888_Sanity
  Scenario: CAP-->Verify that email notification should be create to GA user If program is Shared Revenue and Program Type is "CAP"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcemcent}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Budget" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Audit/Certified Financial Statement" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Resolution" from computer
    When I click modal button "Close"
    When I click on "Submit for Document Verification" in the page details
    And I checkout to yopmail with mailid "automationexealaska@yopmail.com"
    And I pause execution for "1" seconds
    Then I refresh the page
    And I wait for "2" seconds
    And I see the mail subject is as follows :
        """
        Sandbox: Notification from DCRAGrants: Subaward {SavedValue:Automation Runtime Announcement} has been Issued – Sign Warrant
        """
    Then I see the mail text is as follows :
        """
       Hello,

       This email to notify you that you that award {SavedValue:Automation Runtime Announcement} has been issued and will require warrant signature.

       Log in to the EGMS to view the award and perform the warrant signature task.

       Please do not reply to this system-generated email. You may contact the DCRAGrants Support Team at CAA@alaska.gov if you have any questions or need assistance with this task.

      Thank you.
      DCRA Grants and Funding
      """

  @463894_Sanity
  Scenario:Non-CAP-->Verify that email notification should be create to DCCED user If program is Shared Revenue and Program Type is NOT "CAP"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_SFT_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_SFT_SR"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I checkout to yopmail with mailid "automationpm@yopmail.com"
    And I pause execution for "1" seconds
    Then I refresh the page
    And I wait for "2" seconds
    And I see the mail subject is as follows :
        """
        Sandbox: Notification from DCRAGrants: Subaward {SavedValue:Automation Runtime Announcement} has been Issued – Sign Warrant
        """
    Then I see the mail text is as follows :
        """
       Hello,

       This email to notify you that you that award {SavedValue:Automation Runtime Announcement} has been issued and will require warrant signature.

       Log in to the EGMS to view the award and perform the warrant signature task.

       Please do not reply to this system-generated email. You may contact the DCRAGrants Support Team at CAA@alaska.gov if you have any questions or need assistance with this task.

      Thank you.
      DCRA Grants and Funding
      """

  @463892_Sanity
  Scenario: Non-CAP-->Verify that email notification should be create to GA user If program is Shared Revenue and Program Type is NOT "CAP"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_SFT_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_SFT_SR"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I checkout to yopmail with mailid "automationexealaska@yopmail.com"
    And I pause execution for "1" seconds
    Then I refresh the page
    And I wait for "2" seconds
    And I see the mail subject is as follows :
        """
        Sandbox: Notification from DCRAGrants: Subaward {SavedValue:Automation Runtime Announcement} has been Issued – Sign Warrant
        """
    Then I see the mail text is as follows :
        """
       Hello,

       This email to notify you that you that award {SavedValue:Automation Runtime Announcement} has been issued and will require warrant signature.

       Log in to the EGMS to view the award and perform the warrant signature task.

       Please do not reply to this system-generated email. You may contact the DCRAGrants Support Team at CAA@alaska.gov if you have any questions or need assistance with this task.

      Thank you.
      DCRA Grants and Funding
      """

  @469495_Sanity @469491_Sanity
  Scenario:Non-CAP-->Verify that Is Warrant Signed? filed will be updated by system after DCCED signs warrant program is flagged as Shared Revenue and Shared Revenue and Program Type is NOT "CAP"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_SFT_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_SFT_SR"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:externalPendingTasktableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---home:-:externalPendingTasktableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Budget" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Audit/Certified Financial Statement" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---paymentRequest:-:ExternalAwardFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Resolution" from computer
    When I click modal button "Close"
    When I click on "Submit for Document Verification" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:planningPendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---home:-:planningPendingTaskTableId---"
    When I click on "Sign Warrant" in the page details
    And I enter value "Checked" into field "AcknowledgeByDCCED_DCRA__c"
    And I enter value "Automation Description" into field "DCCEDComments_DCRA__c"
    When I click on "Submit for Document Verification" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:planningPendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---home:-:planningPendingTaskTableId---"
    When I click on "Sign Warrant" in the page details
    And I enter value "Checked" into field "AcknowledgeByDCCED_DCRA__c"
    And I enter value "Automation Description" into field "DCCEDComments_DCRA__c"
    Then I softly see field "IsWarrantSigned_DCRA__c" as "checked"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---home:-:planningPendingTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---home:-:planningPendingTaskTableId---"
    Then I softly see field "IsWarrantSigned_DCRA__c" as "checked"

  @411973_Sanity
  Scenario: Verify that External Grantee owner of award see Validation while Accepting the Award in 'Sent to Grantee after Approval' state for Internal Program with Primary Funder Type as Federal if EIN is not present for their organization
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_NFR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_NFR"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title                            | Grant Number |
      | {SavedValue:Automation Runtime Announcement} | 1234         |
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "GrantorActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    And I wait for "5" seconds
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role         | Is Key Contact |
      | Automation City1 SPI | Authorized Signatory | Checked        |
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1000        | 1                     |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsPendingTableId---"
    When I click on "Accept" in the page details
    Then I see the following messages in the page details :
      | EIN is required to accept awards for federal grants. Organization Profile needs to be updated |

  @411974_Sanity
  Scenario: Verify that External Grantee owner of award see Validation while Accepting the Award in 'Sent to Grantee after Approval' state for Internal Program with Primary Funder Type as Federal if UEI is not present for their organization
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_NFR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_NFR"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title                            | Grant Number |
      | {SavedValue:Automation Runtime Announcement} | 1234         |
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "GrantorActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    And I wait for "5" seconds
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role         | Is Key Contact |
      | Automation City1 SPI | Authorized Signatory | Checked        |
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1000        | 1                     |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsPendingTableId---"
    When I click on "Accept" in the page details
    Then I see the following messages in the page details :
      | UEI is required to submit subaward for federal grants.                          |
      | Organization Profile needs to be updated and Verify clicked on Sam.Gov section. |

  @411968_Sanity @411970_Sanity
  Scenario: Verify that External Grantee owner of award see Validation while Accepting the Award in 'Sent to Grantee' state for Internal Program with Primary Funder Type as Federal if UEI is not present for their organization
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "ORGANIZATION_WITHOUT_UEI"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "ORGANIZATION_WITHOUT_UEI"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title                            | Grant Number |
      | {SavedValue:Automation Runtime Announcement} | 1234         |
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "GrantorActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    And I wait for "5" seconds
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1000        | 1                     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I click on "Send to Grantee" in the page details
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:recipientsSubawardTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:recipientsSubawardTableId---"
    When I click on "Accept" in the page details
    Then I see the following messages in the page details :
      | UEI is required to submit subaward for federal grants.                          |
      | Organization Profile needs to be updated and Verify clicked on Sam.Gov section. |

  @User_Story_39835 @429714_Sanity @429316_Sanity
  Scenario: Award: GR & SR: Do not copy match columns at 'Create Subaward' for optional match
  |To verify when ‘Grantee Match Required?’ is set as ‘optional’, then match related columns are not showing in Periodic Renewal Amendment Request|
  |To verify when ‘Grantee Match Required?’ is set as ‘optional’, then match related columns are not showing created Award's budget grid  |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "GRANTEE_MATCH_OPTIONAL"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "GRANTEE_MATCH_OPTIONAL"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"

  @User_Story_39835 @429633_Sanity
  Scenario: To verify when ‘Grantee Match Required?’ is set as ‘optional’, then match related columns are not showing in Budget Redirection Amendment Request
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "GRANTEE_MATCH_OPTIONAL"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "GRANTEE_MATCH_OPTIONAL"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:budgetChangeTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:budgetChangeTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:budgetChangeTableId---"

  @User_Story_39835 @429314_Sanity
  Scenario: To verify when ‘Grantee Match Required?’ is set as ‘optional’, then match related columns are not showing in created Grant's Payments Summary grid
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "GRANTEE_MATCH_OPTIONAL"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "GRANTEE_MATCH_OPTIONAL"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I navigate to "Actuals" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"

  @429638_Sanity
  Scenario: To verify when ‘Grantee Match Required?’ is set as ‘optional’, then match related columns are not showing in Funding Change Amendment Request
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "GRANTEE_MATCH_OPTIONAL"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "GRANTEE_MATCH_OPTIONAL"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly do not see "Cash Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Total Match" in flex table header "---amendment:-:grantorBudgetChangeTableId---"

  @429320_Sanity
  Scenario: To verify when ‘Grantee Match Required?’ is set as ‘optional’, then match related columns are not copied on Award's Payments Summary grid
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "GRANTEE_MATCH_OPTIONAL"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "GRANTEE_MATCH_OPTIONAL"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---amendment:-:recipientsAwardPaymentRequestsTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "AdvancePaymentID"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "{SavedValue:AdvancePaymentID}" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly do not see "Cash Match" in flex table header "---paymentRequest:-:budgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---paymentRequest:-:budgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---paymentRequest:-:budgetTableId---"

  @429313_Sanity
  Scenario: To verify when ‘Grantee Match Required?’ is set as ‘optional’, then match related columns are not showing in Grants budget grid
    Given I activated standalone subaward "Automation Runtime Award" with properties "NO_SR_MATCH_REQUIRED" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:grantsBudgetCategoryGrantor---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:grantsBudgetCategoryGrantor---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:grantsBudgetCategoryGrantor---"

  @429264_Sanity
  Scenario: To verify when ‘Grantee Match Required?’ is set as ‘optional’, then match related columns of application are not copied on newly created Award's budget grid
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "GRANTEE_MATCH_OPTIONAL"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "GRANTEE_MATCH_OPTIONAL"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Budget" sub tab
    Then I softly do not see "Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"
    Then I softly do not see "Total Match" in flex table header "---subAwardStandAlone:-:subAwardBudgetTableId---"

  @429269_Sanity @429254_Sanity
  Scenario: To verify when ‘Grantee Match Required?’ is set as ‘optional’, then match related columns of application are not copied on newly created Award's Payments Summary grid
  |To verify when ‘Grantee Match Required?’ is set as ‘optional’, then match related columns of application are not copied on newly created Grant's Payments Summary grid|
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "GRANTEE_MATCH_OPTIONAL"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "GRANTEE_MATCH_OPTIONAL"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Actuals" sub tab
    Then I do not see "Cash Match" in flex table header "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"
    Then I do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"
    Then I do not see "Total Match" in flex table header "---subAwardStandAlone:-:paymentSummaryBudgetTableId---"
    #429254_Sanity
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Actuals" sub tab
    And I expand nested table containing column value "BP01"
    Then I do not see "Cash Match" in flex table header "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---"
    Then I do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---"
    Then I do not see "Total Match" in flex table header "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---"

  @429253_Sanity
  Scenario: To verify when ‘Grantee Match Required?’ is set as ‘optional’, then match related columns of application are not copied on newly created Grants budget grid
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "GRANTEE_MATCH_OPTIONAL"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "GRANTEE_MATCH_OPTIONAL"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Actuals" sub tab
    And I expand nested table containing column value "BP01"
    Then I do not see "Cash Match" in flex table header "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---"
    Then I do not see "Non-Cash Match" in flex table header "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---"
    Then I do not see "Total Match" in flex table header "---subAwardStandAlone:-:paymentSummaryFocusAreaTableid---"

  @470299_Sanity  @470310_Sanity
  Scenario: Verify that GA user is able to 'Accept' award without any validation when award is in 'sent to Grantee' state (before Approval)
  |Verify that GA user will be able to see the new classification "Award Agreement" on the 'All Files' Modal under files tab in both 'Sent to Grantee' state|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter in modal "DirectGrantSRCreation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter in modal "DirectGrantSR_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly see that "Status" is in "Draft" status
    And I enter value "Automation Testing" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    And I check "All" boxes in flex table with id "---subAwardStandAlone:-:keyContactsTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:keyContactsTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role             |
      | Automation City1 SPI | Project Director/Manager |
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Accept" in the page details
    Then I softly see that "Status" is in "Accepted" status
      #470310_Sanity
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Certification | Insurance | Legal Document | Permits | Other | Budget | Audit/Certified Financial Statement | Resolution | Award Agreement |

  @470320_Sanity
  Scenario: Verify that validation should be displayed to GA, if GA user has not uploaded file with "Award Agreement" classification
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter in modal "DirectGrantSRCreation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter in modal "Grant_Edition2" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly see that "Status" is in "Draft" status
    And I enter value "Automation Testing" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    And I check "All" boxes in flex table with id "---subAwardStandAlone:-:keyContactsTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:keyContactsTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role         | Is Key Personnel |
      | Automation City1 SPI | Authorized Signatory | Checked          |
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone2" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I perform quick search for "Permanent Automation Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "Permanent Automation Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1000        | 1                     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Shared Revenue  | 1000         |
    And I wait for "2" seconds
    And I refresh the page
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    When I click on "Accept after Approval" in the page details
    Then I see the following message in the page details contains:
      | Upload at least one file with a classification of Award Agreement to the files tab. |

  @480029_Sanity
  Scenario: Verify that internal user is able to see "Grantee Match Required" field is hidden if 'Is this a Shared Revenue Program?' is checked on associated program when Creating Direct Grant
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter in modal "DirectGrantSRCreation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    Then I softly see that "Required Match %" rendered in view mode only

  @470837_Sanity @470832_Sanity
  Scenario: To verify that Validation should occur for 'Grant Number' field on Create Direct Grant Modal if Grant Number field is blank
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter in modal "DriectGrant_BlankGrantNo" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    Then I see the following message in the page details contains:
      | To Save, Grant Number is required. |
    #470832_Sanity
    When I enter in modal value "ABCDEFG-*HIJKLM" into field "AL_GrantNumber__c"
    And I click modal button "Continue"
    Then I see the following message in the page details contains:
      | Grant Number must be 12 characters without special characters. |

  @482252_Sanity
  Scenario: To verify that Validation should occur for 'Grant Number' field on FDM Layout if Grant Number field is blank
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "All Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I pause execution for "3" seconds
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    Then I see the following message in the page details contains:
      | Grant Number is required to create an award |

  @464754_Sanity
  Scenario: Verify that GA user see Validation while Accepting the Award in 'Sent to Grantee After Approval' state for Internal Program with Primary Funding Type as Federal if UEI is not present for their organization for Direct Grant
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter in modal "DirectGrantSRCreation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter in modal "Grant_Edition2" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly see that "Status" is in "Draft" status
    And I enter value "Automation Testing" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    And I check "All" boxes in flex table with id "---subAwardStandAlone:-:keyContactsTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:keyContactsTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role         | Is Key Personnel |
      | Automation City1 SPI | Authorized Signatory | Checked          |
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone2" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I perform quick search for "Permanent Automation Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "Permanent Automation Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1000        | 1                     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Shared Revenue  | 1000         |
    And I wait for "2" seconds
    And I refresh the page
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Accept after Approval" in the page details
    Then I see the following message in the page details contains:
      | UEI is required to accept awards for grants. Organization Profile needs to be updated and Verify clicked on Sam.Gov section. |

  @411981_Sanity
  Scenario: Verify that GA user see Validation while Accepting the Award in 'Sent to Grantee After Approval' state for Internal Program, if UEI is not present for their organization
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role         |
      | Automation City1 SPI | Authorized Signatory |
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1                     |
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Accept after Approval" in the page details
    Then I see the following message in the page details contains:
      | UEI is required to accept awards for grants. Organization Profile needs to be updated and Verify clicked on Sam.Gov section. |

  @411976_Sanity
  Scenario: Verify that GA user see Validation while Accepting the Award in 'Sent to Grantee' state for Internal Program with Primary Funding Type as Federal if EIN is not present for their organization
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Accept" in the page details
    Then I see the following message in the page details contains:
      | EIN is required to accept awards for federal grants. Organization Profile needs to be updated. |

  @411977_Sanity
  Scenario: Verify that GA user see Validation while Accepting the Award in 'Sent to Grantee' state for Internal Program, if UEI is not present for their organization
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Accept" in the page details
    Then I see the following message in the page details contains:
      | UEI is required to accept awards for grants. Organization Profile needs to be updated and Verify clicked on Sam.Gov section. |

  @464751_Sanity
  Scenario: Verify that GA user see Validation while Accepting the Award in 'Sent to Grantee' state for Internal Program, if UEI is not present for their organization for Direct Grant
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter in modal "DirectGrantSRCreation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter in modal "Grant_Edition2" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly see that "Status" is in "Draft" status
    And I enter value "Automation Testing" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    And I check "All" boxes in flex table with id "---subAwardStandAlone:-:keyContactsTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:keyContactsTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role             | Is Key Personnel |
      | Automation City1 SPI | Project Director/Manager | Checked          |
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Accept" in the page details
    Then I see the following message in the page details contains:
      | UEI is required to accept awards for grants. Organization Profile needs to be updated and Verify clicked on Sam.Gov section. |

  @481031_Sanity @481034_Sanity
  Scenario: Verify that the Vendor ID is missing validation for the Organization by clicking the Activate button on the Award layout when the status is Accepted after Approval for Direct Grant.
  |Verify that the Vendor ID is missing validation for the Organization by clicking the Activate button on the Award layout when Vendor ID is Added for Direct Grant.|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter in modal "DirectGrantSRCreation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter in modal "Grant_Edition2" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly see that "Status" is in "Draft" status
    And I enter value "Automation Testing" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    And I check "All" boxes in flex table with id "---subAwardStandAlone:-:keyContactsTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:keyContactsTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role             | Is Key Personnel |
      | Automation City1 SPI | Project Director/Manager | Checked          |
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone2" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I perform quick search for "Permanent Automation Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    And I wait for "3" seconds
    When I click "Associate" after selection of "Permanent Automation Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1000        | 1                     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Shared Revenue  | 1000         |
    And I wait for "2" seconds
    And I refresh the page
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Award Agreement" from computer
    When I click modal button "Close"
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Activate" in the page details
    Then I see the following message in the page details contains:
      | Grantee Organization Profile: Vendor ID must be added before activating an award. |

  @481025_Sanity
  Scenario:Verify that the Vendor ID is missing validation for the Organization by clicking the Activate button on the Award layout when the status is Accepted after Approval for Standard Grant.
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role         |
      | Automation City1 SPI | Authorized Signatory |
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1                     |
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Award Agreement" from computer
    When I click modal button "Close"
    When I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Activate" in the page details
    Then I see the following message in the page details contains:
      | Grantee Organization Profile: Vendor ID must be added before activating an award. |

  @489856_Sanity @489826_Sanity
  Scenario: Verify the validation If Both Business License Number and Corporate Entity Number are inactive
  |Verify the validation if Business License Number and Coporate Entity Number fields are empty while activating award|
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role         |
      | Automation City1 SPI | Authorized Signatory |
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1                     |
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Award Agreement" from computer
    When I click modal button "Close"
    When I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Activate" in the page details
    Then I see the following message in the page details contains:
      | The Business License or Corporate Entity number must be active on the grantee's Organization Profile. |

  @489863_Sanity
  Scenario: Verify Award should be activated successfully Either Business License Number or Corporate Entity Number are active
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                 | Project Role         |
      | Automation City1 SPI | Authorized Signatory |
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Commodity Line Number |
      | {SavedValue:fundingAccount} | 1                     |
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "SubawardID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---subAwardStandAlone:-:addFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Award Agreement" from computer
    When I click modal button "Close"
    When I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I perform quick search for "{SavedValue:SubawardID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:SubawardID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"

  @470327_Sanity
  Scenario: To verify that GA user is able to submit Budget Redirection Amendment Request
    Given I activated standalone subaward "Automation Runtime Award" with properties "SHARED_REVENUE_PROGRAM" of type "Directed"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "Justified" into field "{amendment:JustificationFieldID}"
    When I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @412670_Sanity
  Scenario: Verify that Amendment Request created by GA user is shared with subrecipient users of that respective grantee organization present on Award
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "Automation Justification" into field "{amendment:JustificationFieldID}"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentID"
    When I re-login to "Grants Portal" app as "City1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardFromFDM:-:RecipientGrantsPendingTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardFromFDM:-:RecipientGrantsPendingTableId---"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit to Grantor" in page detail
    Then I softly see field "AmendmentType__c" as "Budget Redirection"

  @469132_Sanity
  Scenario: Verify that Grantor user cannot see Budget Redirection amendment type on active Award to create the Amendment Request
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    Then I do not see multipicklist field "AmendmentType__c" contains value "Budget Redirection" under list "Available"

  @412864_Sanity
  Scenario: Verify that Grantee user see only "Budget Redirection" as amendment type on active Award to create the Amendment Request
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    Then I see multipicklist field "AmendmentType__c" contains value "Budget Redirection" under list "Available"

  @470312_Sanity @470346_Sanity
  Scenario: As a GA user, verify "New" button in the Corrective Action section under Reports and Outcomes tab on the Desk Review details layout
  |verify GA user should be able to add Corrective Actions successfully with correct value |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Management" sub tab
    When I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Desk Review" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I click on "Edit" icon for "Site Visit/Desk Review Report" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "sitevisit" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I switch to parent tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    And I save the field labeled "EGMS ID" as "DeskreviewID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Desk Review Reports - All"
    And I perform quick search for "{SavedValue:DeskreviewID}" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "{SavedValue:DeskreviewID}" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Finding"
    Then I can see top right button "New" in flex table with id "---deskreview:-:correctiveTableId---"
    And I expand nested table containing column value "Automation Finding"
  #470346
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                 |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:CITY1 Username} |

  @470298_Sanity @470335_Sanity
  Scenario:  As a GA user, verify "New" button in the Corrective Action section under Reports and Outcomes tab on the Site Visit details layout
  |verify GA user should be able to add Corrective Actions successfully with correct value |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SiteVisitID"
    When I click on "Edit" icon for "Site Visit/Desk Review Report" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "sitevisit" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    And I switch to parent tab
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    When I click on "Send to Grantee" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:SiteVisitID}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:SiteVisitID}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Finding"
    Then I can see top right button "New" in flex table with id "---sitevisits:-:correctiveTableId---"
    And I expand nested table containing column value "Automation Finding"
  #470335
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                 |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:CITY1 Username} |

  @423781_Sanity
  Scenario: To Verify task When the progress report is submitted to Grantor (Created by GA user and Submitted by GA User)
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Performance" sub tab
    And I click on top right button "Ad-Hoc Progress Report" in flex table with id "---progressreport:-:grantorProgressReportsTableId---"
    And I enter "Adhoc_Progress_Report" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AdhocProgressReportID"
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---progressReport:-:recipientAwardsTableId---"
    And I navigate to "Performance" sub tab
    When I click on "Edit" icon for "{SavedValue:AdhocProgressReportID}" inside flex table with id "---progressreport:-:recipientAwardProgressReportTableId---"
    And I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AdhocProgressReportID}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I softly see value "Review Progress Report" for title "Task Type" inside table "---home:-:internalHomePendingTaskTableId---"

  @468901_Sanity
  Scenario: To verify that a validation message for the subsequent Advance Payment Request when the payment period start date is not= 1+ Payment period end date of the latest submitted Payment Request.
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---amendment:-:recipientsAwardPaymentRequestsTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    And I enter "Advanced_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | There could be no gaps between payment periods, adjust the payment period dates to proceed. |

  @469669_Sanity
  Scenario: To verify that GA user is able to submit all subsequent Reimbursement Payment Requests by adding the payment period start date is =1+ payment period end date of latest submitted payment request
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I enter value "Automation Reimbursement Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category           | Spent This Action |
      | Labor and Fringe Benefits | 100               |
    When I enter value "I Agree" into field "TermsAgreement__c"
    And I enter value "Checked" into field "ReceiptsUploaded__c"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @469675_Sanity
  Scenario: To verify that GA user is able to submit all system generated subsequent progress reports by adding the reporting period start date is =1+ reporting period end date of latest submitted progress report
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Performance" sub tab
    And I click on top right button "Ad-Hoc Progress Report" in flex table with id "---progressreport:-:grantorProgressReportsTableId---"
    And I enter "Adhoc_Progress_Report" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @429775_Sanity
  Scenario:To verify that when GA user reschedule, the next schedule should get generated starting from just after the Payment period end date of the latest payment request
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I enter value "Automation Reimbursement Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category           | Spent This Action |
      | Labor and Fringe Benefits | 100               |
    When I enter value "I Agree" into field "TermsAgreement__c"
    And I enter value "Checked" into field "ReceiptsUploaded__c"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I enter value "Automation Reimbursement Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category           | Spent This Action |
      | Labor and Fringe Benefits | 100               |
    When I enter value "I Agree" into field "TermsAgreement__c"
    And I enter value "Checked" into field "ReceiptsUploaded__c"
    And I click on "Save" in the page details

  @490171_Sanity
  Scenario: As GA, Verify the validation If Both Business License Number and Corporate Entity Number are inactive while submitting payment request
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I enter value "Automation Reimbursement Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category           | Spent This Action |
      | Labor and Fringe Benefits | 100               |
    When I enter value "I Agree" into field "TermsAgreement__c"
    And I enter value "Checked" into field "ReceiptsUploaded__c"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | The Business License or Corporate Entity number must be active on the grantee's Organization Profile. |

  @489903_Sanity
  Scenario: Verify that GA user is able to submit payment request with $0 for Advance Payment Request
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    And I enter "Advanced_Edition2" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @489902_Sanity
  Scenario: Verify that Grantee user is able to submit payment request with $0 for Reimbursement Payment Request
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---amendment:-:recipientsAwardPaymentRequestsTableId---"
    When I enter value "Reimbursement Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter value "I Agree" into field "TermsAgreement__c"
    And I enter value "Checked" into field "ReceiptsUploaded__c"
    When I navigate to "Financials" sub tab
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @398527_US_Sanity @429822 @462609
  Scenario: Monitoring: Grantee: SR: Checks for overlapping payment or reporting period
  |To verify that a validation message for the first Advance payment Request when the Payment period start date is not equal to budget period start date
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
      #429822
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---amendment:-:recipientsAwardPaymentRequestsTableId---"
    When I enter value "Advanced Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    And I enter "Advanced_Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | There could be no gaps between payment periods, adjust the payment period dates to proceed. |

  @398527_US @429805_Sanity
  Scenario: To verify that a validation message for the first progress report when the reporting period start date is not equal to budget period start date.
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    And I navigate to "Performance" sub tab
    And I click on top right button "Ad-Hoc Progress Report" in flex table with id "---progressReport:-:recipientAwardProgressReportTableId---"
    And I enter "Adhoc_Progress_Report" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    And I navigate to "Performance" sub tab
    And I click on top right button "Ad-Hoc Progress Report" in flex table with id "---progressReport:-:recipientAwardProgressReportTableId---"
    And I enter "Adhoc_Progress_Report" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition2" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | There could be no gaps between reporting periods, adjust the reporting period dates to proceed. |

  @398527_US  @462581_Sanity
  Scenario: To verify that a validation message for the first Reimbursement payment Request when the Payment period start date is not equal to budget period start date
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---amendment:-:recipientsAwardPaymentRequestsTableId---"
    When I enter value "Reimbursement Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    And I enter "Reibursement_Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category           | Spent This Action |
      | Labor and Fringe Benefits | 100               |
    When I enter value "I Agree" into field "TermsAgreement__c"
    And I enter value "Checked" into field "ReceiptsUploaded__c"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | There could be no gaps between payment periods, adjust the payment period dates to proceed. |

  @398527_US @429818_Sanity
  Scenario: To verify that SPI user is able to submit first Advance Payment Request with the Payment period start date is equal to Budget period start date
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---amendment:-:recipientsAwardPaymentRequestsTableId---"
    When I enter value "Advanced Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category           | Advance Requested This Action |
      | Labor and Fringe Benefits | 100                           |
    And I wait for "5" seconds
    When I enter value "I Agree" into field "TermsAgreement__c"
    And I enter value "Checked" into field "ReceiptsUploaded__c"
    And I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @programActivationWithoutSharedRevenuePeerReview
  Scenario: Validate the activation of Internal Program and the status changes to Active - Program Type:NFR without Shared revenue
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I wait for "5" seconds
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "SiteVisitReviewerRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    Then I softly cannot see row level action button "Enter Review" against "{SavedValue:EXE Username}" in flex table with id "SiteVisitReviewerRoles"

  @490611_Sanity
  Scenario: Verify that Validation should occur If Budget Fiscal Year contain Special characters and Alphabets
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "{applicationIntake:StartDateFieldId}"
    When I enter value "3600" into field "{applicationIntake:EndDateFieldId}"
    When I enter value "1004" into field "{applicationIntake:FundCodeFieldId}"
    When I enter value "3013" into field "{applicationIntake:ObjectCodeFieldId}"
    Then I enter value "DA0101002" into field "{applicationIntake:AppropriationcodeFieldId}"
    When I enter value "ABCD" into field "{applicationIntake:BudgetFiscalYearFieldId}"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    Then I softly see the text containing :
      | Budget Fiscal Year should contain numbers only. |

  @490600_Sanity
  Scenario: Verify that the Program Code field on Funding Account Layout
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "{applicationIntake:StartDateFieldId}"
    When I enter value "3600" into field "{applicationIntake:EndDateFieldId}"
    When I enter value "17AWDDCDOA" into field "{applicationIntake:ProgramCodeFieldId}"
    And I wait for "2" seconds
    Then I softly see field "Program Code" inside page block

  @490561_Sanity
  Scenario: Verify that the Budget Fiscal Year field is required during activation of funding account
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "{applicationIntake:StartDateFieldId}"
    When I enter value "3600" into field "{applicationIntake:EndDateFieldId}"
    When I enter value "1004" into field "{applicationIntake:FundCodeFieldId}"
    When I enter value "3013" into field "{applicationIntake:ObjectCodeFieldId}"
    Then I enter value "DA0101002" into field "{applicationIntake:AppropriationcodeFieldId}"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see the text containing :
      | Overview Tab -Budget Fiscal Year is required to activate the funding account. |

  @490562_Sanity @490559_Sanity @490572_Sanity @490571_Sanity @490568_Sanity @490567_Sanity
  Scenario: Verify that the Budget Fiscal Year field limit is 4 characters, numbers only
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    And I click "Save and Continue" on modal confirmation box
    And I wait for "2" seconds
    When I enter value "10" into field "{applicationIntake:StartDateFieldId}"
    When I enter value "3600" into field "{applicationIntake:EndDateFieldId}"
    When I enter value "1004" into field "{applicationIntake:FundCodeFieldId}"
    When I enter value "3013" into field "{applicationIntake:ObjectCodeFieldId}"
    Then I enter value "DA0101002" into field "{applicationIntake:AppropriationcodeFieldId}"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    #490572
    Then I softly see the text containing :
      | Overview Tab - Fund Code is required to activate the funding account. |
    And I click on "Edit" in the page details
    When I enter value "1004" into field "{SavedValue:FundCodeFieldId}"
    And I click on "Save" in the page details
    Then I softly see field "{applicationIntake:BudgetFiscalYearFieldId}" maximum length is "4" for input field
    #490568
    Then I softly see field "{applicationIntake:ObjectCodeFieldId}" maximum length is "4" for input field
    And I click on "Activate" in the page details
    #490559
    Then I softly see field "Budget Fiscal Year" inside page block
    #490571
    Then I softly see field "Fund Code" inside page block
    #490567
    Then I softly see field "Object Code" inside page block

  @programMessageTabSendEmail
  Scenario: Validate the activation of Internal Program and the status changes to Active - Program Type:NFR without Shared revenue
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    Then I softly see field "Status" as "Created"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    And I send the email under collab tab with following details:
      | To                              | Subject         | Body                       |
      | automationexealaska@yopmail.com | Automation Test | Automation Test Email Body |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---program:-:programCollabMessagesTableId---"
    Then I see the following rows under the following headers in table with id "---program:-:programCollabMessagesTableId---" :
      | Actions     | Subject         | From Address             | To Address                      | CC Address | Attention To | Email Subject   | Preview                    |
      | Action menu | Automation Test | automationpm@yopmail.com | automationexealaska@yopmail.com |            |              | Automation Test | Automation Test Email Body |

  @classificationAndValidationForGAUser
  Scenario: Newly added classification and validations for CDBG program for GA user
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "Default"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I wait for "4" seconds
    And I click on top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I enter value "{SavedValue:Automation Runtime Announcement Application Intake}" into field "Title__c"
    And I enter value "AUTOMATION LIGHTHOUSE VOC-ED CENTER," into field "ExternalOrganization__c"
    And I enter value "{SavedValue:Automation Runtime Announcement Application Intake}" into field "Announcement__c"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click "Add" after selection of "Automation City1 SPI" by showing entries "All" in flex table with id "---applicationIntake:-:selectAssociateAppContacts---"
    When I close "Associate Contacts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachments" page block displayed
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:cdbgApplicationFiles---"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification                   |
      | Joint Application/Cooperative Agreement      |
      | Public Notice                                |
      | Minutes of Meeting                           |
      | Map                                          |
      | Deed                                         |
      | Lease                                        |
      | Easement                                     |
      | Job Description                              |
      | Feasibility or Marketing Studies             |
      | Authority to Participate (Resolution)        |
      | Statement of Assurances and Certification    |
      | Applicant/Recipient Disclosure/Update Report |
      | ADA Certification                            |
      | Sovereign Immunity                           |
    When I click modal button "Close"
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachment" page block displayed
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "Certification Regarding Debarment" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    And I click on "Edit" icon for "CDBG Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Application Part 1" sub tab
    When I enter "CDBG-Form1" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 2" sub tab
    When I enter "CDBG-Form2" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 3" sub tab
    When I enter "CDBG-Form Fields 3" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Validate" in the page details
    And I wait for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Forms and Files Tab - Upload a Public Notice file in the attachments section.                                 |
      | Forms and Files Tab - Upload a Joint Application/Cooperative Agreement file in the attachments section.       |
      | Forms and Files Tab - Upload a Minutes of Meeting file in the attachments section.                            |
      | Forms and Files Tab - Upload a Map file in the attachments section.                                           |
      | Forms and Files Tab - Upload a Deed file in the attachments section.                                          |
      | Forms and Files Tab - Upload a Lease file in the attachments section.                                         |
      | Forms and Files Tab - Upload an Easement file in the attachments section.                                     |
      | Forms and Files Tab - Upload a Feasibility or Marketing Studies file in the attachments section.              |
      | Forms and Files Tab - Upload a Job Description file in the attachments section.                               |
      | Forms and Files Tab - Upload an Authority to Participate (Resolution) file in the attachments section.        |
      | Forms and Files Tab - Upload a Statement of Assurances and Certification file in the attachments section.     |
      | Forms and Files Tab - Upload an Applicant/Recipient Disclosure/Update Report file in the attachments section. |
      | Forms and Files Tab - Upload an ADA Certification file in the attachments section.                            |

  @RequireSovereignImmunitydocumentforspecificorganizationtypesforGAUser
  Scenario: Require Sovereign Immunity document for Native American Tribal Government, Alaska Native Village, Alaska Native Corporations organization types for GA user
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I wait for "4" seconds
    And I click on top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I enter value "{SavedValue:Automation Runtime Announcement Application Intake}" into field "Title__c"
    And I enter value "AUTOMATION LIGHTHOUSE VOC-ED CENTER," into field "ExternalOrganization__c"
    And I enter value "{SavedValue:Automation Runtime Announcement Application Intake}" into field "Announcement__c"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click "Add" after selection of "Automation City1 SPI" by showing entries "All" in flex table with id "---applicationIntake:-:selectAssociateAppContacts---"
    When I close "Associate Contacts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Attachments" page block displayed
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "Sovereign Immunity" from computer
    Then I softly see "Attachment.pdf" has been added in "Sovereign Immunity" flex table

  @SubmitApplicationWhenOptionalMatchRequiredForGAUser
  Scenario: Submit application after Revision/Negotiation without entered ‘Cash-Match’, ’Non-Cash match’ details in application budget which is created for an opportunity with optional match required (GA User)
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Negotiation" and properties "GRANTEE_MATCH_OPTIONAL"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Negotiation}" on announcement "{SavedValue:Automation Runtime Announcement Application Negotiation}" with properties "GRANTEE_MATCH_OPTIONAL"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I wait for "4" seconds
    And I click on top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I enter value "{SavedValue:Automation Runtime Announcement Application Intake}" into field "Title__c"
    And I enter value "AUTOMATION LIGHTHOUSE VOC-ED CENTER," into field "ExternalOrganization__c"
    And I enter value "{SavedValue:Automation Runtime Announcement Application Intake}" into field "Announcement__c"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name       | Budget |
      | Acquisition / Lease | 1000   |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click "Add" after selection of "Automation City1 SPI" by showing entries "All" in flex table with id "---applicationIntake:-:selectAssociateAppContacts---"
    When I close "Associate Contacts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    And I click on "Edit" icon for "CDBG Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Application Part 1" sub tab
    When I enter "CDBG-Form1" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 2" sub tab
    When I enter "CDBG-Form2" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 3" sub tab
    When I enter "CDBG-Form Fields 3" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Validate" in the page details
    And I wait for "3" seconds
    And I switch to parent tab
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Field Name      | Value                         |
      | Review Decision | Revise / Negotiate            |
      | Review Comments | Please revise the application |
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application Negotiation}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime Announcement Application Negotiation}" boxes in flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I click on "Request Negotiation" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "2" seconds
    And I pause execution for "10" seconds
    When I navigate to "Applications" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationIntake:-:grantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    When I save the field labeled "EGMS ID" as "ApplicationId"
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    When  I enter "Edit_2" values from "Negotiations_Field_Values.xlsx"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---negotiation:-:NegotiationFormsTableId---" by clicking "Edit" :
      | Name                  | Needs Negotiation |
      | CDBG Application Form | Checked           |
    When I click on "Save" in the page details
    And I wait for "4" seconds
    When I click on "Send to Grantee" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ApplicationId}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:ApplicationId}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name       | Budget |
      | Acquisition / Lease | 1500   |
    And I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submit to Grantor"

  @Sam.GovverificationbyGAUser
  Scenario:  Sam.Gov verification  by GA
    Given I am on "SUBPORTAL" portal
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    When I navigate to "Grantees" content inside "Organization" subheader on left panel
    When I perform quick search for "AUTOMATION LIGHTHOUSE VOC-ED CENTER," in "ActiveAccount" panel
    And I click on "View" icon for "AUTOMATION LIGHTHOUSE VOC-ED CENTER," inside table
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    Then I softly see "Description" page block displayed
    Then I softly see fields "DUNSExpirationDate__c" is visible
    Then I softly see fields "EINText__c" is visible
    Then I softly see fields "UEISam__c" is visible
    And I click on "Update Sam.Gov Info" in the page details
    Then I softly see fields "UEISam__c" is visible
    Then I softly see fields "EINText__c" is visible
    When I clear the value from field "UEISam__c"
    When I enter value as "{SavedValue:UEIID}" into "UEI" on old form
    And I click modal button "Save and Close Modal"
    And I pause execution for "5" seconds
    Then I softly see fields "UEISam__c" is visible
    Then I softly see "Sam.gov Verification" page block displayed
    And I click on top right button "Verify" in flex table with id "{grantee_tableId:organizationIntegrationDetail}"
    And I wait for "5" seconds
    Then I softly see "Sam.gov Verification" page block displayed

  @GranteesContactCreationByGranteeUser
  Scenario:Grantee user can create Primary/Secondary users by the New button functionality of Contacts table
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    When I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "3" seconds
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:GranteeContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I close "Create Grantee Contact" modal by clicking the top right x button
    And I save the contact name as "Automation Runtime Contact"
    And I navigate to "Grantees" content inside "Contacts" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---home:-:subrecipientContactTableId---" panel
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:userContactsTableId---"
    Then I softly see field "Organization" as "First Class Organization"
    When I click modal button "Edit"
    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
    And I click modal button "Save"
    And I close "View Grantee Contact" modal by clicking the top right x button
    And I wait for "2" seconds
    Then I softly see value "New" for title "Status" inside table "---home:-:subrecipientContactTableId---"
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:City1EIN}" in "---applicationIntake:-:GranteeContactTableId---" panel
    When I click on "View" icon for "{SavedValue:City1EIN}" inside flex table with id "---applicationIntake:-:GranteeContactTableId---"
    And I wait for "2" seconds
    And I click on "Remove" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:userContactsTableId---"
    Then I softly do not see value "{SavedValue:Automation Runtime Contact} Contact" for title "Full Name" inside table "---home:-:userContactsTableId---"
    Given I delete the record "{SavedValue:Automation Runtime Contact} Contact" from the object "CONTACT"

  @427848_Sanity
  Scenario Outline: To Verify Undo Reject button on application review step layout in applications section.
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    Then I can see top right button "Undo Reject" in flex table with id "---applicationReview:-:appTableId---"

    Examples:
      | Announcement Name                                | Application Name                                 |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @445687_Sanity
  Scenario: Application created by Grantee and edited and submitted by GA user
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name       | Budget |
      | Acquisition / Lease | 1000   |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click "Add" after selection of "Automation City1 SPI" by showing entries "All" in flex table with id "---applicationIntake:-:selectAssociateAppContacts---"
    When I close "Associate Contacts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "NFR - 1st Class Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I click on "Edit" in the page details
    When I enter "NFRCity1FormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Validate" in the page details
    And I wait for "3" seconds
    And I switch to parent tab
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @ApplicationCreatedByGASubmittedByGrantee
  Scenario:Application created by GA and edited and submitted by Grantee user
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Negotiation" and properties "GRANTEE_MATCH_OPTIONAL"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Negotiation}" on announcement "{SavedValue:Automation Runtime Announcement Application Negotiation}" with properties "GRANTEE_MATCH_OPTIONAL"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I wait for "4" seconds
    And I click on top right button "New" in flex table with id "---applicationIntake:-:grantorApplicationsTableId---"
    And I enter value "{SavedValue:Automation Runtime Announcement Application Intake}" into field "Title__c"
    And I enter value "AUTOMATION LIGHTHOUSE VOC-ED CENTER," into field "ExternalOrganization__c"
    And I enter value "{SavedValue:Automation Runtime Announcement Application Intake}" into field "Announcement__c"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "CDBG Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Application Part 1" sub tab
    When I enter "CDBG-Form1" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 2" sub tab
    When I enter "CDBG-Form2" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application Part 3" sub tab
    When I enter "CDBG-Form Fields 3" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "3" seconds
    And I click on "Validate" in the split screen page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"

  @NegotiationForSharedRevenueApplication
  Scenario: Negotiation for standard Shared revenue application
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Negotiation" and properties "PROGRAM_TYPE_NFR_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Negotiation}" on announcement "{SavedValue:Automation Runtime Announcement Application Negotiation}" with properties "NEGOTIATION"
    And I delete the record "{SavedValue:Automation Runtime Announcement Application Negotiation}" from the object "FDM"
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application Negotiation}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime Announcement Application Negotiation}" boxes in flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I click on "Request Negotiation" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "2" seconds
    And I pause execution for "10" seconds
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    When I clear the value from field "{applicationIntake:ApplicationSectionsforNegotiationFieldID}"
    When  I enter "Edition_SR" values from "Negotiations_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "4" seconds
    When I click on "Send to Grantee" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"

  @NegotiationforDirectSharedRevenueApplication
  Scenario: Negotiation for direct Shared revenue application
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Negotiation" and properties "PROGRAM_TYPE_NFR_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Negotiation}" on announcement "{SavedValue:Automation Runtime Announcement Application Negotiation}" with properties "NEGOTIATION"
    And I delete the record "{SavedValue:Automation Runtime Announcement Application Negotiation}" from the object "FDM"
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application Negotiation}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime Announcement Application Negotiation}" boxes in flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I click on "Request Negotiation" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "2" seconds
    And I pause execution for "10" seconds
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    When I clear the value from field "{applicationIntake:ApplicationSectionsforNegotiationFieldID}"
    When  I enter "Edition_SR" values from "Negotiations_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "4" seconds
    When I click on "Send to Grantee" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"

  @NegotiationForDirectNonSharedRevenueApplication
  Scenario:Negotiation for direct Non Shared revenue application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Negotiation" and properties "PROGRAM_TYPE_NFR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Negotiation}" on announcement "{SavedValue:Automation Runtime Announcement Application Negotiation}" with properties "NEGOTIATION"
    And I delete the record "{SavedValue:Automation Runtime Announcement Application Negotiation}" from the object "FDM"
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application Negotiation}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime Announcement Application Negotiation}" boxes in flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I click on "Request Negotiation" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "2" seconds
    And I pause execution for "10" seconds
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    When I clear the value from field "{applicationIntake:ApplicationSectionsforNegotiationFieldID}"
    When  I enter "Edition_SR" values from "Negotiations_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "4" seconds
    When I click on "Send to Grantee" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"

  @NegotiationForStandardNonSharedRevenueApplication
  Scenario: Negotiation for standard Non Shared revenue application
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Negotiation" and properties "PROGRAM_TYPE_NFR_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Negotiation}" on announcement "{SavedValue:Automation Runtime Announcement Application Negotiation}" with properties "NEGOTIATION"
    And I delete the record "{SavedValue:Automation Runtime Announcement Application Negotiation}" from the object "FDM"
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Negotiation}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application Negotiation}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "{SavedValue:Automation Runtime Announcement Application Negotiation}" boxes in flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I click on "Request Negotiation" icon for "{SavedValue:Automation Runtime Announcement Application Negotiation}" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "2" seconds
    And I pause execution for "10" seconds
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    When I clear the value from field "{applicationIntake:ApplicationSectionsforNegotiationFieldID}"
    When  I enter "Edition_SR" values from "Negotiations_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "4" seconds
    When I click on "Send to Grantee" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"

  @38219_Sanity
  Scenario Outline: Validate review initiation and completion for the award | verify award acceptance
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I pause execution for "3" seconds
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I pause execution for "5" seconds
    And I enter value "Automation Test Description" into field "{amendment:GrantAwardDescriptionId}"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---"
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | NA              |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description            | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see that "Sent for Review" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"

    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @67673_Sanity
  Scenario Outline: Validate that Funding account table is not editable after submitted for approval
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I pause execution for "3" seconds
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I pause execution for "5" seconds
    And I enter value "Automation Test Description" into field "{amendment:GrantAwardDescriptionId}"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | NA              |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I navigate to "Budget" sub tab
    Then I cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---"

    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @151130_Sanity
  Scenario: Verify user is able to add three step approver for Budget Period change and forward it on step three
    Given I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "{amendment:NewBudgetPeriodEndDateFieldID}"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 3            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:PM Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"

  @151130_Sanity
  Scenario: Verify user is able to add three step approver for Budget Period change and forward it on step three
    Given I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "{amendment:NewBudgetPeriodEndDateFieldID}"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 3            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:PM Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"

  @51087_Sanity
  Scenario: Validate conduct, adding outcomes and submitting site visits for approval
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "GrantorActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SiteVisitID"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 1     |
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 2     |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I close the tab
    And I refresh the page
    When I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    Then I softly see that "Automation Finding" has been added in flextable with Id "---sitevisits:-:correctiveTableId---"
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

  @54291_Sanity
  Scenario: Validate the Creation and Edition and Participant Association for Org Level Desk Review
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I wait for "3" seconds
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see that "{SavedValue:EXE Username}" has been added in flextable with Id "---orgLevelDeskReview:-:deskReviewContactsTableId---"

  @TermsAndConditionAmendment
  Scenario:  T & condition Amendmend request flow from created to Approved and amend award
    Given I published "Competitive" type announcement having name "Automation Runtime FDM NPRA Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM NPRA Announcement}" on announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                    | Field          |
      | Automation Justification | TncComments__c |
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I save the field labeled "EGMS ID" as "AmendmentId"
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @ScopeOfWorkChangeAmendmendRequest
  Scenario: Scope Of Work Change Amendmend request flow from created to Approved and amend award
    Given I published "Competitive" type announcement having name "Automation Runtime FDM NPRA Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM NPRA Announcement}" on announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "---amendment:-:keyOutcomesTableId---"
    And I enter values into fields
      | Value                                    | Field        |
      | Automation Permanent KPI for Regression2 | MasterKPI__c |
      | 10                                       | Target__c    |
    When I click modal button "Save"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:FO Username} | Step 3            |
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see field "Amendment Types" as "Scope of Work Change"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @FundingChangeAmendmentRequestByGAUser
  Scenario: Verify Funding Change AR created by GA user and complete Grantee user flow using GA user (Check all validation for Submit to Grantor button, Edit button logic)
    Given I published "Competitive" type announcement having name "Automation Runtime FDM NPRA Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM NPRA Announcement}" on announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Grantee" in the page details
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name             | Revised Award Amount | Cash Match | Non Cash Match |
      | Labor and Fringe Benefits | 2000                 | 100        | 100            |
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 3000  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @BudgetPeriodChangeAmendmentRequestByGAUser
  Scenario: Verify Budget Period Change AR created by GA user and complete Grantee user flow using GA user (Check all validation for Submit to Grantor button, Edit button logic)
    Given I published "Competitive" type announcement having name "Automation Runtime FDM NPRA Announcement" and properties "PROGRAM_TYPE_NPRA"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM NPRA Announcement}" on announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}" with properties "PROGRAM_TYPE_NPRA"
    And I created approved NPRAFDM on application "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM NPRA Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM NPRA Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM NPRA Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    When I click on "Edit" in the page details
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "{amendment:NewBudgetPeriodEndDateFieldID}"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "CITY1" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @BudgetRedirectionAmendmentByGAUser
  Scenario: Verify Budget Redirection Amendment Request Created by GA user and complete Grantee user flow using GA user (Check all validation for Submit to Grantor button, Edit button logic)
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "Justified" into field "{amendment:JustificationFieldID}"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @BudgetRedirectionAmendmentGrantee
  Scenario: Verify Budget Redirection Amendment Request Created by Grantee user
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "GRANTEE_MATCH_OPTIONAL"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "GRANTEE_MATCH_OPTIONAL"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"

  @Rejection/UndoFunctionalityOnApplicationReview
  Scenario: Rejection/Undo functionality  on Application review form and FDM
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:PM Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "10" seconds
    And I click on "Edit" in the page details
    And I click radio button "I disagree" in COI of review form
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Decline" in the page details without processing
    Then I softly see confirmation box with body "This review form will no longer be editable and will get marked as Review Declined. Are you sure you want to Decline?" is displayed
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see that "Status" is in "Review Declined" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Declined" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"

  @429824_Sanity
  Scenario: The subsequent Payment Request when the payment period start date is not= 1+ Payment period end date of the latest submitted Payment Request (whether it is an Advance or Reimbursement)
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I enter value "Automation Reimbursement Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category           | Spent This Action |
      | Labor and Fringe Benefits | 100               |
    When I enter value "I Agree" into field "TermsAgreement__c"
    And I enter value "Checked" into field "ReceiptsUploaded__c"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---"
    When I enter value "Automation Reimbursement Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter value "I Agree" into field "TermsAgreement__c"
    And I enter value "Checked" into field "ReceiptsUploaded__c"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details :
      | There could be no gaps between payment periods, adjust the payment period dates to proceed. |

  @429815_Sanity
  Scenario: To verify that a validation message for the subsequent progress reports when the reporting period start date is not = 1+ reporting period end date of the latest submitted progress report.
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Performance" sub tab
    And I click on top right button "Ad-Hoc Progress Report" in flex table with id "---progressreport:-:grantorProgressReportsTableId---"
    And I enter "Adhoc_Progress_Report" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Performance" sub tab
    And I click on top right button "Ad-Hoc Progress Report" in flex table with id "---progressreport:-:grantorProgressReportsTableId---"
    And I enter "Adhoc_Progress_Report" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I see the following messages in the page details :
      | There could be no gaps between reporting periods, adjust the reporting period dates to proceed. |

  @MessageTabAndSystemEmailsForAdvanedPaymentRequest
  Scenario:Message Tab And System Emails For Advanced Payment Request
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Performance" sub tab
    And I click on top right button "Ad-Hoc Progress Report" in flex table with id "---progressreport:-:grantorProgressReportsTableId---"
    And I enter "Adhoc_Progress_Report" values from "ProgressReport_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---paymentRequest:-:reimburseCollabMessages---"
    And I send the email under collab tab with following details:
      | To                              | Subject         | Body                       |
      | automationexealaska@yopmail.com | Automation Test | Automation Test Email Body |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---paymentRequest:-:reimburseCollabMessages---"
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:reimburseCollabMessages---" :
      | Actions     | Subject         | From Address             | To Address                      | CC Address | Attention To | Email Subject   | Preview                    |
      | Action menu | Automation Test | automationpm@yopmail.com | automationexealaska@yopmail.com |            |              | Automation Test | Automation Test Email Body |

  @DeskReviewEndToEndFlow
  Scenario: Desk Review End To End Flow
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:PM Username} | Step 1      |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 2      |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime FDM Announcement}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"

  @SiteVisitEndtoEndFlow
  Scenario:Site Visit End to End Flow
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---sitevisits:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 2     |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    And I close the tab
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"

  @MessageTabAndSystemsEmailsForSiteVisit
  Scenario: Message Tab And Systems Emails For desk Review
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "PROGRAM_TYPE_CAP_SR"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PROGRAM_TYPE_CAP_SR"
    And I created approved CAPFDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:PM Username} | Step 1      |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 2      |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime FDM Announcement}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---paymentRequest:-:reimburseCollabMessages---"
    And I send the email under collab tab with following details:
      | To                              | Subject         | Body                       |
      | automationexealaska@yopmail.com | Automation Test | Automation Test Email Body |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---paymentRequest:-:reimburseCollabMessages---"
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:reimburseCollabMessages---" :
      | Actions     | Subject         | From Address             | To Address                      | CC Address | Attention To | Email Subject   | Preview                    |
      | Action menu | Automation Test | automationpm@yopmail.com | automationexealaska@yopmail.com |            |              | Automation Test | Automation Test Email Body |