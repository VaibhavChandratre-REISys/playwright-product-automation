@programExecution @grantor-regression @grantor-parallel-regression @planning @regression
Feature: Validate all scenarios for program

  Background: Create Program
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details

  @34730 @programListView
  Scenario Outline: Verifying if the EXE,PM,PO has access to Internal Programs list view
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "<Program flextable Header>"
    When I perform quick search for "<Program>" in "---program:-:programsTableId---" panel
    Then I see that "<Program>" has been added in flextable with Id "---program:-:programsTableId---"
    Examples:
      | Program flextable Header  | Program                                          |
      | Internal Programs - Draft | {SavedValue:Automation Runtime Internal Program} |

  @105872 @VerifyDeletionOfCreatedProgram
  Scenario Outline: Verifying if the owner of program is ablr to delete created program
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "<Program flextable Header>"
    When I perform quick search for "<Program>" in "---program:-:programsTableId---" panel
    And I click on "Delete" icon for "<Program>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I perform quick search for "<Program>" in "---program:-:programsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:programsTableId---"
    Examples:
      | Program flextable Header  | Program                                          |
      | Internal Programs - Draft | {SavedValue:Automation Runtime Internal Program} |

  @34503 @66389 @105898 @35985 @75815 @38247 @75816 @75817 @75812 @75813 @75910 @75911 @75814 @updateFieldsValidationCheck
  Scenario: To verify that the user is able to modified created internal program settings and view the added setting by the creating a direct grant.
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #105898 #monu
    Then I softly see field "Focus Areas Required?" as "Yes"
    And I softly see field "KPI" as "Yes"
    And I softly see field "Objectives Required?" as "Yes"
    #66389
    And I click on "Edit" in the page details
    And I enter "Edition1" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Focus Areas Required?" as "No"
    And I softly see field "KPI" as "No"
    And I softly see field "Objectives Required?" as "No"
    And I navigate to "Setup" sub tab
    Then I softly see value "Pre-Screen Review" for title "Step Name" inside table "---program:-:reviewStepTableId---"
    And I softly see value "SME Review" for title "Step Name" inside table "---program:-:reviewStepTableId---"
    And I softly see value "Management Review" for title "Step Name" inside table "---program:-:reviewStepTableId---"
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Pre-Screen Review | 0               |
      | SME Review        | 0               |
      | Management Review | 0               |
    And I wait for "3" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 0.00%. |
    And I wait for "3" seconds
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Pre-Screen Review | 0               |
      | SME Review        | 50              |
      | Management Review | 50              |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I wait for "3" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | There are no errors with the review step templates. |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Pre-Screen Review | 20              |
      | SME Review        | 50              |
      | Management Review | 50              |
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 120.00%.                                   |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Pre-Screen Review | 0               |
      | SME Review        | 50              |
      | Management Review | 30              |
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 80.00%. |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Order | Step Name         |
      | 1          | Update pre-review |
    Then I softly see value "Update pre-review" for title "Step Name" inside table "---program:-:reviewStepTableId---"
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Order | Step Name         |
      | 1          | Pre-Screen Review |
    And I click on "Delete" icon for "Pre-Screen Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    Then I softly do not see value "Pre-Screen Review" for title "Step Name" inside table "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Order | Section Header                  |
      | 1             | Return on Investment (ROI) Test |
    Then I softly see value "Return on Investment (ROI) Test" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I click on "Delete" icon for "Return on Investment (ROI) Test" inside flex table with id "---program:-:programReviewPanel---"
    Then I softly do not see value "Return on Investment (ROI) Test" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I click on parallel menu button in flex table title "Review Steps"
    And I select "Download as PDF" from parallel lines dropdown of "Review Steps"
    And I download the file
    Then I softly see following details in "govgrants" pdf file:
      | Detail            | Page Number |
      | SME Review        | 1           |
      | Management Review | 1           |

  @75918  @75925 @75923 @75919 @75926 @75924 @75983 @75980 @75979 @75975 @75978 @75984 @75982 @75977  @addReviewerInPre-ScreenAndManagementReview
  Scenario: To verify user able to add reviewers in reviewers section for pre-screening review step in setup tab of planning
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    And I refresh the page
    And I wait for "4" seconds
    Then I softly see value "{SavedValue:PM Username}" for title "Reviewer" inside table "---program:-:addReviewersTableId---"
    And I click on parallel menu button in flex table title "Reviewers"
    And I select "Download as PDF" from dropdown
    And I download the file
    Then I softly see following details in "govgrants" pdf file:
      | Detail                   | Page Number |
      | {SavedValue:PM Username} | 1           |
    And I switch to parent tab
    And I click on "Remove from Form" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:addReviewersTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly do not see value "{SavedValue:PM Username}" for title "Reviewer" inside table "---program:-:addReviewersTableId---"
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "Management Review"
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    And I refresh the page
    Then I softly see value "{SavedValue:PM Username}" for title "Reviewer" inside table "---program:-:addReviewersTableId---"
    And I click on parallel menu button in flex table title "Reviewers"
    And I select "Download as PDF" from dropdown
    And I download the file
    Then I softly see following details in "govgrants" pdf file:
      | Detail                   | Page Number |
      | {SavedValue:PM Username} | 1           |
    And I switch to parent tab
    And I click on "Remove from Form" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:addReviewersTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly do not see value "{SavedValue:PM Username}" for title "Reviewer" inside table "---program:-:addReviewersTableId---"
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on parallel menu button in flex table title "Review Forms"
    And I select "Download as PDF" from dropdown
    And I download the file
    Then I softly see following details in "govgrants" pdf file:
      | Detail     | Page Number |
      | Pre-Screen | 1           |
    And I switch to parent tab
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) |
      | Pre-Screen | 100.00%         |
    Then I softly see the following messages in the page details contains:
      | You cannot associate a weight to an optional panel |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Delete" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No records found" inside flex table with id "---program:-:reviewStepTableId---"
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: At least one form is required for this review step. |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I collapse nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Weight (%) | Form Name              |
      | 100.00%         | Management Review Test |
    Then I softly see value "Management Review Test" for title "Form Name" inside table "---program:-:reviewStepTableId---"
    And I click on parallel menu button in flex table title "Review Forms"
    And I select "Download as PDF" from dropdown
    And I download the file
    Then I softly see following details in "govgrants" pdf file:
      | Detail                 | Page Number |
      | Management Review Test | 1           |
    And I switch to parent tab
    And I click on "Delete" icon for "Management Review Test" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    Then I softly do not see value "Management Review Test" for title "Form Name" inside table "---program:-:reviewStepTableId---"
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Management Review: At least one form is required for this review step. |

  @76129 @76125 @76292 @76130 @76126 @76293 @76127 @76131 @76128 @76132
  Scenario: To verify search functionality for review panel categories section in fiscal review form in SME review step of setup tab in planning
    And I navigate to "Setup" sub tab
      #76129
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Order | Section Header |
      | 2             | Match Test     |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I softly see value "Match Test" for title "Section Header" inside table "---program:-:programReviewPanel---"
      #76125
    Then I softly see total records count "Total Records: 3" in flex table "---program:-:programReviewPanel---"
      #76292
    And I click on "Delete" icon for "Match Test" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
   # Then I softly see the following messages in the page details contains:
    #  | Record deleted successfully. |
    And I softly do not see value "Match Test" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
      #76130
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Order | Section Header |
      | 2             | Impact Test    |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I softly see value "Impact Test" for title "Section Header" inside table "---program:-:programReviewPanel---"
      #76126
    Then I softly see total records count "Total Records: 3" in flex table "---program:-:programReviewPanel---"
      #76293
    And I click on "Delete" icon for "Impact Test" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
   # Then I softly see the following messages in the page details contains:
   #   | Record deleted successfully. |
    And I softly do not see value "Impact Test" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I refresh the page
    And I navigate to "Setup" sub tab
    #76127
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Order | Section Header   |
      | 1             | Eligibility Test |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I softly see value "Eligibility Test" for title "Section Header" inside table "---program:-:programReviewPanel---"
      #76131
    And I click on "Delete" icon for "Eligibility Test" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
   # Then I softly see the following messages in the page details contains:
   #   | Record deleted successfully. |
    And I softly do not see value "Eligibility Test" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I refresh the page
    When I navigate to "Setup" sub tab
    When I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    #76128
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Order | Section Header   |
      | 2             | Environment Test |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I softly see value "Environment Test" for title "Section Header" inside table "---program:-:programReviewPanel---"
      #76132
    And I click on "Delete" icon for "Environment Test" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
   # Then I softly see the following messages in the page details contains:
   #   | Record deleted successfully. |
    Then I softly do not see value "Environment Test" for title "Section Header" inside table "---program:-:programReviewPanel---"

  @76294 @76295 @76296 @76297 @76298 @76486 @76497 @76498 @76566 @76567 @76570 @76571 @76572 @76573 @76574 @76496
  Scenario: To validate the filters of program review panel
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Pre-Screen | Checked   | 100             | 1                                         |
    And I pause execution for "5" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A weighted form must contain weighted sections. |
    When I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 30                 |
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Completeness   | 60                 |
    And I close "Review Form" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted.  |
      | Setup Tab - Pre-Screen Review - Pre-Screen: The total section weight must equal 100% or 0%. It is currently 90%.                                    |
    When I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 40                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 40                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Completeness   | 60                 |
    And I close "Review Form" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted.  |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    When I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Environment    | 30                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Permits        | 40                 |
    And I close "Review Form" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Schedule section because it is weighted.     |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Environment section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Permits section because it is weighted.      |
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 50                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Environment    | 30                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Permits        | 40                 |
    And I close "Review Form" modal by clicking the top right x button
    And I pause execution for "9" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Schedule section because it is weighted.     |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Environment section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Permits section because it is weighted.      |
      | Setup Tab - SME Review - Compliance Review: The total section weight must equal 100% or 0%. It is currently 120%.                                   |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 20                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Environment    | 30                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Permits        | 40                 |
    And I close "Review Form" modal by clicking the top right x button
    And I pause execution for "9" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Schedule section because it is weighted.     |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Environment section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Permits section because it is weighted.      |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: The total section weight must equal 100% or 0%. It is currently 90%.                                    |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Environment    | 30                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Permits        | 40                 |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Schedule section because it is weighted.     |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Environment section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Permits section because it is weighted.      |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 0                  |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 0                  |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 0                  |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted.  |
      | Setup Tab - SME Review - Fiscal Review: A score cannot be associated to a question in the Budget section because it does not have a weight.         |
      | Setup Tab - SME Review - Fiscal Review: A score cannot be associated to a question in the Match section because it does not have a weight.          |
      | Setup Tab - SME Review - Fiscal Review: A score cannot be associated to a question in the Program Income section because it does not have a weight. |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Schedule section because it is weighted.     |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Environment section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Permits section because it is weighted.      |
      | Setup Tab - SME Review - Fiscal Review: A weighted form must contain weighted sections.                                                             |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 70                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 20                 |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Schedule section because it is weighted.     |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Environment section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Permits section because it is weighted.      |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 30                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 30                 |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Schedule section because it is weighted.     |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Environment section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Permits section because it is weighted.      |
      | Setup Tab - SME Review - Fiscal Review: The total section weight must equal 100% or 0%. It is currently 90%.                                        |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 60                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Completeness   | 60                 |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Schedule section because it is weighted.     |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Environment section because it is weighted.  |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Permits section because it is weighted.      |
      | Setup Tab - Pre-Screen Review - Pre-Screen: The total section weight must equal 100% or 0%. It is currently 120%.                                   |
      | Setup Tab - SME Review - Fiscal Review: The total section weight must equal 100% or 0%. It is currently 90%.                                        |

  @76943 @76944 @76948 @76947 @76984 @76985 @77098
  Scenario: To verify user able to modify review question in Strategic Alignment of Review Panel Categories in management review form for management review step in planning phase
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Strategic Alignment"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type |
      | 2              | Date |
      #76943 following 2 assertion belongs to this
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I softly see value "Date" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I refresh the page
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 3              | Test 2   | Yes/No | 0         |
      #76944 following 5 assertion belongs to this
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Test 2" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type    |
      | 2              | Written |
       #76948 following 2 assertion belongs to this
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "2" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
      #76947 following 2 assertion belongs to this
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I softly do not see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    #And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 5              | Test 5   | Yes/No | 0         |
      #76984 following 5 assertion belongs to this
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "5" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Test 5" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
      #76985 following 5 assertion belongs to this
    Then I softly see "Completeness" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I refresh the page
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 4              | Test 4   | Yes/No | 0         |
      #77098 following 5 assertion belongs to this
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"

  @passed @34731 @programEdition
  Scenario: Verifying if the EXE, PM, PO has create access to Internal Program
    When I click on "Edit" in the page details
    And I enter "RequiredForSubmit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @passed @contactAssociation
  Scenario Outline: Associate contact on program
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I refresh the page
    Then I see that "<Contact>" has been added in flextable with Id "---program:-:contactsTableId---"
    Examples:
      | Contact                   |
      | {SavedValue:EXE Username} |

  @passed @105880 @ValidateDeletionOfAssociatedContact
  Scenario Outline: Verify user is able to delete associated contact
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I refresh the page
    Then I softly see that "<Contact>" has been added in flextable with Id "---program:-:contactsTableId---"
    And I click on "Remove" icon for "<Contact>" inside flex table with id "---program:-:contactsTableId---" without waiting for record
  #  Then I softly see the following messages in the page details contains:
   #   | Record removed successfully. |
    Then I softly see "No records found" inside flex table with id "---program:-:contactsTableId---"

    Examples:
      | Contact                   |
      | {SavedValue:EXE Username} |

  @34740 @programApproverSelection
  Scenario: Validate the assignment of Approvers for the Internal Program
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
    Then I see that "{SavedValue:EXE Username}" has been added in flextable with Id "---program:-:approverTableId---"

  @34616 @76118 @75992 @75821 @75830 @75831 @75836 @75832 @75840 @75841 @programFocusAreaAssociation
  Scenario Outline: Validate the association of Focus Area for the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Title>" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    Then I softly see that "<Title>" has been added in flextable with Id "---program:-:focusAreaTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
