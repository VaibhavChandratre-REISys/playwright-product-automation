@Sprint-PageLayout @Sprint-2025 @EmailTemplate @JuneRelease @PageLayout-Sprint
Feature:Sprint Scenarios for Page Edit/View layout
Business Need: - This includes below user stories
1. EmailTemplate @US-507415 @Sprint-8-2025

  @394311 @394312 @Sprint3 @BTT @wip
  Scenario Outline: PM - BTT -LWC-To verify, user should be able to see browser title for planning phase record as 'Planning View' in view mode.
  |Admin- BTT -LWC- To verify, user should be able to see browser title for planning phase record as 'Planning View' in view mode.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    Then I see page title "Program View"

    Examples:
      | User |
      #| Admin |
      | PM   |

  @394384 @394390 @Sprint3 @BTT
  Scenario Outline: Admin - BTT- LWC- To verify, user should be able to see browser title for planning phase record as 'Planning Edit' in edit mode.
  |PM- BTT-LWC -To verify, user should be able to see browser title for planning phase record as 'Planning Edit' in edit mode.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
#    And I click on "Edit" in the page details
    And I pause execution for "20" seconds
    Then I see page title "Program View"

    Examples:
      | User |
      #| Admin |
      | PM   |

  @394392 @Sprint3 @BTT @wip
  Scenario Outline:PM - BTT- LWC- To verify, user should be able to see browser title for announcement phase record as 'Announcement Edit' in edit mode.
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    #394392 #394415
    Then I see page title "Announcement Edit"
    And I navigate to "Announcements" tab
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
    #394416 #394417
    Then I see page title "Announcement View"

    Examples:
      | User |
      #| Admin |
      | PM   |

  @394436 @394437 @394446 @394448 @Sprint3 @BTT @wip
  Scenario Outline: Admin- BTT- LWC- To verify, user should be able to see browser title for application phase record as 'Application View' in view mode.
  |PM- BTT- LWC- To verify, user should be able to see browser title for application phase record as 'Application View' in view mode.|
  |Admin- BTT- LWC- To verify, user should be able to see browser title for pre-application phase record as 'Pre-application View' in view mode.|
  |PM- BTT- LWC- To verify, user should be able to see browser title for pre-application phase record as 'Pre-application View' in view mode.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
      #394436 #394437
    Then I see page title "Application View"
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
      #394446 #394448
    Then I see page title "Pre-Application View"

    Examples:
      | User |
      #| Admin |
      | PM   |

  @394503 @394515 @394527 @394541 @Sprint3 @BTT @wip
  Scenario Outline: PM- BTT- LWC- To verify, user should be able to see browser title for grant phase record as 'Grant View' in view mode.
  |Admin- BTT- LWC- To verify, user should be able to see browser title for grant phase record as 'Grant View' in view mode.|
  |Admin- BTT- LWC- To verify, user should be able to see browser title for grant phase record as 'Grant Edit' in edit mode.|
  |PM- BTT- LWC- To verify, user should be able to see browser title for grant phase record as 'Grant Edit' in edit mode.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    And I click toggle button to select "Grants - Active"
    And I pause execution for "3" seconds
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
     #394503 @394515
    Then I see page title "Grant View"
    And I navigate to "Grants" tab
    And I click toggle button to select "Grants - My Recordsxg3f"
    And I pause execution for "3" seconds
    And I click on "Edit" action for first record of table
    And I pause execution for "5" seconds
    #394527 #394541
    Then I see page title "Grant Edit"

    Examples:
      | User |
      #| Admin |
      | PM   |

  @394545 @394564 @394566 @394568 @Sprint3 @BTT @wip
  Scenario Outline: Admin- BTT- LWC- To verify, user should be able to see browser title for Amendment requests  record as 'Amendment Request View' in view mode.
  |PM- BTT- LWC- To verify, user should be able to see browser title for Amendment requests  record as 'Amendment Request View' in view mode.|
  |Admin- BTT- LWC- To verify, user should be able to see browser title for Amendment requests  record as 'Amendment Request Edit' in edit mode.|
  |PM- BTT- LWC- To verify, user should be able to see browser title for Amendment requests  record as 'Amendment Request Edit' in edit mode.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I pause execution for "2" seconds
    And I click toggle button to select "Amendment Requests - My Records"
    And I pause execution for "3" seconds
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
     #394545 #394564
    Then I see page title "Amendment Request View"
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    And I pause execution for "3" seconds
    And I click on "Edit" action for first record of table
    And I pause execution for "5" seconds
    #394566 #394568
    Then I see page title "Amendment Request Edit"

    Examples:
      | User |
      #| Admin |
      | PM   |

  @394546 @394559 @394560 @Sprint3 @BTT @wip
  Scenario Outline: PM- BTT- LWC- To verify, user should be able to see browser title for subawards phase record as 'Award View' in view mode.
  |Admin- BTT- LWC- To verify, user should be able to see browser title for subawards phase record as 'Subaward View' in view mode.|
  |PM- BTT- LWC- To verify, user should be able to see browser title for subawards phase record as 'Subaward Edit' in edit mode.|
    Given I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST" of type "Competitive"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I pause execution for "10" seconds
     #394546 #394559
    Then I see page title "Subaward View"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - My Records"
    And I pause execution for "3" seconds
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I pause execution for "5" seconds
    #394560
    Then I see page title "Subaward Edit"

    Examples:
      | User |
      #| Admin |
      | PM   |

  @394570 @394571 @395082 @395083 @Sprint3 @BTT @wip
  Scenario Outline:Admin- BTT- LWC- To verify, user should be able to see browser title for Progress Reports record 'Progress Report View' in view mode on monitoring phase.
  |PM- BTT- LWC- To verify, user should be able to see browser title for Progress Reports record 'Progress Report View' in view mode on monitoring phase.|
  |SPI- BTT -LWC- To verify, user should be able to see browser title for Progress Reports as ' Progress Report View' in view mode on Monitoring phase|
  |SPI- BTT -LWC- To verify, user should be able to see browser title for Progress Reports as ' Progress Report Edit' in edit mode on Monitoring phase
    Given I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    #395082
    Then I see page title "Progress Report View"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    #395083
    Then I see page title "Progress Report Edit"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    Then I softly see that "7" has been added in flextable with Id "---progressReport:-:kpiTableId---"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "8" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:RAEGMSID}" in "---paymentRequest:-:RecipientPaymentRequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:RAEGMSID}" inside flex table with id "---paymentRequest:-:RecipientPaymentRequestAdvancesTableId---" without waiting for record
    #394570 #394571
    Then I see page title "Progress Report View"
    Examples:
      | User |
      #| Admin |
      | PM   |

  @394577 @394578 @394580 @394581 @Sprint3 @BTT @wip
  Scenario Outline: Admin- BTT- LWC- To verify, user should be able to see browser title for site visit record 'Site Visit View' in view mode on monitoring phase.
  |Admin- BTT- LWC- To verify, user should be able to see browser title for site visit record 'Site Visit Edit' in edit mode on monitoring phase.|
  |PM- BTT- LWC- To verify, user should be able to see browser title for site visit record 'Site Visit Edit' in edit mode on monitoring phase.|
  |PM- BTT- LWC- To verify, user should be able to see browser title for site visit record 'Site Visit View' in view mode on monitoring phase.|
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "<User>" user
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
    And I pause execution for "8" seconds
      #394577 #394581
    Then I see page title "Site Visit Edit"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SiteVisitID"
    And I pause execution for "4" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:SiteVisitID}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    When I click on "View" icon for "{SavedValue:SiteVisitID}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---" without waiting for record
    And I pause execution for "6" seconds
      #394580 #394578
    Then I see page title "Site Visit View"

    Examples:
      | User |
      #| Admin |
      | PM   |

  @394584 @394586 @394588 @Sprint3 @BTT @wip
  Scenario Outline: Admin- BTT- LWC- To verify, user should be able to see browser title for desk reviews record 'Desk Reviews Edit' in edit mode on monitoring phase.
  |PM- BTT- LWC- To verify, user should be able to see browser title for desk reviews record 'Desk Review Edit' in edit mode on monitoring phase.|
  |Admin- BTT- LWC- To verify, user should be able to see browser title for desk reviews record 'Desk Review View' in view mode on monitoring phase.|
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Formula_By_Applicant"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I pause execution for "8" seconds
    And I save the field labeled "EGMS ID" as "DeskReview"
    #394584 #394586
    Then I see page title "Desk Review Edit"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Desk Review Reports - All"
    And I perform quick search for "{SavedValue:DeskReview}" in "---riskassessment:-:OrgRiskAssessmentTableId---" panel
    When I click on "View" icon for "{SavedValue:DeskReview}" inside flex table with id "---riskassessment:-:OrgRiskAssessmentTableId---" without waiting for record
    #394588 #394589
    Then I see page title "Desk Review View"

    Examples:
      | User |
      #| Admin |
      | PM   |

  @394591 @394592 @394594 @394595 @Sprint3 @BTT @wip
  Scenario Outline:Admin- BTT- LWC- To verify, user should be able to see browser title for risk assessments record 'Risk Assessment Edit' in edit mode on monitoring phase.
  |Admin- BTT- LWC- To verify, user should be able to see browser title for risk assessments record 'Risk Assessment View' in view mode on monitoring phase.|
  |PM- BTT- LWC- To verify, user should be able to see browser title for risk assessments record 'Risk Assessment View' in view mode on monitoring phase.|
  |PM- BTT- LWC- To verify, user should be able to see browser title for risk assessments record 'Risk Assessment Edit' in edit mode on monitoring phase.|
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I pause execution for "8" seconds
      #394591 #394595
    Then I see page title "Risk Assessment Edit"
    And I navigate to "Assessment" sub tab
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID"
    And I pause execution for "8" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Organization Risk Assessments - All"
    And I perform quick search for "{SavedValue:RAEGMSID}" in "---riskassessment:-:OrgRiskAssessmentTableId---" panel
    When I click on "View" icon for "{SavedValue:RAEGMSID}" inside flex table with id "---riskassessment:-:OrgRiskAssessmentTableId---" without waiting for record
     #394592 #394594
    Then I see page title "Risk Assessment View"

    Examples:
      | User |
      #| Admin |
      | PM   |

  @395089 @305090 @394605 @394604 @Sprint3 @BTT @wip
  Scenario Outline: PM- BTT- LWC- To verify, user should be able to see browser title for advance payment requests record as 'Payment Request View' in view mode on monitoring phase.
  |SPI- BTT -LWC- To verify, user should be able to see browser title for Advance payment records as ' Payment Request Edit ' in edit mode on Monitoring phase|
  |SPI- BTT -LWC- To verify, user should be able to see browser title for Advance payment records as ' Payment Request View ' in view mode on Monitoring phase|
  |Admin- BTT- LWC- To verify, user should be able to see browser title for advance payment requests record as 'Payment Request View' in view mode on monitoring phase.|
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    #395089
    Then I see page title "Payment Request Edit"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:RecipientPaymentRequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:RecipientPaymentRequestAdvancesTableId---" without waiting for record
    And I pause execution for "5" seconds
    #395090
    Then I see page title "Payment Request View"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Advances" content inside "Payments" subheader on left panel
    And I click toggle button to select "Advances - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    And I pause execution for "6" seconds
    #394605 #304604
    Then I see page title "Payment Request View"

    Examples:
      | User |
      | PM   |
   #   | ADMIN |

  @394611 @394612 @395092 @395091 @Sprint3 @BTT @wip
  Scenario Outline: Admin- BTT- LWC- To verify, user should be able to see browser title for reimbursement payment requests record as 'Payment Request View' in view mode on monitoring phase.
  |PM- BTT- LWC- To verify, user should be able to see browser title for reimbursement payment requests record as 'Payment Request View' in view mode on monitoring phase.|
  |SPI- BTT -LWC- To verify, user should be able to see browser title for Reimbursement payment records as ' Payment Request Edit ' in edit mode on Monitoring phase|
  |SPI- BTT -LWC- To verify, user should be able to see browser title for Reimbursement payment records as ' Payment Request View ' in view mode on Monitoring phase|
    Given I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUD_CAT_SUB_ORG_IND-Automation EXE user" of type "Competitive"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "7" seconds
    #395092
    Then I see page title "Payment Request Edit"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                |
    And I click modal button "Close"
    And I click on "Submit to Grantor" in the page details
    And I pause execution for "7" seconds
    When I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:RecipientpaymentrequestReimbursementTableId---"
    And I pause execution for "7" seconds
    #395091
    Then I see page title "Payment Request View"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    And I click toggle button to select "Reimbursements - All"
    And I perform quick search for "{SavedValue:PayreqId}" in "---auditor:-:paymentrequestReimbursementTableId---" panel
    When I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---auditor:-:paymentrequestReimbursementTableId---" without waiting for record
    And I pause execution for "8" seconds
    #394611 #394612
    Then I see page title "Payment Request View"

    Examples:
      | User |
      | PM   |
   #   | ADMIN |

  @394630 @394631 @395094 @394633 @394635 @Sprint3 @BTT @wip
  Scenario Outline: Admin- BTT- LWC- To verify, user should be able to see browser title for Project Period Closeouts record as 'Closeout Edit' in edit mode on Closeout phase.
  |PM- BTT- LWC- To verify, user should be able to see browser title for Project Period Closeouts record as 'Closeout Edit' in edit mode on Closeout phase.|
  |PM- BTT- LWC- To verify, user should be able to see browser title for Project Period Closeouts record as 'Closeout View' in view mode on Closeout phase.|
  |Admin- BTT- LWC- To verify, user should be able to see browser title for Project Period Closeouts record as 'Closeout View' in view mode on Closeout phase.|
  |SPI- BTT -LWC- To verify, user should be able to see browser title for Project Period Closeouts records as 'Closeout View ' in view mode on Closeout phase|
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "7" seconds
    #394630 #394631
    Then I see page title "Closeout Edit"
    And I save the field labeled "EGMS ID" as "closeoutRequestNo"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "7" seconds
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - Draft"
    And I perform quick search for "{SavedValue:closeoutRequestNo}" in "---closeout:-:CloseoutTableId---" panel
    When I click on "View" icon for "{SavedValue:closeoutRequestNo}" inside flex table with id "---closeout:-:CloseoutTableId---" without waiting for record
    And I pause execution for "6" seconds
     #394633 #394635
    Then I see page title "Closeout View"
    And I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I pause execution for "7" seconds
    #395094
    Then I see page title "Closeout View"
    And I pause execution for "5" seconds
    When I click on "Edit" in the page details
    And I pause execution for "6" seconds
    #
    Then I see page title "Closeout Edit"

    Examples:
      | User |
      | PM   |
   #   | ADMIN |

  @394641 @394643 @394644 @394646 @Sprint3 @BTT @wip
  Scenario Outline: Admin - BTT- LWC- To verify, user should be able to see browser title for Strategic Plans record as 'Strategic Plan Edit'  in edit mode on planning phase.
  |PM - BTT- LWC- To verify, user should be able to see browser title for Strategic Plans record as 'Strategic Plan Edit'  in edit mode on planning phase.|
  |PM - BTT- LWC- To verify, user should be able to see browser title for Strategic Plans record as 'Strategic Plan View'  in view mode on planning phase.|
  |Admin - BTT- LWC- To verify, user should be able to see browser title for Strategic Plans record as 'Strategic Plan View'  in view mode on planning phase.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "StartegicPlanNo"
    And I pause execution for "7" seconds
    #394641 #394643
    Then I see page title "Strategic Plan Edit"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - All"
    And I perform quick search for "{SavedValue:StartegicPlanNo}" in "---strategicplan:-:StrategicPlansTableId---" panel
    When I click on "View" icon for "{SavedValue:StartegicPlanNo}" inside flex table with id "---strategicplan:-:StrategicPlansTableId---" without waiting for record
    And I pause execution for "6" seconds
    #394644 #394646
    Then I see page title "Strategic Plan View"


    Examples:
      | User |
      | PM   |
   #   | ADMIN |

  @394647 @394648 @394649 @394650 @Sprint3 @BTT @wip
  Scenario Outline:Admin - BTT- LWC- To verify, user should be able to see browser title for Focus Area record as 'Focus Area View'  in view mode on planning phase.
  |PM - BTT- LWC- To verify, user should be able to see browser title for Focus Area record as 'Focus Area View'  in view mode on planning phase.|
  |PM - BTT- LWC- To verify, user should be able to see browser title for Focus Area record as 'Focus Area Edit'  in edit mode on planning phase.|
  |Admin - BTT- LWC- To verify, user should be able to see browser title for Focus Area record as 'Focus Area Edit'  in edit mode on planning phase.|
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I pause execution for "7" seconds
    And I save the field labeled "EGMS ID" as "FocusAreaNo"
    #394649 #394650
    Then I see page title "Focus Area Edit"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - All"
    And I perform quick search for "{SavedValue:FocusAreaNo}" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "{SavedValue:FocusAreaNo}" inside flex table with id "---focusarea:-:focusAreaTableId---" without waiting for record
    And I pause execution for "6" seconds
    #394647 #394648
    Then I see page title "Focus Area View"

    Examples:
      | User |
   #   | ADMIN |
      | PM   |

  @394651 @394652 @394653 @394654 @Sprint3 @BTT @wip
  Scenario Outline:Admin - BTT- LWC- To verify, user should be able to see browser title for Funding sources record as 'Funding Source Edit'  in edit mode on planning phase.
  |PM - BTT- LWC- To verify, user should be able to see browser title for Funding sources record as 'Funding Source Edit'  in edit mode on planning phase.|
  |PM - BTT- LWC- To verify, user should be able to see browser title for Funding sources record as 'Funding Source View'  in view mode on planning phase.|
  |Admin - BTT- LWC- To verify, user should be able to see browser title for Funding sources record as 'Funding Source View'  in view mode on planning phase.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "7" seconds
    And I save the field labeled "EGMS ID" as "FundingSourceNo"
    #394651 #394652
    Then I see page title "Funding Source Edit"
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - All"
    And I perform quick search for "{SavedValue:FundingSourceNo}" in "---fundingsource:-:fundingSourceTableId---" panel
    When I click on "View" icon for "{SavedValue:FundingSourceNo}" inside flex table with id "---fundingsource:-:fundingSourceTableId---" without waiting for record
    And I pause execution for "6" seconds
    #394653 #394654
    Then I see page title "Funding Source View"

    Examples:
      | User |
   #   | ADMIN |
      | EXE  |

  @394748 @394749 @394750 @394751 @Sprint3 @BTT @wip
  Scenario Outline: Admin - BTT- LWC- To verify, user should be able to see browser title for Key Performance Indicators (KPIs) as 'Master KPI Edit'  in edit mode on planning phase.
  |PM - BTT- LWC- To verify, user should be able to see browser title for Key Performance Indicators (KPIs) as 'Master KPI Edit'  in edit mode on planning phase.|
  |Admin - BTT- LWC- To verify, user should be able to see browser title for Key Performance Indicators (KPIs) as 'Master KPI View'  in view mode on planning phase.|
  |PM - BTT- LWC- To verify, user should be able to see browser title for Key Performance Indicators (KPIs) as 'Master KPI View'  in view mode on planning phase.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "KPINo"
    And I pause execution for "7" seconds
    #394748 #394749
    Then I see page title "Key Performance Indicators (KPI) Edit"
    When I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    And I perform quick search for "{SavedValue:KPINo}" in "---keyperformanceindicator:-:kpiTableId---" panel
    When I click on "View" icon for "{SavedValue:KPINo}" inside flex table with id "---keyperformanceindicator:-:kpiTableId---" without waiting for record
    And I pause execution for "6" seconds
    #394750
    Then I see page title "Key Performance Indicators (KPI) View"

    Examples:
      | User |
      #| ADMIN |
      | EXE  |

  @395016 @Sprint3 @BTT @wip
  Scenario: SPI- BTT -LWC- To verify, user should be able to see browser title for Not yet Qualified opportunities as 'Announcement View' in view mode on opportunities phase
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    And I pause execution for "7" seconds
    #395016
    Then I see page title "Announcement View"

  @395053 @Sprint3 @BTT @wip
  Scenario: SPI- BTT -LWC- To verify, user should be able to see browser title for Converted to Application records as 'Qualified Announcement View' in view mode on opportunities phase
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "8" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "annEgmsId"
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "appEgmsId"
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "{SavedValue:annEgmsId}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:annEgmsId}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---" without waiting for record
    And I pause execution for "7" seconds
    Then I see page title "Qualified Announcement View"

  @395055 @395057 @Sprint3 @BTT @wip
  Scenario:SPI- BTT -LWC- To verify, user should be able to see browser title for Pre-applications records as 'Pre-Application View' in view mode on application phase
  |SPI- BTT -LWC- To verify, user should be able to see browser title for Pre-applications records as 'Pre-Application Edit' in edit mode on application phase|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PREAPPEGMSID"
    And I pause execution for "7" seconds
    #395057
    Then I see page title "Pre-Application Edit"
    And I click on "Save" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:PREAPPEGMSID}" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:PREAPPEGMSID}" inside table
    And I pause execution for "7" seconds
    Then I see page title "Pre-Application View"

  @395058 @395060 @Sprint3 @BTT @wip
  Scenario: SPI- BTT -LWC- To verify, user should be able to see browser title for Applications records as 'Application Edit' in edit mode on application phase
  |SPI- BTT -LWC- To verify, user should be able to see browser title for Applications records as 'Application View' in view mode on application phase|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I pause execution for "7" seconds
      #395058
    Then I see page title "Application Edit"
    And I click on "Save" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside table
    And I pause execution for "7" seconds
      #395060
    Then I see page title "Application View"

  @395061 @395064 @Sprint3 @BTT @wip
  Scenario: SPI- BTT -LWC- To verify, user should be able to see browser title for Negotiation records as 'Application View' in view mode on application phase
  |SPI- BTT -LWC- To verify, user should be able to see browser title for Negotiation records as 'Application Edit' in edit mode on application phase|
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I wait for "3" seconds
    When I save the field labeled "EGMS ID" as "NEGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NEGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:NEGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I click on "Edit" in the page details
    And I pause execution for "7" seconds
    #395064
    Then I see page title "Application Edit"
    When I enter value "Automation Negotiation Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Applications" subheader on left panel
    And I click toggle button to select "Negotiations - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:applicationsflexTableId---" panel
    When I expand nested table containing column value "{SavedValue:Automation Runtime FDM Announcement}"
    And I perform quick search for "{SavedValue:NEGMSID}" in "---negotiation:-:RecipientCompletedNegotiationsTableId---" panel
    When I click on "View" icon for "{SavedValue:NEGMSID}" inside table
    And I pause execution for "7" seconds
    #395061
    Then I see page title "Application View"

  @395066 @Sprint3 @BTT @wip
  Scenario Outline: SPI- BTT -LWC- To verify, user should be able to see browser title for Grants records as 'Grant View' in view mode on Grants phase
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I pause execution for "7" seconds
    When I save the field labeled "EGMS ID" as "GEGMSID"
    Then I see page title "Grant Edit"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "{SavedValue:GEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    When I click on "View" icon for "{SavedValue:GEGMSID}" inside table
    And I pause execution for "7" seconds
    Then I see page title "Grant View"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    And I click toggle button to select "Grants - All"
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
    #395066
    Then I see page title "Grant View"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @395067 @Sprint3 @BTT @wip
  Scenario: SPI- BTT -LWC- To verify, user should be able to see browser title for Subawards records as ' Award View' in view mode on Grants phase
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    And I click on "View" action for first record of table
    And I pause execution for "7" seconds
    #395067
    Then I see page title "Subaward View"

  @395071 @395072 @Sprint3 @BTT @wip
  Scenario: SPI- BTT -LWC- To verify, user should be able to see browser title for Amendment Requests records as ' Amendment Requests View' in view mode on Grants phase
  |SPI- BTT -LWC- To verify, user should be able to see browser title for Amendment Requests records as ' Amendment Requests Edit ' in edit mode on Grants phase|
    Given I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "AEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AEGMSID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside table
    And I pause execution for "7" seconds
    #395071
    Then I see page title "Amendment Request View"
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:AEGMSID}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    When I click on "Edit" icon for "{SavedValue:AEGMSID}" inside table
    And I pause execution for "7" seconds
    #395072
    Then I see page title "Amendment Request Edit"

  @395190 @395191 @Sprint3 @BTT @wip
  Scenario Outline: PM- BTT-LWC -To verify, user should be able to see browser title for Internal / subrecipient organization record as 'Account view' in view mode on Home Phase.
  |Admin- BTT-LWC -To verify, user should be able to see browser title for Internal/ subrecipient  organization record as 'Account view' in view mode on Home Phase.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Home" tab
    When I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "{pagelayout:InternalOrganization}" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "{pagelayout:InternalOrganization}" inside table
    And I pause execution for "7" seconds
    Then I see page title "Organization View"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @396630 @396671 @Sprint3 @BTT @wip
  Scenario: SPI-BTT- LWC- To verify, user should be able to see browser title for forms on pre-application as 'Applications : Standard Pre-application Form view -grants Portal ' on view layout
  |SPI-BTT- LWC- To verify, user should be able to see browser title for forms on pre-application as 'Applications : Standard Pre-application Form edit -grants Portal ' on edit layout|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "3" seconds
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I pause execution for "7" seconds
    #396671
    Then I see page title "Application Detail (FORMS) Edit"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
     #396630
    Then I see page title "Application Detail (FORMS): {}"

  @395192 @Sprint3 @BTT @wip
  Scenario Outline:Admin- BTT-LWC -To verify, user should be able to see browser title for Internal / subrecipient organization record as 'Account Edit' in edit mode on Home Phase.
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Home" tab
    When I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "{pagelayout:InternalOrganization}" in "---home:-:internalOrganizationId---" panel
    When I click on "Edit" icon for "{pagelayout:InternalOrganization}" inside table
    And I pause execution for "8" seconds
    Then I see page title "Organization Edit"

    Examples:
      | User  |
      | ADMIN |

  @396714 @396716 @Sprint3 @BTT @wip
  Scenario: SPI-BTT- LWC- To verify, user should be able to see browser title for forms on Application as 'Applications : Program Specific application Form view - grants Portal ' o.n view layout
  |SPI-BTT- LWC- To verify, user should be able to see browser title for forms on Application as 'Applications : Program Specific application Form edit- grants Portal ' on edit layout|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    Then I see page title "Application Form Edit"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I see page title "Application Form View"
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    Then I see page title "Application Form Edit"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I see page title "Application Form View"

  @401412 @401413 @Sprint3 @BTT @wip
  Scenario:SPI-BTT- LWC- To verify, user should be able to see browser tab title for Tangible Personal Property Report SF- 428 forms  as "Monitoring Tangible Personal Property Report-SF- 428 View ~ Grants Portal" on view layout progress Report.
  |SPI-BTT- LWC- To verify, user should be able to see browser tab title for Tangible Personal Property Report SF- 428 forms  as "Monitoring Tangible Personal Property Report-SF- 428 Edit ~ Grants Portal " on edit layout progress Report.|
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I wait for "2" seconds
   # When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I enter value "UnChecked" into field "FederallyownedProperty__c"
    When I enter value "UnChecked" into field "AcquiredEquipment__c"
    When I enter value "UnChecked" into field "ResidualUnusedSupplies__c"
    Then I see page title "Monitoring Tangible Personal Property Report-SF- 428 Edit ~ Grants Portal"
    When I click on "Save" in the page details
    And I pause execution for "7" seconds
    Then I see page title "Monitoring Tangible Personal Property Report-SF- 428 View ~ Grants Portal"

       ######################## User Story - 507415 , Sprint-8-2025 ###########

  @509164 @509170 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Page Layout - To verify that, the email template lookup field should be displayed correctly on the UI
  |LWC - Admin/PM - Page Layout - To verify that, the standard report lookup field should be displayed correctly on the UI|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Internal Organization" inside page block
    #509170
    Then I softly see field "Authorized Signatory" inside page block

    Examples:
      | User |
     # | Admin |
      | PM   |

  @509175 @509180 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Page Layout - To verify that, users can select an email template from the lookup field in the page block details.
  |LWC - Admin/PM - Page Layout - To verify that, user can select a standard report from the lookup field in the page block details.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    And I select value "AdditionalUserDeclinedInvitation" into field "InternalOrganization__c"
    And I pause execution for "3" seconds
    And I select value "Active Announcements Report" into field "FederalProgramTitle__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see "Internal Organization" as "AdditionalUserDeclinedInvitation" in page details
    #509180
    Then I softly see "Program Title" as "Active Announcements Report" in page details

    Examples:
      | User |
     # | Admin |
      | PM   |

  @509200 @509203 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Page Layout - To verify that, user should be able to open the lookup dialog and search for an email template.
  |LWC - Admin/PM - Page Layout - To verify that, user should be able to open the lookup dialog and search for the standard report|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    And I enter into value "Additional" into lookup field "InternalOrganization__c"
    And I pause execution for "5" seconds
    Then I softly see lookup dialog box and search icon is displayed for field "Internal Organization"
    Then I softly see "AdditionalUserDeclinedInvitation" inside auto search result
    And I enter into value "Active" into lookup field "FederalProgramTitle__c"
    And I pause execution for "3" seconds
    Then I softly see lookup dialog box and search icon is displayed for field "Program Title"
    Then I softly see "Active Announcements Report" inside auto search result

    Examples:
      | User |
     # | Admin |
      | PM   |

  @509205 @509207 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Page Layout - To verify that, after selecting the email template from the lookup, then the email template’s name should appear in the lookup field.
  |LWC - Admin/PM - Page Layout - To verify that, after selecting the standard report from the lookup, the standard report’s name has appeared in the lookup field.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    And I select value "Amendment Request Approved" into field "InternalOrganization__c"
    And I select value "Active Announcements Report" into field "FederalProgramTitle__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see the field "Internal Organization" as "Amendment Request Approved" on page layout
    Then I softly see the field "Program Title" as "Active Announcements Report" on page layout

    Examples:
      | User |
     # | Admin |
      | PM   |

  @509216 @509218 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Page Layout - To verify that, if the email template field is required, an error message should appear when the user tries to save without selecting a template.
  |LWC - Admin/PM - Page Layout - To verify that, if the standard report field is required, an error message should appear when the user tries to save without selecting a report.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I softly see the following messages in the page details contains:
      | To save, Internal Organization is required in the Overview tab under the Information section. |
      | To save, Program Title is required in the Overview tab under the Information section.         |

    Examples:
      | User |
     # | Admin |
      | PM   |

  @509220 @509222 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Page Layout - To verify that, if the email template field is optional, the record should save successfully even without selecting an email template.
  |LWC - Admin/PM - Page Layout - To verify that, if the standard report field is optional, the record should save successfully even without selecting a report|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | --None--          | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | --None--          | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Required Behavior | --None--      | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | --None--      | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I cannot see the following messages in the page details contains:
      | To save, Internal Organization is required in the Overview tab under the Information section. |
      | To save, Program Title is required in the Overview tab under the Information section.         |

    Examples:
      | User |
     # | Admin |
      | PM   |

  @509224 @509227 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Page Layout - To verify that on click of selected email template lookup field, that email template should be opened
  |LWC - Admin/PM - Page Layout - To verify that on click of selected standard report lookup field, that standard report should be opened|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    And I select value "Amendment Request Approved" into field "InternalOrganization__c"
    And I select value "Active Announcements Report" into field "FederalProgramTitle__c"
    And I click on "Save" in the page details
    And I click on "Amendment Request Approved" for field "Internal Organization"
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly see the field "Email Template Name" as "Amendment Request Approved" on page layout
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I click on "Active Announcements Report" for field "Program Title"
    Then I softly see new tab is opened
    And I switch to tab number "2"
    Then I softly see the field "Report: Announcements" as "Active Announcements Report" on page layout

    Examples:
      | User |
     # | Admin |
      | PM   |

  @509235 @509237 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Page Layout - To verify that email template lookup field should be displayed correctly on view and edit page layout
  LWC - Admin/PM - Page Layout - To verify that standard report lookup field should be displayed correctly on view and edit page layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    Then I see field "InternalOrganization__c" is editable
    Then I see field "FederalProgramTitle__c" is editable
    And I select value "Amendment Request Approved" into field "InternalOrganization__c"
    And I select value "Active Announcements Report" into field "FederalProgramTitle__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see the field "Internal Organization" as "Amendment Request Approved" on page layout
    Then I softly see the field "Program Title" as "Active Announcements Report" on page layout

    Examples:
      | User |
     # | Admin |
      | PM   |

  @509243 @509246 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Page Layout - To verify that user can edit and update the selected email template on edit page layout
  |LWC - Admin/PM - Page Layout - To verify that user can edit and update the selected standard report on edit page layout|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    Then I see field "InternalOrganization__c" is editable
    Then I see field "FederalProgramTitle__c" is editable
    And I select value "Amendment Request Approved" into field "InternalOrganization__c"
    And I select value "Active Announcements Report" into field "FederalProgramTitle__c"
    And I click on "Save" in the page details
    Then I softly see the field "Internal Organization" as "Amendment Request Approved" on page layout
    Then I softly see the field "Program Title" as "Active Announcements Report" on page layout
    And I pause execution for "5" seconds
    And I click on "Edit" in the page details
    And I click on close button for field "Internal Organization"
    And I click on close button for field "Program Title"
    And I pause execution for "3" seconds
    And I select value "Amendment Request Grantor Owner Notify" into field "InternalOrganization__c"
    And I select value "Amendments, By Status" into field "FederalProgramTitle__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I softly see the field "Internal Organization" as "Amendment Request Grantor Owner Notify" on page layout
    Then I softly see the field "Program Title" as "Amendments, By Status" on page layout

    Examples:
      | User |
     # | Admin |
      | PM   |

  @509250 @509251 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Page Layout - To verify that search functionality of lookup should work properly for email template lookup on edit page layout
  |LWC - Admin/PM - Page Layout - To verify that search functionality of lookup should work properly for standard report lookup on edit page layout|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    Then I see field "InternalOrganization__c" is editable
    Then I see field "FederalProgramTitle__c" is editable
    And I enter into value "Test " into lookup field "InternalOrganization__c"
    And I pause execution for "3" seconds
    Then I softly see "No Records Found" displayed for field "Internal Organization"
    And I enter into value "Test " into lookup field "FederalProgramTitle__c"
    And I pause execution for "3" seconds
    Then I softly see "No Records Found" displayed for field "Program Title"

    Examples:
      | User |
     # | Admin |
      | PM   |

  @509255 @509256 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Page Layout - To verify that Alternate Rendering Config should work correctly for the email template field
  |LWC - Admin/PM - Page Layout - To verify that Alternate Rendering Config should work correctly for the standard report field|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue      | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                  | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Email Template Lookup  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                  | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Standard Report Lookup | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |               | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false         | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |               | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false         | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    And I pause execution for "5" seconds
    Then I softly do not see lookup dialog box and search icon is displayed for field "Internal Organization"
    And I pause execution for "3" seconds
    Then I softly do not see lookup dialog box and search icon is displayed for field "Program Title"
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue      | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                  | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Email Template Lookup  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                  | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Standard Report Lookup | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                   | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Email Template Lookup  | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                   | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Standard Report Lookup | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    And I refresh the page
    And I enter into value "Additional" into lookup field "InternalOrganization__c"
    And I pause execution for "5" seconds
    Then I softly see lookup dialog box and search icon is displayed for field "Internal Organization"
    Then I softly see "AdditionalUserDeclinedInvitation" inside auto search result
    And I enter into value "Active" into lookup field "FederalProgramTitle__c"
    And I pause execution for "3" seconds
    Then I softly see lookup dialog box and search icon is displayed for field "Program Title"
    Then I softly see "Active Announcements Report" inside auto search result

    Examples:
      | User |
     # | Admin |
      | PM   |

  @509266 @509267 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline:LWC - Admin/PM - Page Layout - To verify that Hide Logic should work correctly for the email template field
  |LWC - Admin/PM - Page Layout - To verify that Hide Logic should work correctly for the standard report field|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide For User        |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide For User        |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                 | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                 | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide For User        | Internal                             | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Hide For User        | Internal                             | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization Email Template | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
    #Hide For User
    And I refresh the page
    Then I softly cannot see field "Program Title" inside page block
    Then I softly cannot see field "Internal Organization Email Template" inside page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide For Profile     |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide For Profile     |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                 | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                 | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide For Profile     | PM                                   | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Hide For Profile     | PM                                   | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization Email Template | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      #Hide For Profile - PM
    And I refresh the page
    Then I softly cannot see field "Program Title" inside page block
    Then I softly cannot see field "Internal Organization Email Template" inside page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide For Context     |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide For Context     |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                 | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                 | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide For Context     | Edit                                 | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Hide For Context     | Edit                                 | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization Email Template | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
   #Hide For Context - Edit
    And I refresh the page
    Then I softly cannot see field "Program Title" inside page block
    Then I softly cannot see field "Internal Organization Email Template" inside page block
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide For Context     |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide For Context     |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                 | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                 | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide For Context     | View                                 | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Hide For Context     | View                                 | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization Email Template | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
    #Hide For Context - View
    And I refresh the page
    Then I softly cannot see field "Program Title" inside page block
    Then I softly cannot see field "Internal Organization Email Template" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @509270 @509271 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline:LWC - Admin/PM - Page Layout - To verify that Read-only Logic should work correctly for the email template field
  |LWC - Admin/PM - Page Layout - To verify that Read-only Logic should work correctly for the standard report field|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active          | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active          | true          | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Read Only For User | Internal      | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active          | true          | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only For User | Internal      | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    Then I softly see field "{pagelayout:StandardReportLookup_FederalProgramTitle__c}" is not editable
    Then I softly see field "{pagelayout:EmailTemplateLookup_InternalOrganization}" is not editable
    #Read Only For Profile - PM
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active             | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active             | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active             | true          | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile | PM            | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active             | true          | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile | PM            | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly see field "{pagelayout:StandardReportLookup_FederalProgramTitle__c}" is not editable
    Then I softly see field "{pagelayout:EmailTemplateLookup_InternalOrganization}" is not editable

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @509476 @509477 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Page Layout - To verify that Hide expression JSON should work correctly for the email template field
  |LWC - Admin/PM - Page Layout - To verify that Hide expression JSON should work correctly for the standard report field|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEBFieldStatusCreated | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEBFieldStatusCreated | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization Email Template   | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    Then I softly cannot see field "Program Title" inside page block
    Then I softly cannot see field "Internal Organization Email Template" inside page block
      #Hide Expression Json - Context in View
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                 | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEBContextInView    | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                 | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEBContextInView    | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization Email Template | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
    And I refresh the page
    And I click on "Save" in the page details
    And I pause execution for "7" seconds
    Then I softly cannot see field "Program Title" inside page block
    Then I softly cannot see field "Internal Organization Email Template" inside page block

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @509481 @509483 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Page Layout - To verify that Read only Expression Builder should work correctly for the email template field
  |LWC - Admin/PM - Page Layout - To verify that Read only Expression Builder should work correctly for the standard report field|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Field Label Override      |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                           | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                    | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:ROEBFieldStatusCreated | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                    | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:ROEBFieldStatusCreated | Grantor State Program | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override      | Internal Organization Email Template    | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "4" seconds
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    Then I softly see field "{pagelayout:StandardReportLookup_FederalProgramTitle__c}" is not editable
    Then I softly see field "{pagelayout:EmailTemplateLookup_InternalOrganization}" is not editable

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @509171 @509172 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario: LWC - SPI - Page Layout - To verify that, the standard report lookup field should be displayed correctly on the UI
  |LWC - SPI - Page Layout - To verify that, the email template lookup field should be displayed correctly on the UI|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "Program Income Justification" inside page block
    Then I softly see field "Authorized Representative Title" inside page block

  @509179 @509181 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario:LWC - SPI - Page Layout - To verify that, users can select an email template from the lookup field in the page block details.
  |LWC - SPI - Page Layout - To verify that, user can select a standard report from the lookup field in the page block details.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    And I pause execution for "6" seconds
    And I select value "AdditionalUserDeclinedInvitation" into field "ProgramIncomeJustification__c"
    And I pause execution for "3" seconds
    And I select value "Active Announcements Report" into field "AuthorizedRepresentativeTitle__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see "Program Income Justification" as "AdditionalUserDeclinedInvitation" in page details
    Then I softly see "Authorized Representative Title" as "Active Announcements Report" in page details

  @509201 @509204 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario: LWC - SPI - Page Layout - To verify that, user should be able to open the lookup dialog and search for an email template.
  |LWC - SPI - Page Layout - To verify that, user should be able to open the lookup dialog and search for the standard report|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    And I enter into value "Additional" into lookup field "ProgramIncomeJustification__c"
    And I pause execution for "5" seconds
    Then I softly see lookup dialog box and search icon is displayed for field "Program Income Justification"
    Then I softly see "AdditionalUserDeclinedInvitation" inside auto search result
    And I enter into value "Active" into lookup field "AuthorizedRepresentativeTitle__c"
    And I pause execution for "3" seconds
    Then I softly see lookup dialog box and search icon is displayed for field "Authorized Representative Title"
    Then I softly see "Active Announcements Report" inside auto search result

  @509208 @509206 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario:LWC - SPI - Page Layout - To verify that, after selecting the standard report from the lookup, the standard report’s name has appeared in the lookup field.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "4" seconds
    And I click on "Edit" in the page details
    And I select value "Amendment Request Approved" into field "ProgramIncomeJustification__c"
    And I select value "Active Announcements Report" into field "AuthorizedRepresentativeTitle__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see the field "Program Income Justification" as "Amendment Request Approved" on page layout
    Then I softly see the field "Authorized Representative Title" as "Active Announcements Report" on page layout

  @509217 @509219 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario: LWC - SPI - Page Layout - To verify that, if the email template field is required, an error message should appear when the user tries to save without selecting a template.
  |LWC - SPI - Page Layout - To verify that, if the standard report field is required, an error message should appear when the user tries to save without selecting a report.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I softly see the following messages in the page details contains:
      | To save, Program Income Justification is required in the Overview tab under the Application Information section.    |
      | To save, Authorized Representative Title is required in the Overview tab under the Application Information section. |

  @509221 @509223 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario: LWC - SPI - Page Layout - To verify that, if the email template field is optional, the record should save successfully even without selecting an email template.
  |LWC - SPI - Page Layout - To verify that, if the standard report field is optional, the record should save successfully even without selecting a report|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | --None--          | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | --None--          | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Required Behavior | --None--      | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | --None--      | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    Then I cannot see the following messages in the page details contains:
      | To save, Program Income Justification is required in the Overview tab under the Application Information section.    |
      | To save, Authorized Representative Title is required in the Overview tab under the Application Information section. |

  @509226 @509228 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario: LWC - SPI - Page Layout - To verify that on click of selected email template lookup field, that email template should be opened
  |LWC - SPI - Page Layout - To verify that on click of selected standard report lookup field, that standard report should be opened|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I select value "Amendment Request Approved" into field "ProgramIncomeJustification__c"
    And I select value "Active Announcements Report" into field "AuthorizedRepresentativeTitle__c"
    And I click on "Save" in the page details
    And I click on "Amendment Request Approved" for field "Program Income Justification"
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly see the field "Email Template Name" as "Amendment Request Approved" on page layout
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I click on "Active Announcements Report" for field "Authorized Representative Title"
    Then I softly see new tab is opened
    And I switch to tab number "2"
    Then I softly see the field "Report: Announcements" as "Active Announcements Report" on page layout

  @509236 @509238 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario: LWC - SPI - Page Layout -  To verify that email template lookup field should be displayed correctly on view and edit page layout
  |LWC - SPI - Page Layout - To verify that standard report lookup field should be displayed correctly on view and edit page layout|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "ProgramIncomeJustification__c" is editable
    Then I softly see field "AuthorizedRepresentativeTitle__c" is editable
    And I select value "Amendment Request Approved" into field "ProgramIncomeJustification__c"
    And I select value "Active Announcements Report" into field "AuthorizedRepresentativeTitle__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see the field "Program Income Justification" as "Amendment Request Approved" on page layout
    Then I softly see the field "Authorized Representative Title" as "Active Announcements Report" on page layout

  @509244 @509249 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario: LWC - SPI - Page Layout - To verify that user can edit and update the selected email template on edit page layout
  |LWC - SPI - Page Layout - To verify that user can edit and update the selected standard report on edit page layout|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I softly see field "ProgramIncomeJustification__c" is editable
    Then I softly see field "AuthorizedRepresentativeTitle__c" is editable
    And I select value "Amendment Request Approved" into field "ProgramIncomeJustification__c"
    And I select value "Active Announcements Report" into field "AuthorizedRepresentativeTitle__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see the field "Program Income Justification" as "Amendment Request Approved" on page layout
    Then I softly see the field "Authorized Representative Title" as "Active Announcements Report" on page layout
    And I pause execution for "5" seconds
    And I click on "Edit" in the page details
    And I click on close button for field "Program Income Justification"
    And I click on close button for field "Authorized Representative Title"
    And I pause execution for "3" seconds
    And I select value "Amendment Request Grantor Owner Notify" into field "ProgramIncomeJustification__c"
    And I select value "Amendments, By Status" into field "AuthorizedRepresentativeTitle__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I softly see the field "Program Income Justification" as "Amendment Request Grantor Owner Notify" on page layout
    Then I softly see the field "Authorized Representative Title" as "Amendments, By Status" on page layout

  @509252 @509253 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario: LWC - SPI - Page Layout - To verify that search functionality of lookup should work properly for email template lookup on edit page layout
  |LWC - SPI - Page Layout -  To verify that search functionality of lookup should work properly for standard report lookup on edit page layout|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I softly see field "ProgramIncomeJustification__c" is editable
    Then I softly see field "AuthorizedRepresentativeTitle__c" is editable
    And I enter into value "Test " into lookup field "ProgramIncomeJustification__c"
    And I pause execution for "3" seconds
    Then I softly see "No Records Found" displayed for field "Program Income Justification"
    And I enter into value "Test " into lookup field "AuthorizedRepresentativeTitle__c"
    And I pause execution for "3" seconds
    Then I softly see "No Records Found" displayed for field "Authorized Representative Title"

  @509257 @509260 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario: LWC - SPI - Page Layout - To verify that Alternate Rendering Config should work correctly for the standard report field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue      | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                  | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Email Template Lookup  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                  | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Standard Report Lookup | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |               | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false         | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |               | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false         | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I softly do not see lookup dialog box and search icon is displayed for field "Program Income Justification"
    And I pause execution for "3" seconds
    Then I softly do not see lookup dialog box and search icon is displayed for field "Authorized Representative Title"
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue      | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                  | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Email Template Lookup  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                  | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Standard Report Lookup | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                   | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Email Template Lookup  | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                   | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Standard Report Lookup | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    And I refresh the page
    And I enter into value "Additional" into lookup field "ProgramIncomeJustification__c"
    And I pause execution for "5" seconds
    Then I softly see lookup dialog box and search icon is displayed for field "Program Income Justification"
    Then I softly see "AdditionalUserDeclinedInvitation" inside auto search result
    And I enter into value "Active" into lookup field "AuthorizedRepresentativeTitle__c"
    And I pause execution for "3" seconds
    Then I softly see lookup dialog box and search icon is displayed for field "Authorized Representative Title"
    Then I softly see "Active Announcements Report" inside auto search result

  @509268 @509269 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario: LWC - SPI - Page Layout - To verify that Hide Logic should work correctly for the email template field
  |LWC - SPI - Page Layout - To verify that Hide Logic should work correctly for the standard report field|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active     | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active     | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:3 |
     # | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
     # | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization Email Template | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
    #Hide For User
    And I refresh the page
    Then I softly cannot see field "Program Income Justification" inside page block
    Then I softly cannot see field "Authorized Representative Title" inside page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide For Profile |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide For Profile |                   | ApiGeneratedId:3 |
     # | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Hide For Profile | SPI           | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Hide For Profile | SPI           | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
   #   | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization Email Template | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      #Hide For Profile - PM
    And I refresh the page
    Then I softly cannot see field "Program Income Justification" inside page block
    Then I softly cannot see field "Authorized Representative Title" inside page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide For Context |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide For Context |                   | ApiGeneratedId:3 |
    #  | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Hide For Context | Edit          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Hide For Context | Edit          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
   #   | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization Email Template | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
   #Hide For Context - Edit
    And I refresh the page
    Then I softly cannot see field "Program Income Justification" inside page block
    Then I softly cannot see field "Authorized Representative Title" inside page block
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide For Context |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide For Context |                   | ApiGeneratedId:3 |
   #   | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Hide For Context | View          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Hide For Context | View          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
   #   | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization Email Template | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
    #Hide For Context - View
    And I refresh the page
    Then I softly cannot see field "Program Income Justification" inside page block
    Then I softly cannot see field "Authorized Representative Title" inside page block

  @509272 @509273 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario: LWC - SPI - Page Layout - To verify that Read-only Logic should work correctly for the email template field
  |LWC - SPI - Page Layout - To verify that Read-only Logic should work correctly for the standard report field|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active          | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active          | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Read Only For User | Applicant     | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active          | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Read Only For User | Applicant     | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "{pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI}" is not editable
    Then I softly see field "{pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}" is not editable
    #Read Only For Profile - PM
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName             | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active             | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active             | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName             | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active             | true          | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile | SPI           | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active             | true          | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Read Only For Profile | SPI           | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly see field "{pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI}" is not editable
    Then I softly see field "{pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}" is not editable

  @509478 @509479 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario: LWC - SPI - Page Layout - To verify that Hide expression JSON should work correctly for the standard report field
  |LWC - SPI - Page Layout - To verify that Hide expression JSON should work correctly for the email template field|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3 |
     # | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEBFieldStatusCreated | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEBFieldStatusCreated | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
     # | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization Email Template   |  Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    Then I softly cannot see field "Program Income Justification" inside page block
    Then I softly cannot see field "Authorized Representative Title" inside page block
     #Hide Expression Json - Context in View
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3 |
    #  | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                              | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEBContextInView | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                              | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEBContextInView | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
  #    | Page Block Config:Page Block Rule Detail | Field Label Override | Internal Organization Email Template | Grantor State Program | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
    And I refresh the page
    And I click on "Save" in the page details
    And I pause execution for "7" seconds
    Then I softly cannot see field "Program Income Justification" inside page block
    Then I softly cannot see field "Authorized Representative Title" inside page block

  @509484 @509585 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario: LWC - SPI - Page Layout - To verify that Read only Expression Builder config should work correctly for the standard report field
  |LWC - SPI - Page Layout - To verify that Read only Expression Builder config should work correctly for the email template field|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:3 |
      #| Page Block Config:Page Block Rule Detail | Field Label Override      |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                    | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:ROEBFieldStatusCreated | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}     |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                    | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:ROEBFieldStatusCreated | Recipient ApplicationView | Name                      | {pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI} |
     # | Page Block Config:Page Block Rule Detail | Field Label Override      | Internal Organization Email Template    | Recipient ApplicationView | Name                      | {pagelayout:EmailTemplateLookup_InternalOrganization}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    Then I softly see field "{pagelayout:EmailTemplateLookup_ProgramIncomeJustification__c_SPI}" is not editable
    Then I softly see field "{pagelayout:StandardReportLookup_AuthorizedRepresentativeTitle__c_SPI}" is not editable

  @511677 @512611 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline:LWC - Admin/PM - Form Layout - To verify that Alternate Rendering Config should work correctly for the email template field
  |LWC - Admin/PM - Form Layout - To verify that Alternate Rendering Config should work correctly for the standard report field|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue      | filterId         |
      | Page Tabs Config                         | Is Active                    | false                  | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                  | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Email Template Lookup  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                  | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Standard Report Lookup | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                             |
      | Page Tabs Config:Page Layout Action      | Is Active                    | true          | Program Specific Application form | Name                      | {allforms:TestTab}                                     |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |               | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false         | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |               | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false         | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I pause execution for "5" seconds
    When I perform quick search for "{allforms:ApplicationRecordSubmittedStateInternal}" in "{applicationIntake:appAllTableId}" panel
    When I click on "View" icon for "{allforms:ApplicationRecordSubmittedStateInternal}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    When I navigate to "Test Tab" sub tab
    And I pause execution for "4" seconds
    Then I softly do not see lookup dialog box and search icon is displayed for field "Application Review"
    And I pause execution for "3" seconds
    Then I softly do not see lookup dialog box and search icon is displayed for field "Division Name"
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue      | filterId         |
      | Page Tabs Config                         | Is Active                    | false                  | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                  | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Email Template Lookup  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | false                  | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Standard Report Lookup | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue          | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                             |
      | Page Tabs Config:Page Layout Action      | Is Active                    | true                   | Program Specific Application form | Name                      | {allforms:TestTab}                                     |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                   | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Email Template Lookup  | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                   | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | Standard Report Lookup | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                  | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
    And I refresh the page
    And I click on close button for field "Application Review"
    And I enter into value "Additional" into lookup field "ApplicationReview__c"
    And I pause execution for "5" seconds
    Then I softly see lookup dialog box and search icon is displayed for field "Application Review"
    Then I softly see "AdditionalUserDeclinedInvitation" inside auto search result
    And I pause execution for "4" seconds
    And I click on close button for field "Division Name"
    And I pause execution for "2" seconds
    And I enter into value "Active" into lookup field "DivisionName__c"
    And I pause execution for "3" seconds
    Then I softly see lookup dialog box and search icon is displayed for field "Division Name"
    Then I softly see "Active Announcements Report" inside auto search result

    Examples:
      | User |
     # | Admin |
      | PM   |

  @512616 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Form Layout - To verify that email template lookup field should be displayed correctly on view and edit page layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                             |
      | Page Tabs Config:Page Layout Action      | Is Active | true          | Program Specific Application form | Name                      | {allforms:TestTab}                                     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I pause execution for "5" seconds
    When I perform quick search for "{allforms:ApplicationRecordSubmittedStateInternal}" in "{applicationIntake:appAllTableId}" panel
    When I click on "View" icon for "{allforms:ApplicationRecordSubmittedStateInternal}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    When I navigate to "Test Tab" sub tab
    And I pause execution for "4" seconds
    And I click on close button for field "Application Review"
    Then I softly see field "ApplicationReview__c" is editable
    And I click on close button for field "Division Name"
    Then I softly see field "DivisionName__c" is editable
    And I select value "Amendment Request Approved" into field "ApplicationReview__c"
    And I select value "Active Announcements Report" into field "DivisionName__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see the field "Application Review" as "Amendment Request Approved" on page layout
    Then I softly see the field "Division Name" as "Active Announcements Report" on page layout

    Examples:
      | User |
     # | Admin |
      | PM   |

  @512633 @512664 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Form Layout - To verify that Hide expression JSON should work correctly for the email template field
  |LWC - Admin/PM - Form Layout - To verify that Hide expression JSON should work correctly for the standard report field|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                             |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                  | Program Specific Application form | Name                      | {allforms:TestTab}                                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEBContextInViewForm | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEBContextInViewForm | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I pause execution for "5" seconds
    When I perform quick search for "{allforms:ApplicationRecordSubmittedStateInternal}" in "{applicationIntake:appAllTableId}" panel
    When I click on "View" icon for "{allforms:ApplicationRecordSubmittedStateInternal}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    When I navigate to "Test Tab" sub tab
    And I pause execution for "4" seconds
    Then I softly cannot see field "Application Review" inside page block
    Then I softly cannot see field "Division Name" inside page block

    Examples:
      | User |
     # | Admin |
      | PM   |

  @512696 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Form Layout - To verify that Hide Logic should work correctly for the email template field
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I pause execution for "5" seconds
    When I perform quick search for "{allforms:ApplicationRecordSubmittedStateInternal}" in "{applicationIntake:appAllTableId}" panel
    When I click on "View" icon for "{allforms:ApplicationRecordSubmittedStateInternal}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    When I navigate to "Test Tab" sub tab
    And I pause execution for "4" seconds
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active     | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active     | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active     | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                             |
      | Page Tabs Config:Page Layout Action      | Is Active     | true          | Program Specific Application form | Name                      | {allforms:TestTab}                                     |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
    #Hide For User
    And I refresh the page
    Then I softly cannot see field "Application Review" inside page block
    Then I softly cannot see field "Division Name" inside page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide For Profile |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide For Profile |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                             |
      | Page Tabs Config:Page Layout Action      | Is Active        | true          | Program Specific Application form | Name                      | {allforms:TestTab}                                     |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
      | Page Block Config:Page Block Rule Detail | Hide For Profile | PM            | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Hide For Profile | PM            | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
      #Hide For Profile - PM
    And I refresh the page
    Then I softly cannot see field "Application Review" inside page block
    Then I softly cannot see field "Division Name" inside page block
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide For Context |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide For Context |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                             |
      | Page Tabs Config:Page Layout Action      | Is Active        | true          | Program Specific Application form | Name                      | {allforms:TestTab}                                     |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
      | Page Block Config:Page Block Rule Detail | Hide For Context | Edit          | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Hide For Context | Edit          | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
   #Hide For Context - Edit
    And I refresh the page
    Then I softly cannot see field "Application Review" inside page block
    Then I softly cannot see field "Division Name" inside page block
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active        | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide For Context |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide For Context |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Tabs Config:Page Layout Action      | Is Active        | true          | Program Specific Application form | Name                      | {allforms:TestTab}                                       |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form}   |
      | Page Block Config:Page Block Rule Detail | Is Active        | true          | Program Specific Application form | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide For Context | View          | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form}   |
      | Page Block Config:Page Block Rule Detail | Hide For Context | View          | Program Specific Application form | Name                      | {pagelayout:StandardReportLookup_FederalProgramTitle__c} |
    #Hide For Context - View
    And I refresh the page
    Then I softly cannot see field "Application Review" inside page block
    Then I softly cannot see field "Division Name" inside page block

    Examples:
      | User |
     # | Admin |
      | PM   |

  @513265 @513290 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Form Layout - To verify that on click of selected email template lookup field, that email template should be opened
  |LWC - Admin/PM - Form Layout - To verify that on click of selected standard report lookup field, that standard report should be opened|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                             |
      | Page Tabs Config:Page Layout Action      | Is Active | true          | Program Specific Application form | Name                      | {allforms:TestTab}                                     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I pause execution for "5" seconds
    When I perform quick search for "{allforms:ApplicationRecordSubmittedStateInternal}" in "{applicationIntake:appAllTableId}" panel
    When I click on "View" icon for "{allforms:ApplicationRecordSubmittedStateInternal}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    When I navigate to "Test Tab" sub tab
    And I pause execution for "4" seconds
    And I click on close button for field "Application Review"
    Then I softly see field "ApplicationReview__c" is editable
    And I click on close button for field "Division Name"
    Then I softly see field "DivisionName__c" is editable
    And I select value "Amendment Request Approved" into field "ApplicationReview__c"
    And I select value "Active Announcements Report" into field "DivisionName__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I click on "Amendment Request Approved" for field "Application Review"
    Then I softly see new tab is opened
    And I switch to tab number "2"
    Then I softly see the field "Email Template Name" as "Amendment Request Approved" on page layout
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    And I click on "Active Announcements Report" for field "Division Name"
    Then I softly see new tab is opened
    And I switch to tab number "3"
    Then I softly see the field "Report: Announcements" as "Active Announcements Report" on page layout

    Examples:
      | User |
     # | Admin |
      | PM   |

  @513402 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline: LWC - Admin/PM - Form Layout - To verify that Read only Expression Builder should work correctly for the email template field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active                 | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                             |
      | Page Tabs Config:Page Layout Action      | Is Active                 | true                                  | Program Specific Application form | Name                      | {allforms:TestTab}                                     |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                  | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:ROEBUserTypeInternal | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                  | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:ROEBUserTypeInternal | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I pause execution for "5" seconds
    When I perform quick search for "{allforms:ApplicationRecordSubmittedStateInternal}" in "{applicationIntake:appAllTableId}" panel
    When I click on "View" icon for "{allforms:ApplicationRecordSubmittedStateInternal}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    When I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    Then I softly see field "{pagelayout:EmailTempLookup_ApplicationReview__c_Form}" is not editable
    Then I softly see field "{pagelayout:StandardTempLookup_DivisionName__c_Form}" is not editable

    Examples:
      | User |
     # | Admin |
      | PM   |

  @512620 @EmailTemplate @US-507415 @Sprint-8-2025
  Scenario Outline:LWC - Admin/PM - Form Layout - To verify that email template lookup field should be displayed on downloaded pdf
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                             |
      | Page Tabs Config:Page Layout Action      | Is Active | true          | Program Specific Application form | Name                      | {allforms:TestTab}                                     |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {pagelayout:EmailTempLookup_ApplicationReview__c_Form} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Program Specific Application form | Name                      | {pagelayout:StandardTempLookup_DivisionName__c_Form}   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I pause execution for "5" seconds
    When I perform quick search for "{allforms:ApplicationRecordSubmittedStateInternal}" in "{applicationIntake:appAllTableId}" panel
    When I click on "View" icon for "{allforms:ApplicationRecordSubmittedStateInternal}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    When I navigate to "Test Tab" sub tab
    When I click on "Download as PDF" in the page details
    And I pause execution for "5" seconds
    And I download the file
    And I pause execution for "5" seconds
    Then I softly see "Application Review" on page "2" of "govgrants" pdf file
    Then I softly see "Division Name" on page "2" of "govgrants" pdf file

    Examples:
      | User |
     # | Admin |
      | PM   |

    ###################### Innovation Locking And Tracking ##########

  @528273 @528320 @US-527277 @Sprint-12-2025 @InnovationLockingAndTracking
  Scenario: LWC : Innovation Record Locking and Tracking - To verify user2 can not be able to edit record when user1 is editing the same record
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                             | filterId         |
      | Page Layout Action    | Is Active            | true                                          | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:DefaultHideExpressionForEdit | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true          | Grantor State Program | Name                      | Edit                       |
      | Page Layout Action    | Hide Expression JSON |               | Grantor State Program | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I click on "Edit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I pause execution for "4" seconds
    Then I softly see "Record Activity Monitor" page block displayed
    Then I see "Record editing in progress " page message displayed in page layout
    #Then I softly see Editors name "Automation PM" with Updates message "Record editing in progress by Automation PM. Editing will be available once updates are complete."
    And I click on "Edit" in the page details
    And I see the following message in the page details :
      | Record is already locked by Automation PM |
