@applicationIntakeWB @grantor-regression @grantor-parallel-regression @regression @ApplicationExecution-reg @app-preapp
Feature: Application Intake scenarios without background


  @70464
  Scenario: Validate whether user should not able to qualify the announcement again for once it is Qualified
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:qualifiedTableId---" panel
    Then I do not see value "{SavedValue:Automation Runtime Announcement Application Intake}" for title "Opportunity Name" inside table "---applicationIntake:-:qualifiedTableId---"
#    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:qualifiedTableId---" without waiting for record
#    When I click on "Qualify" in the page details
#    #requested manual qa to provide correct test steps
#    Then I see the following messages in the page details :
#      | This Opportunity has already been qualified for your Organization. |


  @72512 @72513 @75965 @75966 @matchPercentageIFsetAsYES  @skipOnJenkins
  Scenario: Validate the Match Percentage validation during submit for approval when the Match required setting as Yes | Validate if user submits the application without one key personal contact details then the system should throw an error message|
  Validate History Field is getting updated for PM user when Application status is Submitted to Grantor | Validate whether the Internal user is able to view the Snapshot after Application is Submitted to Grantor status
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "6" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    And I save the field containing "Match Required?" as "Yes"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                                                                  |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                                                      |
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                                                                       |
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                                                        |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI1 Username} | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I click on "Submit Application" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "dark blue"
    Given I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    When I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Submitted to Grantor" for title "New Value" inside field history table
    And I click on back arrow
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    And I wait for "5" seconds
    And I click on hyperlink containing value "Submission"
    When I download the file
    Then I softly see "Submitted to Grantor" on page "1" of "govgrants" pdf file

  @73283 @otherOrganizationUserCannotViewApplication
  Scenario: Validate the Aplications are not visible for other organizations Users
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SA" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:recipientApplications---"

  @34315 @appDueDatepassed  @needStaticRecordsForThis
  Scenario Outline: Validate SPI & SPA user is not able to Create an Application if Application Due Date is passed
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "---AUTOEnvData:-:Automation_Formula_Closed_Announcement_By_Applicant---" in "---applicationIntake:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "---AUTOEnvData:-:Automation_Formula_Closed_Announcement_By_Applicant---" inside flex table with id "---applicationIntake:-:NotYetQualifiedTableId---" without waiting for record
    And I save the field containing "Application Due Date" as "Date"
    Then I softly see field "Application Due Date" contains date less than todays date
    Then I softly cannot see top right button "Create Application" in page detail
    Examples:
      | User | Key User        |
      | SPI1 | Automation SPI1 |
      | SPA  | Automation SPA  |

  @73516 @73517 @supportingDocValidationOnApplication
  Scenario: Validate whether User will be able to attach any document if the supporting document details mentioned in the Announcement
  Validate if suppoting document is not uploaded by user while submitting the application then the system should throw an error message on screen
  Validate user will be able to view and add additional focus areas while creating an application only when the published announcemnt has additional focus areas
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Application" and properties "PROGRAM_FOR_APP_SUPP_DOC_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Opportunities" tab
    And I wait for "3" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Then I softly see that "Automation Permanent Focus Area" has been added in flextable with Id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI1 Username} | Checked        |
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Forms and Files Tab - Complete each mandatory item listed in the checklist before submitting this Application. |
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Automation" inside flex table with id "ApplicationChecklistsFlexGrid" with wait for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click in table hyperlink containing value "View"
    Then I softly verify that the file "Attachment.pdf" is downloaded

  @75501 @75502 @otherOrgUserCanAlsoQualifyAndCreateApplication
  Scenario: Validate Opportunities created from 'Competitive Announcements' are available for all External users under Oppurtunities
  Validate Opportunities created from 'Competitive Announcements' are available for all external users and can qualify and create the Applications
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPA" user
    And I navigate to "Opportunities" tab
    And I wait for "3" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I softly see "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    Then I softly see that "{SavedValue:Automation Runtime Announcement Application Review}" is in "Qualified" status
    And I wait for "3" seconds
    Then I softly can see top right button "Create Application" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "3" seconds
    Then I softly can see top right button "Create Application" in page detail

  @34017 @34291 @focusAreaSettingAsNO
  Scenario: Validate when the funding opportunity  has focus area setting as No then the  User will not be able to view the focus area section when creating the Application
  Validate whether the user is able to Edit the budget category while creating an Application
        Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI1" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    Then I softly do not see "Focus Area" page block displayed
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 0          | 0              | 0              |
#    Given I expand nested table containing column value "BP01"
    And I wait for "4" seconds
    Then I softly see value "$1,000.00" for title "Budget" against the value "Construction" inside table "---applicationIntake:-:budgetPeriodTableId---"

  @34322 @zeroBudgetRequestedAmount
  Scenario: Verify SPI user is not able to Submit Application to Grantor with zero budget/requested amount
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 0      | 0          | 0              | 0              |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI1 Username} | Checked        |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                                                      |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                                                        |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                                                                  |

  @76376 @76378 @contactAssociationforApplication
  Scenario Outline: Validate whether SPI user is allowed to add contacts while creating an Application | Validate whether created Application by SPI user(Record owner of Application)are visible for their child (SPA) organizations
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Opportunities" tab
    And I wait for "3" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:NotYetQualifiedTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click "Add" after selection of "Automation SPA" by showing entries "All" in flex table with id "AssociateAppContacts"
    And I refresh the page
    And I wait for "4" seconds
    Then I see that "<Contact>" has been added in flextable with Id "---applicationIntake:-:applicationContactsTableId---"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPA" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    Examples:
      | Contact        |
      | Automation SPA |

  @77044 @34324 @requestedAmountMustBeLessThanCelingAmount
  Scenario: Verify SPI & SPA user is not able to Submit Application to Grantor with Requested Amount less than Subaward Floor Amount |
  Validate when the supporting documents  checklist are not entered by Announcement owner then Applicant will not be able to upload any document while submitting the application
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 100    | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI1 Username} | Checked        |
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |

  @77046 @77045 @77047 @77048 @budgetGridColumnValidation
  Scenario: Validate the SPI cannot view the Goals and Objectives page block when it is set as No while Announcement creation| Validate the SPI cannot view the Work Plan required page block when it is set as No while Announcement creation
  Validate whether SPI user can submit the application without adding supporting documents when the required documents are optional |
  Validate when the Funding Opportunity Detailed budget Grid Setup as Yes then User will be able to view the Bulid up Line in the Budget Grid
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI1" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside table
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Proposal" sub tab
    And I wait for "3" seconds
    Then I softly do not see "Work Plan" page block displayed
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI1 Username} | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit Application" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "dark blue"

  @77585 @expiredApplicationErrorMessage
  Scenario: Validate user should not be able to Qualify on the Closed opportunity and an error message is displayed as "Funding Opportunity Cannot be Qualified after Deadline"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Expired"
    And I perform quick search for "{SavedValue:AutomationExpiredApplication}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:AutomationExpiredApplication}" inside flex table with id "---applicationIntake:-:recipientApplications---" without waiting for record
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | This application cannot be submitted. The application due date has passed. |

  @bug-401696 @235107 @234957  @sprint-13-US-224176  @Allocation
  Scenario Outline: Directed Ann_ Verify as SPI user can not see Recommended budget field is visible under budget summary when App status is Created, Submit to Grantor & Review initiated before FDM state
  | Competitive Ann_ Verify as SPI user can not see Recommended budget field is visible under budget summary when App status is Created, Submit to Grantor & Review initiated before FDM state |
    Given I published "<Announcement Type>" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Opportunities" tab
    And I wait for "3" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    Then I see the header is "Application" in the page details
    When I navigate to "Budget" sub tab
    #235107 #234957
    Then I softly cannot see field "Recommended Budget" inside page block
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI1 Username} | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I wait for "2" seconds
    And I click on "Splitview" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    And I click on "Edit" in the split screen page details
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "2" seconds
    And I click on "Splitview" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "2" seconds
    And I click on "Edit" in the split screen page details
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Budget" sub tab
    #235107 #234957
    Then I softly cannot see field "Recommended Budget" inside page block
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---" without waiting for record
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Budget" sub tab
    #235107 #234957
    Then I softly cannot see field "Recommended Budget" inside page block
    Examples:
      | Announcement Name                            | Announcement Type |
      | {SavedValue:Automation Runtime Announcement} | Directed          |