#    And I perform quick search for "Completeness" in "---program:-:programReviewPanel---" panel
    Then I softly see value "Completeness" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    Then I softly see value "{SavedValue:PM Username}" for title "Reviewer" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "pm.automation@yopmail.com" for title "Email" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Test Automation Organization" for title "Organization Name" inside table "---program:-:reviewStepTableId---"
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    Then I softly see value "Fiscal Review" for title "Form Name" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Program Review" for title "Form Name" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Compliance Review" for title "Form Name" inside table "---program:-:reviewStepTableId---"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 25              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 25              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Compliance Review | 50              |
    Then I softly see value "25.00%" for title "Form Weight (%)" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "25.00%" for title "Form Weight (%)" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "50.00%" for title "Form Weight (%)" inside table "---program:-:reviewStepTableId---"
    And I click on "Delete" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    Then I softly see the following messages in the page details :
      | Record deleted Successfully. |
    When I enter the following values into flex table with id "---program:-:reviewFormPanelId---" by clicking "New" :
      | Form Name         | Required? | Minimum Number of Reviews per Application |
      | Automation Review | Checked   | 1                                         |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    Then I softly see value "{SavedValue:PM Username}" for title "Reviewer" inside table "---program:-:addReviewersTableId---"
    Then I softly see value "pm.automation@yopmail.com" for title "Email" inside table "---program:-:addReviewersTableId---"
    Then I softly see value "Test Automation Organization" for title "Organization Name" inside table "---program:-:addReviewersTableId---"
    And I click on "Remove from Form" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:addReviewersTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Record removed successfully. |
    When I click on parallel lines menu bar with data target value "Review Forms"
    And I select "Download as PDF" from parallel lines dropdown of "Review Forms"
    And I wait for "3" seconds
    And I download the file
    And I wait for "3" seconds
    Then I softly see "Review Forms" on page "1" of "govgrants" pdf file
    Examples:
      | Title                           |
      | Automation Permanent Focus Area |

  @106094 @VerifyDeletionOfAssociatedFocusArea
  Scenario Outline: Validate user is able to delete associated focus area for the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Title>" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    Then I softly see that "<Title>" has been added in flextable with Id "---program:-:focusAreaTableId---"
    And I click on "Remove" icon for "<Title>" inside flex table with id "---program:-:focusAreaTableId---" without waiting for record
   # Then I softly see the following messages in the page details contains:
   #   | Record deleted successfully. |
    Then I softly see "No records found" inside flex table with id "---program:-:focusAreaTableId---"

    Examples:
      | Title                           |
      | Automation Permanent Focus Area |

  @105920 @VerifyErrorMessageForFocusArea
  Scenario: Validate user is able to see error message for focus area after making program detail changes
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Automation test description" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I wait for "3" seconds
    And I click modal button "Close"
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    When I enter value "No" into field "FocusAreaRequired__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Setup Tab - Remove all the Focus Areas associated with this program if the Focus Area Required is "No". |

  @34737 @76116 @76117 @76113 @76115 @75894 @75888 @75891 @programObjectiveAssociation
  Scenario Outline: Validate the Association of Objective to the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    Then I softly see that "<Objective>" has been added in flextable with Id "---program:-:objectivesTableId---"
    And I wait for "3" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 25              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 25              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Compliance Review | 50              |
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:programReviewPanel---" by clicking "New" :
      | Section Order | Section Header    |
      | 4             | Automation Header |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "Automation Header" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:programReviewPanel---" by clicking "New" :
      | Section Order | Section Header    |
      | 4             | Automation Header |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "Automation Header" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    Then I softly see value "Schedule" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Environment" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Permits" for title "Section Header" inside table "---program:-:programReviewPanel---"
    When I enter the following values into flex table with id "---program:-:programReviewPanel---" by clicking "New" :
      | Section Order | Section Header    |
      | 3             | Automation Header |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "Automation Header" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I click on "Delete" icon for "Automation Header" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
    And I click on "Delete" icon for "Schedule" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
    And I click on "Delete" icon for "Environment" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
    And I click on "Delete" icon for "Permits" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review - Compliance Review: At least one section must be added to this form. |
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PO Username} |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I click on parallel menu button in flex table title "Reviewers"
    And I select "Download as PDF" from parallel lines dropdown of "Reviewers"
    And I wait for "3" seconds
    And I download the file
    And I wait for "5" seconds
    Then I softly see "Review Steps" on page "1" of "govgrants" pdf file
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @106288 @VerifyDeletionOfAssociatedProgramObjective
  Scenario Outline: Validate user is able to delete associated objective from program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    Then I softly see that "<Objective>" has been added in flextable with Id "---program:-:objectivesTableId---"
    And I click on "Remove" icon for "<Objective>" inside flex table with id "---program:-:objectivesTableId---" without waiting for record
 #   Then I softly see the following messages in the page details contains:
  #    | Record deleted successfully. |
    Then I softly see "No records found" inside flex table with id "---program:-:objectivesTableId---"

    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @34738 @75991 @75993 @75895 @75896 @75909 @75912 @75913 @programKPIAssociation
  Scenario Outline: Validate the association of KPI
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "<EGMS Id>" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    Then I softly see that "<EGMS Id>" has been added in flextable with Id "---program:-:kpiTableId---"
    And I pause execution for "2" seconds
    And I expand nested table containing column value "Management Review"
    And I pause execution for "5" seconds
    When I enter the following values into flex table with id "---program:-:reviewFormPanelId---" by clicking "New" :
      | Form Name         | Required? | Minimum Number of Reviews per Application |
      | Automation Review | Checked   | 1                                         |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    When I collapse nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Management Review"
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I collapse nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Management Review"
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PO Username} |
    #Bug445183
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    When I collapse nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    Then I softly see value "Strategic Alignment" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Return on Investment (ROI)" for title "Section Header" inside table "---program:-:programReviewPanel---"
    When I enter the following values into flex table with id "---program:-:programReviewPanel---" by clicking "New" :
      | Section Order | Section Header    |
      | 3             | Automation Header |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |

    Examples:
      | EGMS Id                  |
      | Automation Permanent KPI |

  @106096 @verifyDeletionOfAssociatedProgramKPI
  Scenario Outline: Validate user is able to delete associated kpi from program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "<EGMS Id>" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    Then I softly see that "<EGMS Id>" has been added in flextable with Id "---program:-:kpiTableId---"
    And I click on "Remove" icon for "<EGMS Id>" inside flex table with id "---program:-:kpiTableId---" without waiting for record
   # Then I softly see the following messages in the page details contains:
   #   | Record deleted successfully. |
    Then I softly see "No records found" inside flex table with id "---program:-:kpiTableId---"

    Examples:
      | EGMS Id                  |
      | Automation Permanent KPI |

  @34745 @75997 @76112 @76119 @38242 @programAttachmentChecklist @needToCheckErrorMessage
  Scenario: Validate the attachment checklist for the Internal Program
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    And I pause execution for "2" seconds
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see that "Active" has been added in flextable with Id "---program:-:checklistTableId---"
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I pause execution for "2" seconds
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    Then I softly see value "Budget" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Match" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Program Income" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    Then I softly see value "Capability" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Approach" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Impact" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
#    And I perform quick search for "Permit" in "---program:-:programReviewPanel---" panel
    Then I softly see value "Permits" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "SME Review"
    And I click on "Delete" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I click on "Delete" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I click on "Delete" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    # message disappear in fraction of second
   # Then I softly see the following messages in the page details :
   #   | Setup Tab - SME Review: At least one form is required for this review step.                                   |
   #   | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |
