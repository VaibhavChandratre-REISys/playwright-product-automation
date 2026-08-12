@GranteeFocusArea @GranteePreAwardRegression
Feature: Validate all scenarios for Focus Areas

  @440216 @FocusAreaVerifyOnlyPOFOFDprofilenotabletoseetheNEWbuttontocreatetheFocusareas @PO_Grantee @FO_Grantee @FD_Grantee @GRegression1
  Scenario Outline: Focus Area - Verify Only PO,FO, FD profile not able to see the NEW button to create the Focus areas.
    When I login to "Grantee" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:GranteeProjectTableId---"
    Examples:
      | User       |
      | GRANTEE PO |
      | GRANTEE FO |
      | GRANTEE FD |

  @440213 @VerifywithPMProfileonlydraftcreatestatusrecordabletodeletebyrecordowneronly @P3_Grantee @PM_Grantee @GRegression1
  Scenario: Verify with PM Profile ,only draft (create) status record able to delete by record owner only
    When I login to "Grantee" app as "GRANTEE PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    When I enter in modal value "Automation Focus Area1" into field "Title__c"
    When I enter in modal value "Automation Test Description" into field "Description__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FocusAreaId"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I perform quick search for "{SavedValue:FocusAreaId}" in "---grantee_tableId:-:GranteeProjectTableId---" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:FocusAreaId}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I perform quick search for "{SavedValue:FocusAreaId}" in "---grantee_tableId:-:GranteeProjectTableId---" panel
    Then I can see row level action button "Delete" against "{SavedValue:FocusAreaId}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    And I click on "Delete" icon for "{SavedValue:FocusAreaId}" inside flex table with id "---grantee_tableId:-:GranteeProjectTableId---" without waiting for record
    And I perform quick search for "{SavedValue:FocusAreaId}" in "---grantee_tableId:-:GranteeProjectTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GranteeProjectTableId---"

  @441788 @459775 @ValidateFocusAreanonrecordEXEProfileownershouldnotabletoactivatedeactivatethefocusArea @P2_Grantee @EXE_Grantee @GRegression1
  Scenario: Validate Focus Area non record EXE Profile owner should not able to activate & deactivate the focus Area
    When I login to "Grantee" app as "GRANTEE PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I enter in modal value "Automation Test Description" into field "Description__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "focusEGMSID"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:focusAreaAddFilesTableId---"
    When I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I see "AttachmentTesting.pdf" has been added in "Focus Area Files" flex table
    #459775
    Then I cannot see top right button "Add" in flex table with id "---grantee_tableId:-:focusAreaNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:focusAreaNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:focusAreaNotesTableId---"
    Then I can see top right button "Activate" in page detail
    And I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - All"
    When I perform quick search for "{SavedValue:focusEGMSID}" in "---grantee_tableId:-:GranteeProjectTableId---" panel
    And I click on "View" icon for "{SavedValue:focusEGMSID}" inside table
    Then I cannot see top right button "Activate" in page detail
    And I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - All"
    When I perform quick search for "{SavedValue:focusEGMSID}" in "---grantee_tableId:-:GranteeProjectTableId---" panel
    And I click on "View" icon for "{SavedValue:focusEGMSID}" inside table
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    Then I can see top right button "Deactivate" in page detail
    And I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - All"
    When I perform quick search for "{SavedValue:focusEGMSID}" in "---grantee_tableId:-:GranteeProjectTableId---" panel
    And I click on "View" icon for "{SavedValue:focusEGMSID}" inside table
    Then I cannot see top right button "Deactivate" in page detail

  @443821 @ValidateAwardwithEXEProfileFocusareavalidations @P2_Grantee @EXE_Grantee @GRegression1
  Scenario Outline: Validate Award with EXE/PO Profile Focus area validations
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_Grant_Setting_No" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition_All_No" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name     | Project Role    | Is Key Contact |
      | Sarah PM | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | <Approver> | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Projections" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Projection Tab - Associate at least one Focus Area to this award.    |
      | Projections Tab - Enter Award Budget before submitting for approval. |
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Projections Tab - At least one focus area must be in place at all times during the budget period. Adjust the focus area dates accordingly. |
      | Projections Tab - Enter the Focus Area Start Date and Focus Area End Date to all focus areas to submit for approval.                       |
      | Projections Tab - You must associate a budget to all focus areas before submitting this award for approval.                                |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 15         | 3800     |
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Projections Tab - At least one focus area must be in place at all times during the budget period. Adjust the focus area dates accordingly. |
      | Projections Tab - Focus Area Start Date and Focus Area End Date should be between budget period.                                           |
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Test Focus Area1" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    When I click "Associate" after selection of "Grantee -Focus Area1" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    When I click "Associate" after selection of "MI_Grantee Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Test Focus Area1" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see value "Grantee -Focus Area1" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see value "MI_Grantee Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    When I click on "Remove" icon for "MI_Grantee Focus Area" inside flex table with id "---grantee_tableId:-:ProjectTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Record removed successfully. |
    Then I softly do not see value "MI_Grantee Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Examples:
      | userType    | Approver   |
      | GRANTEE EXE | Victor EXE |

  @440272 @VerifyWithAdminProfileAbletocreateActivateDeactivethefocusarea @P2_Grantee @ADMIN_Grantee @GRegression2
  Scenario: Verify With Admin Profile ,Able to create/Activate/Deactive  the focus area.
    When I login to "Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I enter in modal value "Automation Test Description" into field "Description__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:focusAreaAddFilesTableId---"
    When I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I see "AttachmentTesting.pdf" has been added in "Focus Area Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:focusAreaAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "supporting documents" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:focusAreaAddFilesTableId---"
    Then I softly see value "supporting documents" for title "Classification" inside table "---grantee_tableId:-:focusAreaAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:focusAreaAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Focus Area Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:focusAreaNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I enter the following values into flex table with id "---grantee_tableId:-:focusAreaNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:focusAreaNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:focusAreaNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "demo.admin.merge@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Activate.pdf" as name
    And I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Closed" and is "dark blue"
    Then I see field "Status" as "Inactive"
    And I refresh the page
    And I wait for "5" seconds
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Deactivate.pdf" as name

  @440210 @ValidatePMProfileafterclickonFocusareasmodulesFocusarealistpageshouldbedisplayonlistpagecolumsabletosee @P2_Grantee @PM_Grantee @GRegression5
  Scenario: Validate PM Profile after click on Focus areas modules Focus area list page should be display on list page colums able to see
    When I login to "Grantee" app as "GRANTEE PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    Then I softly see default toggle as "Focus Areas - All" for table "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly see toggle option "Focus Areas - All" inside flex table id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly see toggle option "Focus Areas - Draft" inside flex table id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly see toggle option "Focus Areas - Active" inside flex table id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly see toggle option "Focus Areas - Inactive" inside flex table id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly see "Internal Organization" in flex table header "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:GranteeProjectTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I enter in modal value "Automation Test Description" into field "Description__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "draftFocusID"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    Then I softly do not see value "Active" for title "Status" inside table "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly do not see value "Inactive" for title "Status" inside table "---grantee_tableId:-:GranteeProjectTableId---"
    And I perform quick search for "{SavedValue:draftFocusID}" in "---grantee_tableId:-:GranteeProjectTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:draftFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:draftFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:draftFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I enter in modal value "Automation Test Description" into field "Description__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "activeFocusID"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Active"
    Then I softly do not see value "Draft" for title "Status" inside table "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly do not see value "Inactive" for title "Status" inside table "---grantee_tableId:-:GranteeProjectTableId---"
    And I perform quick search for "{SavedValue:activeFocusID}" in "---grantee_tableId:-:GranteeProjectTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:activeFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:activeFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:activeFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I enter in modal value "Automation Test Description" into field "Description__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "inActiveFocusID"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    And I click on "Deactivate" in the page details
    Then I see field "Status" as "Inactive"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Inactive"
    Then I softly do not see value "Active" for title "Status" inside table "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly do not see value "Draft" for title "Status" inside table "---grantee_tableId:-:GranteeProjectTableId---"
    And I perform quick search for "{SavedValue:inActiveFocusID}" in "---grantee_tableId:-:GranteeProjectTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:inActiveFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:inActiveFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:inActiveFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    And I click toggle button to select "Focus Areas - All"
    And I perform quick search for "{SavedValue:draftFocusID}" in "---grantee_tableId:-:GranteeProjectTableId---" panel
    Then I softly see value "Draft" for title "Status" against the value "{SavedValue:draftFocusID}" inside table "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:draftFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:draftFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:draftFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    And I perform quick search for "{SavedValue:activeFocusID}" in "---grantee_tableId:-:GranteeProjectTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:activeFocusID}" inside table "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:activeFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:activeFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:activeFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    And I perform quick search for "{SavedValue:inActiveFocusID}" in "---grantee_tableId:-:GranteeProjectTableId---" panel
    Then I softly see value "Inactive" for title "Status" against the value "{SavedValue:inActiveFocusID}" inside table "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:inActiveFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:inActiveFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:inActiveFocusID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"

  @440225 @ValidateAdminuseronActivatebuttonabletoseetheconfirmationvalidation @P2_Grantee @ADMIN_Grantee @GRegression5
  Scenario: Validate Admin user on Activate button able to see the confirmation validation
    When I login to "Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I enter in modal value "Automation Test Description" into field "Description__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Once Active, the Focus area will be available for association with application and award. Are you sure you want to activate the focus area?" is displayed
    And I click "Cancel" on modal confirmation box
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Once Active, the Focus area will be available for association with application and award. Are you sure you want to activate the focus area?" is displayed
    And I click "OK" on modal confirmation box
    Then I see status in Progress-bar is "Active" and is "dark blue"

    @440233 @440235 @validatewithPMProfileafterclickonNewbuttonCreateFocusareaModalshouldgetopenandredirecttofocusareapagelayout @P1_Grantee @GRegression1 @PM_Grantee @sprint15
    Scenario: Validate with PM Profile after click on New button Create Focus area Modal should get open and redirect to focus area page layout
    When I login to "Grantee" app as "GRANTEE PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    And I click on "Save and Continue" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Title is required.                |
      | To Save, Description is required.          |
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I enter value "Automation Test Description" into field "Description__c"
    And I save the field labeled "Title" as "FAtitle"
    And I save the field labeled "Description" as "FAdescription"
    When I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    Then I softly see field "Title" as "{SavedValue:FAtitle}"
    Then I softly see field "Description" as "Automation Test Description" in "Details" pageblock
    And I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Activate" in page detail
    #440235
    Then I softly see field "Status" as "Draft"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly see "Collapse" button for header
    Then I softly see "Resize" button for page
    Then I softly see "Collapse" button for page
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"

  @440278 @ValidatePOprofileabletoseeviewactiononlyfortheFocusareas @PO_Grantee @GRegression5 @P3_Grantee
    Scenario: Validate PO profile able to see view action only for the Focus areas
    When I login to "Grantee" app as "GRANTEE PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I enter in modal value "Automation Test Description" into field "Description__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:focusAreaAddFilesTableId---"
    When I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I see "AttachmentTesting.pdf" has been added in "Focus Area Files" flex table
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:focusAreaAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Focus Area Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:focusAreaNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:focusAreaNotesTableId---"
    And I save the field labeled "EGMS ID" as "FocusEGMSID"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:GranteeProjectTableId---"
    When I perform quick search for "{SavedValue:FocusEGMSID}" in "---grantee_tableId:-:GranteeProjectTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:FocusEGMSID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:FocusEGMSID}" in flex table with id "---grantee_tableId:-:GranteeProjectTableId---"
    And I click on "View" icon for "{SavedValue:FocusEGMSID}" inside table
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Files" sub tab
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:focusAreaAddFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:focusAreaAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:focusAreaAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:focusAreaAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:focusAreaNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:focusAreaNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:focusAreaNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:focusAreaNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---grantee_tableId:-:focusAreaNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---grantee_tableId:-:focusAreaNotesTableId---"