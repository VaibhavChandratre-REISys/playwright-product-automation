@formAndPackages @planningNysed @planning
Feature: Validate all scenarios in the home tab

  @492041 @Sprint-01-US-487284 @M04 @M04Planning
  Scenario Outline: Verify that Internal User can see sequence number column on create package modal window - Application
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    Then I softly see "Forms" page block displayed
    Then I softly see "Packages" page block displayed
    And I click on top right button "New Package" in flex table with id "---program:-:packagesTableId---"
    And I enter "Creation" values from "FormPackages_Field_Values.xlsx"
    When I click modal button "Associate Forms"
    Then I softly see "Associated Forms" page block displayed
    Then I see the following headers in table with id "---program:-:packagesFormsTableId---" :
      | Actions | Sequence Number |
    And I click on top right button "Associate" in flex table with id "---program:-:packagesFormsTableId---"
    When I click "Add Forms" after selection of "NSF Cover Page" in the table "---program:-:packagesFormsTableId---"
    When I click "Add Forms" after selection of "NASA - Other Project Information" in the table "---program:-:packagesFormsTableId---"
    When I click "Add Forms" after selection of "NASA - PI and AOR" in the table "---program:-:packagesFormsTableId---"
    Then I softly see "Forms added succesfully." inside flex table with id "---program:-:packagesFormsTableId---"
    And I click modal button "Close"
    When I click on "Edit" icon for "NSF Cover Page" inside flex table with id "---program:-:packagesFormsTableId---"
    Then I softly see fields "GNT__Order__c" is in edit mode
    Then I softly see fields "GNT__isMandatory__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---program:-:packagesFormsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name                        | Sequence Number |
      | NSF Cover Page                   | 1               |
      | NASA - Other Project Information | 1               |
      | NASA - PI and AOR                | 1               |
    Then I see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "1" for title "Sequence Number" against the value "NSF Cover Page" inside table "---program:-:packagesFormsTableId---"
    Then I softly see value "1" for title "Sequence Number" against the value "NASA - Other Project Information" inside table "---program:-:packagesFormsTableId---"
    Then I softly see value "1" for title "Sequence Number" against the value "NASA - PI and AOR" inside table "---program:-:packagesFormsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name                        | Sequence Number |
      | NSF Cover Page                   |                 |
      | NASA - Other Project Information |                 |
      | NASA - PI and AOR                |                 |
    Then I see the following messages in the page details contains:
      | Saved Successfully! |
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name      | Sequence Number |
      | NSF Cover Page | -18             |
