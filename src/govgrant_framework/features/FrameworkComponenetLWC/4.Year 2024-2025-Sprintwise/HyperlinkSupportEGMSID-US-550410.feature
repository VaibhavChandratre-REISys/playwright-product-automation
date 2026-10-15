@HyperlinkSupport_EGMSID @US-550410 @JuneRelease @HyperlinkSupportEGMSID-US-550410
Feature: The user must create an  HyperlinkSupport_EGMSID LWC Object level.
  After creating the template, the user needs to specify the template name in the Action URL (Long) field within the LWC configuration.

  @550797 @550715 @550730 @550732 @550734 @550735
  Scenario Outline: LWC : E-Table : Admin : To verify that EGMS ID column values are rendered as clickable hyperlinks in the table
  |LWC : E-Table : PM : To verify that EGMS ID column values are rendered as clickable hyperlinks in the table|
  |LWC : E-Table : Admin : To verify that when click on EGMS ID then user should redirected to respective EGMS ID detail page|
  |LWC : E-Table : PM : To verify that when click on EGMS ID then user should redirected to respective EGMS ID detail page|
  |LWC : E-Table : Admin : To verify that EGMS ID detail page should be open in same tab|
  |LWC : E-Table : PM : To verify that EGMS ID detail page should be open in same tab|
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - My Records"
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/n/Planning?0.source=alohaHeader"
    Then I see "---program:-:programsTableId---" flex table is displayed
    Then I softly see column header "EGMS ID" displayed in tableId "---program:-:programsTableId---"
    Then I softly see columnname "EGMS ID" values clickable in tableID "---program:-:programsTableId---"
    And I click on first record of column name "EGMS ID" for tableID "---program:-:programsTableId---"
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "PEGMSID"
    Then I softly see the field "{SavedValue:PEGMSID}" as "EGMS ID" on page layout
    #And I click on "Collapse" in page detail
    Then I softly see "Information" page block displayed
    Then I see "Overview" subtab is present in page details
    Then I see "Setup" subtab is present in page details
    Then I see "Responsibilities" subtab is present in page details
    Then I see "History" subtab is present in page details
    Then I see page title "Program View"

    Examples:
      | User  |
      | ADMIN |
      | PM    |

  @550729 @550733 @550736
  Scenario: LWC : E-Table : SPI : To verify that EGMS ID column values are rendered as clickable hyperlinks in the table
  |LWC : E-Table : SPI : To verify that when user click on EGMS ID then user should redirected to respective EGMS ID detail page|
  |LWC : E-Table : SPI : To verify that EGMS ID detail page should be open in same tab|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Applications" tab
    Then I see "---applicationIntake:-:recipientApplications---" flex table is displayed
    Then I softly see column header "EGMS ID" displayed in tableId "---applicationIntake:-:recipientApplications---"
    Then I softly see columnname "EGMS ID" values clickable in tableID "---applicationIntake:-:recipientApplications---"
    And I click on first record of column name "EGMS ID" for tableID "---applicationIntake:-:recipientApplications---"
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    Then I softly see the field "{SavedValue:APPEGMSID}" as "EGMS ID" on page layout
    And I click on "Collapse" in page detail
    Then I softly see "Information" page block displayed
    Then I see "Overview" subtab is present in page details
    Then I see "Budget" subtab is present in page details
    Then I see "Proposal" subtab is present in page details
    Then I see "Forms and Files" subtab is present in page details
    Then I see "History" subtab is present in page details
    Then I see page title "Application View"

  @551176 @551177
  Scenario Outline: LWC : E-Table : Admin : To verify that sorting functionality should be working properly on EGMS ID column as worked earlier
  |LWC : E-Table : PM : To verify that sorting functionality should be working properly on EGMS ID column as worked earlier|
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - My Records"
    And I click on column name "EGMS ID" for sorting of table "---program:-:programsTableId---"
    Then I softly see arrowIcon for column name "EGMS ID"
    Then I softly see column name "EGMS ID" with "Ascending" order

    Examples:
      | User  |
      | ADMIN |
      | PM    |

  @551178
  Scenario: LWC : E-Table : SPI : To verify that sorting functionality should be working properly on EGMS ID column as worked earlier
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Applications" tab
    And I click on column name "EGMS ID" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see arrowIcon for column name "EGMS ID"
    Then I softly see column name "EGMS ID" with "Ascending" order