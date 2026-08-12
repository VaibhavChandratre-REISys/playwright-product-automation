 @competitiveAnnouncementsWB  @announcement @regression  @Product-M05 @announcementExecution @Productannouncement @NeedtoRevisit @wip
Feature: Validate all scenarios in the Competitive Announcement tab - DO NOT UPDATE NOW as not in scope of M04

  @227574 @CompAnnVerifyAdminusercanseethevalueBudgetTabFocusAreareplacedwithBudgetTabBudgetSummarybyFocusAreaintheApplicationsectionforNegotiation @sprint-13-US-224612  @Allocation
  Scenario Outline: Comp Ann Admin user can see the value "Budget Tab Focus Area" replaced with "Budget Tab Budget Summary by Focus Area" in the Application section for Negotiation
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default-Automation ADMIN user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    Then I see multipicklist field "ApplicationSectionsForRevision__c" contains value "Budget Tab: Budget Summary by Focus Area" under list "Application Sections for Negotiation"
    Then I do not see multipicklist field "ApplicationSectionsForRevision__c" contains value "Budget: Focus Area" under list "Application Sections for Negotiation"

    Examples:
      | Announcement Name                            |
      | {SavedValue:Automation Runtime Announcement} |

  @219357 @234667 @CompetativeAnnVerifyasEXEuserIcanseeRecommendedBudgetfieldisvisiblewhenAppstatusisnegotiationinitiated @sprint-13-US-224612  @Allocation 
  Scenario Outline:Competative Ann as EXE user I can see "Recommended Budget" field is visible when App status is negotiation initiated
  | Comp Ann>>Verify EXE when negotiation is initiated during FDM or from app layout then user should not get validation on UI on send to subrecipient button when the budgeted Amount is equal to the Recommended Budget |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    And I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    #234667
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "NegotiationDueDate__c"
    And I enter value "Overview: Project Information" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    When I click on "Send to Subrecipient" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Negotiation Initiated"
    #219357
    And I refresh the page
    When I navigate to "Budget" sub tab
    Then I softly cannot see field "Recommended Budget" inside page block

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | EXE  |

   @227564 @CompAnnVerifyEXEusercaninlineedittheRecommendedBudgetfieldunderRecommendedApplicationsectionbeforeFDMapproval @sprint-13-US-224612  @Allocation
  Scenario Outline: Comp Ann EXE user can inline edit the Recommended Budget field under Recommended Application section before FDM approval
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "NEGOTIATION_NO-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I pause execution for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I pause execution for "5" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    And I click on "Edit" in the page details
    Then I softly see field "Status" as "Created"
    When I enter value "AuGr" into field "GrantCode__c"
    When I enter value "Automation Test Description" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | NA     |
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "GrantorReviewStepRolesandResponsibilities"
    #227564
    And I navigate to "Funding Decision Memo" sub tab
    Then I softly can see row level action button "Edit" against "<Announcement Name>" in flex table with id "---applicationReview:-:recommendedTableId---"
    And I edit the following rows inline in flex table with id "---applicationReview:-:recommendedTableId---" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000               | 1000                    | Yes                   | Recommended |
    And I refresh the page
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:recommendedTableId---" :
      | Application Title   | Recommended Budget |
      | <Announcement Name> | $1,000.00          |

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | EXE  |

  @234668 @CompAnnPOusershouldseevalidationonsendtosrbuttonwhennegotiationisinitiatedduringFDMuserwhenuserselectonlybudgetsummarybyFocusAreasectionfornegotiationwhenbudgetedamountisnotequaltorecommendedamount @sprint-13-US-224612  @Allocation
  Scenario Outline: Comp Ann PO user should not see validation on send to sr button when negotiation is initiated during FDM user when user select only Budget tab Budget details section for negotiation when recommended amount is equal to Budgeted amount
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default-Automation PO user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Funding Decision Memo" sub tab
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "NegotiationDueDate__c"
    And I enter value "Budget: Budget Details" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I cannot see the following messages in the page details contains:
      | Negotiation Tab: Please select "Budget Tab: Budget Details" with "Budget Tab: Budget Summary by Focus Area" in the Application Sections for the Negotiation field. |
    Then I softly see field "Status" as "Negotiation Initiated"

    Examples:
      | Announcement Name                            | User |
      | {SavedValue:Automation Runtime Announcement} | PO   |

    @235268 @CompAnnVerifyEXEcanseethevalidationfor1appwhenthebudgetedAmountisnotequaltotheRecommendedBudgetwhenuserclickonsendtosubrecipientbuttonevenifRecommendedBudget&budgetedamountissameforotherapponsameFDM @sprint-13-US-224612  @Allocation
  Scenario Outline:Comp Ann EXE can see the validation for 1 app when the budgeted Amount is not equal to the Recommended Budget when user click on send to subrecipient button even if  Recommended Budget & budgeted amount is same for other app on same FDM
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I save the field labeled "EGMS ID" as "App2EgmdId"
    And I initiated an application review for application "<Application2>" on announcement "<Announcement Name>" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application2>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "<Application2>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I save the field labeled "EGMS ID" as "App1EgmdId"
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Application2>" in "---applicationReview:-:appTableId---" panel
    When I check "<Application2>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    Then I see the sub-header is "SME Review" in the page details
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
      | {SavedValue:PM Username} |
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    When I expand nested table containing column value "<Application2>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:App1EgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:App1EgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:App1EgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:App1EgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:App1EgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:App1EgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Application2>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "{SavedValue:EXE Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application2>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application2>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I pause execution for "5" seconds
    When I check "<Application2>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:App1EgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:App1EgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Application2>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    And I click on "Edit" in the page details
    When I enter value "AuGr" into field "GrantCode__c"
    When I enter value "Automation Test Description" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} |NA      |
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "GrantorReviewStepRolesandResponsibilities"
    And I navigate to "Funding Decision Memo" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:recommendedTableId---" by clicking "Edit" :
      | Application Title | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Application2>    | 1500               | 1500                    | Yes                   | Recommended |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    And I save the field labeled "Announcement EGMS ID" as "AnnEgmdId"
    When I click on "Initiate Negotiation" icon for "{SavedValue:App1EgmdId}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    #235268
    And I wait for "3" seconds
    And I softly see the following messages in the page details contains:
      | Negotiations Tab: The Budgeted Amount must be equal to the Recommended Amount in the application. So please select the "Budget: Budget Details" option in the "Application Sections for Negotiations" field before sending the application back for revision. |
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:AnnEgmdId}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEgmdId}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I navigate to "Funding Decision Memo" sub tab
    When I click on "Initiate Negotiation" icon for "{SavedValue:App2EgmdId}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I wait for "3" seconds
    And I enter value "7" into field "NegotiationDueDate__c"
    And I enter value "Budget: Budget Details" into field "ApplicationSectionsForRevision__c"
    And I enter value "Budget Tab: Budget Summary by Focus Area" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on "Send to Subrecipient" in the page details
    When I save the field labeled "EGMS ID" as "App2EGMSID"
    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:App2EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:App2EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I click on "Edit" in the page details
    And I navigate to "Negotiations" sub tab
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Negotiation Submitted"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:App2EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:App2EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    And I click on "Create Subaward" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"

    Examples:
      | Announcement Name                            | Application2                     | User |
      | {SavedValue:Automation Runtime Announcement} | Automation Runtime Application_2 | EXE  |

   @227577 @CompAnnVerifyPOusercanseethevalidationwhenthebudgetedAmountisnotequaltotheRecommendedBudgetwhenusertriedtoconverttoawardonFDMlayout @sprint-13-US-224612  @Allocation
  Scenario Outline:Comp Ann PO user can see the validation when the budgeted Amount is not equal to the Recommended Budget when user tried to convert to award on FDM layout
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default-Automation PO user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I save the field labeled "EGMS ID" as "App2EgmdId"
    And I initiated an application review for application "<Application2>" on announcement "<Announcement Name>" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application2>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "<Application2>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I save the field labeled "EGMS ID" as "App1EgmdId"
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Application2>" in "---applicationReview:-:appTableId---" panel
    When I check "<Application2>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    Then I see the sub-header is "SME Review" in the page details
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
      | {SavedValue:PM Username} |
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    When I expand nested table containing column value "<Application2>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:App1EgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:App1EgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
     And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:App1EgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:App1EgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
     And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:App1EgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:App1EgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
     And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Application2>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
     And I wait for "2" seconds
     And I click on "Next Review Step" in the page details
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application2>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application2>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I pause execution for "5" seconds
    When I check "<Application2>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:App1EgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:App1EgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
     And I wait for "3" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
     And I wait for "2" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Application2>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    And I click on "Edit" in the page details
    When I enter value "AuGr" into field "GrantCode__c"
    When I enter value "Automation Test Description" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | NA     |
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "GrantorReviewStepRolesandResponsibilities"
    And I navigate to "Funding Decision Memo" sub tab
    And I save the field labeled "Announcement EGMS ID" as "AnnEgmdId"
    And I edit the following rows inline in flex table with id "---applicationReview:-:recommendedTableId---" by clicking "Edit" :
      | Application Title | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Application2>    | 1500               | 1500                    | Yes                   | Recommended |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    #227577
    And I click on "Create Subaward" icon for "{SavedValue:App1EgmdId}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | The Budgeted Amount must be equal to The Recommended Budget Amount. So please select the "Budget: Budget Details" option in the "Application Sections for Negotiations" field and send the application back for revision to the subrecipient. |
    And I refresh the page
    And I click on "Create Subaward" icon for "{SavedValue:App2EgmdId}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"

    Examples:
      | Announcement Name                            | Application2                     | User |
      | {SavedValue:Automation Runtime Announcement} | Automation Runtime Application_2 | PO   |

  @113322 @ValidateApplicantscanfillinthedetailedbudgetonapplicationwhenfundingopportunityisextended @Sprint-23-US-273843  @Allocation
  Scenario: Validate Applicants can fill in the detailed budget on application when funding opportunity is extended
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{AUTOEnvData:CompetitiveClosedAnnDetailBudgetYes}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "{AUTOEnvData:CompetitiveClosedAnnDetailBudgetYes}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Closed" and is "dark blue"
    And I click on "Extend Dates" in the page details
    And I enter values into fields
      | Value | Field                          |
      | 1     | ProposedApplicationDueDate__c  |
    And I click modal button "Save"
    And I click modal button "Confirm"
    And I click modal button "Close"
    And I refresh the page
    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{AUTOEnvData:CompetitiveClosedAnnDetailBudgetYes}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{AUTOEnvData:CompetitiveClosedAnnDetailBudgetYes}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 500          | 100        | 100            |
    Then I softly can see row level action button "Edit" against "Extra Salary" in flex table with id "---applicationReview:-:addLineItemsModalTableId---"
    When I close "Add Line Items" modal by clicking the top right x button
    And I refresh the page
    When I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---applicationReview:-:budgetTableId---" for table id "Next"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 500          | 50         | 50             |
    Then I softly can see row level action button "Edit" against "Extra Salary" in flex table with id "---applicationReview:-:addLineItemsModalTableId---"


