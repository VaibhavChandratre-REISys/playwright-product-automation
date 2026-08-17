@negotiations @grantor-regression @grantor-parallel-regression @regression @NegoWithBackground
Feature: Validate all scenarios in Shared revenu Negotiations

  @Sprint-19-US-475605 @477606 @477607 @VaishaliD
  Scenario: As a Grantee, verify that Proposals tab should be hide when application is in negotiation initiate state for shared revenue program
    | As a Grantee, verify that validation should not come while save and submit the application for 'Approach/Methodology, Capacity, Qualifications' sections on proposals tab for shared revenue program when application is in negotiation initiate state
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
    When I clear the value from field "ApplicationSectionsforNegotiation__c"
    When  I enter "Edition_SR" values from "Negotiations_Field_Values.xlsx"
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
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    #477606
    Then I softly cannot see "Proposal" sub tab at view detail page
    And I click on "Save" in the page details
    #477607
    Then I softly cannot see the following messages in the page details :
      | Proposal Tab - Provide the Approach/Methodology before submitting this Application. |
      | Proposal Tab - Provide the Capacity before submitting this Application.             |
      | Proposal Tab - Provide the Qualifications before submitting this Application.       |
    And I click on "Submit to Grantor" in the page details
    Then I softly cannot see the following messages in the page details :
      | Proposal Tab - Provide the Approach/Methodology before submitting this Application. |
      | Proposal Tab - Provide the Capacity before submitting this Application.             |
      | Proposal Tab - Provide the Qualifications before submitting this Application.       |
  #GA User
  @Sprint-19-US-475605 @477622 @477623 @VaishaliD
  Scenario: As a GA, verify that Proposals tab should be hide when application is in negotiation initiate state for shared revenue program
  | As a GA, verify that validation should not come while save and submit the application for 'Approach/Methodology, Capacity, Qualifications' sections on proposals tab for shared revenue program when application is in negotiation initiate state
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
    When I clear the value from field "ApplicationSectionsforNegotiation__c"
    When  I enter "Edition_SR" values from "Negotiations_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "4" seconds
    When I click on "Send to Grantee" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I click on "Edit" in the page details
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    #477622
    Then I softly cannot see "Proposal" sub tab at view detail page
    And I click on "Save" in the page details
    #477623
    Then I softly cannot see the following messages in the page details :
      | Proposal Tab - Provide the Approach/Methodology before submitting this Application. |
      | Proposal Tab - Provide the Capacity before submitting this Application.             |
      | Proposal Tab - Provide the Qualifications before submitting this Application.       |
    And I click on "Submit to Grantor" in the page details
    Then I softly cannot see the following messages in the page details :
      | Proposal Tab - Provide the Approach/Methodology before submitting this Application. |
      | Proposal Tab - Provide the Capacity before submitting this Application.             |
      | Proposal Tab - Provide the Qualifications before submitting this Application.       |