@directGrantAnnouncementNysed @announcementM04
Feature: Validate all scenarios in the Direct Grant Announcement

  @NYSED-9898 @Sprint-33 @US-NYSED-9835 @M04
  Scenario Outline: Verify that the Announcement Owner can see updated validation message when fund code + year combination is already exists in the system
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation_CompDir_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "Fund Year" as "FundYear"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation_CompDir_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | An announcement for this Fund Year ({SavedValue:FundYear}) already exists. Please check the associated Program and Year. |

    Examples:
      | UserType |
      | PM       |

  @NYSED-9215 @Sprint-33 @US-NYSED-9064 @M04
  Scenario Outline: Verify that appropriate validation messages are displayed for PM/PO/FD/FO users when ‘Q&A Availability’ is set to Yes and the required fields (Question Deadline, Response Deadline, Submit Questions To) are left blank.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    And I enter value "Yes" into field "QAAvailability__c"
    And I enter value "State" into field "NYSED_FundingType__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Question Deadline is required in the Overview tab under the Q&A Information section.    |
      | To save, Response Deadline is required in the Overview tab under the Q&A Information section.    |
      | To save, Submit questions to: is required in the Overview tab under the Q&A Information section. |
    And I enter value "2" into field "QSubmissionDeadline__c"
    And I enter value "5" into field "AResponseDeadline__c"
    And I enter value "test@yopmail.com" into field "QAContactEmailAddress__c"
    And I wait for "2" seconds
    Then I softly see field "Question Deadline" as "{Date:M/d/yyyy::d+2}" in "Q&A Information" pageblock
    Then I softly see field "Response Deadline" as "{Date:M/d/yyyy::d+5}" in "Q&A Information" pageblock
    Then I softly see field "Submit questions to:" as "test@yopmail.com" in "Q&A Information" pageblock

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | FO       |
#      | PO       |

  @NYSED-9308 @Sprint-33 @US-NYSED-8850 @M04
  Scenario Outline: Verify that the Announcement Owner can see that Carry Over field is marked as required to save on the Announcement layout → Overview tab → Announcement Specific Settings section.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Carry Over" as "Yes" in "Announcement Specific Settings" pageblock
    Then I softly see asterisk mark on "Carry Over"
    And I enter value "--None--" into field "Carry_Over__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Carry Over is required in the Overview tab under the Announcement Specific Settings section. |

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | FO       |
#      | PO       |

  @NYSED-8805 @NYSED-8808 @NYSED-8810 @NYSED-8811 @Bug-NYSED-11052 @Sprint-32 @US-NYSED-8457 @M04
  Scenario Outline: Verify that the Internal user can see that on the Announcements phase → Announcements list view columns are updated as mentioned below.
  |Verify that the Internal user can see that on the Announcements phase → Competitive left-hand sidebar navigator -> Announcements list view columns are updated as mentioned below.|
  |Verify that the Internal user can see that on the Announcements phase → Directed left-hand sidebar navigator -> Announcements list view columns are updated as mentioned below.|
  |Verify that the Internal user can see that on the Announcements phase → Formula left-hand sidebar navigator -> Announcements list view columns are updated as mentioned below.|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    #NYSED-8805
    Then I see only the following headers in table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Type | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    #NYSED-8808
    Then I see only the following headers in table with id "---announcement:-:competitiveAnnouncementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    #NYSED-8810
    Then I see only the following headers in table with id "---announcement:-:annoucementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    #NYSED-8811
    Then I see only the following headers in table with id "---announcement:-:formulaAnnouncementTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Name | Funding Type | Direct Grant? | Estimated Total Funding | Published Date | Application Due Date | Status | Created By | Migrated |

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | FO       |
#      | PO       |

  @NYSED-6544 @Sprint-30 @US-NYSED-6262 @M04
  Scenario Outline: Verify that a validation message is displayed on Save when ‘Carry Over Limit’ is set to Yes and the ‘Carry Over Limit %’ field is left blank.- Standard Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    Given I navigate to "Overview" sub tab
    And I enter value "State" into field "NYSED_FundingType__c"
    And I clear the value from field "Carryover_Limit_Percent__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'. |
    And I enter value "No" into field "Carryover_Limit__c"
    Then I softly cannot see field "Carry Over Limit %" inside page block
    And I enter value "Yes" into field "Carryover_Limit__c"
    And I enter value "11" into field "Carryover_Limit_Percent__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Carry Over Limit %" as "11.00%" in "Announcement Specific Settings" pageblock

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @NYSED-6546 @Sprint-30 @US-NYSED-6262 @M04
  Scenario Outline: Verify that a validation message is displayed on Save when ‘Carry Over Limit’ is set to Yes and the ‘Carry Over Limit %’ field is left blank.- Direct Grant Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation_CompDir_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    Given I navigate to "Overview" sub tab
    And I enter value "State" into field "NYSED_FundingType__c"
    And I enter value "Test" into field "NYSED_GrantAbbreviation__c"
    And I clear the value from field "Carryover_Limit_Percent__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'. |
    And I enter value "No" into field "Carryover_Limit__c"
    Then I softly cannot see field "Carry Over Limit %" inside page block
    And I enter value "Yes" into field "Carryover_Limit__c"
    And I enter value "11" into field "Carryover_Limit_Percent__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Carry Over Limit %" as "11.00%" in "Announcement Specific Settings" pageblock

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @NYSED-10893 @NYSED-10896 @NYSED-10898 @NYSED-10899 @Sprint-37 @US-NYSED-10406 @M04
  Scenario Outline: Verify that a validation message is displayed on Save when ‘Carry Over Limit’ is set to Yes and the ‘Carry Over Limit %’ field is left blank.- Direct Grant Announcement
  |Verify that the Announcement Owner can see that, on the Create Announcement modal → Announcement Specific Settings section, below changes have been made|
  |Verify that the Announcement Owner can see that, on the Announcement layout → Overview tab → Announcement Specific Settings section, the changes have been made.|
  |Verify that the Announcement Owner can see that, on the Announcement layout → Financials tab → Budget Specific Settings section, ‘Budgeting is Required for:’ field is defaulted to ‘Only First Budget Period’ and is non editable.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    And I wait for "2" seconds
    #NYSED-10893
    Then I see only the following ordered options in dropdown field "Allocationlevel__c" :
      | --None-- | By Applicant | N/A |
    #NYSED-10896
    Then I softly cannot see field on modal "Subrecipient Match Required?" inside page block
    Then I softly cannot see field on modal "Focus Areas Required?" inside page block
    Then I softly cannot see field on modal "KPIs Required?" inside page block
    Then I softly cannot see field on modal "Objectives Required?" inside page block
    When I enter "Creation_CompDir_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    When I navigate to "Overview" sub tab
    #NYSED-10898
    Then I softly do not see field "Subrecipient Match Required?" inside "Announcement Specific Settings" section
    Then I softly do not see field "Focus Areas Required?" inside "Announcement Specific Settings" section
    Then I softly do not see field "KPIs Required?" inside "Announcement Specific Settings" section
    Then I softly do not see field "Objectives Required?" inside "Announcement Specific Settings" section
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    #NYSED-10899
    Then I softly see field "Budgeting is Required for:" as "Only First Budget Period" in "Budget Specific Settings" pageblock
    Then I softly see field "Budgeting is Required for:" is not editable

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @NYSED-10900 @NYSED-10904 @Sprint-37 @US-NYSED-10406 @M04
  Scenario Outline: Verify that the Announcement Owner can see that, on the Announcement layout → Financials tab → Budget Period Details section, a new editable, required to save and submit for Approval, and Date field ‘FS-10F Due Date’ is added after ‘Amendment Deadline’.
  |Verify that, apart from the FD user, other users cannot see the section Action ‘Associate' and Inline Edit and Remove actions on the Financials Tab->Budget categories section when the announcement is in ‘Created’ state|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    #NYSED-10904
    Then I softly cannot see top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly can see row level action button "No Actions Available" against "Support Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly cannot see row level action button "Remove" against "Professional Staff Salaries" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I click on "Save" in the page details
    #NYSED-10900
    Then I see only the following headers in table with id "---announcement:-:budgetPeriodTableId---" :
      | Actions | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 60                 |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 30              |
    Then I softly see the following messages in the page details contains:
      | The FS-10F Due Date should not be before the Budget Period Start Date. |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Financials Tab - Add FS-10F Due Date for each budget period. |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