#    And I expand nested table containing column value "SME Review"
    Then I see "No Records Found" inside flex table with id "---program:-:reviewStepTableId---"

  @passed @106079 @106078 @105941 @ValidateDeletionOfSupportingDocuments
  Scenario: Validate user is able to delete the attachment checklist for the Internal Program
    When I navigate to "Setup" sub tab
    #105941 #monu
    Then I softly see value "Grantor Application Forms" for title "Package Name" inside table "---program:-:ProgramBusinessFormTableId---"
    Then I softly see value "Organization Desk Review" for title "Package Name" inside table "---program:-:ProgramBusinessFormTableId---"
    Then I softly see value "Grantor Progress Report Forms" for title "Package Name" inside table "---program:-:ProgramBusinessFormTableId---"
    Then I softly see value "Grantor Site Visit Forms" for title "Package Name" inside table "---program:-:ProgramBusinessFormTableId---"
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    Then I softly see that "Active" has been added in flextable with Id "---program:-:checklistTableId---"
    #106078 #monu
    And I edit the following rows inline in flex table with id "---program:-:checklistTableId---" by clicking "Edit" :
      | Required  | Description     |
      | Mandatory | Automation test |
    And I wait for "1" seconds
    Then I softly see that "Automation test" has been added in flextable with Id "---program:-:checklistTableId---"
    #106079 #monu
    When I click on "Delete" icon for "Mandatory" inside flex table with id "---program:-:checklistTableId---" without waiting for record
  #  Then I softly see the following messages in the page details contains:
   #   | Record deleted successfully. |
    Then I softly see "No records found" inside flex table with id "---program:-:checklistTableId---"

  @106083 @VerifyViewOfAddedLinkAtSupportingDocument
  Scenario: Validate user is able to download uploaded document by clicking on view link
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    Then I softly see that "Active" has been added in flextable with Id "---program:-:checklistTableId---"
    Then I click in table hyperlink containing value "View"


  @76114 @75990 @75996 @75994 @prescreenReviewPanel
  Scenario: To validate system generated validation message for Pre-screen review,when review panel categories has not associated with Pre-screen review form in setup tab in planning phase
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I pause execution for "3" seconds
    When I enter the following values into flex table with id "---program:-:programReviewPanel---" by clicking "New" :
      | Section Order | Section Header    |
      | 3             | Automation Header |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "Automation Header" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Eligibility" for title "Section Header" inside table "---program:-:programReviewPanel---"
    Then I softly see value "Completeness" for title "Section Header" inside table "---program:-:programReviewPanel---"
    And I click on "Delete" icon for "Eligibility" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
    And I click on "Delete" icon for "Completeness" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
    And I click on "Delete" icon for "Automation Header" inside flex table with id "---program:-:programReviewPanel---" without waiting for record
    And I close "Review Form" modal by clicking the top right x button
    And I wait for "2" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - Pre-Screen Review - Pre-Screen: At least one section must be added to this form. |

  @75995 @managementreviewReviewPanel
  Scenario: To validate system generated validation message for management review,when review panel categories has not associated with management form in setup tab in planning phase
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I click on "Delete" icon for "Return on Investment (ROI)" inside flex table with id "---program:-:programReviewPanel---"
    And I click on "Delete" icon for "Strategic Alignment" inside flex table with id "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I wait for "2" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - Management Review - Management Review: At least one section must be added to this form. |

  @34750 @106291 @110156 @110141 @submittingProgramForApproval  @FieldHistoryExclude
  Scenario: Validate the submission of Program for Approval
    And I wait for "5" seconds
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "3" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Automation test description" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "3" seconds
    #110141 #monu
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Program Artifacts" has been added in "Program Files" flex table
    And I click on "Submit For Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #106291 #monu
    Then I softly cannot see top right button "Edit" in page detail
    #110156 #monu
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Submitted for Approval" for title "New Value" inside field history table
    Then I softly see value "Created" for title "Original Value" inside field history table

  @34754 @programApproval @smoke
  Scenario: Validate the approval of Internal Program
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
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
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Automation test description" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
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
    Then I see status in Progress-bar is "Approved" and is "dark blue"

  @106336 @programRejection1 @smoke
  Scenario: Validate user should be able to reject program
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
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
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    And I pause execution for "2" seconds
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"

  @53689 @verifyRelatedLogsTableForFocusAreaForActiveProgram
  Scenario Outline: Verify related log table for focus area for Active Program
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
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
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
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
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Active"
    And I perform quick search for "<Focus Area>" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "<Focus Area>" inside flex table with id "---focusarea:-:focusAreaTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    When I perform quick search for "<Program Name>" in "---focusarea:-:relatedProgramsTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---focusarea:-:relatedProgramsTableId---"
    Examples:
      | Focus Area                      | Program Name                                     |
      | Automation Permanent Focus Area | {SavedValue:Automation Runtime Internal Program} |

  @53690 @Verify_Relatedlogs_table_for_focusArea_for_Draft_Program  @smoke
  Scenario Outline: Verify related log table for focus area for draft Program
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Active"
    And I perform quick search for "<Focus Area>" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "<Focus Area>" inside flex table with id "---focusarea:-:focusAreaTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    When I perform quick search for "<Program Name>" in "---focusarea:-:relatedProgramsTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---focusarea:-:relatedProgramsTableId---"
    Examples:
      | Focus Area                      | Program Name                                     |
      | Automation Permanent Focus Area | {SavedValue:EXE Username}cution Internal Program |

  @53692 @Verify_Relatedlogs_table_for_focusArea_for_Active_Program_ViewAction
  Scenario Outline: Verify related log table for focus area for Active Program view Action
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
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
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
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
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Active"
    And I perform quick search for "<Focus Area>" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "<Focus Area>" inside flex table with id "---focusarea:-:focusAreaTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    When I perform quick search for "<Program Name>" in "---focusarea:-:relatedProgramsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---focusarea:-:relatedProgramsTableId---" without waiting for record
    Then I see status in Progress-bar is "Active" and is "dark blue"
    Examples:
      | Focus Area                      | Program Name                                     |
      | Automation Permanent Focus Area | {SavedValue:Automation Runtime Internal Program} |

  @76333 @76334 @76332 @SMEProgramReviewFormAndFiscalReviewForm  @wip
  Scenario Outline: To verify Filter functionality for review panel categories section in program review form in SME review step of setup tab in planning
  /To validate system is getting displayed error message for program review form, while adding invalid values into the filter for review panel categories section on setup tab of planning
  /To validate system is getting displayed error message for fiscal review form, while adding invalid values into the filter for review panel categories section on setup tab of planning
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 15                 |
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Approach       | 60                 |
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Impact         | 25                 |
    And I click on advance filter of table id "---program:-:programReviewPanel---" for LWC
    And I enter advance filter values inside id "---program:-:programReviewPanel---" for LWC
      | Section Order | equals to | 3 |
    Then I softly see value "3" for title "Section Order" inside table "---program:-:programReviewPanel---"
    And I enter advance filter values inside id "---program:-:programReviewPanel---" for LWC
      | Section Order | equals to | 5 |
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 75                 |
      | Match          | 75                 |
      | Program Income | 10                 |
    And I click on advance filter of table id "ProgramRelatedReviewPanelCategoriesFlexToggle" for LWC
    And I enter advance filter values inside id "ProgramRelatedReviewPanelCategoriesFlexToggle" for LWC
      | Section Order | equals to | 5 |
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanel---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76336 @76337 @WithoutPreScreenReviewFormWithoutManagementReviewForm
  Scenario: To validate system generated error message, When Prescreen review step has not associated with any review form in review form section in setup tab of planning
  / To validate system generated error message, When management review step has not associated with any review form in review form section in setup tab of planning
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Delete" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    Then I softly see "No Records Found" inside flex table with id "---program:-:reviewFormPanelId---"
    And I refresh the page
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: At least one form is required for this review step. |
    And I expand nested table containing column value "Management Review"
    And I click on "Delete" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:reviewFormPanelId---"
    And I refresh the page
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Management Review: At least one form is required for this review step.                                   |
      | Setup Tab - Management Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |

  @76339 @ValidateErrorMessageForComplianceReviewForm
  Scenario: To validate system generated error message,for compliance review form, If Review Panel Categories not associated with review question in SME review step of setup tab in planing
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    When I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Fiscal Review | 40              | 1                                         | Checked   |
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Program Review | 50              | 1                                         | Checked   |
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Compliance Review | 10              | 1                                         | Checked   |
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Schedule"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I wait for "2" seconds
    And I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Compliance Review: A weighted form must contain weighted sections. |

  @76480 @76481 @76482 @ManagementReviewPanelCategoryReviewFormWeight  @kjhefuwehfiuqwefh
  Scenario: To validate system generated error message , When Total section Weight is more than 100% for all Review Panel Categories in management review form for management review step in planning phase
  | To validate system generated error message , When Total section Weight is less than 100% for all Review Panel Categories in management review form for management review step in planning phase
  | To validate system generated error message ,When management review form Weight : 0% & total section weight : 100 % for all review panel categories for management review step in planning phase
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 70                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header      | Section Weight (%) |
      | Strategic Alignment | 50                 |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
 #   Then I softly see the following messages in the page details contains:
  #    | Setup Tab - Management Review - Management Review: The total section weight must equal 100% or 0%. It is currently 120%. |
    And I wait for "2" seconds
    And I collapse nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 60                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header      | Section Weight (%) |
      | Strategic Alignment | 30                 |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
  #  Then I softly see the following messages in the page details contains:
   #   | Setup Tab - Management Review - Management Review: The total section weight must equal 100% or 0%. It is currently 90%. |
    And I wait for "2" seconds
    And I collapse nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Management Review | 0               |
    And I collapse nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 60                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header      | Section Weight (%) |
      | Strategic Alignment | 40                 |
    And I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Management Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |

  @76478 @PrescreenReviewPanelCategoriesWithoutAssociated
  Scenario Outline: To validate system generated error message,for Prescreen Review form, If Review Panel Categories not associated with review question in  Prescreening review step of setup tab in planing
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 20              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Pre-Screen | 100.00          | 1                                         | Check     |
    And I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Pre-Screen | 10.00%          | 1                                         | Check     |
    And I refresh the page
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Eligibility"
#    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
#    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I collapse nested table containing column value "Eligibility"
    And I wait for "2" seconds
    And I expand nested table containing column value "Completeness"
