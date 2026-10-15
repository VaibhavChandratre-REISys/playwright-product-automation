@lwcPageBlock @neetaPagelayoutLWC @PageLayout @PageLayout1 @lwcPageBlockRecordLevel
Feature: Page Block Scenarios for Page Edit/View layout
Business Need: to ensure that the page block of our pages meets the needs of different user roles: admin, internal users, and external users.

  @338712 @Sprint13 @R
  Scenario: LWC - Flex Edit Layout - Page Block Hide Logic - Admin - Config - To verify that when user select 'System Administrator' in 'Hide For Profile' then that block should be hide for System Administrator profile.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Hide For Profile |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For Profile | System Administrator | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation ADMIN user"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block

  @338735 @Sprint13 @R
  Scenario Outline: LWC - Flex Edit Layout - Page Block Hide Logic - Admin - Config - To verify that when user select 'PM' in 'Hide For Profile' then that page block should be hide for PM profile.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Hide For Profile |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For Profile | <User>        | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    Examples:
      | User |
      | PM   |

  @338720  @Sprint13
  Scenario: LWC - Flex Edit Layout -Page Block Hide Logic - Admin- Config - To verify that when user select 'SPI' in 'Hide For Profile' then that page block should be hide for SPI profile and visible at admin profile.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block            | Hide For Profile |                   | Recipient Pre-Application | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For Profile | SPI           | Recipient Pre-Application | Name                      | PB-12004                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    Then I cannot see field "Applicant Information" inside page block

  @338745  @Sprint13 @R
  Scenario Outline: LWC - Flex Edit Layout - Page Block Hide Logic - Admin - Config - To verify that when user added 'Internal' in 'Hide For User' then that page block should be hide for all Internal users.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Hide For User |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName     | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For User | Internal      | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    Examples:
      | User |
      | PM   |

  @338774  @Sprint13
  Scenario: LWC - Flex Edit Layout - Page Block Hide Logic - Admin - Config - To verify that when user added 'Applicant' in 'Hide For User' then that page block should be hide for all applicant users.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block            | Hide For User |                   | Recipient Pre-Application | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName     | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For User | Applicant     | Recipient Pre-Application | Name                      | PB-12004                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    Then I cannot see field "Applicant Information" inside page block

  @338811 @338815 @330706 @330707  @Sprint13 @R
  Scenario Outline: LWC - Flex Edit Layout - Page Block Hide Logic - Admin - Config - To verify that when user select 'View' in 'Hide for Context' then that page block should be hide for view layout.
  | LWC - Flex Edit Layout - Page Block Hide Logic - PM - UI - To verify that when user select 'View' in 'Hide for Context' then that page block should be hide for view layout.|
  | LWC - Flex View Layout - Page Block Hide Logic - Admin - Config - To verify that when user select 'View' in 'Hide for Context' then that page block should be hide for view layout.|
  | LWC - Flex View Layout - Page Block Hide Logic - PM - UI - To verify that when user select 'View' in 'Hide for Context' then that page block should be hide for view layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Hide For Context |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For Context | View          | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @338818 @338822 @330780 @330782  @Sprint13 @R
  Scenario Outline: LWC - Flex Edit Layout - Page Block Hide Logic - Admin - Config - To verify that when user select 'Edit' in 'Hide for Context' then that page block should be hide for edit layout.
  | LWC - Flex Edit Layout - Page Block Hide Logic - PM - UI - To verify that when user select 'Edit' in 'Hide for Context' then that page block should be hide for edit layout.|
  |LWC - Flex View Layout - Page Block Hide Logic - Admin - Config - To verify that when user select 'Edit' in 'Hide for Context' then that page block should be hide for edit layout.|
  |LWC - Flex View Layout - Page Block Hide Logic - PM - UI - To verify that when user select 'Edit' in 'Hide for Context' then that page block should be hide for edit layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Hide For Context |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For Context | Edit          | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @324597  @Sprint13
  Scenario Outline: LWC-Flex Edit Layout - Page Block - UI - PM - To verify "Header Instruction Text" is rendering on left top of page block same as text added in "Header Instruction Text" on page block config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Header Instruction Text |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | Peer Review Block | Awards             | Name                      | PB-10075                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I wait for "3" seconds
    Then I see "Peer Review Block" shown as header instruction text
    Examples:
      | User |
      | PM   |

  @324601 @324603  @Sprint13 @R
  Scenario Outline: LWC-Flex Edit Layout - Page Block - UI - PM - To verify page block is not available on edit layout when "Is Active" checkbox is unchecked in page block config
  | LWC-Flex Edit Layout - Page Block - Config- Admin- To verify page block is not available on edit layout when "Is Active" checkbox is unchecked in page block config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active | true              | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | false         | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @324606 @324608  @Sprint13 @R
  Scenario Outline: LWC-Flex Edit Layout - Page Block - UI - PM - To verify page block is available on edit layout when "Is Active" checkbox is checked in page block config
  | LWC-Flex View Layout - Page Block - Config- Admin- To verify page block is available on edit layout when "Is Active" checkbox is checked in page block config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active | true              | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | true          | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I see field "Peer Reviewers" inside page block
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @313967 @313968  @Sprint13 @R
  Scenario Outline: LWC-Flex View Layout - Page Block - Config- Admin- To verify page block is not available on view layout when "Is Active" checkbox is unchecked in page block config
  | LWC-Flex View Layout - Page Block - UI - PM - To verify page block is not available on view layout when "Is Active" checkbox is unchecked in page block config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active | true              | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | false         | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @313970 @313971  @Sprint13 @R
  Scenario Outline: LWC-Flex View Layout - Page Block - UI - PM - To verify page block is available on view layout when "Is Active" checkbox is checked in page block config
  | LWC-Flex View Layout - Page Block - Config- Admin- To verify page block is available on edit layout when "Is Active" checkbox is checked in page block config|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active | true              | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active | true          | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I see field "Peer Reviewers" inside page block
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @314037 @314039  @Sprint13
  Scenario Outline: LWC-Flex View Layout - Page Block - Config- Admin- To verify "Header Instruction Text" is rendering on left top of page block same as text added in "Header Instruction Text" on page block config.
  |LWC-Flex View Layout - Page Block - UI - PM - To verify "Header Instruction Text" is rendering on left top of page block same as text added in "Header Instruction Text" on page block config.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Header Instruction Text |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | Peer Review Block | Awards             | Name                      | PB-10075                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I see "Peer Review Block" shown as header instruction text
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @330565 @Sprint13 @R
  Scenario: LWC - Flex View Layout - Page Block Hide Logic - Admin - Config - To verify that when user select 'System Administrator' in 'Hide For Profile' then that block should be hide for System Administrator profile.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Hide For Profile |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For Profile | System Administrator | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation ADMIN user"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block

  @330583 @Sprint13 @R
  Scenario Outline: LWC - Flex View Layout - Page Block Hide Logic - Admin - Config - To verify that when user select 'PM' in 'Hide For Profile' then that page block should be hide for PM profile.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Hide For Profile |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For Profile | <User>        | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    Examples:
      | User |
      | PM   |

  @330869 @330871  @Sprint13 @R
  Scenario Outline: LWC - Flex View Layout - Page Block Hide Logic - Admin - Config - To verify that when user added 'Internal' in 'Hide For User' then that page block should be hide for all Internal users.
  |LWC - Flex View Layout - Page Block Hide Logic - PM - UI - To verify that when user added 'Internal' in 'Hide For User' then that page block should be hide for all Internal users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Hide For User |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName     | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For User | Internal      | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @330872  @Sprint13
  Scenario: LWC - Flex View Layout - Page Block Hide Logic - Admin - Config - To verify that when user added 'Applicant' in 'Hide For User' then that page block should be hide for all applicant users.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | coreComponentField               | filterId         |
      | Page Block            | Hide For User |                   | Annoucement External Profile-FOA | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName     | fieldNewValue | coreComponentField               | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Hide For User | Applicant     | Annoucement External Profile-FOA | Name                      | PB-12374                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    Then I cannot see field "Opportunity Information" inside page block

  @338632 @338637
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any page block using Left operand as ‘$ User’ and operator as ‘In’ that page block should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                        | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserFNameInFreeTextAutomation | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @338642 @338647
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page block using Left operand as ‘$ User’ and operator as ‘Not In’ that page block should display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                           | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserFNameNotInFreeTextAutomation | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I see "Program Specific Settings" page block displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @338651 @338654
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page block using Left operand as ‘$ User’ and operator as ‘Equals’ that page block should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                            | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserFNameEqualsFreeTextAutomation | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @338681 @338685
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any page block using Left operand as ‘$ User’ and operator as ‘Contains’ that page block should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                              | Grantor State Program | Name                      | PB-13988                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserFNameContainsFreeTextAutomation | Grantor State Program | Name                      | PB-13988                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @338655 @R
  Scenario Outline: LWC- Flex View Layout-PB Hide Expression Builder - Admin - Config-Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than equals’ block should not display on UI for values greater than equals value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                               | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDLessThanEqualsFreeTextADMIN | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed
    Examples:
      | User  |
      | ADMIN |

  @338657
  Scenario Outline: LWC - View Layout - PB Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than equals’ block should not display on UI for values greater than equals value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                            | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDLessThanEqualsFreeTextPM | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed
    Examples:
      | User |
      | PM   |

  @338661 @R
  Scenario Outline: LWC -View Layout -PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than equals’ block should not display on UI for values lesser than equals value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                         | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                                  | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDGreaterThanEqualsFreeTextADMIN | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I cannot see field "Program Specific Settings" inside page block