#      | {SavedValue:Automation Runtime Announcement} | Competitive       |

  @219489 @219636  @sprint-13-US-224176  @Allocation @wip
  Scenario Outline: Directed Ann_ Verify as SPA user I can see Recommended budget field is visible under budget summary when App status is negotiation Sent to S\R
  | Competitive Ann_ Verify as SPA user I can see Recommended budget field is visible under budget summary when App status is negotiation Sent to S\R |
    Given I published "<Announcement Name>" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default-Automation SPA user"
    And I created approved FDM on application "<Announcement Name>"
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "NegotiationDueDate__c"
    And I enter value "Overview: Project Information" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    And I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPA" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---" without waiting for record
    #219489 #219636
    When I navigate to "Negotiations" sub tab
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I navigate to "Budget" sub tab
    Then I softly see field "Recommended Budget" inside page block

    Examples:
      | Announcement Name                            | Announcement Type |
      | {SavedValue:Automation Runtime Announcement} | Directed          |
      | {SavedValue:Automation Runtime Announcement} | Competitive       |


  @219584 @219679 @DirectedAnnVerifyRecommendedbudgetfieldshouldnotdisplayforSPIonapplicationifitsrelatedFDMwillrejectduringapproval @sprint-13-US-204132  @Allocation @wip
  Scenario Outline: Directed Ann_ Verify 'Recommended budget' field should not display for SPI on application if it's related FDM will reject during approval
  | Competitive Ann 'Recommended budget' field should not display for SPI on application if it's related FDM will reject during approval |
    Given I published "<Announcement Type>" type announcement having name "Automation Runtime Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
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
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
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
    When I complete filling in the Review form with recommendation "Recommended"
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
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
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
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    When I enter value "AuGr" into field "GrantCode__c"
    When I enter value "Automation Test Description" into field "Justification__c"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000               | 1000                    | Yes                   | Recommended |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Disapprove" in the approval decision
    Then I see status in Progress-bar is "Rejected" and is "Red"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI1" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    #219584 #219679
    Then I softly see field "Recommended Budget" inside page block

    Examples:
      | Announcement Name                            | Announcement Type | User |
      | {SavedValue:Automation Runtime Announcement} | Directed          | EXE  |
      | {SavedValue:Automation Runtime Announcement} | Competitive       | EXE  |