#    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
#    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: The total Review Form weight must equal 100% for a weighted step. It is currently 10.00%.
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 95.00%.
      | Setup Tab - Pre-Screen Review - Pre-Screen: A weighted form must contain weighted sections.
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76579 @76580 @76581 @SMEReviewTotalSectionWeightValidation  @needToCheckErrorMessage
  Scenario Outline: To validate system generated error message ,When Total section Weight is 0% for all Review Panel Categories in program review form for SME review step in planning phase
  | To validate system generated error message , When Total section Weight is more than 100% for all Review Panel Categories in program review form for SME review step in planning phase
  | To validate system generated error message , When Total section Weight is less than 100% for all Review Panel Categories in program review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Compliance Review | 0               |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 30              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 70              |
    When I collapse nested table containing column value "SME Review"
    And I wait for "1" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 0                  |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Approach       | 0                  |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Impact         | 0                  |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Program Review: A score cannot be associated to a question in the Capability section because it does not have a weight. |
      | Setup Tab - SME Review - Program Review: A score cannot be associated to a question in the Approach section because it does not have a weight    |
      | Setup Tab - SME Review - Program Review: A score cannot be associated to a question in the Impact section because it does not have a weight.     |
      | Setup Tab - SME Review - Program Review: A weighted form must contain weighted sections.                                                         |
    When I collapse nested table containing column value "SME Review"
    And I wait for "1" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 50                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Approach       | 50                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Impact         | 20                 |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Program Review: The total section weight must equal 100% or 0%. It is currently 120%. |
    When I collapse nested table containing column value "SME Review"
    And I wait for "1" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 60                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Approach       | 30                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Impact         | 0                  |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Program Review: A score cannot be associated to a question in the Impact section because it does not have a weight. |
      | Setup Tab - SME Review - Program Review: The total section weight must equal 100% or 0%. It is currently 90%.                                |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76583 @76584 @76586 @PrescreeningSMEReviewQuestionValidation
  Scenario Outline: To verify,review question section displayed by default for all review panel categories for prrescreening review form in prescreening review step of planning phase
  |To verify,review question section displayed by default for all review panel categories for compliance review form in SME review step of planning phase
  |To verify,review question section displayed by default for all review panel categories for Fiscal review form in SME review step of planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Eligibility"
    Then I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Is applicant a legal entity registered in State of California?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "2" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "2" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "If applicable, were the required public comment processes observed and documented?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Total Records: 2" inside flex table with id "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 4              | Test 4   | Yes/No | 0         |
    When I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Schedule"
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 4              | Test 4   | Yes/No | 0         |
    When I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Environment"
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 4              | Test 4   | Yes/No | 0         |
    When I collapse nested table containing column value "Permits"
    And I expand nested table containing column value "Permits"
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Total Records: 3" inside flex table with id "---program:-:programReviewPanel---"
    And I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 7              | Test 7   | Yes/No | 0         |
    And I wait for "2" seconds
    When I collapse nested table containing column value "Budget"
    And I wait for "2" seconds
    And I expand nested table containing column value "Budget"
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 7" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I wait for "2" seconds
    When I collapse nested table containing column value "Budget"
    And I wait for "2" seconds
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 4              | Test 4   | Yes/No | 0         |
    And I wait for "2" seconds
    When I collapse nested table containing column value "Match"
    And I wait for "2" seconds
    And I expand nested table containing column value "Match"
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I wait for "2" seconds
    When I collapse nested table containing column value "Match"
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 3              | Test 3   | Yes/No | 0         |
    And I wait for "2" seconds
    When I collapse nested table containing column value "Program Income"
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Income"
    Then I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 3" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Total Records: 3" inside flex table with id "---program:-:programReviewPanel---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76922 @76921 @76937 @76936 @ValidatingReturnOnInvestmentQuestionValidatingStrategicAlignment  @skipOnJenkins
  Scenario Outline: To verify user allow to download PDF for review question in Return on Investment (ROI) of Review Panel Categories in management review form for management review step in planning phase
  | To verify user able to add new review question with success message in Return on Investment (ROI) of Review Panel Categories in management review form for management review step in planning phase
  | To verify user allow to download PDF for review question in Strategic Alignment of Review Panel Categories in management review form for management review step in plnning phase
  | To verify user able to add new review question with success message in Strategic Alignment of Review Panel Categories in management review form for management review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Return on Investment (ROI)"
    And I click on parallel lines menu bar with data target value "ProgramReviewPanelCategories"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Return on Investment (ROI)" on page "1" of "govgrants" pdf file
    Then I softly see "Strategic Alignment" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question" on page "1" of "govgrants" pdf file
    Then I softly see "Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max" on page "1" of "govgrants" pdf file
    Then I softly see "Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type    | Max Score |
      | 4              | Test     | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I expand nested table containing column value "Strategic Alignment"
    And I click on parallel lines menu bar with data target value "ProgramReviewPanelCategories"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Strategic Alignment" on page "1" of "govgrants" pdf file
    Then I softly see "Return on Investment (ROI)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question" on page "1" of "govgrants" pdf file
    Then I softly see "Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max" on page "1" of "govgrants" pdf file
    Then I softly see "Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type    | Max Score |
      | 3              | Test 1   | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 1" for title "Question" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76925 @76924 @76938 @ModificationDeletionManagementReviewQuestion  @needToCheckErrorMessage
  Scenario Outline: To verify user able to modify review question in Return on Investment (ROI) of Review Panel Categories in management review form for management review step in planning phase
  | To verify user able to delete review question with success message in Return on Investment (ROI) of Review Panel Categories in management review form for management review step in planning phase
  | To verify user able to delete review question with success message in Strategic Alignment of Review Panel Categories in management review form for management review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I wait for "2" seconds
    And I expand nested table containing column value "Return on Investment (ROI)"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type | Max Score |
      | 4              | Test 4   | Date | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "2" seconds
    When I collapse nested table containing column value "Return on Investment (ROI)"
    And I wait for "2" seconds
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type    |
      | 4              | Written |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "2" seconds
    When I collapse nested table containing column value "Return on Investment (ROI)"
    And I wait for "2" seconds
    And I expand nested table containing column value "Return on Investment (ROI)"
    And I wait for "2" seconds
    Then I softly see value "Written" for title "Type" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "4" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
  #  Then I softly see the following messages in the page details contains:
   #   | Record deleted successfully! |
    And I wait for "2" seconds
    When I collapse nested table containing column value "Return on Investment (ROI)"
    And I wait for "2" seconds
    And I expand nested table containing column value "Return on Investment (ROI)"
    Then I softly do not see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I wait for "2" seconds
    When I collapse nested table containing column value "Return on Investment (ROI)"
    And I wait for "2" seconds
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type | Max Score |
      | 3              | Test 3   | Date | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on "Delete" icon for "3" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    Then I softly do not see value "3" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @38246 @77115 @77106 @ValidatingPre-ScreenReviewFormAndComplianceReviewAdditionDeletion
  Scenario: To validate system generated error message ,When Total section Weight is 0% for all Review Panel Categories in prescreening review form for prescreening review step in planning phase
  | To verify user able to modify review question  in Environment of Review Panel Categories in compliance review form for SME review step in planning phase
  | To verify user able to add new review question with success message in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 40              |
      | SME Review        | 30              |
      | Pre-Screen Review | 30              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Required? | Minimum Number of Reviews per Application |
      | Pre-Screen | 100             | Check     | 1                                         |
    And I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application |
      | Pre-Screen | 10.00%          | 1                                         |
    And I refresh the page
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 0                  |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Completeness   | 0                  |
    And I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "5" seconds
    And I navigate to "Setup" sub tab
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |
    And I collapse nested table containing column value "Pre-Screen Review"
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I wait for "3" seconds
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type | Max Score |
      | 4              | Test 4   | Date | 0         |
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I collapse nested table containing column value "Environment"
    And I wait for "1" seconds
    And I expand nested table containing column value "Environment"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type   |
      | 4              | Number |
    And I pause execution for "3" seconds
    Then I softly see value "Number" for title "Type" against the value "4" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "4" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    Then I softly do not see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"

  @77118 @77116 @77122 @77120 @ValidatingAdditionModificationDeletionOfPermitsReview  @skipOnJenkins
  Scenario Outline: To verify user allow to download PDF for review question in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
  | To verify user able to add new review question with success message in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
  | To verify user able to modify review question in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
  | To verify user able to delete review question with success message in Permits of Review Panel Categories in compliance review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Permits"
    And I click on parallel lines menu bar with data target value "ProgramReviewPanelCategories"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Permits " on page "1" of "govgrants" pdf file
    Then I softly see "Environment" on page "1" of "govgrants" pdf file
    Then I softly see "Schedule" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question" on page "1" of "govgrants" pdf file
    Then I softly see "Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max" on page "1" of "govgrants" pdf file
    Then I softly see "Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type    | Max Score |
      | 4              | Test     | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type |
      | 4              | Date |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Date" for title "Type" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "4" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted Successfully. |
    Then I softly do not see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77124 @77123 @77170 @77171 @ValidatingPDFAdditionDeletionModificationInBudgetFiscalReviewForm  @skipOnJenkins
  Scenario Outline: To verify user allow to download PDF for review question in Budget of Review Panel Categories in Fiscal review form for SME review step in planning phase
  | To verify user able to add new review question with success message in Budget of Review Panel Categories in Fiscal review form for SME review step in planning phase
  | To verify user able to delete review question with success message in Budget of Review Panel Categories in Fiscal review form for SME review step in planning phase
  | To verify user able to modify review question in Budget of Review Panel Categories in Fiscal review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Budget"
    And I click on parallel lines menu bar with data target value "ProgramReviewPanelCategories"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Budget" on page "1" of "govgrants" pdf file
    Then I softly see "Program Income" on page "1" of "govgrants" pdf file
    Then I softly see "Match" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max Score" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%) " on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type    | Max Score |
      | 7              | Test 7   | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "7" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 7" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "7" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "7" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted Successfully. |
    Then I softly do not see value "7" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type |
      | 7              | Date |
    Then I softly see value "Date" for title "Type" against the value "7" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77172 @ValidatingAdditionInMatchFiscalReviewForm
  Scenario: To verify user able to add new review question with success message in Match of Review Panel Categories in Fiscal review form for SME review step in planning phase
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I get the "EGMS ID"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 4              | Test 4   | Yes/No | 0         |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"

  @77173 @77176 @77174 @ValidatingPDFModificationDeletionInMatchFiscalReviewForm
  Scenario Outline:  To verify user allow to download PDF for review question in match of Review Panel Categories in Fiscal review form for SME review step in planning phase
  | To verify user able to modify review question in Match of Review Panel Categories in fiscal review form for SME review step in planning phase
  | To verify user able to delete review question with success message in Match of Review Panel Categories in fiscal review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Budget"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    And I wait for "5" seconds
    Then I softly see "Budget" on page "1" of "govgrants" pdf file
    Then I softly see "Program Income" on page "1" of "govgrants" pdf file
    Then I softly see "Match" on page "1" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question" on page "1" of "govgrants" pdf file
    Then I softly see "Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max" on page "1" of "govgrants" pdf file
    Then I softly see "Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type    | Max Score |
      | 7              | Test 7   | Written | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "7" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 7" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "7" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type |
      | 7              | Date |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Date" for title "Type" against the value "7" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "7" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "7" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77189 @ValidatingAdditionInProgramIncomeFiscalReviewForm
  Scenario Outline: To verify user able to add new review question with success message in Program Income of Review Panel Categories in Fiscal review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type | Max Score |
      | 3              | Test 3   | Date | 0         |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 3" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "3" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76477 @ValidatingProgramReviewFormWithoutQuestion  @needToCheckErrorMessage
  Scenario Outline: To validate system generated error message,for Program Review form, If Review Panel Categories not associated with review question in SME review step of setup tab in planing
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Step Name         | Form Weight (%) |
      | Compliance Review | 10              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Step Name     | Form Weight (%) |
      | Fiscal Review | 40              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Step Name      | Form Weight (%) |
      | Program Review | 50              |
    And I wait for "2" seconds
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Capability"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I wait for "2" seconds
    And I collapse nested table containing column value "Capability"
    And I wait for "2" seconds
    And I expand nested table containing column value "Approach"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I wait for "2" seconds
    And I collapse nested table containing column value "Approach"
    And I wait for "2" seconds
    And I expand nested table containing column value "Impact"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Program Review: A score must be associated to at least one question in the Capability section because it is weighted. |
      | Setup Tab - SME Review - Program Review: A score must be associated to at least one question in the Approach section because it is weighted.   |
      | Setup Tab - SME Review - Program Review: A score must be associated to at least one question in the Impact section because it is weighted.     |
      | Setup Tab - SME Review - Compliance Review: A weighted form must contain weighted sections.                                                    |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76476 @ValidatingFiscalReviewFormWithoutQuestion
  Scenario Outline: To validate system generated error message,for Fiscal Review form, If Review Panel Categories not associated with review question in SME review step of setup tab in planing
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Compliance Review | 10              |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 40              |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 50              |
    When I collapse nested table containing column value "SME Review"
    And I wait for "1" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Budget"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I collapse nested table containing column value "Budget"
    And I wait for "1" seconds
    And I expand nested table containing column value "Match"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I collapse nested table containing column value "Match"
    And I wait for "1" seconds
    And I expand nested table containing column value "Program Income"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Budget section because it is weighted.         |
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Match section because it is weighted.          |
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Program Income section because it is weighted. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @38244 @ValidatingManagementReviewFormWithoutQuestion
  Scenario Outline: To validate system generated error message,for management review form, If Review Panel Categories not associated with review question in management review step of setup tab in planing
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Management Review | 100             |
    And I collapse nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Return on Investment (ROI)"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I wait for "2" seconds
    And I expand nested table containing column value "Strategic Alignment"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Management Review - Management Review: A score must be associated to at least one question in the Return on Investment (ROI) section because it is weighted. |
      | Setup Tab - Management Review - Management Review: A score must be associated to at least one question in the Strategic Alignment section because it is weighted.        |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @76479 @ValidatingTotalSectionWeightInManagmentReview
  Scenario: To validate system generated error message ,When Total section Weight is 0% for all Review Panel Categories in management review form for management review step in planning phase
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 0                  |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header      | Section Weight (%) |
      | Strategic Alignment | 0                  |
    And I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Management Review - Management Review: A score cannot be associated to a question in the Return on Investment (ROI) section because it does not have a weight. |
      | Setup Tab - Management Review - Management Review: A score cannot be associated to a question in the Strategic Alignment section because it does not have a weight.        |
      | Setup Tab - Management Review - Management Review: A weighted form must contain weighted sections.                                                                         |

  @77290 @77289 @77292 @77291  @PDFAdditionModificationDeletionInApproach
  Scenario Outline: To verify user allow to download PDF for review question in Approach of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user able to add new review question with success message in Approach of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user able to modify review question in Approach of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user able to delete review question with success message in Approach of Review Panel Categories in Program review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Approach"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    And I wait for "8" seconds
    Then I softly see "Capability" on page "1" of "govgrants" pdf file
    Then I softly see "Approach" on page "1" of "govgrants" pdf file
    Then I softly see "Impact" on page "2" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question" on page "1" of "govgrants" pdf file
    Then I softly see "Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max" on page "1" of "govgrants" pdf file
    Then I softly see "Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I wait for "3" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type | Max Score |
      | 11             | Test 11  | Date | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "11" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 11" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Date" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "11" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "11" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type    |
      | 11             | Written |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "2" seconds
    Then I softly see value "Written" for title "Type" against the value "11" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "11" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "11" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77293 @77294 @77343 @AdditionPDFModificationInImpact
  Scenario Outline: To verify user able to add new review question with success message in Impact of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user allow to download PDF for review question in Impact of Review Panel Categories in Program review form for SME review step in planning phase
  | To verify user able to modify review question in Impact of Review Panel Categories in Program review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 4              | Test 4   | Yes/No | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    And I wait for "8" seconds
    Then I softly see "Capability" on page "1" of "govgrants" pdf file
    Then I softly see "Approach" on page "1" of "govgrants" pdf file
    Then I softly see "Impact" on page "2" of "govgrants" pdf file
    Then I softly see "Section Weight (%)" on page "1" of "govgrants" pdf file
    Then I softly see "Section Header" on page "1" of "govgrants" pdf file
    Then I softly see "Section Order" on page "1" of "govgrants" pdf file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Then I softly see "Question" on page "1" of "govgrants" pdf file
    Then I softly see "Order" on page "1" of "govgrants" pdf file
    Then I softly see "Question Type" on page "1" of "govgrants" pdf file
    Then I softly see "Max" on page "1" of "govgrants" pdf file
    Then I softly see "Score" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type |
      | 4              | Date |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Date" for title "Type" against the value "4" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77418 @77422 @77421 @ValidatingErrorMessageInManagamentComplianceFiscalReviewForm
  Scenario Outline: To validate system generated error message, if Form Weight (%) :100% ,Minimum Number of Reviews per Application : 0 , Required? : Unchecked ,for Management Review form in Management Review step in planning phase
  | To validate system generated error message, if Form Weight (%) :20% ,Minimum Number of Reviews per Application : 0 , Required? : Unchecked ,for compliance Review form in SME Review step in planning phase
  | To validate system generated error message, if Form Weight (%) :40% ,Minimum Number of Reviews per Application : 0 , Required? : Unchecked ,for Fiscal Review form in SME Review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Management Review | Unchecked | 100             | 0                                         |
    Then I softly see the following messages in the page details contains:
      | You cannot associate a weight to an optional panel |
    When I collapse nested table containing column value "Management Review"
    And I wait for "1" seconds
    And I expand nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Compliance Review | Unchecked | 40              | 0                                         |
    Then I softly see the following messages in the page details contains:
      | You cannot associate a weight to an optional panel |
    And I refresh the page
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Fiscal Review | Unchecked | 40              | 0                                         |
    Then I softly see the following messages in the page details contains:
      | You cannot associate a weight to an optional panel |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77423 @ValidatingErrorMessageInPreScreenReviewForm
  Scenario Outline: To validate system generated error message, if Form Weight (%) :100% ,Minimum Number of Reviews per Application : 0 , Required? : Unchecked ,for prescreening Review form in prescreening Review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application |
      | Pre-Screen | 40              | 0                                         |
    Then I see the following messages in the page details contains:
      | You cannot associate a weight to an optional panel |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77484 @77483 @77482 @ValidatingReviewrsAreNotRequiredForOptionalPanelsInSMEReview
  Scenario Outline: To validate system generated error message, if Form Weight (%) :30% ,Minimum Number of Reviews per Application : 1 , Required? : Unchecked ,for compliance Review Review form in SME Review step in planning phase
  | To validate system generated error message, if Form Weight (%) :30% ,Minimum Number of Reviews per Application : 1 , Required? : Unchecked ,for fiscal Review Review form in SME Review step in planning phase
  | To validate system generated error message, if Form Weight (%) : 50% ,Minimum Number of Reviews per Application : 1 , Required? : unchecked ,for Program Review Review form in SME Review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Form Name         | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Compliance Review | Unchecked | 30              | 1                                         |
    Then I softly see the following messages in the page details contains:
      | Reviewers are not required for optional panels |
    And I refresh the page
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Form Name     | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Fiscal Review | Unchecked | 30              | 1                                         |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Reviewers are not required for optional panels |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Form Name      | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Program Review | Unchecked | 50              | 1                                         |
    Then I softly see the following messages in the page details contains:
      | Reviewers are not required for optional panels |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77486 @ValidatingMinimumNoOfReviewsShouldBeGreaterThanZeroInManagementReviewForm
  Scenario Outline: To validate system generated error message, if Form Weight (%) : 0% , Minimum Number of Reviews per Application : 0 , Required? :checked ,for management Review form in management Review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application |
      | Management Review | 0               | 0                                         |
    Then I see the following messages in the page details contains:
      | For required panel the Minimum Number of Reviews should be greater than zero. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77488 @ValidatingReviewersAreNotRequiredForOptionalPanelsManagementReviewForm
  Scenario Outline: To validate system generated error message, if Form Weight (%) :100% , Minimum Number of Reviews per Application : 1 , Required? : Unchecked ,for management Review form in management Review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Management Review | 100             | 1                                         | Unchecked |
    Then I softly see the following messages in the page details contains:
      | Reviewers are not required for optional panels |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77605 @ValidatingTotalReviewFormWeightErrorMessageUncheckedManagementReviewForm
  Scenario Outline: To validate system generated error message, if Form Weight (%) :100% , Minimum Number of Reviews per Application : 1 , Required? : Unchecked ,for management Review form in management Review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Required? | Minimum Number of Reviews per Application |
      | Management Review | 0               | Unchecked | 0                                         |
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |
      | Setup Tab - Management Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77610 @ValidatingErrorMessageInManagementReviewForm
  Scenario Outline: To validate system generated error message, if Form Weight (%) : 0% , Minimum Number of Reviews per Application : 1 , Required? : Checked ,for management Review form in management Review step in planning phase
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application |
      | Management Review | 0               | 1                                         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |
      | Setup Tab - Management Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77612 @ValidatingErrorMessageInProgramReviewForm
  Scenario Outline: To validate system generated error message, if Form Weight (%) : 0% ,Minimum Number of Reviews per Application : 1 , Required? : Checked ,for Program Review Review form in SME Review step in planning phase
    And I wait for "5" seconds
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 0               |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Compliance Review | 50              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 50              |
    And I wait for "2" seconds
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) | Minimum Number of Reviews per Application |
      | Program Review | 0               | 1                                         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |
      | Setup Tab - SME Review - Compliance Review: A weighted form must contain weighted sections.                          |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

 @77613 @ValidatingErrorMessageFiscalReviewForm
  Scenario Outline: To validate system generated error message, if Form Weight (%) :0% ,Minimum Number of Reviews per Application : 1 , Required? :Checked ,for fiscal Review Review form in SME Review step in planning phase
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 0               |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 50              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Compliance Review | 50              |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) | Minimum Number of Reviews per Application |
      | Fiscal Review | 0               | 1                                         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |
      | Setup Tab - SME Review - Compliance Review: A weighted form must contain weighted sections.                          |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

 @77615 @ValidatingErrorMessageInComplianceReviewForm
  Scenario Outline: To validate system generated error message, if Form Weight (%) :0% ,Minimum Number of Reviews per Application : 1 , Required? :Checked ,for compliance Review Review form in SME Review step in planning phase
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 50              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 50              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Compliance Review | 0               |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application |
      | Compliance Review | 0               | 1                                         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77617 @ValidatingErrorMassageInManagementReviewForm
  Scenario Outline: To validate system generated error message, if Form Weight (%) : 0% , Minimum Number of Reviews per Application : 1 , Required? : UnChecked ,for management Review form in management Review step in planning phase
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Required? | Minimum Number of Reviews per Application |
      | Management Review | 0               | Unchecked | 1                                         |
    Then I softly see the following messages in the page details contains:
      | Reviewers are not required for optional panels |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77407 @validatingValidationMsgUnderPermitsReviewPanelCategories
  Scenario: To validate system generated validation message, When Max score:0, for all review questions under the Permits review panel categories and  Weight is present, in Compliance Review form of SME review steps in planning phase
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Compliance Review | 30              | 1                                         | Checked   |
    And I wait for "2" seconds
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Permits        | 30                 |
    And I expand nested table containing column value "Permits"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 130.00%.                             |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Permits section because it is weighted. |
      | Setup Tab - SME Review - Compliance Review: The total section weight must equal 100% or 0%. It is currently 30%.                               |

  @77417 @validatingValidationMsgUnderCompletenessReviewPanelCategories
  Scenario Outline: To validate system generated validation message, When Max score:0, for all review questions under the Completeness review panel categories and  Weight is present, in prescreening Review form of prescreening review steps in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 40              |
      | SME Review        | 30              |
      | Pre-Screen Review | 30              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Pre-Screen | 100             | 1                                         | Checked   |
    And I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Completeness   | 30                 |
    And I expand nested table containing column value "Completeness"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
      | Setup Tab - Pre-Screen Review - Pre-Screen: The total section weight must equal 100% or 0%. It is currently 30%.                                    |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77485 @77609 @77616 @validatingErrorMsgPrescreeningReviewForm  @needToCheckErrorMessage
  Scenario Outline: To validate system generated validation message, When Max score:0, for all review questions under the Completeness review panel categories and  Weight is present, in prescreening Review form of prescreening review steps in planning phase
  | To validate system generated error message, if Form Weight (%) :0% ,Minimum Number of Reviews per Application : 0 , Required? :Unchecked ,for prescreening Review Review form in prescreening Review step in planning phase
  | To validate system generated error message, if Form Weight (%) :0% ,Minimum Number of Reviews per Application : 1 , Required? :Checked ,for prescreening Review Review form in prescreening Review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
    And I expand nested table containing column value "Eligibility"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I collapse nested table containing column value "Eligibility"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Completeness"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 100       |
    And I close "Review Form" modal by clicking the top right x button
    And I wait for "2" seconds
    When I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application |
      | Pre-Screen | 100             | 1                                         |
    Then I softly see the following messages in the page details contains:
      | Reviewers are not required for optional panels |
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "1" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Pre-Screen | checked   | 0               | 1                                         |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%.                               |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted. |
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "1" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application |
      | Pre-Screen | 0               | 1                                         |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%.                               |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77707 @77708 @77709 @validatingErrorMsgProgramReviewForm  @needToCheckErrorMessage
  Scenario Outline: To validate system generated error message, Max score set as 0 on all questions and weight as 60% on Review Panel Categories of "Impact" under Program review form of the SME reviews steps of setup tab of planning phase.
  | To validate system generated error message, Max score set as 0 on all questions and weight as 60% on Review Panel Categories of "Approach" under Program review form of the SME reviews steps of setup tab of planning phase.
  | To validate system generated error message, Max score set as 0 on all questions and weight as 60% on Review Panel Categories of "Capability" under Program review form of the SME reviews steps of setup tab of planning phase.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 30              |
    And I wait for "2" seconds
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Impact         | 60                 |
    And I expand nested table containing column value "Impact"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 80.00%.                          |
      | Setup Tab - SME Review - Program Review: A score must be associated to at least one question in the Impact section because it is weighted. |
      | Setup Tab - SME Review - Program Review: The total section weight must equal 100% or 0%. It is currently 135%.                             |
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 30              |
    And I wait for "2" seconds
    When I collapse nested table containing column value "SME Review"
    And I wait for "1" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Approach       | 60                 |
    And I expand nested table containing column value "Approach"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 80.00%.                            |
      | Setup Tab - SME Review - Program Review: A score must be associated to at least one question in the Approach section because it is weighted. |
      | Setup Tab - SME Review - Program Review: A score must be associated to at least one question in the Impact section because it is weighted.   |
      | Setup Tab - SME Review - Program Review: The total section weight must equal 100% or 0%. It is currently 135%.                               |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 30              |
    And I wait for "2" seconds
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 60                 |
    And I expand nested table containing column value "Capability"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 80.00%.                              |
      | Setup Tab - SME Review - Program Review: A score must be associated to at least one question in the Capability section because it is weighted. |
      | Setup Tab - SME Review - Program Review: A score must be associated to at least one question in the Approach section because it is weighted.   |
      | Setup Tab - SME Review - Program Review: A score must be associated to at least one question in the Impact section because it is weighted.     |
      | Setup Tab - SME Review - Program Review: The total section weight must equal 100% or 0%. It is currently 180%.                                 |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77710 @77711 @77712 @validatingErrorMsgFiscalReviewForm  @needToCheckErrorMessage
  Scenario Outline: To validate system generated error message, Max score set as 0 on all questions and weight as 60% on Review Panel Categories of "Program Income" under fiscals review form of the SME reviews steps of setup tab of planning phase.
  | To validate system generated error message, Max score set as 0 on all questions and weight as 60% on Review Panel Categories of "Match" under fiscals review form of the SME reviews steps of setup tab of planning phase.
  |  To validate system generated error message, Max score set as 0 on all questions and weight as 60% on Review Panel Categories of "Budget" under fiscals review form of the SME reviews steps of setup tab of planning phase.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 30              |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 60                 |
    And I expand nested table containing column value "Program Income"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 80.00%.                                 |
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Program Income section because it is weighted. |
      | Setup Tab - SME Review - Fiscal Review: The total section weight must equal 100% or 0%. It is currently 150%.                                     |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 30              |
    And I wait for "2" seconds
    When I collapse nested table containing column value "SME Review"
    And I wait for "1" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 60                 |
    And I expand nested table containing column value "Match"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 80.00%.                                 |
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Program Income section because it is weighted. |
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Match section because it is weighted.          |
      | Setup Tab - SME Review - Fiscal Review: The total section weight must equal 100% or 0%. It is currently 195%.                                     |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I wait for "1" seconds
    When I collapse nested table containing column value "SME Review"
    And I wait for "1" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 30              |
    And I wait for "1" seconds
    When I collapse nested table containing column value "SME Review"
    And I wait for "1" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 60                 |
    And I expand nested table containing column value "Budget"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 80.00%.                                 |
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Budget section because it is weighted.         |
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Program Income section because it is weighted. |
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Match section because it is weighted.          |
      | Setup Tab - SME Review - Fiscal Review: The total section weight must equal 100% or 0%. It is currently 180%.                                     |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77802 @77803 @77804 @validatingErrorMsgComplianceReviewForm  @needToCheckErrorMessage
  Scenario Outline: To validate system generated error message, Max score set as 0 on all questions and weight as 60% on Review Panel Categories of "Schedule" under compliance review form of the SME reviews steps of setup tab of planning phase.
  | To validate system generated error message, Max score set as 0 on all questions and weight as 60% on Review Panel Categories of "Environment" under compliance review form of the SME reviews steps of setup tab of planning phase.
  | To validate system generated error message, Max score set as 0 on all questions and weight as 60% on Review Panel Categories of "Permits" under compliance review form of the SME reviews steps of setup tab of planning phase.
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Compliance Review | 30              |
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 60                 |
    And I expand nested table containing column value "Schedule"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 130.00%.                              |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Schedule section because it is weighted. |
      | Setup Tab - SME Review - Compliance Review: The total section weight must equal 100% or 0%. It is currently 60%.                                |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Compliance Review | 30              |
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    When I collapse nested table containing column value "Schedule"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Environment    | 60                 |
    And I expand nested table containing column value "Environment"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 130.00%.                                 |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Environment section because it is weighted. |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Schedule section because it is weighted.    |
      | Setup Tab - SME Review - Compliance Review: The total section weight must equal 100% or 0%. It is currently 120%.                                  |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Compliance Review | 30              |
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I collapse nested table containing column value "Environment"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Permits        | 60                 |
    And I expand nested table containing column value "Permits"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 130.00%.                                 |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Environment section because it is weighted. |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Permits section because it is weighted.     |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Schedule section because it is weighted.    |
      | Setup Tab - SME Review - Compliance Review: The total section weight must equal 100% or 0%. It is currently 180%.                                  |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77805 @77806 @validatingErrorMessagePrescreeningReviewForm
  Scenario Outline: To validate system generated error message, Max score set as 0 on all questions and weight as 60% on Review Panel Categories of "Completeness" under prescreening review form of the prescreening reviews steps of setup tab of planning phase.
  | To validate system generated error message, Max score set as 0 on all questions and weight as 60% on Review Panel Categories of "Eligibility" under prescreening review form of the prescreening reviews steps of setup tab of planning phase.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 25              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Pre-Screen | 100             | 1                                         | Checked   |
    And I refresh the page
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Completeness   | 60                 |
    And I expand nested table containing column value "Completeness"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
      | Setup Tab - Pre-Screen Review - Pre-Screen: The total section weight must equal 100% or 0%. It is currently 60%.                                    |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) |
      | Pre-Screen | 100             |
    And I wait for "2" seconds
    And I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I collapse nested table containing column value "Completeness"
    And I wait for "2" seconds
    And I expand nested table containing column value "Eligibility"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 40                 |
    And I wait for "2" seconds
    And I collapse nested table containing column value "Eligibility"
    And I wait for "2" seconds
    And I expand nested table containing column value "Eligibility"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted.  |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77807 @validatingSuccessMessageReturnOnInvestmentInmanagementReviewForm
  Scenario Outline: To validate system generated success message, Max score set as 100 for any 1 questions and weight as 60% on Review Panel Categories of "Return on Investment (ROI)" under management review form of the management reviews steps of setup tab of planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Management Review | 100             |
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 60                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 100       |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | There are no errors with the review step templates. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @78040 @78042 @78044 @validatingSuccessMessageFiscalcomplianceReviewForm  @needToCheckErrorMessage
  Scenario Outline: To validate system generated success message, Max score set as 100 for any 1 questions and weight as 60% on Review Panel Categories of "Match" under Fiscal review form of the SME reviews steps of setup tab of planning phase.
  | To validate system generated success message, Max score set as 100 for any 1 questions and weight as 60% on Review Panel Categories of "Program Income" under Fiscal review form of the SME reviews steps of setup tab of planning phase.
  | To validate system generated success message, Max score set as 100 for any 1 questions and weight as 60% on Review Panel Categories of "Schedule" under compliance review form of the SME reviews steps of setup tab of planning phase.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 50              |
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 50                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 0                  |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 0                  |
    And I expand nested table containing column value "Match"
    And I wait for "3" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 50        |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 2              | Test 2   | Yes/No | 0         |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 3              | Test 3   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Fiscal Review: The total section weight must equal 100% or 0%. It is currently 50%. |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 50              |
    When I collapse nested table containing column value "SME Review"
    And I wait for "1" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 50                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 0                  |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 0                  |
    And I wait for "2" seconds
    And I collapse nested table containing column value "Match"
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Income"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 50        |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Fiscal Review: The total section weight must equal 100% or 0%. It is currently 50%. |
    And I refresh the page
    When I navigate to "Setup" sub tab
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Compliance Review | 50              | 1                                         | Checked   |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) |
      | Fiscal Review | 0               |
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I wait for "2" seconds
    When I collapse nested table containing column value "Program Income"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 0                  |
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Income"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I wait for "2" seconds
    When I collapse nested table containing column value "Program Income"
    And I wait for "2" seconds
    And I expand nested table containing column value "Match"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I wait for "2" seconds
    When I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Budget"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I wait for "2" seconds
    When I collapse nested table containing column value "Budget"
    And I close "Review Form" modal by clicking the top right x button
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewFormPanelId---"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 0                  |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Environment    | 0                  |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Permits        | 100                |
    And I expand nested table containing column value "Permits"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 100       |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 2              | Test 2   | Yes/No | 0         |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 3              | Test 3   | Yes/No | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | There are no errors with the review step templates. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @78087 @validateSuccessMessageForReviewStepSection
  Scenario Outline: To validate success message,when user click on validate button in review step section of setup tab in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 40              |
      | SME Review        | 60              |
      | Pre-Screen Review | 0               |
    And I wait for "8" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | There are no errors with the review step templates. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @81230 @validatingPreScreenReviewFormQuestions
  Scenario Outline: To verify,review question displayed by default for all review panel categories for Prescreen review form in prescreen review step of planning phase
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
#    And I perform quick search for "Eligibility" in "---program:-:programReviewPanel---" panel
    And I expand nested table containing column value "Eligibility"
    Then I softly see value "1" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Does the applicant meet the eligibility criteria laid out in the funding opportunity announcement?	" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Is applicant a legal entity registered in State of California?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    When I collapse nested table containing column value "Eligibility"