#    Then I d not see "Program Specific Settings" page block displayed
    Examples:
      | User  |
      | ADMIN |

  @338664
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than equals’ block should not display on UI for values lesser than value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                               | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDGreaterThanEqualsFreeTextPM | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed
    Examples:
      | User |
      | PM   |

  @338668
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than’ should not display on UI for values greater than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                         | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDLessThanFreeTextADMIN | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed
    Examples:
      | User  |
      | ADMIN |

  @338671
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - PM - UI  - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than’ block should not display on UI for values greater than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                      | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDLessThanFreeTextPM | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed
    Examples:
      | User |
      | PM   |

  @338675
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder -Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than’ should not display on UI for values lesser than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                            | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDGreaterThanFreeTextADMIN | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed
    Examples:
      | User  |
      | ADMIN |

  @338678
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than’ should not display on UI for values lesser than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                         | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDGreaterThanFreeTextPM | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed
    Examples:
      | User |
      | PM   |

  @338519 @R
  Scenario: LWC - Flex View Layout - PB Hide Expression Builder - PM - UI - Verify if we configure hide expression for any page block using Left operand as ‘Field’ and operator as ‘Not In’ that page block should display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlockFieldNotInFreeTextTest | Grantor State Program | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - All"
#    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
#    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "View" action for first record of table
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I can see "Program Specific Settings" page block displayed

  @351720 @351721
  Scenario Outline: LWC - Flex Edit Layout - Page Block Hide Expression Builder - Admin - Config - To verify that when user select 'User type' as Left Operand, 'IN' as operator and 'Internal' as Right Operand then action should be hidden for all Internal users.
  | LWC - Flex Edit Layout - Page Block Hide Expression Builder - PM - UI - To verify that when user select 'User type' as Left Operand, 'IN' as operator and 'Internal' as Right Operand then page block should be hidden for all Internal users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active            | true              | Awards             | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                       | Awards             | Name                      | PB-12306                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:pageBlockHideLogicPB12306 | Awards             | Name                      | PB-12306                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I cannot see field "Subrecipient Information" inside page block
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @351723
  Scenario: LWC - Flex Edit Layout - Page Block Hide Expression Builder - SPI - Config - To verify that when user select User type as Left Operand, 'IN' as operator and 'Applicant' as Right Operand then page block should be hidden for all Applicant users.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField        | filterId         |
      | Page Block            | Is Active            | true              | Recipient Pre-Application | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Recipient Pre-Application | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                       | Recipient Pre-Application | Name                      | PB-12004                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:pageBlockHideLogicPB12004 | Recipient Pre-Application | Name                      | PB-12004                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    Then I cannot see field "Applicant Information" inside page block

  @330929 @330998
  Scenario Outline: LWC - Flex View Layout - Page Block Hide Expression Builder - Admin - Config - To verify that when user select 'User type' as Left Operand, 'IN' as operator and 'Internal' as Right Operand then action should be hidden for all Internal users.
  | LWC - Flex View Layout - Page Block Hide Expression Builder - PM - UI - To verify that when user select 'User type' as Left Operand, 'IN' as operator and 'Internal' as Right Operand then page block should be hidden for all Internal users.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active            | true              | Awards             | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                       | Awards             | Name                      | PB-12306                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:pageBlockHideLogicPB12306 | Awards             | Name                      | PB-12306                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I cannot see field "Subrecipient Information" inside page block
    Examples:
      | User |
      | PM   |
