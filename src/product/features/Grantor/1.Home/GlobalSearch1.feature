@globalSearchRegression @globalSearch1 @grantor-regression @grantor-parallel-regression @regression @globalExecution1
Feature: Validate all scenarios for the global search

  @388972 @ValidatethatusercansortanyobjectsafterglobalsearchanyrecordbyEGMSIDCreatedDateRelevanceInternalProgramInternalOrganizationApplicationDueDateStatus @sprint-2-US-386939  @GlobalSearch
  Scenario: Validate that user can sort any objects after global search any record by EGMS ID, Created Date, Relevance, Internal Program, Internal Organization, Application Due Date, Status
    When I login to "Grantor" app as "PM" user
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "Programs"
    Then I softly see options "Relevance" inside "Relevance" dropdown
    Then I softly see options "EGMS ID" inside "Relevance" dropdown
    Then I softly see options "Type" inside "Relevance" dropdown
    Then I softly see options "Program Name" inside "Relevance" dropdown
    Then I softly see options "Created By" inside "Relevance" dropdown
    Then I softly see options "Status" inside "Relevance" dropdown

  @389538 @ValidateEXEuserisabletoseetheglobalsearchbarforanannouncement @sprint-2-US-386939  @GlobalSearch
  Scenario: VerifythattherecordownerisabletoedittheaccessforrecordwhenCloseoutRequestisintheCreatedAcknowledgedbySRSenttoreviewReviewedOverriddenorinUnpublishedstate
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "closeoutRequestNo"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeouts"
    Then I softly see field "Status" as "Created"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutRequestNo}" in "---closeout:-:subrecpientPendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutRequestNo}" inside flex table with id "---closeout:-:subrecpientPendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeouts"
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date |
      | Automation PM | Fiscal Reviewer | Automation Description | 5        |
    When I click on "Send for Review" icon for "{SavedValue:PM Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutRequestNo}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutRequestNo}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    And I wait for "3" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeouts"
    When I click on "Save" in the page details
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeouts"
    Then I softly see field "Status" as "Reviewed"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I wait for "3" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutRequestNo}"
    And I click on row level action button "Edit" against "{SavedValue:closeoutRequestNo}" in global search with id "Closeouts"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

  @389558 @VerifythatPeerreviewerhaveeditaccessforrecordonlywheneditaccesssettingisyesforpeerreviewerwhenCloseoutisasubmittedforreviewandReviewedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that Peer reviewer have edit access for record only when edit access setting is yes for peer reviewer when Closeout is a submitted for review and Reviewed state.
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name           | Closeout |
      | Automation EXE | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CloseoutID}"
    And I click on row level action button "Edit" against "{SavedValue:CloseoutID}" in global search with id "Closeouts"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I click on "Send for Review" icon for "{SavedValue:PM Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CloseoutID}"
    And I click on row level action button "Edit" against "{SavedValue:CloseoutID}" in global search with id "Closeouts"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

  @389644 @VerifythatuserisabletoexpandtheresultbyCloseoutandFilterRefinetheresultbyconfigureColumnsforanCloseout @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to expand the result by Closeout and Filter/Refine the the result by configured Columns for an Closeout.
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I wait for "3" seconds
    And I navigate to "Closeout" tab
    And I select "Closeouts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CloseoutID}"
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "Closeouts" for global search record
    And I perform quick search inside global search "CL--"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Closeout" inside refine by filter
    Then I softly see "Grant EGMS ID" inside refine by filter
    Then I softly see "Project Name" inside refine by filter
    Then I softly see "Project Period" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I select "Closeouts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:CloseoutID}"
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "Closeouts" for global search record
    Then I softly see value "{SavedValue:EXE Username}" for title "Created By" inside table "Closeouts" for global search record

  @389645 @VerifythatuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedEGMSIDGrantEGMSIDCreatedByonobjectsafterglobalsearchtheanyrecordf0orCloseout @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user redirect to that record when user click on any hyperlink provided (e.g. -EGMS ID, Grant EGMS ID, Created By) on objects after global search the any record for Closeout.
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I wait for "2" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:closeoutID}"
    Then I softly see field "Status" as "Created"
    And I wait for "2" seconds
    And I navigate to "Closeout" tab
    And I select "Closeout" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:closeoutID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:EXE Username}"
    Then I softly see the text containing "{SavedValue:EXE Username}"

  @390081 @VerifythattherecordownerisabletoedittheaccessforrecordwhenFundingSourceisintheCreatedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Funding Source is in the Created state
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FundingSourcesID"
    And I wait for "3" seconds
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    Then I softly can see row level action button "Change Owner" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    And I click on row level action button "Edit" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    And I wait for "2" seconds
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail

  @390082 @VerifythatNonOwneruserdoesnthaveaneditoptioninanystageofFundingsourcesandwillgeterrormessageonpage @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that Non-Owner user doesn't have an edit option in any stage of Funding sources and will get error message on page.
    Given I login to "Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Draft"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FundingSourcesID"
    Then I softly see field "Status" as "Created"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on row level action button "Edit" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - All"
    When I perform quick search for "{SavedValue:FundingSourcesID}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingSourcesID}" inside table
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on row level action button "Edit" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    Then I softly see field "Status" as "Active"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - All"
    When I perform quick search for "{SavedValue:FundingSourcesID}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingSourcesID}" inside table
    And I wait for "1" seconds
    And I click on "View" icon for "Active" inside flex table with id "---fundingsource:-:fundingAccountTableId---"
    When I click on "Deactivate" in the page details
    Then I softly see field "Status" as "Closed"
    And I click on hyperlink for invisible fields containing value "{SavedValue:FundingSourcesID}"
    Then I softly see field "Status" as "Closed"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on row level action button "Edit" against "{SavedValue:FundingSourcesID}" in global search with id "Funding Sources"
    Then I softly see field "Status" as "Closed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail

  @390084 @VerifythatuserisabletoexpandtheresultbyFundingSourceandFilterRefinethetheresultbyconfiguredColumnsforafundingSource @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to expand the result by FundingSource and Filter/Refine the the result by configured Columns for a funding Source
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FundingSourcesID"
    And I wait for "3" seconds
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:FundingSourcesID}" for title "EGMS ID" inside table "Funding Sources" for global search record
    And I perform quick search inside global search "FS--"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Funding Source Type" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:FundingSourcesID}" for title "EGMS ID" inside table "Funding Sources" for global search record
    Then I softly see value "{SavedValue:EXE Username}" for title "Created By" inside table "Funding Sources" for global search record

  @390085 @VerifythatuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedEGMSIDCreatedbyonobjectsafteglobalsearchtheanyrecordforFundingSources @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, Created by ) on objects after global search the any record for Funding Sources.
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "FundingSourcesID"
    And I wait for "3" seconds
    And I wait for "2" seconds
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:FundingSourcesID}"
    Then I softly see field "Status" as "Created"
    And I wait for "2" seconds
    When I navigate to "Planning" tab
    And I select "Funding Sources" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FundingSourcesID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:FundingSourcesID}"
    Then I softly see the text containing "{SavedValue:FundingSourcesID}"

  @390107 @SubrecipientOrganizationVerifythattheAdminisabletoedittheaccessfororganizationwhenOrganizationiintheactivestate @sprint-2-US-386939  @GlobalSearch
  Scenario: Subrecipient Organization -> Verify that the Admin is able to edit the access for organization when Organization is in the active state.
    When I login to "Grantor" app as "Admin" user
    And I navigate to "Home" tab
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "Automation Permanent Organization for Risk Assessment"
    And I click on row level action button "Edit" against "Automation Permanent Organization for Risk Assessment" in global search with id "Organizations"
    Then I softly see the text containing "Automation Permanent Organization for Risk Assessment"
    Then I softly see field "Status" as "Active"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

  @390112 @SubrecipientOrganizationVerifythaNonwneruserdoesnthaveaneditoptioninanyOrganizationandwillgeterrormessageonpage @sprint-2-US-386939  @GlobalSearch
  Scenario: Subrecipient Organization -> Verify that Non-owner user doesn't have an edit option in any Organization and will get error message on page.
    When I login to "Grantor" app as "PM" user
    And I navigate to "Home" tab
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "Automation Permanent Organization for Risk Assessment"
    And I click on row level action button "Edit" against "Automation Permanent Organization for Risk Assessment" in global search with id "Organizations"
    Then I softly see field "Status" as "Active"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390139 @390140-1 @VerifythattherecordownerisabletoedittheaccessforrecordwhenAmendmentisintheCreatedAcknowledgedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Amendment is in the Created, Acknowledged state
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I wait for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Sent To Subrecipient"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Acknowledged"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Acknowledged"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Activated"
    And I pause execution for "10" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name           | Closeout |
      | Automation EXE | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "4" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I select "Amendment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Closed/Completed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390140-2 @VerifythattherecordownerisabletoedittheaccessforrecordwhenAmendmentisintheCreatedAcknowledgedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Amendment is in the Created, Acknowledged state
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I wait for "2" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I get the "EGMS ID"
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Acknowledged"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on row level action button "Edit" against "{SavedValue:budgetPChangeId}" in global search with id "Amendment Requests"
    Then I softly see field "Status" as "Rejected"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390145 @VerifythatuserisabletoexpandtheresultbyAmendmentmoduleandFilterRefinetheresultbyconfiguredColumnsforanAmendment @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to expand the result by Amendment module and Filter/Refine the the result by configured Columns for an Amendment
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I select "Amendment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    Then I softly see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "Amendment Requests" for global search record
    And I perform quick search inside global search "CR--"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Record Type" inside refine by filter
    Then I softly see "Award ID" inside refine by filter
    Then I softly see "Award Title" inside refine by filter
    Then I softly see "Amendment Type" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:budgetPChangeId}" by label "EGMS ID" in left panel for global search
    Then I softly see value "{SavedValue:budgetPChangeId}" for title "EGMS ID" inside table "Amendment Requests" for global search record
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Programs" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search

  @390150 @VerifythatuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedegEGMSIDonobjectsafterglobalsearchtheanyrecordforamendment @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID ) on objects after global search the any record for amendment.
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I select "Amendment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:budgetPChangeId}"
    And I click on hyperlink for global search containing value "{SavedValue:budgetPChangeId}"
    Then I softly see the text containing "{SavedValue:budgetPChangeId}"

  @390156 @390157-1 @VerifythattherecordownerisabletoedittheaccessforrecordwhenProgressReportisintheSubmittoGrantorandsenttoSRstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Progress Report is in the Submit to Grantor and sent to S/R state
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Monitoring Reports"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    Then I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Given I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Monitoring Reports"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Monitoring Reports"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    Given I click on "Send Back to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent Back to Subrecipient"
    And I wait for "5" seconds
    And I navigate to "Monitoring" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Monitoring Reports"
    Then I softly see field "Status" as "Sent Back to Subrecipient"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Monitoring Reports"
    Then I softly see field "Status" as "Sent Back to Subrecipient"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Monitoring Reports"
    Then I softly see field "Status" as "Sent Back to Subrecipient"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 95     | 7             |
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                     | Progress Report |
      | {SavedValue:PM Username} | Step 1          |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Monitoring Reports"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Monitoring Reports"
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390157-2 @VerifythattherecordownerisabletoedittheaccessforrecordwhenProgressReportisintheSubmittoGrantorandsenttoSRstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Progress Report is in the Submit to Grantor and sent to S/R state
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "3" seconds
    Given I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    Given I click on "Send Back to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent Back to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Actual | Reported Date |
      | Automation Permanent KPI | 95     | 7             |
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                     | Progress Report |
      | {SavedValue:PM Username} | Step 1          |
    Given I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---progressReport:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    And I wait for "2" seconds
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---" without waiting for record
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---progressReport:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Performance" sub tab
    Then I see value "Force Closed" for title "Status" against the value "{SavedValue:progID}" inside table "---progressreport:-:grantorProgressReportsTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on row level action button "Edit" against "{SavedValue:progID}" in global search with id "Monitoring Reports"
    Then I softly see field "Status" as "Force Closed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390163 @VerifythatuserisabletoexpandtheresultbyProgressReportmoduleandFilterRefinetheresultbyconfiguredColumnsforanProgressReport @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user is able to expand the result by Progress Report module and Filter/Refine the the result by configured Columns for an Progress Report
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    Then I softly see value "{SavedValue:progID}" for title "EGMS ID" inside table "Monitoring Reports" for global search record
    And I perform quick search inside global search "PR--"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Grant Title" inside refine by filter
    Then I softly see "Recipient Organization" inside refine by filter
    Then I softly see "Reporting Period Start Date" inside refine by filter
    Then I softly see "Reporting Period End Date" inside refine by filter
    Then I softly see "Due Date" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:progID}" by label "EGMS ID" in left panel for global search
    Then I softly see value "{SavedValue:progID}" for title "EGMS ID" inside table "Monitoring Reports" for global search record
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Reports" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search

  @390169 @VerifythatuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedegEGMSIDonobjectsafterglobalsearchtheanyrecordforProgressReport @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID ) on objects after global search the any record for Progress Report
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
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Monitoring Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I click on hyperlink for global search containing value "{SavedValue:progID}"
    Then I softly see the text containing "{SavedValue:progID}"

  @390190 @390201 @VerifythattherecordownerisabletoedittheaccessforrecordwhenRiskAssessmentisintheCreatedsubmitforrevieworinReviewedstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Risk Assessment is in the Created, submit for review or in Reviewed state
    Given I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "5" seconds
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "riskID"
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Created"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "Record Id" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "RiskAssessmentApproverRoles" by clicking "New" :
      | Name                     | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "RiskAssessmentApproverRoles" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Submitted for Review"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---riskassessment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "RiskAssessmentApproverRoles"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "Record Id" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    Then I softly can see top right button "Complete Review" in page detail
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Reviewed"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Reviewed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Subaward Risk Assessments - All"
    And I perform quick search for "Record Id" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Active"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID1"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I see status in Progress-bar is "Expired" and is "dark blue"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390220 @VerifythatPMRevieweruserhaveeditaccessforrecordonlywheneditaccesssettingisyesforpeerreviewerwhenRiskAssessmentisasubmitforreviewstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that PM Reviewer user have edit access for record only when edit access setting is yes for peer reviewer when Risk Assessment is a submit for review state
    Given I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "5" seconds
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "riskID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "RiskAssessmentApproverRoles" by clicking "New" :
      | Name                     | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Automation Test Description | 7        | Yes                  |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "RiskAssessmentApproverRoles" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Submitted for Review"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

  @390222 @VerifythatPMRevieweruserhaveeditaccessforrecordonlywheneditaccesssettingisyesforpeerreviewerwhenRiskAssessmentisasubmitforreviewstate @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that PM Reviewer user have edit access for record only when edit access setting is yes for peer reviewer when Risk Assessment is a submit for review state
    Given I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "5" seconds
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "riskID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "RiskAssessmentApproverRoles" by clicking "New" :
      | Name                     | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Automation Test Description | 7        | NO                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "RiskAssessmentApproverRoles" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    And I click on row level action button "Edit" against "{SavedValue:riskID}" in global search with id "Risk Assessment"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390224 @VerifythatuserisabletoexpandtheresultbyRiskAssessmentmoduleandFilterRefinethetheresultbyconfiguredColumnsforanRiskAssessment @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user is able to expand the result by Risk Assessment module and Filter/Refine the the result by configured Columns for an Risk Assessment.
    Given I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "5" seconds
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "riskID"
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    Then I softly see value "{SavedValue:riskID}" for title "EGMS ID" inside table "Risk Assessment" for global search record
    And I perform quick search inside global search "RA-"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Effective Date" inside refine by filter
    Then I softly see "Expiration Date" inside refine by filter
    Then I softly see "Risk Level" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:riskID}" by label "EGMS ID" in left panel for global search
    Then I softly see value "{SavedValue:riskID}" for title "EGMS ID" inside table "Risk Assessment" for global search record
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Risk Assessment" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search

  @390225 @VerifythatuserisabletoexpandtheresultbyRiskAssessmentmoduleandFilterRefinethetheresultbyconfiguredColumnsforanRiskAssessment @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user is able to expand the result by Risk Assessment module and Filter/Refine the the result by configured Columns for an Risk Assessment.
    Given I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "5" seconds
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "riskID"
    And I wait for "3" seconds
    And I navigate to "Monitoring" tab
    And I select "Risk Assessment" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:riskID}"
    Then I softly see value "{SavedValue:riskID}" for title "EGMS ID" inside table "Risk Assessment" for global search record
    And I click on hyperlink for global search containing value "{SavedValue:riskID}"
    Then I softly see the text containing "{SavedValue:riskID}"

  @390304 @VerifythattherecordownerisnotabletoedittheaccessforrecordwhenPaymentRequestisintheSubmittograntorstate @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that the record owner is not able to edit the access for record when Payment Request is in the Submit to grantor state.
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "paymentEGMSID"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 20                       | 100        | 100            |
    When I close "Payment Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I pause execution for "4" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Payment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:paymentEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:paymentEGMSID}" in global search with id "Payment Requests"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390311 @VerifythattherecordownerisnotabletoedVerifythatuserisabletoexpandtheresultbyPaymentRequestmoduleandFilterRefinetheresultbyconfiguredColumnsforanPaymentRequest @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user is able to expand the result by Payment Request module and Filter/Refine the the result by configured Columns for an Payment Request.
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "paymentEGMSID"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Payment Request" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:paymentEGMSID}"
    Then I softly see value "{SavedValue:paymentEGMSID}" for title "EGMS ID" inside table "Payment Requests" for global search record
    And I perform quick search inside global search "PR-"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Subaward Id" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "Payment Period" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:paymentEGMSID}" by label "EGMS ID" in left panel for global search
    Then I softly see value "{SavedValue:paymentEGMSID}" for title "EGMS ID" inside table "Payment Requests" for global search record
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Payment Requests" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search

  @390317 @VerifythatuserredirecttothatrecordwhenuserclickonanyhyperlinkprovidedegEGMSIDSubawardIDonobjectsafterglobalsearchtheanyrecordforPaymentRequest @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, Subaward ID ) on objects after global search the any record for Payment Request.
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---progressReport:-:recipientAwardsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---progressReport:-:recipientAwardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardId"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "paymentEGMSID"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I select "Payment Requests" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:paymentEGMSID}"
    Then I softly see value "{SavedValue:paymentEGMSID}" for title "EGMS ID" inside table "Payment Requests" for global search record
    And I click on hyperlink for global search containing value "{SavedValue:paymentEGMSID}"
    Then I softly see the text containing "{SavedValue:paymentEGMSID}"

  @390367 @390372 @SubrecipientOrganizationVerifythattheAdminisabletoedittheaccessforrecordwhenExternalOrganizationisintheApprovedstate @sprint-2-US-386939  @GlobalSearch
  Scenario:Subrecipient Organization ->Verify that the Admin is able to edit the access for record when External Organization is in the Approved state
    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "{AUTOEnvData:AutomationExternalOrgApproved}"
    Then I softly see value "{AUTOEnvData:AutomationExternalOrgApproved}" for title "Account Name" inside table "Organizations" for global search record
    And I click on row level action button "Edit" against "{AUTOEnvData:AutomationExternalOrgApproved}" in global search with id "Organizations"
    Then I softly see field "Status" as "Active"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "{AUTOEnvData:AutomationExternalOrgApproved}"
    Then I softly see value "{AUTOEnvData:AutomationExternalOrgApproved}" for title "Account Name" inside table "Organizations" for global search record
    And I click on row level action button "Edit" against "{AUTOEnvData:AutomationExternalOrgApproved}" in global search with id "Organizations"
    Then I softly see field "Status" as "Active"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390379 @SubrecipientOrganizationVerifythatNonOwneruserdoesnthaveaneditoptioninanystageofExternalSROrganizationandwillgeterrormessageonpage @sprint-2-US-386939  @GlobalSearch
  Scenario:Subrecipient Organization -> Verify that Non-Owner user doesn't have an edit option in any stage of External S/R Organization and will get error message on page
    When I login to "Grantor" app as "PM" user
    And I navigate to "Home" tab
    And I select "External Registration" from dropdown for Global search
    And I perform quick search inside global search "{AUTOEnvData:AutomationExternalOrgSubmitforApproved}"
    Then I softly see value "{AUTOEnvData:AutomationExternalOrgSubmitforApproved}" for title "External Organization" inside table "External Registration" for global search record
    Then I softly cannot see row level action button "Edit" against "{AUTOEnvData:AutomationExternalOrgSubmitforApproved}" in global search with id "External Registration"
    And I wait for "5" seconds
    And I navigate to "Home" tab
    And I select "External Registration" from dropdown for Global search
    And I perform quick search inside global search "{AUTOEnvData:AutomationExternalOrgApproved}"
    Then I softly see value "{AUTOEnvData:AutomationExternalOrgApproved}" for title "External Organization" inside table "External Registration" for global search record
    Then I softly cannot see row level action button "Edit" against "{AUTOEnvData:AutomationExternalOrgApproved}" in global search with id "External Registration"
    And I navigate to "Home" tab
    And I select "External Registration" from dropdown for Global search
    And I perform quick search inside global search "{AUTOEnvData:AutomationExternalOrgRejected}"
    Then I softly see value "{AUTOEnvData:AutomationExternalOrgRejected}" for title "External Organization" inside table "External Registration" for global search record
    Then I softly cannot see row level action button "Edit" against "{AUTOEnvData:AutomationExternalOrgRejected}" in global search with id "External Registration"

  @389520 @389525 @389537 @389536 @VerifythatthereviewownerisabletoeditSubmitDeclinetheaccessforrecordwhenReviewsareinsentforreviewstate @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that the review owner is able to edit/Submit/Decline the access for record when Reviews are in sent for review state.
    When I login to "Grantor" app as "FO" user
    And I navigate to "Applications" tab
    And I select "Reviews" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}"
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" for title "Review Form EGMS ID" inside table "Reviews" for global search record
    And I click on row level action button "Edit" against "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" in global search with id "Reviews"
    And I wait for "2" seconds
    Then I softly see that "Status" is in "Sent for Review" status
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit" in page detail
    Then I can see top right button "Decline" in page detail
    And I wait for "5" seconds
    #@389536
    And I navigate to "Applications" tab
    And I select "Reviews" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}"
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" for title "Review Form EGMS ID" inside table "Reviews" for global search record
    And I perform quick search inside global search "R-"
    Then I softly see "Review Form EGMS ID" inside refine by filter
    Then I softly see "Announcement EGMS Id" inside refine by filter
    Then I softly see "Form Name" inside refine by filter
    Then I softly see "Application EGMS ID" inside refine by filter
    Then I softly see "Assigned To" inside refine by filter
    Then I softly see "Min" inside refine by filter
    Then I softly see "Max" inside refine by filter
    Then I softly see "Due Date" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I filter field record by "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" by label "Review Form EGMS ID" in left panel for global search
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" for title "Review Form EGMS ID" inside table "Reviews" for global search record
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Reviews" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I select "Reviews" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}"
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" for title "Review Form EGMS ID" inside table "Reviews" for global search record
    And I click on row level action button "Edit" against "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" in global search with id "Reviews"
    And I wait for "2" seconds
    #@389525
    Then I softly see that "Status" is in "Sent for Review" status
    Then I cannot see top right button "Edit" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    And I select "Reviews" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AutomationPermanentApplicationReviewCompleted}"
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewCompleted}" for title "Review Form EGMS ID" inside table "Reviews" for global search record
    And I click on row level action button "Edit" against "{SavedValue:AutomationPermanentApplicationReviewCompleted}" in global search with id "Reviews"
    And I wait for "2" seconds
    Then I softly see that "Status" is in "Review Completed" status
    Then I cannot see top right button "Edit" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    And I select "Reviews" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AutomationPermanentApplicationReviewDecline}"
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewDecline}" for title "Review Form EGMS ID" inside table "Reviews" for global search record
    And I click on row level action button "Edit" against "{SavedValue:AutomationPermanentApplicationReviewDecline}" in global search with id "Reviews"
    And I wait for "2" seconds
    Then I softly see that "Status" is in "Review Declined" status
    Then I cannot see top right button "Edit" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I select "Reviews" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}"
    Then I softly see value "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}" for title "Review Form EGMS ID" inside table "Reviews" for global search record
    And I click on hyperlink for global search containing value "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}"
    #@389537
    Then I softly see the text containing "{SavedValue:AutomationPermanentApplicationReviewForGlobalSearch}"