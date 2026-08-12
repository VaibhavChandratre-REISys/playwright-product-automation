@GranteeStrategicPlan @GranteePreAwardRegression
Feature: Validate all scenarios for Strategic Plan

  @476591 @validateAdminusercandeactivateactivestrategicplancreatedbyEXEuserfromsameinternalorganization @P2_Grantee @ADMIN_Grantee @GRegression2
  Scenario: Validate Admin user can Deactivate active Strategic plan created by EXE user from same internal organization
    Given I login to "Grantee" app as "GRANTEE EXE1" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "1" seconds
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    When I click on "View" icon for "{SavedValue:StrategicPlan}" inside flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I wait for "2" seconds
    When I click on "Activate" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "You will not be able to edit the Strategic Plan once it is active. Are you sure you want to continue?" is displayed
    And I wait for "2" seconds
    When I click modal button "OK"
    Then I softly see field "Status" as "Active"
    Then I see status in Progress-bar is "Active" and is "Dark Blue"
    When I re-login to "Grantee" app as "GRANTEE ADMIN2" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    When I click on "View" icon for "{SavedValue:StrategicPlan}" inside flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "Are you sure, you want to deactivate?" is displayed
    And I wait for "2" seconds
    When I click modal button "OK"
    Then I softly see field "Status" as "Inactive"

  @476620 @VerifyFDusercannotDeactivateactiveStrategicplan @P3_Grantee @FO_Grantee @GRegression2
  Scenario Outline: Verify FO user cannot Deactivate active Strategic plan
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "<RecordId>" in "---grantee_tableId:-:StrategicPlans---" panel
    And I click on "View" icon for "<RecordId>" inside table
    Then I cannot see top right button "Deactivate" in page detail
    Examples:
      | User       | RecordId                            |
      | GRANTEE FO | Automation Permanent Strategic Plan |

  @476621 @VerifyFDusercannotDeactivateactiveStrategicplan @P3_Grantee @FD_Grantee @GRegression2
  Scenario Outline: Verify FD user cannot Deactivate active Strategic plan
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "<RecordId>" in "---grantee_tableId:-:StrategicPlans---" panel
    And I click on "View" icon for "<RecordId>" inside table
    Then I cannot see top right button "Deactivate" in page detail
    Examples:
      | User       | RecordId                            |
      | GRANTEE FD | Automation Permanent Strategic Plan |

  @476622 @VerifyFDusercannotDeactivateactiveStrategicplan @P3_Grantee @PO_Grantee @GRegression2
  Scenario Outline: Verify PO user cannot Deactivate active Strategic plan
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "<RecordId>" in "---grantee_tableId:-:StrategicPlans---" panel
    And I click on "View" icon for "<RecordId>" inside table
    Then I cannot see top right button "Deactivate" in page detail
    Examples:
      | User       | RecordId                            |
      | GRANTEE PO | Automation Permanent Strategic Plan |

  @476623 @VerifyFDusercannotDeactivateactiveStrategicplan @P4_Grantee @AUDITOR_Grantee @GRegression2
  Scenario Outline: Verify FD user cannot Deactivate active Strategic plan
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "<RecordId>" in "---grantee_tableId:-:StrategicPlans---" panel
    And I click on "View" icon for "<RecordId>" inside table
    Then I cannot see top right button "Deactivate" in page detail
    Examples:
      | User            | RecordId                            |
      | GRANTEE AUDITOR | Automation Permanent Strategic Plan |

  @476594 @StrategicPlanVerifyPOasNonownerusercannoteditanydataonStrategicplanrecordcreatedbyPMuserwhenSPisinCreatedActivestate @PO_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Strategic Plan - Verify PO as Non owner user cannot edit any data on Strategic plan record created by PM user when SP is in Created, Active state
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I enter in modal "Grantee_StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic Plan Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Plan" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I softly see value "Strategic Plan" for title "Classification" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic Plan Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic GoaI Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Goal" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    Then I softly see value "Strategic Goal" for title "Classification" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic GoaI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Objective Files" flex table
    And I click on "Edit" icon for "Others" inside flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Objective" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    Then I softly see value "Objective" for title "Classification" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Objective Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:StrategicPlan}" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "{SavedValue:StrategicPlan}" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "{SavedValue:StrategicPlan}" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    And I save the value from row "1" for column name "Objective" as "Title1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I save the value from row "1" for column name "Title" as "Files" from flex table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see row level action button "Download" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see row level action button "View" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I save the value from row "1" for column name "Title" as "Notes" from flex table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Download" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "View" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "<RecordId>" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "<RecordId>" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "Automation Permanent Strategic Plan"
    Then I softly see value "Automation Permanent Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Permanent Strategic Goal"
    Then I softly see value "Automation Permanent Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "<RecordId>" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    And I save the value from row "1" for column name "Objective" as "Objective1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then  I can see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Examples:
      | User       | RecordId                            |
      | GRANTEE PO | Automation Permanent Strategic Plan |

  @476595 @StrategicPlanVerifyPOasNonownerusercannoteditanydataonStrategicplanrecordcreatedbyPMuserwhenSPisinCreatedActivestate @PM_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Strategic Plan - Verify PM as Non owner user cannot edit any data on Strategic plan record created by PM user when SP is in Created, Active state
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I enter in modal "Grantee_StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic Plan Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Plan" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I softly see value "Strategic Plan" for title "Classification" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic Plan Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exe.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic GoaI Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Goal" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    Then I softly see value "Strategic Goal" for title "Classification" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic GoaI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exe.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Objective Files" flex table
    And I click on "Edit" icon for "Others" inside flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Objective" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    Then I softly see value "Objective" for title "Classification" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Objective Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exe.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:StrategicPlan}" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "{SavedValue:StrategicPlan}" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "{SavedValue:StrategicPlan}" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    And I save the value from row "1" for column name "Objective" as "Title1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I save the value from row "1" for column name "Title" as "Files" from flex table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see row level action button "Download" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see row level action button "View" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then  I can see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I save the value from row "1" for column name "Title" as "Notes" from flex table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Download" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "View" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "<RecordId>" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "<RecordId>" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "Automation Permanent Strategic Plan"
    Then I softly see value "Automation Permanent Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Permanent Strategic Goal"
    Then I softly see value "Automation Permanent Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "<RecordId>" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I can see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    And I save the value from row "1" for column name "Objective" as "Objective1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then  I can see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Examples:
      | User       | RecordId                            |
      | GRANTEE PM | Automation Permanent Strategic Plan |

  @476596 @StrategicPlanVerifyPOasNonownerusercannoteditanydataonStrategicplanrecordcreatedbyPMuserwhenSPisinCreatedActivestate @FO_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Strategic Plan - Verify FO as Non owner user cannot edit any data on Strategic plan record created by PM user when SP is in Created, Active state
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I enter in modal "Grantee_StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic Plan Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Plan" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I softly see value "Strategic Plan" for title "Classification" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic Plan Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exe.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic GoaI Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Goal" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    Then I softly see value "Strategic Goal" for title "Classification" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic GoaI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exe.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Objective Files" flex table
    And I click on "Edit" icon for "Others" inside flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Objective" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    Then I softly see value "Objective" for title "Classification" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Objective Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exe.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:StrategicPlan}" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "{SavedValue:StrategicPlan}" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "{SavedValue:StrategicPlan}" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    And I save the value from row "1" for column name "Objective" as "Title1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I save the value from row "1" for column name "Title" as "Files" from flex table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see row level action button "Download" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see row level action button "View" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then  I can see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I save the value from row "1" for column name "Title" as "Notes" from flex table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Download" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "View" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "<RecordId>" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "<RecordId>" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "Automation Permanent Strategic Plan"
    Then I softly see value "Automation Permanent Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Permanent Strategic Goal"
    Then I softly see value "Automation Permanent Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "<RecordId>" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    And I save the value from row "1" for column name "Objective" as "Objective1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then  I can see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Examples:
      | User       | RecordId                            |
      | GRANTEE FO | Automation Permanent Strategic Plan |

  @476597 @StrategicPlanVerifyPOasNonownerusercannoteditanydataonStrategicplanrecordcreatedbyPMuserwhenSPisinCreatedActivestate @ADMIN_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Strategic Plan - Verify ADMIN as Non owner user cannot edit any data on Strategic plan record created by PM user when SP is in Created, Active state
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I enter in modal "Grantee_StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic Plan Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Plan" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I softly see value "Strategic Plan" for title "Classification" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic Plan Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exe.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic GoaI Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Goal" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    Then I softly see value "Strategic Goal" for title "Classification" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic GoaI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exe.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Objective Files" flex table
    And I click on "Edit" icon for "Others" inside flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Objective" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    Then I softly see value "Objective" for title "Classification" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Objective Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "victor.exe.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:StrategicPlan}" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "{SavedValue:StrategicPlan}" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "{SavedValue:StrategicPlan}" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    And I save the value from row "1" for column name "Objective" as "Title1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I save the value from row "1" for column name "Title" as "Files" from flex table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see row level action button "Download" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see row level action button "View" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then  I can see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I save the value from row "1" for column name "Title" as "Notes" from flex table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Download" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "View" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "<RecordId>" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "<RecordId>" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "Automation Permanent Strategic Plan"
    Then I softly see value "Automation Permanent Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Permanent Strategic Goal"
    Then I softly see value "Automation Permanent Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "<RecordId>" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I can see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    And I save the value from row "1" for column name "Objective" as "Objective1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Examples:
      | User          | RecordId                            |
      | GRANTEE ADMIN | Automation Permanent Strategic Plan |

  @476612 @ValidateStrategicPlanFOusercannotcreateStrategicPlan @P3_Grantee @FO_Grantee @GRegression2
  Scenario Outline: Validate Strategic Plan FO user cannot create Strategic Plan
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:StrategicPlans---"
    Examples:
      | userType   |
      | GRANTEE FO |

  @476613 @ValidateStrategicPlanFOusercannotcreateStrategicPlan @P3_Grantee @FD_Grantee @GRegression2
  Scenario Outline: Validate Strategic Plan FD user cannot create Strategic Plan
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:StrategicPlans---"
    Examples:
      | userType   |
      | GRANTEE FD |

  @476615 @ValidateStrategicPlanFOusercannotcreateStrategicPlan @P4_Grantee @AUDITOR_Grantee @GRegression2
  Scenario Outline: Validate Strategic Plan AUDITOR user cannot create Strategic Plan
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:StrategicPlans---"
    Examples:
      | userType        |
      | GRANTEE AUDITOR |

  @445784 @ValidateStrategicPlanFOusercannotcreateStrategicPlan @P3_Grantee @PO_Grantee @GRegression2
  Scenario Outline: Validate Strategic Plan PO user cannot create Strategic Plan
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:StrategicPlans---"
    Examples:
      | userType   |
      | GRANTEE PO |

  @476278 @ValidatePMusercancreateandActivateStrategicplan
  Scenario Outline: Validate PM user can create and Activate Strategic plan
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I enter in modal "Grantee_StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic Plan Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Plan" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I softly see value "Strategic Plan" for title "Classification" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic Plan Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic GoaI Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Goal" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    Then I softly see value "Strategic Goal" for title "Classification" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic GoaI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Objective Files" flex table
    And I click on "Edit" icon for "Others" inside flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Objective" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    Then I softly see value "Objective" for title "Classification" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Objective Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Examples:
      | userType    | emailIdFrom                       | emailIdTo                       |
      | GRANTEE EXE | victor.exe.ggmergeqa2@yopmail.com | sarah.pm.ggmergeqa2@yopmail.com |

  @476619 @ValidateEXEusercanDeactivateactiveStrategicplancreatedbyPMuserfromsameinternalorganization @P2_Grantee @EXE_Grantee @GRegression2
  Scenario: Validate EXE user can Deactivate active Strategic plan created by PM  user from same internal organization
    Given I login to "Grantee" app as "GRANTEE EXE1" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "1" seconds
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    When I click on "View" icon for "{SavedValue:StrategicPlan}" inside flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I wait for "2" seconds
    When I click on "Activate" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "You will not be able to edit the Strategic Plan once it is active. Are you sure you want to continue?" is displayed
    And I wait for "2" seconds
    When I click modal button "OK"
    Then I softly see field "Status" as "Active"
    Then I see status in Progress-bar is "Active" and is "Dark Blue"
    When I re-login to "Grantee" app as "GRANTEE PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    When I click on "View" icon for "{SavedValue:StrategicPlan}" inside flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "Are you sure, you want to deactivate?" is displayed
    And I wait for "2" seconds
    When I click modal button "OK"
    Then I softly see field "Status" as "Inactive"

  @476590 @Validateadminusercancreateandactivatestrategicplan  @P1_Grantee @GRegression1 @ADMIN_Grantee @sprint15
  Scenario Outline: Validate Admin user can create and Activate Strategic plan
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I enter in modal "Grantee_StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic Plan Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Plan" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I softly see value "Strategic Plan" for title "Classification" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic Plan Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic GoaI Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Goal" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    Then I softly see value "Strategic Goal" for title "Classification" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic GoaI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Objective Files" flex table
    And I click on "Edit" icon for "Others" inside flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Objective" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    Then I softly see value "Objective" for title "Classification" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Objective Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I click on "Activate" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "You will not be able to edit the Strategic Plan once it is active. Are you sure you want to continue?" is displayed
    And I wait for "2" seconds
    When I click modal button "OK"
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Examples:
      | userType      | emailIdFrom                  | emailIdTo                       |
      | GRANTEE Admin | demo.admin.merge@yopmail.com | victor.exeqagrantee@yopmail.com |

  @445782 @vaildatePM/EXEusercanviewStrategicplanrecordinCreated,Active,Inactivestate @P2_Grantee @PM_Grantee @Gregression2
  Scenario Outline:Validate PM/ EXE user can view Strategic plan record in Created, Active, Inactive state
    When I login to "Grantee" app as "GRANTEE EXE1" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic 1" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "1" seconds
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic Plan Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                              | Subject            | Body            |
      | sarah.pm.ggmergeqa2@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "exe1.automation.qa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic GoaI Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Goal" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    Then I softly see value "Strategic Goal" for title "Classification" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic GoaI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                              | Subject            | Body            |
      | sarah.pm.ggmergeqa2@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "exe1.automation.qa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Objective Files" flex table
    And I click on "Edit" icon for "Others" inside flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Objective" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    Then I softly see value "Objective" for title "Classification" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Objective Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                              | Subject            | Body            |
      | sarah.pm.ggmergeqa2@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "exe1.automation.qa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:StrategicPlan}" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "{SavedValue:StrategicPlan}" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "{SavedValue:StrategicPlan}" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    And I save the value from row "1" for column name "Objective" as "Title1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I save the value from row "1" for column name "Title" as "Files" from flex table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see row level action button "Download" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see row level action button "View" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then  I can see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I save the value from row "1" for column name "Title" as "Notes" from flex table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Download" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "View" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I re-login to "Grantee" app as "GRANTEE EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "<RecordId>" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "<RecordId>" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "Automation Permanent Strategic Plan"
    Then I softly see value "Automation Permanent Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Permanent Strategic Goal"
    Then I softly see value "Automation Permanent Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "<RecordId>" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I can see top right button "Deactivate" in page detail
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    And I save the value from row "1" for column name "Objective" as "Objective1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I can see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then  I can see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "<RecordId>" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "<RecordId>" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "Automation Permanent Strategic Plan"
    Then I softly see value "Automation Permanent Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Permanent Strategic Goal"
    Then I softly see value "Automation Permanent Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "<RecordId>" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I can see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    And I save the value from row "1" for column name "Objective" as "Objective1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then  I can see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Deactivate" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "Are you sure, you want to deactivate?" is displayed
    And I wait for "2" seconds
    When I click modal button "OK"
    Then I softly see field "Status" as "Inactive"
    Then I softly see status in Progress-bar is "Inactive" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Inactive"
    And I perform quick search for "<RecordId>" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "<RecordId>" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "Automation Permanent Strategic Plan"
    Then I softly see value "Automation Permanent Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Permanent Strategic Goal"
    Then I softly see value "Automation Permanent Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "<RecordId>" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    And I save the value from row "1" for column name "Objective" as "Objective1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I re-login to "Grantee" app as "GRANTEE EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Inactive"
    And I perform quick search for "<RecordId>" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "<RecordId>" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "Automation Permanent Strategic Plan"
    Then I softly see value "Automation Permanent Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Permanent Strategic Goal"
    Then I softly see value "Automation Permanent Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "<RecordId>" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    And I save the value from row "1" for column name "Objective" as "Objective1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Examples:
      | User        | RecordId                            |
      | GRANTEE PM1 | Automation Permanent Strategic Plan |


  @445795 @StrategicPlanVerifyPOasNonownerusercannoteditanydataonStrategicplanrecordcreatedbyPMuserwhenSPisinCreatedActivestate @PO_Grantee @P3_Grantee @GRegression3
  Scenario Outline: Strategic Plan - Verify EXE as Non owner user cannot edit any data on Strategic plan record created by PM user when SP is in Created, Active state
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I enter in modal "Grantee_StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic Plan Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Plan" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I softly see value "Strategic Plan" for title "Classification" inside table "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic Plan Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Strategic GoaI Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Strategic Goal" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    Then I softly see value "Strategic Goal" for title "Classification" inside table "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicGoalsFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Strategic GoaI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:strategicGoalsNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:strategicGoalsNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Objective Files" flex table
    And I click on "Edit" icon for "Others" inside flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Objective" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    Then I softly see value "Objective" for title "Classification" inside table "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:objectivesAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Objective Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:objectivesNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:objectivesNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:StrategicPlan}" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "{SavedValue:StrategicPlan}" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "{SavedValue:StrategicPlan}" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    And I save the value from row "1" for column name "Objective" as "Title1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    And I save the value from row "1" for column name "Title" as "Files" from flex table "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see row level action button "Download" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see row level action button "View" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Files}" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    And I save the value from row "1" for column name "Title" as "Notes" from flex table "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Download" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "View" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Notes}" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "<RecordId>" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "<RecordId>" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "Automation Permanent Strategic Plan"
    Then I softly see value "Automation Permanent Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Permanent Strategic Goal"
    Then I softly see value "Automation Permanent Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    Then I can see row level action button "View" against "Automation Permanent Strategic Plan" in flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I click on "View" icon for "<RecordId>" inside table
    Then I cannot see top right button "Edit" in page detail
    Then I can see top right button "Deactivate" in page detail
    And I navigate to "Overview" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    And I save the value from row "1" for column name "Title" as "Title" from flex table "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I can see row level action button "View" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title}" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I expand nested table containing column value "{SavedValue:Title}"
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    And I save the value from row "1" for column name "Objective" as "Objective1" from flex table "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I can see row level action button "View" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Objective1}" in flex table with id "---grantee_tableId:-:StrategicObjectivesChild---"
    When I navigate to "Related Log" sub tab
    Then  I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I save the value from row "1" for column name "Title" as "Title2" from flex table "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see that "{SavedValue:Title2}" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I can see row level action button "View" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:Title2}" in flex table with id "---grantee_tableId:-:strategicPlanKPITableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:strategicPlansFilesTableId---"
    Then  I can see top right button "New" in flex table with id "---grantee_tableId:-:strategicPlansNotesTableId---"
    When I click on parallel lines menu bar with data target value "Strategic Plan Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Examples:
      | User        | RecordId                            |
      | GRANTEE EXE | Automation Permanent Strategic Plan |

  @476591 @validateAdminusercandeactivateactivestrategicplancreatedbyEXEuserfromsameinternalorganization @P2_Grantee @ADMIN_Grantee @GRegression2
  Scenario: Validate Admin user can Deactivate active Strategic plan created by EXE user from same internal organization
    Given I login to "Grantee" app as "GRANTEE EXE1" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "1" seconds
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    When I click on "View" icon for "{SavedValue:StrategicPlan}" inside flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I wait for "2" seconds
    When I click on "Activate" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "You will not be able to edit the Strategic Plan once it is active. Are you sure you want to continue?" is displayed
    And I wait for "2" seconds
    When I click modal button "OK"
    Then I softly see field "Status" as "Active"
    Then I see status in Progress-bar is "Active" and is "Dark Blue"
    When I re-login to "Grantee" app as "GRANTEE ADMIN2" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    When I click on "View" icon for "{SavedValue:StrategicPlan}" inside flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "Are you sure, you want to deactivate?" is displayed
    And I wait for "2" seconds
    When I click modal button "OK"
    Then I softly see field "Status" as "Inactive"

  @476618 @validatePMusercandeactivateactivestrategicplancreatedbyAdminuserfromsameinternalorganization @P2_Grantee @PM_Grantee @GRegression2
  Scenario: Validate PM user can Deactivate active Strategic plan created by Admin user from same internal organization
    Given I login to "Grantee" app as "GRANTEE ADMIN2" user
    And I navigate to "Planning" tab
    When I navigate to "{grantee_sidebar:StrategicPlanLinkName}" content inside "{grantee_sidebar:SetUpSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:StrategicPlans}"
    And I enter value "Automation Runtime Strategic" into field "StrategyTitle__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "1" seconds
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:StrategicGoalsandObjective---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---grantee_tableId:-:Objectives---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Activities" as "Automation Test Description"
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:objectivesSelectKPITableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    And I save the field labeled "Strategic Plan" as "StrategicPlan"
    And I click on hyperlink containing value "{SavedValue:StrategicPlan}"
    When I navigate to "Related Log" sub tab
    Then I softly see that "Automation Runtime KPI" has been added in flextable with Id "---grantee_tableId:-:strategicPlanKPITableId---"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    When I click on "View" icon for "{SavedValue:StrategicPlan}" inside flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I wait for "2" seconds
    When I click on "Activate" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "You will not be able to edit the Strategic Plan once it is active. Are you sure you want to continue?" is displayed
    And I wait for "2" seconds
    When I click modal button "OK"
    Then I softly see field "Status" as "Active"
    Then I see status in Progress-bar is "Active" and is "Dark Blue"
    When I re-login to "Grantee" app as "GRANTEE PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    And I perform quick search for "{SavedValue:StrategicPlan}" in "---grantee_tableId:-:StrategicPlans---" panel
    Then I softly see value "{SavedValue:StrategicPlan}" for title "EGMS ID" inside table "---grantee_tableId:-:StrategicPlans---"
    When I expand nested table containing column value "{SavedValue:StrategicPlan}"
    Then I softly see value "Automation Strategic Goal" for title "Strategic Goal" inside table "---grantee_tableId:-:StrategicGoalsChild---"
    When I expand nested table containing column value "Automation Strategic Goal"
    Then I softly see value "Automation Strategic Objective" for title "Objective" inside table "---grantee_tableId:-:StrategicObjectivesChild---"
    When I click on "View" icon for "{SavedValue:StrategicPlan}" inside flex table with id "---grantee_tableId:-:StrategicPlans---"
    And I wait for "2" seconds
    When I click on "Deactivate" in the page details without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "Are you sure, you want to deactivate?" is displayed
    And I wait for "2" seconds
    When I click modal button "OK"
    Then I softly see field "Status" as "Inactive"