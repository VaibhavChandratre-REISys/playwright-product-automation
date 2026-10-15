@Navigator  @ComponentSanity @ComponentSanity3
Feature: Sidebar Navigator Scenarios
Business Need: to ensure that the Navigator of our web pages meets the needs of different user roles: admin, internal users, and external users.
In this feature file, we use the following tags for component-wise execution:@Navigator

#Home module
  @503736 @Navigator
  Scenario Outline:3.0- Home Tab- Sidebar- Admin/PM- To verify that, under the Tasks menu, clicking on the accordion content should redirect to the correct URL.
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Home" tab
    And I pause execution for "3" seconds
    Then I softly see "Navigator" on phase level
    Then I see header text "Tasks" at sidebar
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I see "HomePhaseCompletedTasks" flex table is displayed
    Then I see "HomePhaseCompletedTasksBy" flex table is displayed
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    Then I see "HomePendingTasks" flex table is displayed
    Then I see "HomePendingTasksBy" flex table is displayed

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @503739 @Navigator
  Scenario Outline:3.0- Home Tab- Sidebar- Admin/PM- To verify that, under the Activities menu, clicking on the accordion content should redirect to the correct URL.
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Home" tab
    And I pause execution for "3" seconds
    Then I softly see "Navigator" on phase level
    Then I see header text "Activities" at sidebar
    Then I see header text "Contacts" at sidebar
    When I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I wait for "5" seconds
    And I see "InternalContacts" flex table is displayed
    When I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    When I wait for "5" seconds
    And I see "SubrecipientContacts" flex table is displayed
    When I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I wait for "5" seconds
    Then I see "Reviewers" flex table is displayed
    Then I see header text "Organization" at sidebar
    When I navigate to "Internal" content inside "Organization" subheader on left panel
    And I wait for "5" seconds
    Then I see "InternalOrganizationHierarchyEnhancedGrantor" flex table is displayed
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I wait for "5" seconds
    And I see "ActiveAccount" flex table is displayed
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    And I wait for "5" seconds
    Then I see "UserRegistration" flex table is displayed
    Then I see "UserRegistrationIndApp" flex table is displayed

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @503739_1 @Navigator
  Scenario Outline:3.0- Home Tab- Sidebar- Admin/PM- To verify that, under the Activities menu, clicking on the accordion content should redirect to the correct URL.
    Given I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Home" tab
    And I pause execution for "3" seconds
    Then I softly see "Navigator" on phase level
    Then I see header text "Activities" at sidebar
    Then I see header text "Contacts" at sidebar
    When I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I wait for "5" seconds
    Then I see "InternalContacts" flex table is displayed
    When I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    And I wait for "5" seconds
    Then I see "SubrecipientContacts" flex table is displayed
    When I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I wait for "5" seconds
    Then I see "Reviewers" flex table is displayed
    Then I see header text "Organization" at sidebar
    When I navigate to "Internal" content inside "Organization" subheader on left panel
    And I wait for "5" seconds
    Then I see "InternalOrganizationHierarchyEnhancedGrantor" flex table is displayed
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    And I wait for "5" seconds
    Then I see "ActiveAccount" flex table is displayed
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    And I wait for "5" seconds
    Then I see "UserRegistration" flex table is displayed
    Then I see "UserRegistrationIndApp" flex table is displayed
    Then I see header text "Admin Functions" at sidebar
#    Then I navigate to "Manage Sharing Rules" content inside "Admin Functions" subheader on left panel
#    And I see new tab is opened
#    And I wait for "5" seconds
#    Then I see page title "Lightning Experience"
#    And I click on back arrow
#    When I navigate to "Approval Process Cache" content inside "Admin Functions" subheader on left panel
#    And I wait for "5" seconds
#    Then I see page title "Home ~ As a Grantor"
#    And I click on back arrow
#    When I navigate to "Batch Jobs" content inside "Admin Functions" subheader on left panel
#    Then I see "ApexBatchEnhancedConfig" flex table is displayed

    Examples:
      | Users |
#      | Admin |
      | PM    |

  @503740 @Navigator
  Scenario Outline: 3.0- Home Tab- Sidebar- Admin/PM- To verify that, under the Technical Support menu, clicking on the accordion content should redirect to the correct URL.
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Home" tab
    And I pause execution for "3" seconds
    Then I softly see "Navigator" on phase level
    Then I see header text "Technical Support" at sidebar
    And I wait for "3" seconds
    When I navigate to "Contact Us" content inside "Technical Support" subheader on left panel
    And I wait for "3" seconds
    Then I see page title "Home ~ Grantor"
    And I see "Customer_Support" in current url

    Examples:
      | Users |
