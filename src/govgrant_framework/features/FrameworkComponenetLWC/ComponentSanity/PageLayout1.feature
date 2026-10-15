@ComponentSanity @PagelayoutComponentSanity @Page3 @ComponentSanity3
Feature: Test pagelayout component

  @549433_17 @549434_17 @549435_17 @549436_17 @549438_17 @549521_17
  Scenario Outline: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
  |3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.|
  |3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field           | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false           | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #Read Only Expression JSON - for UserType In Internal Reviever
    Then I softly see field "<field label>" inside page block
    Then I softly see fields "<field api>" is in edit mode

    Examples:
      | fieldName                 | fieldNewValue                                                          | coreComponentSubFieldValue                       | field label                            | field api                           |
      | Read Only Expression JSON | govgrants_config:HideForUserAppAsReviewerInternalPostCreateApplication | {SavedValue:CFDANumber__c}                       | Assistance Listing #                   | CFDANumber__c                       |
      | Read Only Expression JSON | govgrants_config:HideForUserAppAsReviewerInternalPostCreateApplication | {SavedValue:ZipCode4Externsion__c}               | X_4-Digit Zip Code Extension           | ZipCode4Externsion__c               |
      | Read Only Expression JSON | govgrants_config:HideForUserAppAsReviewerInternalPostCreateApplication | {SavedValue:ApplicationDeadlineWithDateTime__c}  | Application Deadline                   | ApplicationDeadlineWithDateTime__c  |
      | Read Only Expression JSON | govgrants_config:HideForUserAppAsReviewerInternalPostCreateApplication | {SavedValue:AreAnyStateSpecificFormsAttached__c} | Are any state specific forms attached? | AreAnyStateSpecificFormsAttached__c |
      | Read Only Expression JSON | govgrants_config:HideForUserAppAsReviewerInternalPostCreateApplication | {SavedValue:AuthorizedRepresentativePhone__c}    | Authorized Representative Phone        | AuthorizedRepresentativePhone__c    |
      | Read Only Expression JSON | govgrants_config:HideForUserAppAsReviewerInternalPostCreateApplication | {SavedValue:AOR_Contact__c}                      | AOR Contact                            | AOR_Contact__c                      |

  @549433_18 @549434_18 @549435_18 @549436_18 @549438_18 @549521_18
  Scenario Outline: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
  |3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.|
  |3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field           | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false           | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #Read Only Expression JSON - for UserApp Reciepient
    Then I softly see field "<field label>" inside page block
    Then I softly see field "<field api>" is not editable

    Examples:
      | fieldName                 | fieldNewValue                                                          | coreComponentSubFieldValue                       | field label                            | field api                           |
      | Read Only Expression JSON | govgrants_config:HideForUserContextViewOrEditOrCretaeCreateApplication | {SavedValue:CFDANumber__c}                       | Assistance Listing #                   | CFDANumber__c                       |
      | Read Only Expression JSON | govgrants_config:HideForUserContextViewOrEditOrCretaeCreateApplication | {SavedValue:ZipCode4Externsion__c}               | X_4-Digit Zip Code Extension           | ZipCode4Externsion__c               |
      | Read Only Expression JSON | govgrants_config:HideForUserContextViewOrEditOrCretaeCreateApplication | {SavedValue:ApplicationDeadlineWithDateTime__c}  | Application Deadline                   | ApplicationDeadlineWithDateTime__c  |
      | Read Only Expression JSON | govgrants_config:HideForUserContextViewOrEditOrCretaeCreateApplication | {SavedValue:AreAnyStateSpecificFormsAttached__c} | Are any state specific forms attached? | AreAnyStateSpecificFormsAttached__c |
      | Read Only Expression JSON | govgrants_config:HideForUserContextViewOrEditOrCretaeCreateApplication | {SavedValue:AuthorizedRepresentativePhone__c}    | Authorized Representative Phone        | AuthorizedRepresentativePhone__c    |
      | Read Only Expression JSON | govgrants_config:HideForUserContextViewOrEditOrCretaeCreateApplication | {SavedValue:AOR_Contact__c}                      | AOR Contact                            | AOR_Contact__c                      |

  @549433_19 @549434_19 @549435_19 @549436_19 @549438_19 @549521_19
  Scenario Outline: 3.0: Page Layout: SPI: To verify Numeric & Calculated Fields under opportunity overview page block
  |3.0: Page Layout: SPI: To verify text-based field under opportunity overview page block.|
  |3.0: Page Layout: SPI: To verify Date & Time Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Boolean / True-False Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify Contact & Web Fields under opportunity overview page block|
  |3.0: Page Layout: SPI: To verify lookup Fields under opportunity overview page block|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field           | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue   | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true            | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Is Hidden Field      | false           | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                 | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
      | Page Block Config:Page Block Rule Detail | <fieldName>          | <fieldNewValue> | Recipient ApplicationView | Name                      | <coreComponentSubFieldValue> |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #Read Only Expression JSON - for Status Equals Create
    Then I softly see field "<field label>" inside page block
    Then I softly see field "<field api>" is not editable

    Examples:
      | fieldName                 | fieldNewValue                                           | coreComponentSubFieldValue                       | field label                            | field api                           |
      | Read Only Expression JSON | govgrants_config:HideForStatusAsCreateCreateApplication | {SavedValue:CFDANumber__c}                       | Assistance Listing #                   | CFDANumber__c                       |
      | Read Only Expression JSON | govgrants_config:HideForStatusAsCreateCreateApplication | {SavedValue:ZipCode4Externsion__c}               | X_4-Digit Zip Code Extension           | ZipCode4Externsion__c               |
      | Read Only Expression JSON | govgrants_config:HideForStatusAsCreateCreateApplication | {SavedValue:ApplicationDeadlineWithDateTime__c}  | Application Deadline                   | ApplicationDeadlineWithDateTime__c  |
      | Read Only Expression JSON | govgrants_config:HideForStatusAsCreateCreateApplication | {SavedValue:AreAnyStateSpecificFormsAttached__c} | Are any state specific forms attached? | AreAnyStateSpecificFormsAttached__c |
      | Read Only Expression JSON | govgrants_config:HideForStatusAsCreateCreateApplication | {SavedValue:AuthorizedRepresentativePhone__c}    | Authorized Representative Phone        | AuthorizedRepresentativePhone__c    |
      | Read Only Expression JSON | govgrants_config:HideForStatusAsCreateCreateApplication | {SavedValue:AOR_Contact__c}                      | AOR Contact                            | AOR_Contact__c                      |
