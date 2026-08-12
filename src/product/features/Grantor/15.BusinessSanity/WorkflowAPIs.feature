@workflowAPIs @regression
Feature: Validate all APIs of every modules flow

  @mkk @testgranteesf
  Scenario:
    Given I create program records with status "Active" using "default" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
      | Automation Runtime External Program | NGO Program      |
#    And I create program records with status "Approved" using "default" properties
#      | Title                                            |
#      | {SavedValue:Automation Runtime Program}          |
#      | {SavedValue:Automation Runtime External Program} |
    Given I create program records with status "Created" using "Owner-{SavedValue:PM1 Username},approver1-{SavedValue:FO Username},approver2-NA" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |

    Given I create program records with status "Created" using "default" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

    Given I create program records with status "Created" using "default" properties
      | Title                               | RecordType       |
      | Automation Runtime External Program | NGO Program      |
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"


  @testAmendmentRequest
  Scenario:
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Competitive"
    And I create amendment request records with status "Created" using "default" properties
      | Title                                              | AmendmentType    | RecordType          |
      | {SavedValue:Automation Runtime Award for closeout} | Periodic Renewal | Periodic/BP Renewal |
    And I create amendment request records with status "Sent To Subrecipient" using "default" properties
      | Title                                              | AmendmentType    |
      | {SavedValue:Automation Runtime Award for closeout} | Periodic Renewal |
    And I create amendment request records with status "Acknowledged" using "default" properties
      | Title                                              | AmendmentType    |
      | {SavedValue:Automation Runtime Award for closeout} | Periodic Renewal |
    And I create amendment request records with status "Submitted for Approval" using "default" properties
      | Title                                              | AmendmentType    |
      | {SavedValue:Automation Runtime Award for closeout} | Periodic Renewal |
    And I create amendment request records with status "Approved" using "default" properties
      | Title                                              | AmendmentType    |
      | {SavedValue:Automation Runtime Award for closeout} | Periodic Renewal |
    And I halt execution

  @testAmendmentRequest1
  Scenario:
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Competitive"
    And I create subrecipient side amendment request records with status "Acknowledged" using "default" properties
      | Title                                              | AmendmentType        | RecordType        |
      | {SavedValue:Automation Runtime Award for closeout} | Budget Period Change | Formal Amendments |
    And I halt execution

  @testCarryForward
  Scenario:
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Competitive"
    And I create amendment request records with status "Approved" using "default" properties
      | Title                                              | AmendmentType    | RecordType          |
      | {SavedValue:Automation Runtime Award for closeout} | Periodic Renewal | Periodic/BP Renewal |
    And I halt execution
    And I save the field labeled "Subaward Title" as "Automation Runtime New award"
    And I create subrecipient side amendment request records with status "Created" using "default" properties
      | Title                                     | GrantName                                          | AmendmentType | RecordType        |
      | {SavedValue:Automation Runtime New award} | {SavedValue:Automation Runtime Award for closeout} | Carry Forward | Formal Amendments |
#    And I create subrecipient side amendment request records with status "Approved" using "default" properties
#      | Title                             | GrantName                                  | AmendmentType | RecordType        |
#      | Automation Runtime New Award98104 | Automation Runtime Award for closeout92657 | Carry Forward | Formal Amendments |
    And I halt execution

  @testApplication
  Scenario:
#    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    And I create program records with status "Active" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    And I create announcement records with status "Published" using "default" properties
      | AnnouncementName                            | ProgramName                             | AnnType  | AllocationLevel |
      | Automation Runtime Announcement Application | {SavedValue:Automation Runtime Program} | Directed | N/A             |
#    And I halt execution
#    And I create pre-application records with status "Created" using "default" properties
#      | Title                              | AnnouncementName                                         |
#      | Automation Runtime Pre-Application | {SavedValue:Automation Runtime Announcement Application} |
#    And I halt execution
    And I create application records with status "Submitted to Grantor" using "default" properties
      | Title                          | AnnouncementName                                         | PreAppTitle |
      | Automation Runtime Application | {SavedValue:Automation Runtime Announcement Application} |             |
