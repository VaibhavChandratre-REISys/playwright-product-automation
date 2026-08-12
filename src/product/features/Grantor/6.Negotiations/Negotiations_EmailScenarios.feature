@emailRegression @negotiationsEmailScenarios @grantor-regression @grantor-parallel-regression @regression @NegoWithBackground
Feature: Validate all email scenarios in Negotiations

  #NegoWithBackground
  @34192 @57490 @57492 @createSubawardButtonOnCompletedNegotiationfromApplicationsTab
  Scenario: Validate whether user is able to Create Subaward from the Applications Tab Once Negotiation is completed and user is able to view the completed Negotiation on Applications Tab| Validate that Applicant receives Email notification when sent to subrecipient
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I click on "Edit" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Negotiation Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    And I logout
    And I wait for "5" seconds
    And I checkout to yopmail with mailid "automationspi31.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: An Application Negotiation Request forApplication {SavedValue:EGMSID} has been Requested
      """
    Given I am on "INTERNAL" portal
    And I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    Then I softly see values "{SavedValue:Automation Runtime FDM Announcement}" and "Reviewed" inside table
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    Then I softly can see top right button "Create Subaward" in page detail