#    And I expand nested table containing column value "Pre-Screen Review"
#    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
#    And I perform quick search for "Completeness" in "---program:-:programReviewPanel---" panel
    And I expand nested table containing column value "Completeness"
    Then I softly see value "1" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Have all required elements outlined in the funding opportunity been submitted?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Provide explanation for missing elements" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "If applicable, were the required public comment processes observed and documented?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "If applicable, were the required public comment processes observed and documented?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Question Order" in flex table header "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Question" in flex table header "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Type" in flex table header "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Max Score" in flex table header "---program:-:programReviewPanelQuestionsTableId---"

    Examples:
      | Focus Area                      | Program Name                                     |
      | Automation Permanent Focus Area | {SavedValue:Automation Runtime Internal Program} |

  @81231 @validatingComplainceReviewQuestionsInSMEReviewForEXEUser
  Scenario Outline: To verify,review question displayed by default for all review panel categories for Compliance Review review form in SME review step of planning phase
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
#    And I perform quick search for "Schedule" in "---program:-:programReviewPanel---" panel
    And I expand nested table containing column value "Schedule"
    Then I softly see value "1" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Does the schedule account for all applicable regulatory/permit reviews?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Is the schedule realistic?	" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Are state resources available to support proposed schedule?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    When I collapse nested table containing column value "Schedule"