#    And I halt execution
    And I Initiated application review for multiple records on announcement
      | AnnouncementName                                         |
      | {SavedValue:Automation Runtime Announcement Application} |
#    And I halt execution
    And I initiate pre-screen review for announcements with properties "default"
      | AnnouncementName                                         | ReviewerName             |
      | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:FO Username} |
#    And I halt execution
    And I submit review for announcements with properties "default"
      | ReviewName        | AnnouncementName                                         | ApplicationName                             |
      | Pre-Screen Review | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:Automation Runtime Application} |
#    And I halt execution
    And I initiate SME review for announcements with properties "default"
      | AnnouncementName                                         | ReviewerName             | ReviewerName2             | ReviewerName3            |
      | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:FO Username} | {SavedValue:EXE Username} | {SavedValue:PM Username} |
#    And I halt execution
    And I submit review for announcements with properties "default"
      | ReviewName | AnnouncementName                                         | ApplicationName                             |
      | SME Review | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:Automation Runtime Application} |
#    And I halt execution
    And I initiate management review for announcements with properties "default"
      | AnnouncementName                                         | ReviewerName             |
      | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:FO Username} |
    And I halt execution
#    And I submit review for announcements with properties "default"
#      | ReviewName        | AnnouncementName                                         | ApplicationName                             |
#      | Management Review | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:Automation Runtime Application} |
#    And I halt execution
#    And I create FDM records with status "Created" using "default" properties
#      | AnnouncementName                                         | ApplicationName                             |
#      | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:Automation Runtime Application} |
#    And I halt execution
#    And I initiate award for FDM records with properties "default"
#      | AnnouncementName                                         | ApplicationName                             |
#      | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:Automation Runtime Application} |
#    And I halt execution

  @testCloseout
  Scenario:
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
#    And I create subawards records with status "Submitted to Grantor" using "default" properties
#      | Title                              | AwardName                                          | PaymentRequestType |
#    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
#    And I create payment request records with status "Submitted to Grantor" using "default" properties
#      | Title                              | AwardName                                          | PaymentRequestType |
#      | Automation Runtime Payment Request | {SavedValue:Automation Runtime Award for closeout} | Reimbursement      |
#    And I create site visit or Desk Review records with status "Active" using "default" properties
#      | RecordType  | Title                          | AwardName                                          | AssociateAward                        | MonitoringType   |
#      | Site Visit | Automation Runtime Site Visit | {SavedValue:Automation Runtime Award for closeout} | {SavedValue:Automation Runtime Award} | Program & Fiscal |
#    And I create org level site visit or Desk Review records with status "Active" using "default" properties
#      | RecordType | Title                                    | AccountName                         | AssociateAward                        | MonitoringType   |
#      | Site Visit | Automation Runtime Org Level Desk Review | SAN DIEGO ELECTRICAL TRAINING TRUST | {SavedValue:Automation Runtime Award} | Program & Fiscal |
#    And I create closeout records with status "Approved" using "default" properties
#      | AwardName                                          | CloseoutType     |
#      | {SavedValue:Automation Runtime Award for closeout} | Early Completion |
#    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Payment Request"
#    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime award}" having object api name as "PaymentRequest__c"
#    And I update schedule payment request records with status "Created" using "default" properties
#      | EGMSId                 | AwardName                             | PaymentRequestType |
#      | {SavedValue:Record Id} | {SavedValue:Automation Runtime award} | Reimbursement      |
#    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
#    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
#    And I update schedule progress report records with status "Approved" using "default" properties
#      | EGMSId                 | AwardName                             |
#      | {SavedValue:Record Id} | {SavedValue:Automation Runtime award} |
    And I halt execution