#      | ADMIN |

  @331249 @331250 @R
  Scenario Outline: LWC - Flex View Layout - Page Block Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'View' as Right Operand then page block should be hidden for view layout.
  | LWC - Flex View Layout - Page Block Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'View' as Right Operand then page block should be hidden for view layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active            | true              | Awards             | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                     | Awards             | Name                      | PB-11941                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:pageBlockHideLogicForContextViewPB12306 | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  ######Program should be in active state##########
  @338532 @338535 @R
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page block using Left operand as ‘Field’ and operator as ‘Not Equals’ that page block should display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                           | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                    | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlockFieldNotEqualsFreeTextTest | Grantor State Program | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - All"
    And I click on "View" action for first record of table
    When I navigate to "Overview" sub tab
    Then I can not see "Program Specific Settings" page block displayed
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @351758 @351759 @R
  Scenario Outline: LWC - Flex Edit Layout - Page Block Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'Edit' as Right Operand then page block should be hidden for edit layout.
  | LWC - Flex Edit Layout - Page Block Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'IN' as operator and 'Edit' as Right Operand then page block should be hidden for edit layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active            | true              | Awards             | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                     | Awards             | Name                      | PB-11941                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:pageBlockHideLogicForContextEditPB12306 | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @338541 @338546
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - Admin- Config -Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than equals’ page block should not display on UI for values greater than equals value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block                               | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                         | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                  | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block:Page Block Detail             | Is Active            | true                                                                  | Grantor State Program | Name                      | PB-11275                                |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEBPageBlockFieldFundedAmtLessThanEqualsFreeText3000 | Grantor State Program | Name                      | PB-11275                                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @351837 @R
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - Admin - Config - To verify that when user select User type as Left Operand, 'NOT IN' as operator and 'Reviewer' as Right Operand then page block should be hidden for all users except reviewer users.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active            | true              | Awards             | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                             | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                      | Awards             | Name                      | PB-11941                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:pageBlockHideForNotInRev | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    Examples:
      | User  |
      | ADMIN |

  @351840 @351845 @331321 @331333 @R
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'View' as Right Operand then page block should be hidden for all layouts except view layout.
  | LWC - Flex Edit Layout - PB Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'View' as Right Operand then page block should be hidden for all layouts except view layout.|
  | LWC - Flex View Layout - PB Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'View' as Right Operand then page block should be hidden for all layouts except view layout.|
  | LWC - Flex View Layout - PB Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'View' as Right Operand then page block should be hidden for all layouts except view layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active            | true              | Awards             | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                           | Awards             | Name                      | PB-11941                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:pageBlockHideNotInContextView | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I see field "Peer Reviewers" inside page block
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @338551 @338554
  Scenario Outline: LWC- View Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expresion using Left operand as ‘Field’ and operator as ‘Greater than equals’ block should not display on UI for values less than equals value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block                               | Is Active            | false             | Grantor State Program | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                            | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                     | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block:Page Block Detail             | Is Active            | true                                                                     | Grantor State Program | Name                      | PB-11275                                |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEBPageBlockFieldFundedAmtGreaterThanEqualsFreeText2999 | Grantor State Program | Name                      | PB-11275                                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @351854 @351888 @331337 @331342 @R
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Edit' as Right Operand then page block should be hidden for all layouts except edit layout.
  | LWC - Flex Edit Layout - PB Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Edit' as Right Operand then page block should be hidden for all layouts except edit layout.|
  | LWC - Flex View Layout - PB Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Edit' as Right Operand then page block should be hidden for all layouts except edit layout.|
  | LWC - Flex View Layout - PB Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Edit' as Right Operand then page block should be hidden for all layouts except edit layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active            | true              | Awards             | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                           | Awards             | Name                      | PB-11941                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:pageBlockHideNotInContextEdit | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    #351854 #351888
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I see field "Peer Reviewers" inside page block
    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @338585 @338587
  Scenario Outline: LWC - Flex View Layout-PB Hide Expression Builder -Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than’ block should not display on UI for values greater than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block                               | Is Active            | false             | Grantor State Program | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block:Page Block Detail             | Is Active            | true                                                            | Grantor State Program | Name                      | PB-11275                                |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEBPageBlockFieldFundedAmtLessThanFreeText3001 | Grantor State Program | Name                      | PB-11275                                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @338588 @338593
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder- Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than’ page block not display on UI for values lesser than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block                               | Is Active            | false             | Grantor State Program | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                               | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block:Page Block Detail             | Is Active            | true                                                               | Grantor State Program | Name                      | PB-11275                                |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEBPageBlockFieldFundedAmtGreaterThanFreeText2999 | Grantor State Program | Name                      | PB-11275                                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @338599 @338629
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page block using Left operand as ‘Field’ and operator as ‘Contains’ that page block should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block                               | Is Active            | false             | Grantor State Program | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block:Page Block Detail             | Is Active            | true                                                                | Grantor State Program | Name                      | PB-11275                                |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEBPageBlockFieldTypeContainsFreeTextProjectGrants | Grantor State Program | Name                      | PB-11275                                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
#      | ADMIN |
      | PM   |

    ############## Page Block - Edit Layout - HEB ##############
  @352066 @352067
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any block using Left operand as ‘Field’ and operator as ‘Equals’ that block should not display on edit layout for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | ApiGeneratedId:0 |
      | Page Block                               | Is Active            | false             | Grantor State Program | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Grantor State Program | Name                      | PBD-42114                  |
      | Page Block:Page Block Detail             | Is Active            | true                                                                | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEBPageBlockFieldTypeContainsFreeTextProjectGrants | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @352068 @352070
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page block using Left operand as ‘Field’ and operator as ‘Not Equals’ that page block should display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                        | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                                 | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlockFieldTypeNotEqualsFreeTextProjectGrants | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I see "Program Specific Settings" page block displayed

    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @352073 @352097
  Scenario Outline: LWC -Edit Layout -PB Hide Expression Builder - Admin- Config -Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than equals’ page block should not display on UI for values greater than equals value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block                               | Is Active            | false             | Grantor State Program | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                         | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                  | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block:Page Block Detail             | Is Active            | true                                                                  | Grantor State Program | Name                      | PB-11275                                |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEBPageBlockFieldFundedAmtLessThanEqualsFreeText3000 | Grantor State Program | Name                      | PB-11275                                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I click on "Edit" in the page details
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @352105 @352106
  Scenario Outline: LWC -Edit Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than equals’ block should not display on UI for values less than equals value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block                               | Is Active            | false             | Grantor State Program | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                            | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                     | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block:Page Block Detail             | Is Active            | true                                                                     | Grantor State Program | Name                      | PB-11275                                |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEBPageBlockFieldFundedAmtGreaterThanEqualsFreeText2999 | Grantor State Program | Name                      | PB-11275                                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I click on "Edit" in the page details
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @352110 @352111
  Scenario Outline: LWC - Flex Edit Layout-PB Hide Expression Builder - Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Less than’ block should not display on UI for values greater than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block                               | Is Active            | false             | Grantor State Program | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block:Page Block Detail             | Is Active            | true                                                            | Grantor State Program | Name                      | PB-11275                                |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEBPageBlockFieldFundedAmtLessThanFreeText3001 | Grantor State Program | Name                      | PB-11275                                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I click on "Edit" in the page details
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @352117 @352120
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder- Admin- Config- Verify if we configure hide expression using Left operand as ‘Field’ and operator as ‘Greater than’ page block not display on UI for values lesser than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block                               | Is Active            | false             | Grantor State Program | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                               | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block:Page Block Detail             | Is Active            | true                                                               | Grantor State Program | Name                      | PB-11275                                |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEBPageBlockFieldFundedAmtGreaterThanFreeText2999 | Grantor State Program | Name                      | PB-11275                                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I click on "Edit" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @352642 @352643 @382283 @lwcsanity
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page block using Left operand as ‘Field’ and operator as ‘Contains’ that page block should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block                               | Is Active            | false             | Grantor State Program | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Grantor State Program | Name                      | {pagelayout:CurrencyField_FundedAmount} |
      | Page Block:Page Block Detail             | Is Active            | true                                                                | Grantor State Program | Name                      | PB-11275                                |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEBPageBlockFieldTypeContainsFreeTextProjectGrants | Grantor State Program | Name                      | PB-11275                                |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I enter value "3000" into field "FundedAmount__c"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I click on "Edit" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