#      | Admin |
      | PM    |

  @503741 @Navigator
  Scenario Outline: 3.0- Home Tab- Sidebar- Admin/PM- To verify that, under the  Useful Links menu, clicking on the accordion content should redirect to the correct URL.
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Home" tab
    Then I see "Navigator" on phase level
    Then I see header text "Useful Links" at sidebar
    And I navigate to "EIN Registration" content inside "Useful Links" subheader on left panel
    And I switch to tab number "1"
    And I see "https://www.irs.gov/businesses/small-businesses-self-employed/get-an-employer-identification-number" in current url
    Then I see page title "Get an employer identification number | Internal Revenue Service"
    And I switch to parent tab
    When I navigate to "Entity/UEI Registration" content inside "Useful Links" subheader on left panel
    And I switch to tab number "2"
    And I see "https://sam.gov/entity-registration" in current url
    Then I see page title "Entity Registration | SAM.gov"

    Examples:
      | Users |
#      | Admin |
      | PM    |

  @507431 @Navigator
  Scenario:3.0- Home Tab- Sidebar- SPI- To verify that, under the Tasks menu, clicking on the accordion content should redirect to the correct URL
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    Then I softly see "Navigator" on phase level
    Then I see header text "My Tasks" at sidebar
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I see "CompletedTasks" flex table is displayed
    Then I see "CompletedTasksBy" flex table is displayed
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    Then I see "PendingTasks" flex table is displayed
    Then I see "PendingTasksBy" flex table is displayed

  @507432 @Navigator
  Scenario:3.0- Home Tab- Sidebar- SPI- To verify that, under the Activities menu, clicking on the accordion content should redirect to the correct URL
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    Then I see "Navigator" on phase level
    Then I softly see header text "Activities" at sidebar
    Then I softly see header text "Organization" at sidebar
    Then I navigate to "Organization Profile" content inside "Activities" subheader on left panel
    And I pause execution for "3" seconds
    And I see "san-diego-electrical-training-trust" in current url
    Then I softly see field "Status" as "Active"
    Then I see page title "Organization View"

  @507433 @Navigator
  Scenario: 3.0- Home Tab- Sidebar- SPI- To verify that, under the Technical Support menu, clicking on the accordion content should redirect to the correct URL
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    Then I see "Navigator" on phase level
    Then I softly see header text "Technical Support" at sidebar
    And I wait for "3" seconds
    Then I navigate to "Contact Us" content inside "Technical Support" subheader on left panel
    Then I softly see new tab is opened
    And I see "sandbox.my.site.com/recipient/s/Customer-Support" in current url

  @507434 @Navigator
  Scenario:3.0- Home Tab- Sidebar- SPI- To verify that, under the Useful Links menu, clicking on the accordion content should redirect to the correct URL   Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    Then I see "Navigator" on phase level
    Then I softly see header text "Useful Links" at sidebar
    Then I navigate to "EIN Registration" content inside "Useful Links" subheader on left panel
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I see "https://www.irs.gov/businesses/small-businesses-self-employed/get-an-employer-identification-number" in current url
    And I get current page title
    Then I see page title "Get an employer identification number | Internal Revenue Service"
    And I switch to parent tab
    When I navigate to "Entity/UEI Registration" content inside "Useful Links" subheader on left panel
    And I switch to tab number "2"
    And I see "https://sam.gov/entity-registration" in current url
    Then I see page title "Entity Registration | SAM.gov"

  @503749 @Navigator
  Scenario: 3.0- Planning Tab- Sidebar- Admin/PM- To verify that, under the Tasks menu, clicking on the accordion content should redirect to the correct URL.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    Then I see "Navigator" on phase level
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "5" seconds
    Then I see "PhasePendingTasks" flex table is displayed
    Then I see "PhasePendingTasksBy" flex table is displayed
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "5" seconds
    Then I see "PhaseCompletedTasks" flex table is displayed
    Then I see "PhaseCompletedTasksBy" flex table is displayed

  @507435
  Scenario: 3.0- Home Tab- Sidebar- SPI- To verify that the Navigator's Collapse and Expand buttons are functioning correctly
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    Then I see "Navigator" on phase level
    Then I softly see header text "Tasks" at sidebar
    And I collapse vertical "Collapse Navigator" on phase level
    Then I do not see "Tasks" at sidebar
    And I expand vertical "Expand Navigator" on phase level
    Then I softly see header text "Tasks" at sidebar

  @504416 @Navigator
  Scenario Outline:3.0- Home Tab- Sidebar- Admin/PM- To verify that the Navigator's Collapse and Expand buttons are functioning correctly.
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Home" tab
    And I pause execution for "3" seconds
    Then I softly see "Navigator" on phase level
    Then I softly see header text "Tasks" at sidebar
    And I wait for "3" seconds
    And I collapse vertical "Collapse Navigator" on phase level
    Then I do not see header text "Tasks" at sidebar
    Then I softly see "Navigator" on phase level
    And I expand vertical "Expand Navigator" on phase level
    Then I softly see header text "Tasks" at sidebar

    Examples:
      | Users |
#      | Admin |
      | PM    |

    #planning module
  @503750 @Navigator
  Scenario Outline: 3.0- Planning Tab- Sidebar- Admin/PM- To verify that, under the Activities menu, clicking on the accordion content should redirect to the correct URL.
