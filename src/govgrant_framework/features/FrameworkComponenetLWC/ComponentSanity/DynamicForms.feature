@Dynamicorms
Feature: LWC - Test Set -Dynamic form - Support to create capture form. (Support of dynamic form)
  Test Suite Link: https://reisystems.atlassian.net/browse/FW-24494

  @FW-24495
  Scenario: LWC: Dynamic Form: PM: To verify that user can able to see Dynamic Form.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed

  @FW-24496
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to see form instruction on dynamic Form.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Capture Form          | Form Instruction |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Form:General  | Form Instruction | {SavedValue:PageInstructionText} | {SavedValue:CaptureForm} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "view more" hyperlink in page instruction block
    Then I see "{SavedValue:PageInstructionText}" shown as page instruction text

  @FW-24497
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to see section level instruction.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue | filterId         |
      | Capture Section       | Section Instruction |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName           | fieldNewValue    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Section:General | Section Instruction | Instruction Text | {SavedValue:Testsection1} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I see "Instruction Text" shown as header instruction text

  @FW-24688
  Scenario Outline: LWC: Dynamic Form: PM: To Verify that user can be able to see section level HELP TEXT
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Capture Section       | Section Help Text |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName         | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Section:General | Section Help Text | <help text>   | {SavedValue:Testsection1} |                           |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly see "Test section 1" page block displayed
    When I hovering mouse on help text icon inside page block detail "Test section 1"
    Then I softly see "Page block Help Text" shown as help text
    Examples:
      | User | help text                                                                                                                                                                           |
      | PM   | Section 1 Help Text: The quick brown fox jumps over 13 lazy dogs! "Can you read this?" she asked. Yes—I can. Email: example@test.com; Website: https://example.com/path?x=1&y=2#top |

  @FW-24690
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to configure rich text area comment support for question.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue        | filterId         |
      | Capture Item          | Comment Applicable? | Long TextArea Applicable | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Comment Applicable? | Rich TextArea Applicable | {SavedValue:WrittenItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly see "rich-text-editor" editor in "Comments" section

  @FW-24691
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to configure rich text area comment support for question.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue        | filterId         |
      | Capture Item          | Comment Applicable? | Long TextArea Applicable | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Comment Applicable? | Long TextArea Applicable | {SavedValue:WrittenItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly see "textarea" editor in "Comments" section

  @FW-24712_1 @written-datatype
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:WrittenItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                        |
      | Written is required to save under Test section 1. |

  @FW-24712_2 @date-datatype
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:DateItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                     |
      | Date is required to save under Test section 1. |

  @FW-24712_3 @currency-datatype
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:CurrencyItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                         |
      | Currency is required to save under Test section 1. |

  @FW-24712_4 @percent-datatype
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:PercentItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                        |
      | Percent is required to save under Test section 1. |

  @FW-24712_5 @checkbox-datatype
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:CheckboxItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                         |
      | Checkbox is required to save under Test section 1. |

  @FW-24712_6 @number-datatype
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:NumberItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                       |
      | Number is required to save under Test section 1. |

  @FW-24712_7 @picklist-datatype
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:PicklistItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                         |
      | Picklist is required to save under Test section 1. |

  @FW-24713_1 @written-datatype
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to submit for written type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to submit | {SavedValue:WrittenItem} |                           |                            |
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Announcement__c/a1bDa000001jpqRIAQ/view"
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Written in Section Test section 1 question not answered           |
      | Written Section 2 in Section Test section 2 question not answered |

  @FW-24713_2 @date-datatype
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to submit for date type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to submit | {SavedValue:DateItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Date in Section Test section 1 question not answered |

  @FW-24713_3 @currency-datatype
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to submit for currency type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue      | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to submit | {SavedValue:CurrencyItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Currency in Section Test section 1 question not answered |

  @FW-24713_4 @percent-datatype
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to submit for percent type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to submit | {SavedValue:PercentItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Percent in Section Test section 1 question not answered |

  @FW-24713_5 @checkbox-datatype
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to submit for checkbox type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:CheckboxItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Checkbox in Section Test section 1 question not answered |

  @FW-24713_6 @number-datatype
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to submit for number type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue      | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to submit | {SavedValue:NumberItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Number in Section Test section 1 question not answered |

  @FW-24713_7 @picklist-datatype
  Scenario:LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to submit for picklist type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:PicklistItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    Then I can see row level action button "View" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Edit" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    Then I can see row level action button "Preview" against "Test Capture Form 1" in flex table with id "---announcement:-:DynamicFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Picklist in Section Test section 1 question not answered |

  @FW-24714
  Scenario: LWC: Dynamic Form: PM: To Verify that the user can download the dynamic form PDF.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
     # And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Announcement__c/a1bDa000001jpqRIAQ/view"
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I enter value "Test Data" into field "Written"
    And I click on "Save" in the page details
    And I click on "menu" button inside page details in lwc
    And I pause execution for "3" seconds
    Then I see "Download as PDF" button is displayed
    When I click on "Download as PDF" in the page details
    Then I softly see new tab is opened

  @FW-24716
  Scenario: LWC: Dynamic Form: PM:To verify that when the "Hide PDF Download" configuration is set to true, the user is unable to see the "Download as PDF" action on the dynamic form.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName         | fieldOrignalValue | filterId         |
      | Page Layout           | Hide Pdf Download | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName         | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Hide Pdf Download | true          | Test Capture Form 1 |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
     # And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Announcement__c/a1bDa000001jpqRIAQ/view"
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I enter value "Test Data" into field "Written"
    And I click on "Save" in the page details
    And I click on "menu" button inside page details in lwc
    And I pause execution for "3" seconds
    Then I softly do not see "Download as PDF" button is displayed

  @FW-24737
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save for written type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:WrittenItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see asterisk mark at "Written" field in LWC
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                        |
      | Written is required to save under Test section 1. |

  @FW-24738
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save for date type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:DateItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see asterisk mark at "Date" field in LWC
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                     |
      | Date is required to save under Test section 1. |

  @FW-24739
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save for currency type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:CurrencyItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see asterisk mark at "Currency" field in LWC
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                         |
      | Currency is required to save under Test section 1. |

  @FW-24740
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save for percent type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:PercentItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see asterisk mark at "Percent" field in LWC
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                        |
      | Percent is required to save under Test section 1. |

  @FW-24741
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save for checkbox type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:CheckboxItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see asterisk mark at "Checkbox" field in LWC
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                         |
      | Checkbox is required to save under Test section 1. |

  @FW-24742
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save for number type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:NumberItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see asterisk mark at "Number" field in LWC
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                       |
      | Number is required to save under Test section 1. |

  @FW-24743
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to save for picklist type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to save | {SavedValue:PicklistItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    Then I softly see asterisk mark at "Picklist" field in LWC
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                         |
      | Picklist is required to save under Test section 1. |

  @FW-24747
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to submit for date type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to submit | {SavedValue:DateItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see required to submit symbol at "Date" field in LWC
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Date in Section Test section 1 question not answered |

  @FW-24748
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to submit for currency type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue      | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to submit | {SavedValue:CurrencyItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see required to submit symbol at "Currency" field in LWC
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Currency in Section Test section 1 question not answered |

  @FW-24749
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to submit for percent type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue      | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to submit | {SavedValue:PercentItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see required to submit symbol at "Percent" field in LWC
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Percent in Section Test section 1 question not answered |

  @FW-24750
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to submit for checkbox type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue      | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to submit | {SavedValue:CheckboxItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see required to submit symbol at "Checkbox" field in LWC
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Checkbox in Section Test section 1 question not answered |

  @FW-24751
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to submit for number type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue      | coreComponentField      | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to submit | {SavedValue:NumberItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see required to submit symbol at "Number" field in LWC
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Number in Section Test section 1 question not answered |

  @FW-24752
  Scenario: LWC: Dynamic Form: PM: To Verify that user can be able to set question behavior as required to submit for picklist type field.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Capture Item          | Question Applicable ? |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue      | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Question Applicable ? | Required to submit | {SavedValue:PicklistItem} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    Then I softly see required to submit symbol at "Picklist" field in LWC
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Picklist in Section Test section 1 question not answered |

  @FW-29373
  Scenario: LWC: Dynamic Form: PM: To Verify that clicking the preview action opens the Dynamic Form in preview mode.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Preview" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly see "Test section 1" page block displayed
    Then I softly see only field "Written" in page details
    Then I softly see only field "Date" in page details
    Then I softly see only field "Currency" in page details
    Then I softly see only field "Percent" in page details
    Then I softly see only field "Checkbox" in page details
    Then I softly see only field "Number" in page details
    Then I softly see only field "Picklist" in page details

  @FW-29372
  Scenario: LWC: Dynamic Form: PM: To Verify that clicking the View action opens the Dynamic Form in View mode.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly see "Test section 1" page block displayed
    Then I softly see only field "Written" in page details
    Then I softly see only field "Date" in page details
    Then I softly see only field "Currency" in page details
    Then I softly see only field "Percent" in page details
    Then I softly see only field "Checkbox" in page details
    Then I softly see only field "Number" in page details
    Then I softly see only field "Picklist" in page details

  @FW-29355
  Scenario: LWC: Dynamic Form: PM: Verify that user can be able to hide action "Test Action class" using hide expression profile.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Capture Action        | Is Active            | true              | ApiGeneratedId:0 |
      | Capture Action        | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory  | fieldName            | fieldNewValue                               | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Action:General | Is Active            | true                                        | {SavedValue:TestActionClass} | Name                      | Test Action Class          |
      | Capture Action:General | Hide Expression JSON | govgrants_config:TestActionClassProfileInPM | {SavedValue:TestActionClass} | Name                      | Test Action Class          |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    When I click on "menu" button inside page details in lwc
    Then I do not see "Test Action Class" button is displayed

  @FW-29352
  Scenario: LWC: Dynamic Form: PM: To Verify that action "Test Action class" should be visible on dynamic form.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "menu" button inside page details in lwc
    Then I softly see "Test Action Class" button is displayed

  @FW-29353
  Scenario: LWC: Dynamic Form: PM: Verify that when I click on "Test Action class" action then I see Page messages.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    When I click on "Test Action Class" in the page details
    Then I see "message 2 confirm" page message displayed in page layout
    Then I see "message 1 info" page message displayed in page layout

  @FW-29354
  Scenario: LWC: Dynamic Form: PM: Verify that user can be able to hide action "Test Action class" using expression usertype.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Capture Form Action   | Is Active            | true              | ApiGeneratedId:0 |
      | Capture Form Action   | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory  | fieldName            | fieldNewValue                                      | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Action:General | Is Active            | true                                               | {SavedValue:TestActionClass} | Name                      | Test Action Class          |
      | Capture Action:General | Hide Expression JSON | govgrants_config:TestActionClassUserTypeInInternal | {SavedValue:TestActionClass} | Name                      | Test Action Class          |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "menu" button inside page details in lwc
    Then I do not see "Test Action Class" button is displayed

  @FW-29351
  Scenario: LWC: Dynamic Form: PM: Verify that user can be able to hide action "Test Action URL" using hide expression profile.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Capture Form Action   | Is Active            | true              | ApiGeneratedId:0 |
      | Capture Form Action   | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory  | fieldName            | fieldNewValue                               | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Action:General | Is Active            | true                                        | {SavedValue:TestActionURL} | Name                      | Test Action URL            |
      | Capture Action:General | Hide Expression JSON | govgrants_config:TestActionClassProfileInPM | {SavedValue:TestActionURL} | Name                      | Test Action URL            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I do not see "Test Action URL" button is displayed

  @FW-29350
  Scenario: LWC: Dynamic Form: PM: Verify that user can be able to hide action "Test Action URL" using expression usertype
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Capture Form Action   | Is Active            | true              | ApiGeneratedId:0 |
      | Capture Form Action   | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory  | fieldName            | fieldNewValue                                      | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Action:General | Is Active            | true                                               | {SavedValue:TestActionURL} | Name                      | Test Action URL            |
      | Capture Action:General | Hide Expression JSON | govgrants_config:TestActionClassUserTypeInInternal | {SavedValue:TestActionURL} | Name                      | Test Action URL            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I do not see "Test Action URL" button is displayed

  @FW-29349
  Scenario: LWC: Dynamic Form: PM: Verify that clicking the "Test Action URL" action opens a new tab with the URL specified in the Action Target Configuration.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    When I click on "Test Action URL" in the page details
    Then I softly see new tab is opened

  @FW-29348
  Scenario: LWC: Dynamic Form: PM: To Verify that action "Test Action URL" should be visible on dynamic form.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I click on "menu" button inside page details in lwc
    Then I softly see "Test Action URL" button is displayed

  @FW-29374
  Scenario: LWC: Dynamic Form: PM: To Verify that clicking the preview action opens the Dynamic Form in edit mode.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                          | filterId         |
      | Flex Table Action     | Action URL Long LWC | /lightning/r/CapturePackage__c/{!rowId}/view?c__parentRecordId={!recordId}&c__Mode=preview | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                           | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Action URL Long LWC | /lightning/r/CapturePackage__c/{!rowId}/view?c__parentRecordId={!recordId}&c__Mode=edit | DynamicForms       | Name                      | Preview                    |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Preview" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I see "Save" button is displayed
    Then I see "Cancel" button is displayed

  @FW-29346
  Scenario: LWC: Dynamic Form: PM: To Verify that the user can be able to see captured response and score for picklist data type.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I enter value "1,2,3,4" into field "Picklist"
    And I click on "Save" in the page details
    Then I softly see "Picklist" as "1,2,3,4" in page details

  @FW-29345
  Scenario: LWC: Dynamic Form: PM: To Verify that the user can be able to see captured response and score for number data type.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    #And I enter value "1234567890" into field "Picklist"
    And I enter value "7" into field "Score (Max Score : 7)"
    And I enter value "Test Comments" into field "Comments"
    And I click on "Save" in the page details
    Then I softly see "Picklist" as "1234567890" in page details
    Then I softly see "Score (Max Score : 7)" as "7" in page details
    Then I softly see "Comments" as "Test Comments" in page details

  @FW-29338
  Scenario: LWC: Dynamic Form: PM:To verify that when the "validation button visibility" configuration is set to none/blank, the user is unable to see the "Validate" action on the dynamic form.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                    | fieldOrignalValue | filterId         |
      | Capture Form          | Validation Button Visibility | Show              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                    | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Form:General  | Validation Button Visibility |               | {SavedValue:CaptureForm} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly do not see "Validate" button is displayed

  @FW-29337
  Scenario: LWC: Dynamic Form: PM:To verify that when the "validation button visibility" configuration is set to hide, the user is unable to see the "Validate" action on the dynamic form.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                    | fieldOrignalValue | filterId         |
      | Capture Form          | Validation Button Visibility | Show              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                    | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Form:General  | Validation Button Visibility | Hide          | {SavedValue:CaptureForm} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly do not see "Validate" button is displayed

  @FW-29336
  Scenario: LWC: Dynamic Form: PM:To verify that when the "validation button visibility" configuration is set to show, the user is able to see the "Validate" action on the dynamic form.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                    | fieldOrignalValue | filterId         |
      | Capture Form          | Validation Button Visibility | Show              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                    | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Form:General  | Validation Button Visibility | Show          | {SavedValue:CaptureForm} |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "View" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly see "Validate" button is displayed

  @FW-29291
  Scenario: LWC: Dynamic Form: PM: To Verify that the date/Currency/Percent/Checkbox/Number/Picklist field is hidden when Written Type is set to "12" as per dependent Field json.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "Dynamic Forms" page block displayed
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I enter value "12" into field "Written"
    And I click on "Save" in the page details
    Then I softly see field "Date" inside page block
    Then I softly see field "Number" inside page block
    Then I softly see field "Picklist" inside page block
    Then I softly see field "Percent" inside page block
    Then I softly see field "Currency" inside page block
    Then I softly see field "Checkbox" inside page block
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Capture Item          | Dependent Question Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue                             | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Dependent Question Json | govgrants_config:Written1Value12HideItems | {SavedValue:WrittenItem} |                           |                            |
    And I refresh the page
    And I click on "Save" in the page details
    Then I softly cannot see field "Date" inside page block
    Then I softly cannot see field "Number" inside page block
    Then I softly cannot see field "Picklist" inside page block
    Then I softly cannot see field "Percent" inside page block
    Then I softly cannot see field "Currency" inside page block
    Then I softly cannot see field "Checkbox" inside page block

  @FW-29292
  Scenario: LWC: Dynamic Form: PM: To Verify that the Written/Currency/Percent/Checkbox/Number/Picklist field is hidden when Date Type is set to "2026-08-05 " as per dependent Field json.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I enter value "08/05/2026" into field "Date"
    And I click on "Save" in the page details
    Then I softly see field "Written" inside page block
    Then I softly see field "Number" inside page block
    Then I softly see field "Picklist" inside page block
    Then I softly see field "Percent" inside page block
    Then I softly see field "Currency" inside page block
    Then I softly see field "Checkbox" inside page block
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Capture Item          | Dependent Question Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue                                  | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Dependent Question Json | govgrants_config:Date1Value2026-08-05HideItems | {SavedValue:DateItem} |                           |                            |
    And I refresh the page
    And I click on "Save" in the page details
    Then I softly cannot see field "Written" inside page block
    Then I softly cannot see field "Number" inside page block
    Then I softly cannot see field "Picklist" inside page block
    Then I softly cannot see field "Percent" inside page block
    Then I softly cannot see field "Currency" inside page block
    Then I softly cannot see field "Checkbox" inside page block

  @FW-29293
  Scenario: LWC: Dynamic Form: PM: To Verify that the date/Written/Percent/Checkbox/Number/Picklist field is hidden when Currency Type is set to "12" as per dependent Field json.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I enter value "12" into field "Currency"
    And I click on "Save" in the page details
    Then I softly see field "Written" inside page block
    Then I softly see field "Number" inside page block
    Then I softly see field "Picklist" inside page block
    Then I softly see field "Date" inside page block
    Then I softly see field "Percent" inside page block
    Then I softly see field "Checkbox" inside page block
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Capture Item          | Dependent Question Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Dependent Question Json | govgrants_config:CuerrencyValue12HideItems | {SavedValue:CurrencyItem} |                           |                            |
    And I refresh the page
    And I click on "Save" in the page details
    Then I softly cannot see field "Written" inside page block
    Then I softly cannot see field "Number" inside page block
    Then I softly cannot see field "Picklist" inside page block
    Then I softly cannot see field "Date" inside page block
    Then I softly cannot see field "Percent" inside page block
    Then I softly cannot see field "Checkbox" inside page block

  @FW-29294
  Scenario: LWC: Dynamic Form: PM: To Verify that the date/Currency/Written/Checkbox/Number/Picklist field is hidden when percent Type is set to "12" as per dependent field json.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I enter value "12" into field "Percent"
    And I click on "Save" in the page details
    Then I softly see field "Written" inside page block
    Then I softly see field "Number" inside page block
    Then I softly see field "Picklist" inside page block
    Then I softly see field "Date" inside page block
    Then I softly see field "Currency" inside page block
    Then I softly see field "Checkbox" inside page block
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Capture Item          | Dependent Question Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue                            | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Dependent Question Json | govgrants_config:PercentValue12HideItems | {SavedValue:PercentItem} |                           |                            |
    And I refresh the page
    And I click on "Save" in the page details
    Then I softly cannot see field "Written" inside page block
    Then I softly cannot see field "Number" inside page block
    Then I softly cannot see field "Picklist" inside page block
    Then I softly cannot see field "Date" inside page block
    Then I softly cannot see field "Currency" inside page block
    Then I softly cannot see field "Checkbox" inside page block

  @FW-29295 @FW-29296
  Scenario: LWC: Dynamic Form: PM: To Verify that the date/Currency/Percent/written/Number/Picklist field is hidden when checkbox Type is set to "true" as per dependent field json.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I enter value "Checked" into field "Checkbox"
    And I click on "Save" in the page details
    Then I softly see field "Written" inside page block
    Then I softly see field "Number" inside page block
    Then I softly see field "Picklist" inside page block
    Then I softly see field "Date" inside page block
    Then I softly see field "Currency" inside page block
    Then I softly see field "Percent" inside page block
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Capture Item          | Dependent Question Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Dependent Question Json | govgrants_config:CheckboxValuetrueHideItems | {SavedValue:PercentItem} |                           |                            |
    And I refresh the page
    And I click on "Save" in the page details
    Then I softly cannot see field "Written" inside page block
    Then I softly cannot see field "Number" inside page block
    Then I softly cannot see field "Picklist" inside page block
    Then I softly cannot see field "Date" inside page block
    Then I softly cannot see field "Currency" inside page block
    Then I softly cannot see field "Percent" inside page block

  @FW-29297
  Scenario: LWC: Dynamic Form: PM: To Verify that the date/Currency/Percent/Checkbox/Number/Picklist field is hidden when picklist Type is set to "1" as per dependent field json.

  @FW-29298
  Scenario: LWC: Dynamic Form: PM: To Verify that the date/Currency/Percent/Checkbox/Number/Picklist field is EnableRequired when Written Type is set to "12" as per dependent field json.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I enter value "12" into field "Written"
    And I click on "Save" in the page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Capture Item          | Dependent Question Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue                                | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Dependent Question Json | govgrants_config:Written1Value12RequiredSave | {SavedValue:WrittenItem} |                           |                            |
    And I refresh the page
    And I click on "Save" in the page details
    Then I softly see asterisk mark at "Number" field in LWC
    Then I softly see asterisk mark at "Picklist" field in LWC
    Then I softly see asterisk mark at "Currency" field in LWC
    Then I softly see asterisk mark at "Percent" field in LWC
    Then I softly see asterisk mark at "Checkbox" field in LWC
    Then I softly see asterisk mark at "Date" field in LWC
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                         |
      | Number is required to save under Test section 1.   |
      | Picklist is required to save under Test section 1. |
      | Currency is required to save under Test section 1. |
      | Percent is required to save under Test section 1.  |
      | Checkbox is required to save under Test section 1. |
      | Date is required to save under Test section 1.     |

   @FW-29299
  Scenario: LWC: Dynamic Form: PM: To Verify that the Written/Currency/Percent/Checkbox/Number/Picklist field is EnableRequired when Date Type is set to "2026-08-05 " as per dependent Field json.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/CapturePackage__c/a4rDa000001osYxIAI/view?c__parentRecordId=YTFiRGEwMDAwMDFqcTZvSUFB&c__Mode=ZWRpdA%3D%3D"
    And I enter value "08/05/2026" into label "Date"
    And I click on "Save" in the page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Capture Item          | Dependent Question Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue                                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Dependent Question Json | govgrants_config:Date1Value2026-08-05RequiredSave | {SavedValue:DateItem} |                           |                            |
    And I refresh the page
    And I click on "Save" in the page details
    Then I softly see asterisk mark at "Number" field in LWC
    Then I softly see asterisk mark at "Picklist" field in LWC
    Then I softly see asterisk mark at "Currency" field in LWC
    Then I softly see asterisk mark at "Percent" field in LWC
    Then I softly see asterisk mark at "Checkbox" field in LWC
    Then I softly see asterisk mark at "Written" field in LWC
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                         |
      | Number is required to save under Test section 1.   |
      | Picklist is required to save under Test section 1. |
      | Currency is required to save under Test section 1. |
      | Percent is required to save under Test section 1.  |
      | Checkbox is required to save under Test section 1. |
      | Written is required to save under Test section 1.  |

  @FW-29302
  Scenario: LWC: Dynamic Form: PM: To Verify that the date/Written/Percent/Checkbox/Number/Picklist field is EnableRequired when Currency Type is set to "12" as per dependent Field json.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I enter value "12" into label "Currency"
    And I click on "Save" in the page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Capture Item          | Dependent Question Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue                                | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Dependent Question Json | govgrants_config:CurrencyValue12RequiredSave | {SavedValue:CurrencyItem} |                           |                            |
    And I refresh the page
    And I click on "Save" in the page details
    Then I softly see asterisk mark at "Number" field in LWC
    Then I softly see asterisk mark at "Picklist" field in LWC
    Then I softly see asterisk mark at "Date" field in LWC
    Then I softly see asterisk mark at "Percent" field in LWC
    Then I softly see asterisk mark at "Checkbox" field in LWC
    Then I softly see asterisk mark at "Written" field in LWC
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                         |
      | Number is required to save under Test section 1.   |
      | Picklist is required to save under Test section 1. |
      | Date is required to save under Test section 1.     |
      | Percent is required to save under Test section 1.  |
      | Checkbox is required to save under Test section 1. |
      | Written is required to save under Test section 1.  |

  @FW-29303
  Scenario: LWC: Dynamic Form: PM: To Verify that the date/Currency/Written/Checkbox/Number/Picklist field is EnableRequired when percent Type is set to "12" as per dependent Field json.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I enter value "12" into label "Percent"
    And I click on "Save" in the page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Capture Item          | Dependent Question Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue                               | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Dependent Question Json | govgrants_config:PercentValue12RequiredSave | {SavedValue:CurrencyItem} |                           |                            |
    And I refresh the page
    And I click on "Save" in the page details
    Then I softly see asterisk mark at "Number" field in LWC
    Then I softly see asterisk mark at "Picklist" field in LWC
    Then I softly see asterisk mark at "Date" field in LWC
    Then I softly see asterisk mark at "Currency" field in LWC
    Then I softly see asterisk mark at "Checkbox" field in LWC
    Then I softly see asterisk mark at "Written" field in LWC
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                         |
      | Number is required to save under Test section 1.   |
      | Picklist is required to save under Test section 1. |
      | Date is required to save under Test section 1.     |
      | Currency is required to save under Test section 1. |
      | Checkbox is required to save under Test section 1. |
      | Written is required to save under Test section 1.  |

  @FW-29304
  Scenario: LWC: Dynamic Form: PM: To Verify that the date/Currency/Percent/written/Number/Picklist field is EnableRequired when checkbox Type is set to "true" as per dependent Field json.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I enter value "Checked" into label "Checkbox"
    And I click on "Save" in the page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Capture Item          | Dependent Question Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Dependent Question Json | govgrants_config:CheckboxValuetrueRequiredSave | {SavedValue:CurrencyItem} |                           |                            |
    And I refresh the page
    And I enter value "Checked" into label "Checkbox"
    And I click on "Save" in the page details
    Then I softly see asterisk mark at "Number" field in LWC
    Then I softly see asterisk mark at "Picklist" field in LWC
    Then I softly see asterisk mark at "Date" field in LWC
    Then I softly see asterisk mark at "Currency" field in LWC
    Then I softly see asterisk mark at "Percent" field in LWC
    Then I softly see asterisk mark at "Written" field in LWC
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                         |
      | Number is required to save under Test section 1.   |
      | Picklist is required to save under Test section 1. |
      | Date is required to save under Test section 1.     |
      | Currency is required to save under Test section 1. |
      | Percent is required to save under Test section 1.  |
      | Written is required to save under Test section 1.  |

  @FW-29305
  Scenario: LWC: Dynamic Form: PM: To Verify that the date/Currency/Percent/Checkbox/written/Picklist field is EnableRequired when Number Type is set to "12" as per dependent Field json.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I enter value "12" into label "Number"
    And I click on "Save" in the page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Capture Item          | Dependent Question Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue                              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Dependent Question Json | govgrants_config:NumberValue12RequiredSave | {SavedValue:CurrencyItem} |                           |                            |
    And I refresh the page
    And I click on "Save" in the page details
    Then I softly see asterisk mark at "Checkbox" field in LWC
    Then I softly see asterisk mark at "Picklist" field in LWC
    Then I softly see asterisk mark at "Date" field in LWC
    Then I softly see asterisk mark at "Currency" field in LWC
    Then I softly see asterisk mark at "Percent" field in LWC
    Then I softly see asterisk mark at "Written" field in LWC
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                         |
      | Checkbox is required to save under Test section 1. |
      | Picklist is required to save under Test section 1. |
      | Date is required to save under Test section 1.     |
      | Currency is required to save under Test section 1. |
      | Percent is required to save under Test section 1.  |
      | Written is required to save under Test section 1.  |

  @FW-29308
  Scenario: LWC: Dynamic Form: PM: To Verify that the date/Currency/Percent/Checkbox/Number/Picklist field is ShowRequired when Written Type is set to "12" as per dependent Field json.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Capture Item          | Dependent Question Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue                               | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Dependent Question Json | govgrants_config:WrittenValue12ShowRequired | {SavedValue:WrittenItem} |                           |                            |
    And I refresh the page
    And I pause execution for "4" seconds
   # Then I softly do not see only field "Date" in page details
    Then I softly do not see only field "Currency" in page details
    Then I softly do not see only field "Percent" in page details
    Then I softly do not see only field "Checkbox" in page details
    Then I softly do not see only field "Number" in page details
    Then I softly do not see only field "Picklist" in page details
    And I enter value "12" into label "Written"
    And I pause execution for "5" seconds
    Then I softly see "Test section 1" page block displayed
    Then I softly see only field "Date" in page details
    Then I softly see only field "Currency" in page details
    Then I softly see only field "Percent" in page details
    Then I softly see only field "Checkbox" in page details
    Then I softly see only field "Number" in page details
    Then I softly see only field "Picklist" in page details

  @FW-29309
  Scenario: LWC: Dynamic Form: PM: To Verify that the Written/Currency/Percent/Checkbox/Number/Picklist field is ShowRequired when Date Type is set to "2026-08-05 " as per dependent Field json.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - My Records"
    And I click on top right button "New" in flex table with id "---program:-:allAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "9" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I pause execution for "6" seconds
    When I navigate to "Setup" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Test Capture Form 1" inside flex table with id "---announcement:-:DynamicFormsTableId---" without waiting for record
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Capture Item          | Dependent Question Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName               | fieldNewValue                                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Capture Item:General  | Dependent Question Json | govgrants_config:DateValue08/05/2026ShowRequired | {SavedValue:WrittenItem} |                           |                            |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see only field "Written" in page details
    Then I softly do not see only field "Currency" in page details
    Then I softly do not see only field "Percent" in page details
    Then I softly do not see only field "Checkbox" in page details
    Then I softly do not see only field "Number" in page details
    Then I softly do not see only field "Picklist" in page details
    And I enter value "08/05/2026" into label "Date"
    And I pause execution for "5" seconds
    Then I softly see "Test section 1" page block displayed
    Then I softly see only field "Written" in page details
    Then I softly see only field "Currency" in page details
    Then I softly see only field "Percent" in page details
    Then I softly see only field "Checkbox" in page details
    Then I softly see only field "Number" in page details
    Then I softly see only field "Picklist" in page details