#      | ADMIN |
      | PM   |

  @352644 @352645
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any page block using Left operand as ‘$ User’ and operator as ‘In’ that page block should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                               | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                        | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserFNameInFreeTextAutomation | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @352651 @352652
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page block using Left operand as ‘$ User’ and operator as ‘Not In’ that page block should display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                           | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserFNameNotInFreeTextAutomation | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I see "Program Specific Settings" page block displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @352657 @352659
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression for any page block using Left operand as ‘$ User’ and operator as ‘Equals’ that page block should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                            | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserFNameEqualsFreeTextAutomation | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @352660
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than equals’ block should not display on UI for values greater than equals value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                               | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDLessThanEqualsFreeTextADMIN | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User  |
      | ADMIN |

  @352661
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than equals’ block should not display on UI for values greater than equals value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                            | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDLessThanEqualsFreeTextPM | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
      | PM   |

  @352663 @R
  Scenario Outline: LWC-Edit Layout -PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than equals’ block should not display on UI for values less than equals value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                         | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                                  | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDGreaterThanEqualsFreeTextADMIN | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User  |
      | ADMIN |

  @352666
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than equals’ block should not display on UI for values lesser than value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                               | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDGreaterThanEqualsFreeTextPM | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
      | PM   |

  @352681
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than’ should not display on UI for values greater than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                         | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDLessThanFreeTextADMIN | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User  |
      | ADMIN |

  @352684
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - PM - UI  - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Less than’ block should not display on UI for values greater than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                      | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDLessThanFreeTextPM | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
      | PM   |

  @352685
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder -Admin - Config - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than’ should not display on UI for values lesser than to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                            | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDGreaterThanFreeTextADMIN | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User  |
      | ADMIN |

  @352687
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder - PM - UI - Verify if we configure hide expression using Left operand as ‘$ User’ and operator as ‘Greater than’ should not display on UI for values lesser than equals to the value in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                         | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserAccIDGreaterThanFreeTextPM | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
      | PM   |

  @352688 @352375
  Scenario Outline: LWC - Flex Edit Layout - PB Hide Expression Builder- Admin - Config - Verify if we configure hide expression for any page block using Left operand as ‘$ User’ and operator as ‘Contains’ that page block should not display on UI for values in right operand
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Is Active            | false             | Grantor State Program | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Grantor State Program | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                                              | Grantor State Program | Name                      | PB-11275                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEBPageBlock$UserFNameContainsFreeTextAutomation | Grantor State Program | Name                      | PB-11275                   |
    Given I delete the record "Automation Program For Test" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I can not see "Program Specific Settings" page block displayed

    Examples:
      | User |
    #  | ADMIN |
      | PM   |

  @331362 @331366 @351890 @351896 @382280 @lwcsanity @382281 @R
  Scenario Outline: LWC - Flex View Layout - PB Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Create' as Right Operand then page block should be hidden for all layouts except create layout.
  | LWC - Flex View Layout - PB Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Create' as Right Operand then page block should be hidden for all layouts except create layout.|
  | LWC - Flex Edit Layout - PB Hide Expression Builder - Admin - Config - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Create' as Right Operand then page block should be hidden for all layouts except create layout.|
  | LWC - Flex Edit Layout - PB Hide Expression Builder - PM - UI - To verify that when user select 'Context' as Left Operand, 'NOT IN' as operator and 'Create' as Right Operand then page block should be hidden for all layouts except create layout.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Is Active            | true              | Awards             | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | Awards             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                    | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Is Active            | true                                             | Awards             | Name                      | PB-11941                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:pageBlockHideNotInContextCreate | Awards             | Name                      | PB-11941                   |
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "Automation <User> user"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "Edit" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    When I navigate to "Responsibilities" sub tab
    Then I cannot see field "Peer Reviewers" inside page block
    Examples:
      | User |
#        | ADMIN |
      | PM   |
