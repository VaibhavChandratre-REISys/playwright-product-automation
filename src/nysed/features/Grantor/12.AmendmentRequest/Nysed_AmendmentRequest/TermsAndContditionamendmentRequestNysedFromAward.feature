@amendmentRequestsNysed @TermsandConditionsamendmentRequestsNysed
Feature: Validate all scenarios in the Terms and Conditions Change Amendment Request

  @NYSED-9280 @NYSED-9260 @NYSED-9261 @NYSED-9268 @NYSED-9274 @NYSED-Sprint-33 @US-NYSED-8676 @M06 @Bug-Ticket-NYSED-9602
  Scenario Outline:Verify that, apart from the Submit and Certify Role user cannot see a page-level action 'Acknowledge' on the Terms and Conditions Change Amendment Request layout.
  |Verify that the Grantee User cannot see the Creating For and Child Organization fields on the Terms and Conditions Change Amendment Request layout, when the subaward is created via Direct Grant.|
  |Verify that the Grantee User can see on the Amendment Requests section → Terms and Conditions Change Amendment Request layout, Overview tab -> 'Change in Subaward Terms and Conditions' section is added with 'Subaward Terms and Conditions' field|
  |Verify that the 'View Only' or 'LEA Admin' role users cannot see that on the Terms and Conditions Change Amendment Request layout → Files tab → Amendment Files section, section button ‘Add Files’ and Note section, section button 'New'.|
  |Verify that the Submit and Certify Role User can see a page-level action 'Acknowledge' on the Terms and Conditions Change Amendment Request layout.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA_RISK_ASSESSMENT_NO"
    Given I created standalone grant from approved announcement with announcement "<GrantName>" and properties "default"
    Given I activated standalone subaward from approved announcement with announcement "<GrantName>" and properties "default"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                         | Field                       |
      | Subaward Terms and Conditions | NYSED_SubTermsConditions__c |
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PO | Step 1            |
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    #NYSED-9260
    Then I softly cannot see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Justification for Terms and Conditions Change" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Not For Profit" inside page block
    #NYSED-9261
    Then I see only the following ordered page blocks :
      | Overview                                |
      | Change in Subaward Terms and Conditions |
      | System Information                      |
    Then I softly see field "Subaward Terms and Conditions" inside page block
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Subaward Terms and Conditions" rendered in view mode only
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I pause execution for "5" seconds
    When I close "Add File" modal by clicking the top right x button
    Then I softly can see row level action button "View" against "Other" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly can see row level action button "Edit" against "Other" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly can see row level action button "Delete" against "Other" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    When I enter the following values into flex table with id "---amendment:-:SubrecipientAmendmentContentNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---amendment:-:SubrecipientAmendmentContentNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---amendment:-:SubrecipientAmendmentContentNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---amendment:-:SubrecipientAmendmentContentNotesTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9280
    Then I softly cannot see top right button "Acknowledge" in page detail
    When I navigate to "Overview" sub tab
    #NYSED-9260
    Then I softly cannot see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Justification for Terms and Conditions Change" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Not For Profit" inside page block
    #NYSED-9261
    Then I see only the following ordered page blocks :
      | Overview                                |
      | Change in Subaward Terms and Conditions |
      | System Information                      |
    Then I softly see field "Subaward Terms and Conditions" inside page block
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Subaward Terms and Conditions" rendered in view mode only
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9280
    Then I softly cannot see top right button "Acknowledge" in page detail
    When I navigate to "Overview" sub tab
    #NYSED-9260
    Then I softly cannot see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Justification for Terms and Conditions Change" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Not For Profit" inside page block
    When I navigate to "Files" sub tab
    #NYSED-9268
    Then I softly cannot see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly cannot see row level action button "Edit" against "Other" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Other" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentContentNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---amendment:-:SubrecipientAmendmentContentNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---amendment:-:SubrecipientAmendmentContentNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---amendment:-:SubrecipientAmendmentContentNotesTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9280
    Then I softly cannot see top right button "Acknowledge" in page detail
    When I navigate to "Overview" sub tab
    #NYSED-9260
    Then I softly cannot see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Justification for Terms and Conditions Change" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Not For Profit" inside page block
    When I navigate to "Files" sub tab
    #NYSED-9268
    Then I softly cannot see top right button "Add Files" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly can see row level action button "View" against "Other" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly cannot see row level action button "Edit" against "Other" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly cannot see row level action button "Delete" against "Other" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly can see row level action button "Download" against "Other" in flex table with id "---amendment:-:RecipientAttachmentTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---amendment:-:SubrecipientAmendmentContentNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---amendment:-:SubrecipientAmendmentContentNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---amendment:-:SubrecipientAmendmentContentNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---amendment:-:SubrecipientAmendmentContentNotesTableId---"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9274
    Then I softly can see top right button "Acknowledge" in page detail
    When I click on "Submit to Grantor" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"

    Examples:
      | GrantName                                                 | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Direct Grant} | GRANTEE_SC   |

  @NYSED-9258 @NYSED-Sprint-33 @US-NYSED-8676 @M06
  Scenario Outline: Verify that the Grantee User can see on the Amendment Requests section → Terms and Conditions Change Amendment Request layout, Overview tab -> Overview section, below changes and fields sequence have been made.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards - All"
    And I perform quick search for "{SavedValue:awardName}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                         | Field                       |
      | Subaward Terms and Conditions | NYSED_SubTermsConditions__c |
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PO | Step 1            |
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    #NYSED-9258
    Then I softly see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Justification for Terms and Conditions Change" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Not For Profit" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly do not see field "Child Organization" added after "Creating For"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9258
    Then I softly see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Justification for Terms and Conditions Change" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Not For Profit" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly do not see field "Child Organization" added after "Creating For"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9258
    Then I softly see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Justification for Terms and Conditions Change" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Not For Profit" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly do not see field "Child Organization" added after "Creating For"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    And I click on "View" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-9258
    Then I softly see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly see field "Overall Impact" inside page block
    Then I softly see field "Justification for Terms and Conditions Change" inside page block
    Then I softly see field "Project ID" inside page block
    Then I softly see field "Not For Profit" inside page block
    Then I softly see field "Creating For" inside page block
    Then I softly do not see field "Child Organization" added after "Creating For"

    Examples:
      | GrantName                                        | InternalUser | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | PO           | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | PM           | GRANTEE_CE   |

  @NYSED-9257 @NYSED-Sprint-33 @US-NYSED-8676 @M06
    @NYSED-11032 @NYSED-Sprint-29 @US-NYSED-10421 @M06
  Scenario Outline: Verify that the Grantee User can see on the Amendment Requests section → Terms and Conditions Change Amendment Request layout, Overview tab -> Overview section, below changes and fields sequence have been made.
  |Verify that the Internal User can see that the fields below are removed from the Terms and Conditions Change amendment.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "<GrantName>" on announcement "<GrantName>" with properties "CHILDORGANIZATION_CREATEAPPLICATIONMODAL"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "<GrantName>"
    And I created approved FDM on application "<GrantName>"
    Given I created award from approved FDM with announcement "<GrantName>"
    And I activate award from FDM having application name "<GrantName>"
    When I login to "As a Grantor" app as "<InternalUser>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:grantName}" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "{SavedValue:grantName}" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    And I wait for "2" seconds
    And I save the field labeled "Project ID" as "ProjectID"
    And I save the field labeled "Creating For" as "CreatingFor"
    And I save the field labeled "Child Organization" as "ChildOrganization"
    And I save the field labeled "Not For Profit" as "NotForProfit"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:awardName}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                         | Field                       |
      | Subaward Terms and Conditions | NYSED_SubTermsConditions__c |
    And I wait for "3" seconds
    And I click on "Save" in the page details
    #NYSED-11032
    Then I softly cannot see field "Justification for Terms and Conditions Change" inside page block
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 1            |
    When I click on "Send to Subrecipient" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #NYSED-9257
    Then I softly see field "Subaward ID" inside page block
    Then I softly see field "Amendment Type(s)" inside page block
    Then I softly see field "Overall Justification" inside page block
    Then I softly do not see field "PurposeRTA__c" is required to submit mark as "This field is required to submit"
    Then I softly see field "Overall Impact" inside page block
    Then I softly do not see field "Impact__c" is required to submit mark as "This field is required to submit"
    Then I softly see field "Justification for Terms and Conditions Change" inside page block
    Then I softly see field "Project ID" as "{SavedValue:ProjectID}"
    Then I softly see field "Creating For" as "{SavedValue:CreatingFor}"
    Then I softly see field "Child Organization" as "{SavedValue:ChildOrganization}"
    Then I softly see field "Not For Profit" as "{SavedValue:NotForProfit}"

    Examples:
      | GrantName                                        | InternalUser | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | PM           | GRANTEE_SC   |
#      | {SavedValue:Automation Runtime FDM Announcement} | PO           | GRANTEE_CE   |