#    Given I have "default" configuration as below:
#      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
#      | ACCORDIAN HEADER      | Active           | true              | ApiGeneratedId:0 |
#      | ACCORDIAN HEADER      | Header Text      | Setup             | ApiGeneratedId:1 |
#      | SUB HEADER CONFIG     | Active           | true              | ApiGeneratedId:0 |
#      | SUB HEADER CONFIG     | HIDE HEADER TEXT | true              | ApiGeneratedId:1 |
#    Given I setup test configuration as below:
#      | configurationCategory | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
#      | ACCORDIAN HEADER      | Active           | true          | GrantorPlanning    | Name                      | Setup                      |
#      | ACCORDIAN HEADER      | Header Text      |               | GrantorPlanning    | Name                      | Setup                      |
#      | SUB HEADER CONFIG     | Active           | true          | Setup              | Name                      | Planning                   |
#      | SUB HEADER CONFIG     | HIDE HEADER TEXT | false         | Setup              | Name                      | PLanning                   |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I wait for "3" seconds
    Then I see "Navigator" on phase level
    Then I softly see header text "Activities" at sidebar
    Then I softly see header text "Setup" at sidebar
    Then I softly see header text "Task" at sidebar
#    Then I see Planning (Accordion Sub Header) as per Sub Header Text on the sidebar
#    When I Active configuration under Accordion Content Detail is unchecked
#    Then I Cannot See Planning (Accordion Sub Header) is Not Visible under "Setup"
#    When I Checked Hide Header Text checkbox in config
#    Then I Cannot See Planning (Accordion Sub Header) is Not Visible under "Setup"
#    Then I softly see "Planning" at sidebar
    And I wait for "3" seconds
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    Then I see "PhasePendingTasks" flex table is displayed
    Then I see "PhasePendingTasksBy" flex table is displayed
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "5" seconds
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I see "PhaseCompletedTasks" flex table is displayed
    Then I see "PhaseCompletedTasksBy" flex table is displayed
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Active"
    Then I pause execution for "3" seconds
    Then I see "StrategicPlansGrantor" flex table is displayed
    And I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Active"
    Then I see "GrantorServiceAreas" flex table is displayed
    Then I pause execution for "3" seconds
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Active"
    Then I see "InternalFundingSource" flex table is displayed
    Then I see "ExternalFundingSource" flex table is displayed
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Active"
    Then I see "GrantorMasterKPIs" flex table is displayed
    And I pause execution for "3" seconds
    And I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    Then I see "AllformsGrid" flex table is displayed
    Then I see "FormsandPackages" flex table is displayed
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    Then I see "MasterTermConditions" flex table is displayed
    Then I see "Programs" is displayed
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    Then I see "Programs" flex table is displayed
    And I navigate to "External Programs" content inside "Programs" subheader on left panel
    Then I see "FederalPrograms" flex table is displayed
    Then I see "NGOProgramsForGranator" flex table is displayed

    Examples:
      | Users |