#    Then I softly see value "8" for title "Sequence Number" against the value "NSF Cover Page" inside table "---program:-:packagesFormsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name      | Sequence Number |
      | NSF Cover Page | 9.8             |
    Then I softly see value "98" for title "Sequence Number" against the value "NSF Cover Page" inside table "---program:-:packagesFormsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name      | Sequence Number |
      | NSF Cover Page | 2323            |
    Then I softly see value "232" for title "Sequence Number" against the value "NSF Cover Page" inside table "---program:-:packagesFormsTableId---"
    And I check "All" boxes in flex table with id "---program:-:packagesFormsTableId---"
    And I click on top right button "Remove Selected Forms" in flex table with id "---program:-:packagesFormsTableId---"
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |
#      | ADMIN    |
#      | FO       |
#      | FD       |

  @492282 @Sprint-01-US-487284 @M04 @M04Planning
  Scenario Outline: Verify that Internal User can see sequence number column on view package modal window - Application
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    Then I softly see "Forms" page block displayed
    Then I softly see "Packages" page block displayed
    And I click on top right button "New Package" in flex table with id "---program:-:packagesTableId---"
    And I enter "Creation" values from "FormPackages_Field_Values.xlsx"
    When I click modal button "Associate Forms"
    And I wait for "3" seconds
    And I save the field labeled "Package Name" as "PackageName"
    Then I softly see "Associated Forms" page block displayed
    Then I see the following headers in table with id "---program:-:packagesFormsTableId---" :
      | Actions | Sequence Number |
    And I click on top right button "Associate" in flex table with id "---program:-:packagesFormsTableId---"
    When I click "Add Forms" after selection of "NSF Cover Page" in the table "---program:-:packagesFormsTableId---"
    When I click "Add Forms" after selection of "NASA - Other Project Information" in the table "---program:-:packagesFormsTableId---"
    When I click "Add Forms" after selection of "NASA - PI and AOR" in the table "---program:-:packagesFormsTableId---"
    Then I softly see "Forms added succesfully." inside flex table with id "---program:-:packagesFormsTableId---"
    And I click modal button "Close"
    And I click modal button "Close"
    When I perform quick search for "{SavedValue:PackageName}" in "---program:-:packagesTableId---" panel
    And I click on "View" icon for "{SavedValue:PackageName}" inside table
    Then I see the following headers in table with id "---program:-:packagesFormsTableId---" :
      | Actions | Sequence Number |
    And I softly can see row level action button "Edit" against "NSF Cover Page" in flex table with id "---program:-:packagesFormsTableId---"
    And I softly can see row level action button "Edit" against "NASA - Other Project Information" in flex table with id "---program:-:packagesFormsTableId---"
    And I softly can see row level action button "Edit" against "NASA - PI and AOR" in flex table with id "---program:-:packagesFormsTableId---"
    And I wait for "2" seconds
    When I click on "Edit" icon for "NSF Cover Page" inside flex table with id "---program:-:packagesFormsTableId---"
    Then I softly see fields "GNT__Order__c" is in edit mode
    Then I softly see fields "GNT__isMandatory__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---program:-:packagesFormsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name                        | Sequence Number |
      | NSF Cover Page                   | 1               |
      | NASA - Other Project Information | 1               |
      | NASA - PI and AOR                | 1               |
    Then I see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "1" for title "Sequence Number" against the value "NSF Cover Page" inside table "---program:-:packagesFormsTableId---"
    Then I softly see value "1" for title "Sequence Number" against the value "NASA - Other Project Information" inside table "---program:-:packagesFormsTableId---"
    Then I softly see value "1" for title "Sequence Number" against the value "NASA - PI and AOR" inside table "---program:-:packagesFormsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name                        | Sequence Number |
      | NSF Cover Page                   |                 |
      | NASA - Other Project Information |                 |
      | NASA - PI and AOR                |                 |
    Then I see the following messages in the page details contains:
      | Saved Successfully! |
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name      | Sequence Number |
      | NSF Cover Page | -18             |
#    Then I softly see value "8" for title "Sequence Number" against the value "NSF Cover Page" inside table "---program:-:packagesFormsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name      | Sequence Number |
      | NSF Cover Page | 9.8             |
    Then I softly see value "98" for title "Sequence Number" against the value "NSF Cover Page" inside table "---program:-:packagesFormsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:packagesFormsTableId---" by clicking "Edit" :
      | Form Name      | Sequence Number |
      | NSF Cover Page | 2323            |
    Then I softly see value "232" for title "Sequence Number" against the value "NSF Cover Page" inside table "---program:-:packagesFormsTableId---"
    And I check "All" boxes in flex table with id "---program:-:packagesFormsTableId---"
    And I click on top right button "Remove Selected Forms" in flex table with id "---program:-:packagesFormsTableId---"
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |
#      | ADMIN    |
#      | FO       |
#      | FD       |

  @538107 @538104 @NYSEDSprint-14 @US-537868 @M05
  Scenario Outline:Verify that internal user see that all the OOTB Packages are hidden except which has Package Type as 'Payment Request' in the Packages list view under the Planning phase -> Forms and Packages left navigation.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:PackageName}" in "---program:-:packagesTableId---" panel
    #538107
    Then I softly see value "Payment Request" for title "Package Type" against the value "{SavedValue:PackageName}" inside table "---program:-:packagesTableId---"
    And I perform quick search for "{SavedValue:FormName}" in "---program:-:formsPackagesFormsTableId---" panel
    #538104
    Then I softly see value "Payment Request" for title "Package Type" against the value "{SavedValue:FormName}" inside table "---program:-:formsPackagesFormsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |
#      | EXE      |
#      | ADMIN    |