#    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
#    And I perform quick search for "Environment" in "---program:-:programReviewPanel---" panel
    And I expand nested table containing column value "Environment"
    Then I softly see value "1" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "If the Environment Impact Statement is required, has it been submitted and approved?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Is the applicant EPA certified?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Does the application include leverage funds? Is documentation of the leverage included in the application?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    When I collapse nested table containing column value "Environment"
#    And I expand nested table containing column value "SME Review"
#    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
#    And I perform quick search for "Permits" in "---program:-:programReviewPanel---" panel
    And I expand nested table containing column value "Permits"
    Then I softly see value "1" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Have all required permits been identified?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Which permits have not yet been received?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "When will the first applicable permit expire?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Date" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Question Order" in flex table header "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Question" in flex table header "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Type" in flex table header "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "Max Score" in flex table header "---program:-:programReviewPanelQuestionsTableId---"

    Examples:
      | Focus Area                      | Program Name                                     |
      | Automation Permanent Focus Area | {SavedValue:Automation Runtime Internal Program} |

  @77347 @77349 @77348 @validatingMaximumScoreSMEReviewFormQuestions  @needToCheckErrorMessage
  Scenario Outline: To validate system generated validation message, When Max score:0, for all review questions under the Capability review panel categories and  Weight is present, in program review form of SME review steps in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Program Review | 30              | 1                                         | Checked   |
    When I collapse nested table containing column value "SME Review"
    And I wait for "1" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
     #77347
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
    And I expand nested table containing column value "Capability"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    When I collapse nested table containing column value "Capability"
    #77348
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Approach       | 30                 |
    And I expand nested table containing column value "Approach"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    #77349
    When I collapse nested table containing column value "Approach"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Impact         | 30                 |
    And I expand nested table containing column value "Impact"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 80.00%.                              |
      | Setup Tab - SME Review - Program Review: A score must be associated to at least one question in the Capability section because it is weighted. |
      | Setup Tab - SME Review - Program Review: The total section weight must equal 100% or 0%. It is currently 90%.                                  |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77403 @validatingSMEReviewFormQuestionsForMatchReviewPanel
  Scenario: To validate system generated validation message, When Max score:0, for all review questions under the Capability review panel categories and  Weight is present, in program review form of SME review steps in planning phase
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Step Name     | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Fiscal Review | 30              | 1                                         | Checked   |
    And I wait for "2" seconds
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 30                 |
    And I expand nested table containing column value "Match"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Match section because it is weighted. |
      | Setup Tab - SME Review - Fiscal Review: The total section weight must equal 100% or 0%. It is currently 115%.                            |

  @77404 @validatingSMEReviewFormQuestions-ForProgramIncomeReviewPanel  @needToCheckErrorMessage
  Scenario: To validate system generated validation message, When Max score:0, for all review questions under the Program Income review panel categories and  Weight is present, in program review form of SME review steps in planning phase
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    When I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Fiscal Review | 100             | 1                                         | Checked   |
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Program Review | 0               | 1                                         | Checked   |
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 30                 |
    And I wait for "1" seconds
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 35                 |
    And I wait for "1" seconds
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 35                 |
    And I expand nested table containing column value "Program Income"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    And I wait for "2" seconds
    And I collapse nested table containing column value "Program Income"
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Income"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Fiscal Review: A score must be associated to at least one question in the Program Income section because it is weighted. |

  @77405 @77406 @validatingSMEReviewFormQuestions  @needToCheckErrorMessage
  Scenario: To validate system generated validation message, When Max score:0, for all review questions under the Schedule review panel categories and  Weight is present, in Compliance Review form of SME review steps in planning phase
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Step Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Compliance Review | 10              | 1                                         | Checked   |
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    #77405
    And I expand nested table containing column value "Schedule"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
    And I wait for "2" seconds
    And I collapse nested table containing column value "Schedule"
    And I wait for "2" seconds
    And I expand nested table containing column value "Schedule"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    #77406
    And I expand nested table containing column value "Environment"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Environment    | 30                 |
    And I wait for "2" seconds
    And I collapse nested table containing column value "Environment"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 110.00%.                                 |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Schedule section because it is weighted.    |
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Environment section because it is weighted. |
      | Setup Tab - SME Review - Compliance Review: The total section weight must equal 100% or 0%. It is currently 60%.                                   |

  @77408 @validatingMaxScoreZeroForEligiblityInPreScreenReviewFormQuestions
  Scenario Outline: To validate system generated validation message, When Max score:0, for all review questions under the Eligibility review panel categories and  Weight is present, in prescreening Review form of prescreening review steps in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 40              |
      | SME Review        | 30              |
      | Pre-Screen Review | 40              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Pre-Screen | 30              | 1                                         | Checked   |
    And I wait for "2" seconds
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 30                 |
    And I expand nested table containing column value "Eligibility"
    And I wait for "2" seconds
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 1              | Test 1   | Yes/No | 0         |
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Eligibility section because it is weighted. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77487 @77602 @77603 @77604 @ValidatingMinimumNoOfReviewsShouldBeGreaterThanZeroInProgramFiscalAndComplianceReviewForm
  Scenario Outline: To validate system generated error message, if Form Weight (%) : 0% ,Minimum Number of Reviews per Application : 0 , Required? : checked ,for Program,Fiscal and Compliance Review form, in SME Review step in planning phase
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "SME Review"
    #77487
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Required? | Minimum Number of Reviews per Application | Form Weight (%) |
      | Program Review | Unchecked | 0                                         | 0               |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Required? |
      | Program Review | Check     |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | For required panel the Minimum Number of Reviews should be greater than zero. |
    #77602
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Required? | Minimum Number of Reviews per Application | Form Weight (%) |
      | Fiscal Review | Unchecked | 0                                         | 0               |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Required? |
      | Fiscal Review | Check     |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | For required panel the Minimum Number of Reviews should be greater than zero. |
    #77603
    And I refresh the page
    When I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Required? | Minimum Number of Reviews per Application | Form Weight (%) |
      | Compliance Review | Unchecked | 0                                         | 0               |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Required? |
      | Compliance Review | Check     |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | For required panel the Minimum Number of Reviews should be greater than zero. |
    #77604 #monu
    And I refresh the page
    When I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Required? | Minimum Number of Reviews per Application | Form Weight (%) |
      | Pre-Screen | Check     | 1                                         | 0               |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    When I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Required? |
      | Compliance Review | Check     |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | For required panel the Minimum Number of Reviews should be greater than zero. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77476 @77477 @77478 @ValidatingMinimumNoOfReviewsShouldBeZeroInProgramFiscalAndComplianceReviewForm
  Scenario Outline: To validate system generated error message, if Form Weight (%) :50%, 30%, 30%,Minimum Number of Reviews per Application : 0 , Required? : checked ,for Program, Fiscal and Compliance Review form in SME Review step in planning phase
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "SME Review"
    #77476
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Program Review | Unchecked | 0               | 0                                         |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Required? | Minimum Number of Reviews per Application | Form Weight (%) |
      | Program Review | Checked   | 0                                         | 50              |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | For required panel the Minimum Number of Reviews should be greater than zero. |
     #77477
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Fiscal Review | Unchecked | 0               | 0                                         |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Required? | Minimum Number of Reviews per Application | Form Weight (%) |
      | Fiscal Review | Checked   | 0                                         | 30              |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | For required panel the Minimum Number of Reviews should be greater than zero. |
        #77478
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Compliance Review | Unchecked | 0               | 0                                         |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Required? | Minimum Number of Reviews per Application | Form Weight (%) |
      | Compliance Review | Checked   | 0                                         | 30              |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | For required panel the Minimum Number of Reviews should be greater than zero. |
    #And I click on top right button "save" in flex table with id "---program:-:reviewStepTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77475 @ValidatingTotalReviewFormWeightErrorMessageCheckedManagementReviewForm
  Scenario Outline:To validate system generated error message, if Form Weight (%) :100% ,Minimum Number of Reviews per Application : 0 , Required? : checked ,for management Review form in management Review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Management Review | Unchecked | 0               | 0                                         |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I collapse nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Required? | Minimum Number of Reviews per Application | Form Weight (%) |
      | Management Review | Checked   | 0                                         | 100             |
    Then I softly see the following messages in the page details contains:
      | For required panel the Minimum Number of Reviews should be greater than zero. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77687 @ValidatingReviewerErrorMessagePreScreenReviewForm
  Scenario Outline:To validate system generated error message, if Form Weight (%) :0% ,Minimum Number of Reviews per Application : 1 , Required? :Unchecked ,for prescreening Review Review form in prescreening Review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application |
      | Pre-Screen | 0               | 1                                         |
    Then I softly see the following messages in the page details :
      | Reviewers are not required for optional panels |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77685 @77686 @77684 @ValidatingReviewerErrorMessageFiscalComplianceAndProgramReviewForm
  Scenario Outline:To validate system generated error message, if Form Weight (%) :0% ,Minimum Number of Reviews per Application : 1 , Required? :Unhecked ,for compliance Review Review form in SME Review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "SME Review"
    #77685
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Fiscal Review | Unchecked | 0               | 1                                         |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Reviewers are not required for optional panels |
    #77686
    And I refresh the page
    When I navigate to "Setup" sub tab
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Compliance Review | Unchecked | 0               | 1                                         |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Reviewers are not required for optional panels |
    #77684
    And I refresh the page
    When I navigate to "Setup" sub tab
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Program Review | Unchecked | 0               | 1                                         |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Reviewers are not required for optional panels |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77694 @77706 @validatingErrorMessagesManagementReviewFormQuestions
  Scenario Outline:To validate system generated error message, Max score set as 0 on all questions and weight as 40% on Review Panel Categories of "Return on Investment (ROI)" under management review of the reviews steps section of setup tab of planning phase.
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application |
      | Management Review | 100             | 1                                         |
    And I wait for "2" seconds
    When I collapse nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I wait for "2" seconds
     #77694
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 40                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header      | Section Weight (%) |
      | Strategic Alignment | 60                 |
    And I softly see value "40%" for title "Section Weight (%)" inside table "---program:-:programReviewPanel---"
    And I expand nested table containing column value "Return on Investment (ROI)"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 0         |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 2              | 0         |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 3              | 0         |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I collapse nested table containing column value "Management Review"
    And I wait for "2" seconds
    #77706
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I softly see value "60%" for title "Section Weight (%)" inside table "---program:-:programReviewPanel---"
    And I wait for "2" seconds
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I wait for "2" seconds
    And I expand nested table containing column value "Strategic Alignment"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 0         |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 2              | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Management Review - Management Review: A score must be associated to at least one question in the Strategic Alignment section because it is weighted. |

    Examples:
      | Objective                      |
      | Automation Permanent Objective |


  @77420 @77479 @ValidatingWeightErrorMessageProgramReviewForm
  Scenario Outline:To validate system generated error message, if Form Weight (%) :40% ,Minimum Number of Reviews per Application : 0 , Required? : Unchecked ,for Program Review form in SME Review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Program Review | Unchecked | 40              | 0                                         |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | You cannot associate a weight to an optional panel |
    And I refresh the page
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Pre-Screen | Checked   | 100             | 0                                         |
    Then I softly see the following messages in the page details :
      | For required panel the Minimum Number of Reviews should be greater than zero. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77606 @77607 @77608 @ValidatingTotalReviewFormWeightErrorMessageProgramReviewForm  @needToCheckErrorMessage
  Scenario Outline: To validate system generated error message, if Form Weight (%) : 0% ,Minimum Number of Reviews per Application : 0 , Required? : Unchecked ,for Program Review Review form in SME Review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 50              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) | Required? | Minimum Number of Reviews per Application |
      | Program Review | 0               | Unchecked | 0                                         |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) | Required? | Minimum Number of Reviews per Application |
      | Fiscal Review | 0               | Unchecked | 0                                         |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Required? | Minimum Number of Reviews per Application |
      | Compliance Review | 0               | Unchecked | 0                                         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%.        |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |


  @77811 @validatingSuccessForStrategicAlignmentInMessagemanagementReviewForm
  Scenario Outline: To validate system generated success message, Max score set as 100 for any 1 questions and weight as 60% on Review Panel Categories of "Strategic Alignment" under management review form of the management reviews steps of setup tab of planning phase
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application |
      | Management Review | 100             | 1                                         |
    And I collapse nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 40                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header      | Section Weight (%) |
      | Strategic Alignment | 60                 |
    And I softly see value "60%" for title "Section Weight (%)" inside table "---program:-:programReviewPanel---"
    And I expand nested table containing column value "Strategic Alignment"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 100       |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 2              | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | There are no errors with the review step templates. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @78047 @78085 @validatingSuccessMessagePreScreenReviewForm
  Scenario Outline: To validate system generated success message, Max score set as 100 for any 1 questions and weight as 60% on Review Panel Categories of "Eligibility" under prescreening review form of the prescreening reviews steps of setup tab of planning phase.
    And I wait for "5" seconds
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 25              |
      | Pre-Screen Review | 25              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name  | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Pre-Screen | Checked   | 100             | 1                                         |
    When I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 60                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Completeness   | 40                 |
    And I softly see value "60%" for title "Section Weight (%)" inside table "---program:-:programReviewPanel---"
    And I wait for "2" seconds
    And I expand nested table containing column value "Eligibility"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 100       |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 2              | 0         |
    And I collapse nested table containing column value "Eligibility"
    And I wait for "2" seconds
    And I expand nested table containing column value "Completeness"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 0         |
    And I collapse nested table containing column value "Completeness"
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review - Pre-Screen: A score must be associated to at least one question in the Completeness section because it is weighted. |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 40                 |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Completeness   | 60                 |
    And I softly see value "60%" for title "Section Weight (%)" inside table "---program:-:programReviewPanel---"
    And I wait for "2" seconds
    And I expand nested table containing column value "Completeness"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 100       |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | There are no errors with the review step templates. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77813 @77814 @validatingSuccessMessageSMEReviewForm
  Scenario Outline: To validate system generated success message, Max score set as 100 for any 1 questions and weight as 60% on Review Panel Categories of "Capability" under program review form of the SME reviews steps of setup tab of planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Program Review | 100             | 1                                         | Checked   |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Fiscal Review | 0               | 1                                         | Checked   |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Compliance Review | 0               | 1                                         | Checked   |
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 60                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Approach       | 20                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Impact         | 20                 |
    And I softly see value "60%" for title "Section Weight (%)" inside table "---program:-:programReviewPanel---"
    And I expand nested table containing column value "Capability"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 100       |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | There are no errors with the review step templates. |
    And I refresh the page
    And I navigate to "Setup" sub tab
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I collapse nested table containing column value "Capability"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 20                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Approach       | 60                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Impact         | 20                 |
    And I softly see value "60%" for title "Section Weight (%)" inside table "---program:-:programReviewPanel---"
    And I expand nested table containing column value "Approach"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 100       |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | There are no errors with the review step templates. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @78045 @78046 @validatingSuccessMessageComplianceReviewForm
  Scenario Outline: To validate system generated success message, Max score set as 100 for any 1 questions and weight as 60% on Review Panel Categories of "Environment" under compliance review form of the SME reviews steps of setup tab of planning phase.
    And I wait for "5" seconds
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I pause execution for "5" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Program Review | 0               | 1                                         | Checked   |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Fiscal Review | 0               | 1                                         | Checked   |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Compliance Review | 100             | 1                                         | Checked   |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 0                  |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Environment    | 60                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Permits        | 40                 |
    And I softly see value "60%" for title "Section Weight (%)" inside table "---program:-:programReviewPanel---"
    And I wait for "2" seconds
    And I expand nested table containing column value "Environment"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 100       |
    And I wait for "3" seconds
    And I collapse nested table containing column value "Environment"
    And I wait for "2" seconds
    And I expand nested table containing column value "Permits"
    And I delete all rows inside flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type | Max Score |
      | 1              | Test 1   | Date | 0         |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Compliance Review: A score must be associated to at least one question in the Permits section because it is weighted. |
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 0                  |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Environment    | 40                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Permits        | 60                 |
    And I softly see value "60%" for title "Section Weight (%)" inside table "---program:-:programReviewPanel---"
    And I collapse nested table containing column value "Permits"
    And I wait for "2" seconds
    And I expand nested table containing column value "Permits"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 100       |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | There are no errors with the review step templates. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77816 @validatingSuccessMessageFiscalReviewForm
  Scenario Outline: To validate system generated success message, Max score set as 100 for any 1 questions and weight as 60% on Review Panel Categories of "Budget" under Fiscal review form of the SME reviews steps of setup tab of planning phase.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Program Review | 0               | 1                                         | Checked   |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Fiscal Review | 100             | 1                                         | Checked   |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Compliance Review | 0               | 1                                         | Checked   |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 60                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 20                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 10                 |
    And I softly see value "60%" for title "Section Weight (%)" inside table "---program:-:programReviewPanel---"
    And I wait for "2" seconds
    And I expand nested table containing column value "Budget"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 100       |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review - Fiscal Review: The total section weight must equal 100% or 0%. It is currently 90%. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77331 @77344 @validatingErrorMessageManagementReviewFormQuestions
  Scenario Outline:To validate system generated error message, Max score set as 0 on all questions and weight as 40% on Review Panel Categories of "Return on Investment (ROI)" under management review of the reviews steps section of setup tab of planning phase.
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "Management Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Required? | Minimum Number of Reviews per Application | Form Weight (%) |
      | Management Review | Checked   | 1                                         | 100             |
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Reviewers are not required for optional panels |
    And I wait for "2" seconds
    And I collapse nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Management Review"
    And I wait for "2" seconds
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 60                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header      | Section Weight (%) |
      | Strategic Alignment | 40                 |
    And I softly see value "40%" for title "Section Weight (%)" inside table "---program:-:programReviewPanel---"
    And I expand nested table containing column value "Return on Investment (ROI)"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 0         |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 2              | 0         |
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 3              | 0         |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I wait for "2" seconds
    And I expand nested table containing column value "Strategic Alignment"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 0         |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 2              | 0         |
    And I click modal button "Close"
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Management Review - Management Review: A score must be associated to at least one question in the Return on Investment (ROI) section because it is weighted. |
      | Setup Tab - Management Review - Management Review: A score must be associated to at least one question in the Strategic Alignment section because it is weighted.        |

    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77342 @validatingDeleteReviewQuestionSMEReviewFormQuestions  @needToCheckErrorMessage
  Scenario Outline:To verify user able to delete review question with success message in Impact of Review Panel Categories in Program review form for SME review step in planning phase
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Impact"
    And I click on "Delete" icon for "2" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77192 @validatingDownloadPDFForImpactInSMEReviewFormQuestions
  Scenario Outline:To verify user allow to download PDF for review question in Impact of Review Panel Categories in Program review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Program Income"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I see "Review Questions" on page "1" of "govgrants" pdf file
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77193 @77194 @77195 @verifyDeletionOfQuestionFromSMEReviewPanel  @needToCheckErrorMessage
  Scenario Outline:To verify user is able to delete question 2 from Program income review form inside SME review panel
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    #77194 #monu
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Program Income"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type   |
      | <Question 2>   | Yes/No |
    And I wait for "2" seconds
    When I collapse nested table containing column value "Program Income"
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Income"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    #77193 #monu
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    When I collapse nested table containing column value "Program Income"
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Income"
    And I click on "Delete" icon for "<Question 2>" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    Then I softly do not see value "<Question 2>" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    #77195 #monu
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question              | Type   | Max Score |
      | 3              | Automation Question 3 | Yes/No | 10        |
    Then I softly see value "Automation Question 3" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"

    Examples:
      | Objective                      | Question 2                                                                                                                                      |
      | Automation Permanent Objective | Does the budget outline how program income will be used and tracked? Are the proposed program income uses consistent with program requirements? |

  @77199 @validatingDownloadPDFSMEReviewPanelCategory
  Scenario Outline:To verify user is able to download review panel category for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I click on parallel menu button in flex table title "Review Categories"
    And I select "Download as PDF" from parallel lines dropdown of "Review Categories"
    And I download the file
    Then I see "Review Categories" on page "1" of "govgrants" pdf file
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77200 @77201 @validatingDeletionOfCapabilityQuestionFromProgramReviewInsideSMEReview
  Scenario Outline:To verify user able to delete review question with success message in Impact of Review Panel Categories in Program review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    #77201 #monu
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Capability"
    When I click on "Question" column header inside table with id "---program:-:programReviewPanelQuestionsTableId---"
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Question Order | Type |
      | <Question 2>   | Date |
    And I wait for "1" seconds
    And I collapse nested table containing column value "Capability"
    And I wait for "2" seconds
    And I expand nested table containing column value "Capability"
    Then I softly see value "Date" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    #77200 #monu
    And I refresh the page
    When I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    When I collapse nested table containing column value "Capability"
    And I wait for "2" seconds
    And I expand nested table containing column value "Capability"
    When I click on "Question" column header inside table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "<Question 2>" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    Then I softly do not see value "<Question 2>" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      | Question 2                                                                                                                                                                                                                                                   |
      | Automation Permanent Objective | Does the applicant have the capacity to successfully implement the project on schedule? Do recent past performance and/or resolution efforts on past monitoring/audit findings suggest the applicant has the capacity to implement the project successfully? |

  @77815 @validatingSuccessMessageForImpactUnderSMEReviewForm
  Scenario Outline: To validate system generated success message, Max score set as 100 for any 1 questions and weight as 60% on Review Panel Categories of "Impact" under program review form of the SME reviews steps of setup tab of planning phase
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Program Review | 30              | 1                                         | Checked   |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name     | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Fiscal Review | 70              | 1                                         | Checked   |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Compliance Review | 0               | 1                                         | Checked   |
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 20                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Approach       | 60                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Impact         | 20                 |
    And I softly see value "60%" for title "Section Weight (%)" inside table "---program:-:programReviewPanel---"
    And I expand nested table containing column value "Capability"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 100       |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | There are no errors with the review step templates. |
    And I refresh the page
    And I navigate to "Setup" sub tab
    When I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I collapse nested table containing column value "Capability"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 20                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Approach       | 20                 |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Impact         | 60                 |
    And I softly see value "60%" for title "Section Weight (%)" inside table "---program:-:programReviewPanel---"
    And I expand nested table containing column value "Impact"
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Max Score |
      | 1              | 100       |
    And I close "Review Form" modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | There are no errors with the review step templates. |
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @77346 @validatingDownloadPDFForProgramIncomeInSMEReviewFormQuestions
  Scenario Outline:To verify user allow to download PDF for review question in Program Income of Review Panel Categories in Fiscal review form for SME review step in planning phase
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Impact"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see "Review Questions" on page "1" of "govgrants" pdf file
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @80051 @38864 @76503 @76946 @77105 @validatingComplianceReviewFormQuestionsInSMEReview
  Scenario: To verify,review question displayed by default for all review panel categories for Compliance Review review form in SME review step of planning phase
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Budget"
    And I softly see value "1" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Has the applicant submitted a sufficient budget narrative matching the categories contained in the budget?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "15" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Is the budget reasonable given the proposed scope of work?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "15" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Is the budget reasonable given the proposed scope of work?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "10" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Is the need for proposed budget item adequately supported?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "5" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I collapse nested table containing column value "Budget"
    And I wait for "2" seconds
    And I expand nested table containing column value "Budget"
    And I wait for "2" seconds
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "10" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "6" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "How much are similar projects typically awarded?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Currency" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I collapse nested table containing column value "Budget"
    And I wait for "2" seconds
    And I expand nested table containing column value "Match"
    And I softly see value "1" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Does the application meet the match requirement outlined in the funding opportunity?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "10" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Are the match costs allowable, allocable, and reasonable?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I see value "5" for title "Max Score" against the value "Are the match costs allowable, allocable, and reasonable?" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Does the application include leverage funds? Is documentation of the leverage included in the application?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I see value "5" for title "Max Score" against the value "Does the application include leverage funds? Is documentation of the leverage included in the application?" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I collapse nested table containing column value "Match"
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Income"
    And I softly see value "1" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Will program income be generated during this project?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "10" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Does the budget outline how program income will be used and tracked? Are the proposed program income uses consistent with program requirements?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "10" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    #38864
    When I navigate to "Setup" sub tab
    And I collapse nested table containing column value "SME Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Capability"
    And I softly see value "1" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Does the applicant demonstrate sufficient management and organizational capacity?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "10" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Does the applicant have the capacity to successfully implement the project on schedule? Do recent past performance and/or resolution efforts on past monitoring/audit findings suggest the applicant has the capacity to implement the project successfully?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "25" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I collapse nested table containing column value "Capability"
    And I wait for "2" seconds
    And I expand nested table containing column value "Approach"
    And I softly see value "1" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Has the applicant provided a clear project narrative?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "10" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Is the management approach (roles and responsibilities of staff/partners) clear and consistent with funding opportunity requirements?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "7" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "How well is the project scope aligned with the funding opportunity?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Low/Med/High" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "3" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "What state unmet needs are addressed by the project proposal?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "5" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Is the need for the project clearly identified?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "6" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "What activities are covered by the project?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "10" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I collapse nested table containing column value "Approach"
    And I wait for "2" seconds
    And I expand nested table containing column value "Impact"
    And I softly see value "1" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Are performance metrics appropriate?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "10" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Have they identified and described beneficiaries (e.g. population served or final recipients of grant funds)?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "10" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Provide your assessment of project impact on beneficiaries." for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "5" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    #76503
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Return on Investment (ROI)"
    And I softly see value "1" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Is the project cost effective and has a cost estimate been provided?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "15" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Are the performance goals adequate?" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "15" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "3" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Rate and describe overall value of the Project." for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "30" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I wait for "2" seconds
    And I expand nested table containing column value "Strategic Alignment"
    And I softly see value "1" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Provide your assessment of project alignment with Agency Goals and Objectives." for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "15" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "2" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Assess the overall impact of this project." for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "Written" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I softly see value "20" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    #76946
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    And I expand nested table containing column value "Eligibility"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see new tab is opened
    And I switch to parent tab
    And I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    #77105
    When I navigate to "Setup" sub tab
    And I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Environment"
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see new tab is opened

  @77100 @77102 @77101 @77104 @76984 @validatingDownloadPDFForScheduleReviewQuestionsInSMEReview  @needToCheckErrorMessage
  Scenario Outline: To verify user allow to download PDF for review question in Schedule of Review Panel Categories in compliance review form for SME review step in planning phase
    And I wait for "5" seconds
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 75              |
      | Pre-Screen Review | 0               |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Schedule"
    And I wait for "2" seconds
    And I click on parallel menu button in flex table title "Review Questions"
    And I select "Download as PDF" from parallel lines dropdown of "Review Questions"
    And I download the file
    Then I softly see new tab is opened
    And I switch to parent tab
    #77102
    When I edit the following rows inline in flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Type    |
      | 3              | Written |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Written" for title "Type" against the value "3" inside table "---program:-:programReviewPanelQuestionsTableId---"
    #77101
    And I click on "Delete" icon for "3" inside flex table with id "---program:-:programReviewPanelQuestionsTableId---" without waiting for record
    Then I softly do not see value "3" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    #77104
    And I collapse nested table containing column value "Schedule"
    And I wait for "2" seconds
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 4              | Test 4   | Yes/No | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "4" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 4" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "4" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    And I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    #76984
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---program:-:programReviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question | Type   | Max Score |
      | 5              | Test 5   | Yes/No | 0         |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "5" for title "Question Order" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Test 5" for title "Question" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "Yes/No" for title "Type" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly see value "0" for title "Max Score" inside table "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Edit" against "5" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "5" in flex table with id "---program:-:programReviewPanelQuestionsTableId---"
    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @passed @106332 @106322 @106319 @106317 @verifyActivationOfAmendedProgram
  Scenario Outline: Verify user is able to activate the amended internal program
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
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
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
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
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    #106317 #monu
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click on "Amend Program" in the page details
    #106322 #monu
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #106319 #monu
    Then I softly see field "Status" as "Being Amended"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Examples:
      | Focus Area                      | Program Name                                     |
      | Automation Permanent Focus Area | {SavedValue:Automation Runtime Internal Program} |

  @passed @106313 @verifyTaskCreationForProgramActivation
  Scenario Outline: Verify user is able to see created task to activate program inside pending tasks
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Focus Area>" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
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
    And I refresh the page
    And I click on "Submit For Approval" in the page details
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
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Activate Internal Program" for title "Task Type" inside table "---program:-:pendingTaskTableId---"

    Examples:
      | Focus Area                      |
      | Automation Permanent Focus Area |

  @105969 @VerifyAllActiveFocusArea
  Scenario: Validate user is able to see all active focus area on associate modal
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    And I check "All" boxes in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    Then I see value "Active" for title "Status" against the value "Automation Permanent Focus Area2" inside table "---program:-:focusAreaTableId---"
    Then I see value "Active" for title "Status" against the value "Automation Permanent Focus Area" inside table "---program:-:focusAreaTableId---"

  @106339 @VerifyEmailNotificationForProgramApproval @RERUNProgram
  Scenario: Validate respective user should get an email notification for program approval
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Approve Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    And I pause execution for "180" seconds
    And I logout
    And I wait for "2" seconds
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Request to Approve {SavedValue:ProgramEGMSID}
      """
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Approve Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I click on mail with subject "Sandbox: Notification: Request to Approve {SavedValue:ProgramEGMSID}"
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Request to Approve {SavedValue:ProgramEGMSID}
      """

  @VerifyValidationMessageForReviewFormWeightLessThan100%
  Scenario: validate user is able to see validation message when review form weight is les than 100%
    And I navigate to "Setup" sub tab
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Pre-Screen Review | 30              |
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Step Name  | Required? | Form Weight (%) | Minimum Number of Reviews per Application |
      | Pre-Screen | Checked   | 30              | 1                                         |
    And I pause execution for "8" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    #Bug444555
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Pre-Screen Review: The total Review Form weight must equal 100% for a weighted step. It is currently 30.00%. |
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 130.00%.                                       |

  @passed @109651 @VerifyValidationMessageForReviewFormStepWeightLessThan100%
  Scenario: validate user is able to see validation message when step weight is les than 100%
    And I navigate to "Setup" sub tab
    And I wait for "1" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name  | Step Weight (%) |
      | SME Review | 70              |
    And I pause execution for "5" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 95.00%. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name  | Step Weight (%) |
      | SME Review | 85              |
    And I pause execution for "5" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 110.00%. |

  @109794 @VerifyValidationMessageForReviewFormWeightGreaterThan100%   @needToCheckErrorMessage
  Scenario: validate user is able to see validation message when review form weight is greater than 100%
    And I navigate to "Setup" sub tab
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name  | Step Weight (%) |
      | SME Review | 75              |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewFormPanelId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) | Minimum Number of Reviews per Application | Required? |
      | Compliance Review | 30              | 1                                         | Checked   |
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see the following messages in the page details contains:
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 130.00%. |
      | Setup Tab - SME Review - Compliance Review: A weighted form must contain weighted sections.                        |

  @passed @109646 @VerifyAdditionOfNewReviewList
  Scenario: validate user is able to add new Review list for created internal program
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Step Order | Step Name         | Description            | Step Weight (%) |
      | 4          | Automation Review | Automation Description | 0               |
    Then I softly see value "4" for title "Step Order" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Automation Review" for title "Step Name" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Automation Description" for title "Description" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "0.00%" for title "Step Weight (%)" inside table "---program:-:reviewStepTableId---"

  @passed @138466 @Verify3StepApprovalForProgram-RnRFuntionality
  Scenario: Validate user is allowed to set up a 3 step approval for Program created
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I wait for "9" seconds
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 3  |
    Then I softly see "Saved Successfully!" inside flex table with id "---program:-:approverTableId---"

  @138467 @VerifyUserShouldNotBeAbleToAddSameStepForMultipleUserAtProgramApprover-RnRFuntionality
  Scenario: Validate program owner cant add same step for multiple users for program while defining approvers on program record
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    Then I softly see "You cannot specify the same step for multiple users for Program." inside flex table with id "---program:-:approverTableId---"

  @138463 @VerifyApprovalOfProgramWithApproverStep-RnRFuntionality
  Scenario:  Validate the approval is completed in one step on program when only one approver is defined
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I pause execution for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly see field "Status" as "Approved"

  @138464 @VerifyErrorMessageWhileSkippingStepsAtProgramApproverSection-RnRFuntionality
  Scenario:  Validate owner of the program cannot skip any approval steps for program approval while defining the approval on the program
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I pause execution for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 4  |
    And I wait for "9" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities - You cannot skip an Approval Step. |

  @140330 @Verify4StepApprovalAtProgramApprover-RnRFuntionality
  Scenario: Verify that user can add four step approver on internal program
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 3  |
    And I wait for "9" seconds
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FD Username} | Step 4  |
    Then I softly see "Saved Successfully!" inside flex table with id "---program:-:approverTableId---"

  @passed @138465 @VerifyUserShouldNotBeAbleToAddSameUserForMultipleStepAtProgram-RnRFunctionality  @buglogged154221
  Scenario: Validate program owner cant add same user for multiple steps  while assigning approvers for program on program record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 2  |
    Then I softly see "You cannot specify the same user for multiple steps for Program" inside flex table with id "---program:-:approverTableId---"