#      | Admin |
      | PM    |

  @503751 @Navigator
  Scenario Outline: 3.0- Planning Tab- Sidebar- Admin/PM- To verify that the Navigator on Record are functioning correctly.
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    When I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    Then I wait for "3" seconds
    Then I click on "Navigator" in the page details
    Then I softly see header text "Task" at sidebar
    Then I softly see header text "Activities" at sidebar
    Then I wait for "10" seconds
    And I click on "Minimize" icon
    Then I do not see header text "Task" at sidebar
    Examples:
      | Users |
     # | Admin |
      | PM    |

  @503752 @Navigator
  Scenario Outline: 3.0- Planning Tab- Sidebar- Admin/PM- To verify that the Navigator's Collapse and Expand buttons are functioning correctly.
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    And I pause execution for "3" seconds
    Then I see "Navigator" on phase level
    Then I softly see header text "Task" at sidebar
    And I wait for "3" seconds
    And I collapse vertical "Collapse Navigator" on phase level
    Then I do not see header text "Task" at sidebar
    And I expand vertical "Expand Navigator" on phase level
    Then I softly see "Task" at sidebar
    Examples:
      | Users |
     # | Admin |
      | PM    |

    #Announcement Module
  @503753 @Navigator
  Scenario Outline:3.0- Announcements Tab- Sidebar- Admin/PM- To verify that, under the Tasks menu, clicking on the accordion content should redirect to the correct URL.
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Announcements" tab
    And I pause execution for "3" seconds
    Then I softly see "Navigator" on phase level
    Then I softly see header text "Tasks" at sidebar
    Then I softly see header text "My Tasks" at sidebar
    Then I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "5" seconds
    Then I see "PhasePendingTasks" flex table is displayed
    Then I see "PhasePendingTasksBy" flex table is displayed
    Then I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "5" seconds
    Then I see "PhaseCompletedTasks" flex table is displayed
    Then I see "PhaseCompletedTasksBy" flex table is displayed

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @503754 @Navigator
  Scenario Outline: 3.0- Announcements Tab- Sidebar- Admin/PM- To verify that, under the Activities menu, clicking on the accordion content should redirect to the correct URL.
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Announcements" tab
    And I pause execution for "3" seconds
    Then I softly see "Navigator" on phase level
    Then I softly see header text "Activities" at sidebar
    Then I softly see header text "Announcements" at sidebar
    Then I navigate to "Competitive" content inside "Announcements" subheader on left panel
    Then I wait for "5" seconds
    Then I see "ActiveFundingOpportunitiesCompitive" flex table is displayed
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I wait for "5" seconds
    Then I see "ActiveFundingOpportunities" flex table is displayed
    Then I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I wait for "5" seconds
    Then I see "ActiveFundingOpportunitiesFormula" flex table is displayed
    Examples:
      | Users |
     # | Admin |
      | PM    |

  @503755 @Navigator
  Scenario Outline: 3.0- Announcements Tab- Sidebar- Admin/PM- To verify that the Navigator's Collapse and Expand buttons are functioning correctly.
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Announcements" tab
    And I pause execution for "3" seconds
    Then I see "Navigator" on phase level
    Then I see header text "Tasks" at sidebar
    And I collapse vertical "Collapse Navigator" on phase level
    Then I do not see "Tasks" at sidebar
    Then I see "Navigator" on phase level
    And I expand vertical "Expand Navigator" on phase level
    Then I see header text "Tasks" at sidebar

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @503756 @Navigator
  Scenario Outline: 3.0- Announcements Tab- Sidebar- Admin/PM- To verify that the Navigator on Record are functioning correctly.
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I wait for "3" seconds
    Then I click on "Navigator" in the page details
    Then I see "tasks" is displayed
    Then I see "Activities" is displayed
    Then I wait for "3" seconds
    And I click on "Minimize" icon
    Then I do not see "Tasks" at sidebar

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @549776
  Scenario: LWC- Opportunity Phase - Sidebar- SPI- To verify that the Navigator's Collapse and Expand buttons are functioning correctly.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    Then I softly see "Navigator" on phase level
    Then I see "Tasks" content inside "Pending Tasks" subheader on left panel
    And I collapse vertical "Collapse Navigator" on phase level
    Then I do not see "Tasks" content inside "Pending Tasks" subheader on left panel
    And I collapse vertical "Expand Navigator" on phase level
    Then I see "Tasks" content inside "Pending Tasks" subheader on left panel

  @549777
  Scenario: LWC- Opportunity Phase - Sidebar- SPI- To verify that, under the Tasks and Application menu, clicking on the accordion content should redirect to the correct URL.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    Then I softly see "Navigator" on phase level
    Then I see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I see "Tasks" content inside "Completed Tasks" subheader on left panel
    Then I see "Activities" content inside "Not Yet Qualified" subheader on left panel
    Then I see "Activities" content inside "Qualified" subheader on left panel
    Then I see "Activities" content inside "Converted to Application" subheader on left panel
    #Table displayed
    And I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    Then I see "PhasePendingTasks" flex table is displayed
    Then I see "PhasePendingTasksBy" flex table is displayed
    And I navigate to "Completed Tasks" content inside "Tasks" subheader on left panel
    Then I see "PhaseCompletedTasks" flex table is displayed
    Then I see "PhaseCompletedTasksBy" flex table is displayed
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    Then I see "NotYetQualifiedAnnouncementsExternal" flex table is displayed
    And I collapse vertical "Collapse Navigator" on phase level
    #Subtab displayed
    Then I softly do not see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly do not see "Tasks" content inside "Completed Tasks" subheader on left panel
    Then I softly do not see "Activities" content inside "Not Yet Qualified" subheader on left panel
    Then I softly do not see "Activities" content inside "Qualified" subheader on left panel
    Then I softly do not see "Activities" content inside "Converted to Application" subheader on left panel

  @549802
  Scenario: LWC- Opportunity Phase - Config- SPI- To verify Opportunity phase config for sidebar Activity Menu section.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    Then I softly see "Navigator" on phase level
    Then I see "Activities" content inside "Not Yet Qualified" subheader on left panel
    Then I see "Activities" content inside "Qualified" subheader on left panel
    Then I see "Activities" content inside "Converted to Application" subheader on left panel
    And I collapse vertical "Collapse Navigator" on phase level
   #Subtab displayed
    Then I softly do not see "Activities" content inside "Not Yet Qualified" subheader on left panel
    Then I softly do not see "Activities" content inside "Qualified" subheader on left panel
    Then I softly do not see "Activities" content inside "Converted to Application" subheader on left panel

  @549803
  Scenario: LWC- Opportunity Phase - Config- SPI- To verify opportunity phase config for sidebar Task Menu section.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    Then I softly see "Navigator" on phase level
    Then I see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I see "Tasks" content inside "Completed Tasks" subheader on left panel
    And I collapse vertical "Collapse Navigator" on phase level
      #Subtab displayed
    Then I softly do not see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly do not see "Tasks" content inside "Completed Tasks" subheader on left panel

  @549770
  Scenario: LWC- Application Phase - Sidebar- Admin/PM- To verify that the Navigator's Collapse and Expand buttons are functioning correctly.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    Then I softly see "Navigator" on phase level
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel
    Then I softly see "Activities" content inside "Pre-Applications" subheader on left panel
    Then I softly see "Activities" content inside "Applications" subheader on left panel
    And I collapse vertical "Collapse Navigator" on phase level
  #Subtab displayed
    Then I softly do not see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly do not see "Tasks" content inside "Completed Tasks" subheader on left panel
    Then I softly do not see "Activities" content inside "Pre-Applications" subheader on left panel
    Then I softly do not see "Activities" content inside "Applications" subheader on left panel

  @549772 @549772_1
  Scenario: LWC- Application Phase - Sidebar- Admin/PM- To verify that, under the Tasks and Application menu, clicking on the accordion content should redirect to the correct URL.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    Then I softly see "Navigator" on phase level
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    Then I see "PhasePendingTasks" flex table is displayed
    Then I see "PhasePendingTasksBy" flex table is displayed
    When I navigate to "Completed Tasks" content inside "Tasks" subheader on left panel
    Then I see "PhaseCompletedTasks" flex table is displayed
    Then I see "PhaseCompletedTasksBy" flex table is displayed
    When I navigate to "Pre-Applications" content inside "Activities" subheader on left panel
    Then I see "RecipientPreApplications" flex table is displayed
    When I navigate to "Applications" content inside "Activities" subheader on left panel
    Then I see "RecipientApplications" flex table is displayed
    When I navigate to "Negotiations" content inside "Activities" subheader on left panel
    Then I see "RecipientNegotiations" flex table is displayed

  @549772 @549772_2 @549809 @549810
  Scenario: LWC- Application Phase - Sidebar- Admin/PM- To verify that, under the Tasks and Application menu, clicking on the accordion content should redirect to the correct URL.
  |LWC- Application Phase - Config- Admin/PM- To verify Application phase config for sidebar Activity Menu section.|
  |LWC- Application Phase - Config- Admin/PM- To verify Application phase config for sidebar Task Menu section.|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    #549810
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel
    #549809
    Then I softly see "Activities" content inside "Applications" subheader on left panel
    Then I softly see "Activities" content inside "Pre-Applications" subheader on left panel
    Then I softly see "Activities" content inside "Reviews" subheader on left panel
    Then I softly see "Activities" content inside "Funding Decision Memos (FDM)" subheader on left panel
    Then I softly see "Activities" content inside "Negotiations" subheader on left panel
    When I navigate to "Pending Tasks" content inside "Tasks" subheader on left panel
    Then I see "PhasePendingTasks" flex table is displayed
    Then I see "PhasePendingTasksBy" flex table is displayed
    When I navigate to "Completed Tasks" content inside "Tasks" subheader on left panel
    Then I see "PhaseCompletedTasksBy" flex table is displayed
    Then I see "PhaseCompletedTasks" flex table is displayed
    Then I see "PhaseCompletedTasksBy" flex table is displayed
    When I navigate to "Applications" content inside "Activities" subheader on left panel
    Then I see "ApplicantGrantorApplications" flex table is displayed
    When I navigate to "Pre-Applications" content inside "Activities" subheader on left panel
    Then I see "ApplicantPreApplications" flex table is displayed
    When I navigate to "Reviews" content inside "Activities" subheader on left panel
    Then I see "AnnouncementList" flex table is displayed
    When I navigate to "Funding Decision Memos (FDM)" content inside "Activities" subheader on left panel
    Then I see "FDMList1" flex table is displayed
    When I navigate to "Negotiations" content inside "Activities" subheader on left panel
    #549772
    Then I see "PendingNegotiations" flex table is displayed
    Then I see "CompletedNegotiations" flex table is displayed

  @549791
  Scenario: 3.0- Grant Tab- Sidebar- Admin/PM- To verify that the Navigator on Record are functioning correctly.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    And I click on "View" icon for "Draft" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    Then I click on "Navigator" in the page details
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel
    Then I see "Activities" content inside "Grants" subheader on left panel
    Then I see "Activities" content inside "Subawards" subheader on left panel
    Then I see "Activities" content inside "Amendment Requests" subheader on left panel
    Then I wait for "3" seconds
    And I click on "Minimize" icon
    Then I softly do not see "Tasks" content inside "Pending Tasks" subheader on left panel

  @549792
  Scenario: 3.0- Grant Tab- Sidebar- Admin/PM- To verify that the Navigator's Collapse and Expand buttons are functioning correctly.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    Then I softly see "Navigator" on phase level
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel
    Then I softly see "Activities" content inside "Grants" subheader on left panel
    Then I softly see "Activities" content inside "Subawards" subheader on left panel
    And I collapse vertical "Collapse Navigator" on phase level
  #Subtab displayed
    Then I softly do not see "Tasks" content inside "Pending Tasks" subheader on left panel
    And I expand vertical "Expand Navigator" on phase level
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel

  @549793
  Scenario: 3.0- Grant Tab- Sidebar- Admin/PM- To verify that, under the Activities menu, clicking on the accordion content should redirect to the correct URL.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    Then I softly see "Navigator" on phase level
    Then I see "Activities" content inside "Grants" subheader on left panel
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    Then I see "GrantorActiveGrants" flex table is displayed
    Then I softly see "Activities" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I navigate to "Subawards" content inside "Activities" subheader on left panel
    Then I see "GrantorRelatedAwards2" flex table is displayed
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    Then I see "GrantorAmendmentRequests" flex table is displayed
    Then I softly see "Activities" content inside "Automation Sub Header Text Grants" subheader on left panel
    Then I softly do not see "Tasks" content inside "Grant Tasks" subheader on left panel

  @549795
  Scenario: 3.0- Grant Tab- Sidebar- SPI- To verify that the Navigator on Record are functioning correctly.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    Then I softly see "Navigator" on phase level
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel
    Then I softly see "Activities" content inside "Grants" subheader on left panel
    Then I softly see "Activities" content inside "Subawards" subheader on left panel
    And I collapse vertical "Collapse Navigator" on phase level
      #Subtab displayed
    Then I softly do not see "Tasks" content inside "Pending Tasks" subheader on left panel
    And I expand vertical "Expand Navigator" on phase level
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I click on "View" icon for "Active" inside flex table with id "RecipientActiveGrants" without waiting for record
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel
    Then I see "Activities" content inside "Grants" subheader on left panel
    Then I see "Activities" content inside "Subawards" subheader on left panel
    Then I see "Activities" content inside "Amendment Requests" subheader on left panel

  @549796
  Scenario:3.0- Grant Tab- Sidebar- SPI- To verify that the Navigator's Collapse and Expand buttons are functioning correctly.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    Then I softly see "Navigator" on phase level
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel
    Then I softly see "Activities" content inside "Grants" subheader on left panel
    Then I softly see "Activities" content inside "Subawards" subheader on left panel
    And I collapse vertical "Collapse Navigator" on phase level
      #Subtab displayed
    Then I softly do not see "Tasks" content inside "Pending Tasks" subheader on left panel
    And I expand vertical "Expand Navigator" on phase level
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel

  @549797
  Scenario:3.0- Grant Tab- Sidebar- SPI- To verify that, under the Activities menu, clicking on the accordion content should redirect to the correct URL.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    Then I softly see "Navigator" on phase level
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    Then I see "PhasePendingTasks" flex table is displayed
    Then I see "PhasePendingTasksBy" flex table is displayed
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I see "PhaseCompletedTasks" flex table is displayed
    Then I see "PhaseCompletedTasksBy" flex table is displayed
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    Then I see "RecipientActiveGrants" flex table is displayed
    When I navigate to "Subawards" content inside "Activities" subheader on left panel
    Then I see "RecipientsRelatedAwards2" flex table is displayed
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    Then I see "RecipientAmendmentRequests" flex table is displayed

  @549798
  Scenario: 3.0- Grant Tab- Sidebar- SPI- To verify that, under the Tasks menu, clicking on the accordion content should redirect to the correct URL.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    Then I softly see "Navigator" on phase level
    Then I softly see "Activities" content inside "Automation Sub Header Text ExtGrants" subheader on left panel
    Then I softly do not see "Tasks" content inside "Automation Sub Header Text My Tasks" subheader on left panel

  @549932
  Scenario: 3.0- Monitoring Tab- Sidebar- Admin/PM- To verify that the Navigator on Record are functioning correctly.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Not Started" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Not Started" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
    Then I click on "Navigator" in the page details
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel
    Then I softly see "Activities" content inside "Monitoring Schedules" subheader on left panel
    Then I softly see "Activities" content inside "Progress Reports" subheader on left panel
    Then I wait for "10" seconds
    And I click on "Minimize" icon
    Then I softly do not see "Activities" content inside "Progress Reports" subheader on left panel

  @549935
  Scenario: 3.0- Monitoring Tab- Sidebar- Admin/PM- To verify that the Navigator's Collapse and Expand buttons are functioning correctly.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Monitoring" tab
    Then I softly see "Navigator" on phase level
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel
    And I collapse vertical "Collapse Navigator" on phase level
      #Subtab displayed
    Then I do not see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I do not see "Tasks" content inside "Completed Tasks" subheader on left panel

  @549936 @549937 @549953
  Scenario: 3.0- Monitoring Tab- Sidebar- Admin/PM- To verify that, under the Tasks menu, clicking on the accordion content should redirect to the correct URL.
  |3.0- Monitoring Tab- Sidebar- Admin/PM- To verify that, under the Activities menu, clicking on the accordion content should redirect to the correct URL.|
  |3.0- Monitoring Tab- Sidebar- Admin/PM- To verify that, under the Activities menu, clicking on the accordion content should redirect to the correct URL.|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    #549936
    #Hide Header Text Check
    Then I softly do not see "Activities" content inside "Automation Accordion Header Monitoring Tasks" subheader on left panel
    Then I see "PhasePendingTasks" flex table is displayed
    Then I see "PhasePendingTasksBy" flex table is displayed
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I see "PhaseCompletedTasks" flex table is displayed
    Then I see "PhaseCompletedTasksBy" flex table is displayed
    And I navigate to "Monitoring Schedules" content inside "Activities" subheader on left panel
    Then I see "MonitoringScheduleGrantor" flex table is displayed
    And I navigate to "Progress Reports" content inside "Activities" subheader on left panel
    Then I see "GrantorProgressReportsInternal" flex table is displayed
    And I navigate to "Site Visits" content inside "Activities" subheader on left panel
    Then I see "LatestSiteVisitReportsGrid" flex table is displayed
    #549937
    And I navigate to "Desk Reviews" content inside "Activities" subheader on left panel
    Then I see "LatestDeskReviewReportsGrid" flex table is displayed
    And I navigate to "Risk Assessments" content inside "Activities" subheader on left panel
    Then I see "OrgRiskAssessmentGrid" flex table is displayed
    And I navigate to "Subaward Terms and Conditions" content inside "Activities" subheader on left panel
    Then I see "SubAwardTermsAndCondition" flex table is displayed
    And I navigate to "Advances" content inside "Activities" subheader on left panel
    Then I see "GrantorPaymentRequestAdvances" flex table is displayed
    And I navigate to "Reimbursements" content inside "Activities" subheader on left panel
    Then I see "GrantorPaymentRequestReimbursement" flex table is displayed
    And I navigate to "Refunds" content inside "Activities" subheader on left panel
    Then I see "GrantorPaymentRequestRefunds" flex table is displayed
    #Hide Header Text Uncheck
    Then I softly see "Activities" content inside "Automation Accordion Header Monitoring Schedule" subheader on left panel
    Then I softly do not see "Activities" content inside "Automation Accordion Header Monitoring Tasks" subheader on left panel

  @549938
  Scenario: 3.0- Monitoring Tab- Sidebar- SPI- To verify that the Navigator on Record are functioning correctly.
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
    Then I softly see "Navigator" on phase level
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel
    And I collapse vertical "Collapse Navigator" on phase level
    Then I softly do not see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly do not see "Tasks" content inside "Completed Tasks" subheader on left panel

  @549939
  Scenario: 3.0- Monitoring Tab- Sidebar- SPI- To verify that the Navigator's Collapse and Expand buttons are functioning correctly.
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    Then I see "PhasePendingTasks" flex table is displayed
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I see "PhaseCompletedTasks" flex table is displayed
    And I collapse vertical "Collapse Navigator" on phase level
    Then I do not see "PhasePendingTasks" flex table is displayed
    Then I do not see "PhaseCompletedTasks" flex table is displayed

  @549940 @549941 @549965
  Scenario: 3.0- Monitoring Tab- Sidebar- SPI- To verify that, under the Tasks menu, clicking on the accordion content should redirect to the correct URL.
  |3.0- Monitoring Tab- Sidebar- SPI- To verify that, under the Activities menu, clicking on the accordion content should redirect to the correct URL.|
  |3.0- Monitoring Tab- Sidebar- SPI- To verify that, under the Activities menu, clicking on the accordion content should redirect to the correct URL.|
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    #549941
    #Hide Header Text Check
    Then I softly do not see "Activities" content inside "Automation Accordion Header Monitoring Tasks" subheader on left panel
    Then I see "PhasePendingTasks" flex table is displayed
    Then I see "PhasePendingTasksBy" flex table is displayed
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I see "PhaseCompletedTasks" flex table is displayed
    Then I see "PhaseCompletedTasksBy" flex table is displayed
    And I navigate to "Monitoring Schedules" content inside "Activities" subheader on left panel
    Then I see "MonitoringScheduleGrantor" flex table is displayed
    And I navigate to "Progress Reports" content inside "Activities" subheader on left panel
    Then I see "GrantorProgressReportsExternal" flex table is displayed
    And I navigate to "Site Visits" content inside "Activities" subheader on left panel
    Then I see "ApplicantSiteVisitReports" flex table is displayed
    And I navigate to "Desk Reviews" content inside "Activities" subheader on left panel
    Then I see "ApplicantDeskReviewReports" flex table is displayed
    And I navigate to "Risk Assessments" content inside "Activities" subheader on left panel
    Then I see "OrgRiskAssessmentGrid" flex table is displayed
    And I navigate to "Subaward Terms and Conditions" content inside "Activities" subheader on left panel
    Then I see "SRSubAwardTermsAndCondition" flex table is displayed
    And I navigate to "Advances" content inside "Activities" subheader on left panel
    Then I see "RecipientPaymentRequestAdvances" flex table is displayed
    And I navigate to "Reimbursements" content inside "Activities" subheader on left panel
    Then I see "RecipientPaymentRequestReimbursement" flex table is displayed
    And I navigate to "Refunds" content inside "Activities" subheader on left panel
    Then I see "RecipientPaymentRequestRefunds" flex table is displayed
    #Hide Header Text Uncheck
    Then I softly see "Activities" content inside "Automation Accordion Header Monitoring Schedule" subheader on left panel
    Then I softly see "Activities" content inside "Automation Accordion Header Progress Reports" subheader on left panel
    #Hide Header Text Check
    Then I softly do not see "Activities" content inside "Automation Accordion Header Monitoring Tasks" subheader on left panel

  @549955
  Scenario: 3.0- Closeout Phase- Sidebar- Admin/PM- To verify that, under the Tasks menu, clicking on the accordion content should redirect to the correct URL.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Closeout" tab
    Then I softly see toggle option "Closeouts - Completed" inside flex table id "AllCloseouts"
    Then I softly see toggle option "Closeouts - Draft" inside flex table id "AllCloseouts"
    Then I softly see toggle option "Closeouts - All" inside flex table id "AllCloseouts"
    Then I softly see toggle option "Closeouts - Submitted" inside flex table id "AllCloseouts"
    Then I see "AllCloseouts" flex table is displayed
    Then I softly see "Navigator" on phase level
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    Then I see "PhasePendingTasks" flex table is displayed
    Then I see "PhasePendingTasksBy" flex table is displayed
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I see "PhaseCompletedTasks" flex table is displayed
    Then I see "PhaseCompletedTasksBy" flex table is displayed
    And I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    Then I see "ProjectPeriodCloseoutGrantor" flex table is displayed
    And I collapse vertical "Collapse Navigator" on phase level
    Then I softly do not see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly do not see "Tasks" content inside "Completed Tasks" subheader on left panel
    And I expand vertical "Expand Navigator" on phase level
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel

  @549956
  Scenario: 3.0- Closeout Phase- Sidebar- Admin/PM-To verify that the Navigator's Collapse and Expand buttons are functioning correctly.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Closeout" tab
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel
    Then I softly see "Navigator" on phase level
    And I collapse vertical "Collapse Navigator" on phase level
    Then I softly do not see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly do not see "Tasks" content inside "Completed Tasks" subheader on left panel
    And I collapse vertical "Collapse Navigator" on phase level
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel

  @549957
  Scenario: 3.0- Closeout Phase- Sidebar- Admin/PM- Config- To verify Sidebar task menu config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Side Bar Header       | Sidebar Task Menu Label | Tasks             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName               | fieldNewValue    | coreComponentField |
      | Side Bar Header:General | Sidebar Task Menu Label | Automation Tasks | Closeout           |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Closeout" tab
    Then I softly see "Automation Tasks" content inside "Pending Tasks" subheader on left panel

  @549958
  Scenario: 3.0- Closeout Phase- Sidebar- Admin/PM- Config- To verify Sidebar Activity menu config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Side Bar Header       | Sidebar Activity Menu Label | Activities        | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName                   | fieldNewValue         | coreComponentField |
      | Side Bar Header:General | Sidebar Activity Menu Label | Automation Activities | Closeout           |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Closeout" tab
    Then I softly see "Automation Activities" content inside "Project Period Closeouts" subheader on left panel

  @549959 @549960
  Scenario: 3.0- Closeout Phase- Sidebar- SPI- To verify that, under the Tasks menu, clicking on the accordion content should redirect to the correct URL.
  |3.0- Closeout Phase- Sidebar- SPI-To verify that the Navigator's Collapse and Expand buttons are functioning correctly.|
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Closeout" tab
    Then I softly see toggle option "Closeouts - Completed" inside flex table id "AllCloseouts"
    Then I softly see toggle option "Closeouts - Draft" inside flex table id "AllCloseouts"
    Then I softly see toggle option "Closeouts - All" inside flex table id "AllCloseouts"
    Then I softly see toggle option "Closeouts - Submitted" inside flex table id "AllCloseouts"
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly see "Tasks" content inside "Completed Tasks" subheader on left panel
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    Then I see "PhasePendingTasks" flex table is displayed
    Then I see "PhasePendingTasksBy" flex table is displayed
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I see "PhaseCompletedTasks" flex table is displayed
    Then I see "PhaseCompletedTasksBy" flex table is displayed
    And I navigate to "Project Period Closeouts" content inside "Activities" subheader on left panel
    Then I see "ProjectPeriodCloseoutGrantor" flex table is displayed
    And I collapse vertical "Collapse Navigator" on phase level
    Then I softly do not see "Tasks" content inside "Pending Tasks" subheader on left panel
    Then I softly do not see "Tasks" content inside "Completed Tasks" subheader on left panel
    And I expand vertical "Expand Navigator" on phase level
    Then I softly see "Tasks" content inside "Pending Tasks" subheader on left panel

  @549961
  Scenario: 3.0- Closeout Phase- Sidebar- SPI- Config- To verify Sidebar task menu config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Side Bar Header       | Sidebar Task Menu Label | Tasks             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName               | fieldNewValue    | coreComponentField |
      | Side Bar Header:General | Sidebar Task Menu Label | Automation Tasks | RecipientCloseout  |
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Closeout" tab
    Then I softly see "Automation Tasks" content inside "Pending Tasks" subheader on left panel

  @549963
  Scenario: 3.0- Closeout Phase- Sidebar- SPI- Config- To verify Sidebar Activity menu config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Side Bar Header       | Sidebar Activity Menu Label | Activities        | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName                   | fieldNewValue         | coreComponentField |
      | Side Bar Header:General | Sidebar Activity Menu Label | Automation Activities | RecipientCloseout  |
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Closeout" tab
    Then I softly see "Automation Activities" content inside "Project Period Closeouts" subheader on left panel
