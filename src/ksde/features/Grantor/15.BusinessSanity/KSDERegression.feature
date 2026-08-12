@ksdeBusinessNewFlowSanity @grantor-sanity @sanity
Feature: Validate sanity testing of Complete Business Flow

  @KSDE-125 @KSDE-126 @KSDE-128 @KSDE-129 @KSDE-130 @KSDE-131 @KSDE-133 @KSDE-134 @KSDE-135 @KSDE-136 @KSDE-137 @KSDE-138 @KSDE-139
    @KSDE-141 @KSDE-142 @KSDE-151 @ApplicationRegression
  Scenario Outline:Test Set: Secondary Improvement Grant Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "program-{SavedValue:InternalProgram_2}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<userType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Application Name>" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    When I enter "Edition1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I save the field labeled "EGMS ID" as "appEGMSID"
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name   | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Health Science | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name   | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Health Science | $1,000.00  | $1,000.00                    | $0.00                      | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "Edit" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $1,000.00                    |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | Supplies    | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $1,000.00                    | $0.00                      | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
#    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
#      | Category Name       | Requested Budget | Cash Match | Non-Cash Match |
#      | Special Populations | 1000             | 100        | 100            |
#      | Supplies            | 1000             | 100        | 100            |
    When I navigate to "Overview" sub tab
    #already key contact
#    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
#      | Name                       | Is Key Contact |
#      | {SavedValue:SPI3 Username} | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I save the field labeled "Form ID" as "FormID"
    #KSDE-125
    Then I see field "Form ID" as "{SavedValue:FormID}"
    Then I see field "Form Name" as "Perkins Secondary Improvement Grant"
    #KSDE-126
    Then I see field "Is Form Validated?" as "No"
    When I click on "Save" in the page details
    #KSDE-128
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Consortium Application is required.                                                                                                                                                                                                                                                                                                                                                           |
      | Describe how you ensure members of special populations (Individuals with Disabilities, Economically Disadvantaged, Single Parents, English Learners, Non-Traditional Enrollees, Migrant Worker Parents, Homeless (includes Migrant), Active Military Parent, Foster Care Youth) will not be discriminated against on the basis of their status as members of special populations is required. |
      | Describe how you provide equal access for special populations (Individuals with Disabilities, Economically Disadvantaged, Single Parents, English Learners, Non-Traditional Enrollees, Migrant Worker Parents, Homeless (includes Migrant), Active Military Parent, Foster Care Youth) to CTE courses, programs and programs of Study is required.                                            |
      | Describe how you inform special populations (Individuals with Disabilities, Economically Disadvantaged, Single Parents, English Learners, Non-Traditional Enrollees, Migrant Worker Parents, Homeless (includes Migrant), Active Military Parent, Foster Care Youth) about CTE industries, clusters, pathways and courses is required.                                                        |
      | Describe how career exploration and development coursework, activities and services are incorporated including the middle school level is required.                                                                                                                                                                                                                                           |
      | Describe how you inform students of career information regarding employment opportunities is required.                                                                                                                                                                                                                                                                                        |
      | Describe your district’s system of career guidance and academic counseling is required.                                                                                                                                                                                                                                                                                                       |
      | Describe the activities/ information given to prepare special populations for high skill, high wage or in-demand occupations is required.                                                                                                                                                                                                                                                     |
      | Describe how your CTE programs improve students’ academic and technical skills is required.                                                                                                                                                                                                                                                                                                   |
      | Describe how you prepare CTE participants for non-traditional fields is required.                                                                                                                                                                                                                                                                                                             |
      | Describe Work-Based Learning opportunities for students participating in CTE programs and how the eligible recipient will work with local business/industry to develop or expand work-based learning experiences for students is required.                                                                                                                                                    |
      | Describe how you will provide CTE students with the opportunity to gain postsecondary credit while still attending high school is required.                                                                                                                                                                                                                                                   |
      | Describe efforts to support recruitment, preparation, retention and training of CTE teachers and staff (faculty, administrators and other CTE professionals) is required.                                                                                                                                                                                                                     |
      | Acknowledgement is required.                                                                                                                                                                                                                                                                                                                                                                  |
      | Acknowledgement By is required.                                                                                                                                                                                                                                                                                                                                                               |
      | Acknowledgement Date is required.                                                                                                                                                                                                                                                                                                                                                             |
      | Certify is required.                                                                                                                                                                                                                                                                                                                                                                          |
      | Certified By is required.                                                                                                                                                                                                                                                                                                                                                                     |
      | Signature is required.                                                                                                                                                                                                                                                                                                                                                                        |
      | Certified Date is required.                                                                                                                                                                                                                                                                                                                                                                   |
      | State Goal - 2S1 Academic Proficiency in Reading/Language Arts is required.                                                                                                                                                                                                                                                                                                                   |
      | State Goal - 1S1 Four-Year Graduation Rate is required.                                                                                                                                                                                                                                                                                                                                       |
      | State Goal - 2S2 Academic Proficiency in Mathematics is required.                                                                                                                                                                                                                                                                                                                             |
      | State Goal - 4S1 Non-traditional Program Concentration is required.                                                                                                                                                                                                                                                                                                                           |
      | State Goal - 2S3 Academic Proficiency in Science is required.                                                                                                                                                                                                                                                                                                                                 |
      | State Goal - 3S1 Post-Program Placement is required.                                                                                                                                                                                                                                                                                                                                          |
      | State Goal - 5S2 Program Quality - Attained Postsecondary Credits is required.                                                                                                                                                                                                                                                                                                                |
      | CLNA Document is required.                                                                                                                                                                                                                                                                                                                                                                    |
      | Contractual Provisions and Local Assurances Supporting Document is required.                                                                                                                                                                                                                                                                                                                  |
      | Program Income Form is required.                                                                                                                                                                                                                                                                                                                                                              |
      | Approved Pathways Supporting Document is required.                                                                                                                                                                                                                                                                                                                                            |
      | Please enter data for at least one field in the Student Performance Data (Actuals) section.                                                                                                                                                                                                                                                                                                   |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button.                                                                                                                                                                                                                    |
    Then I see field "Is Form Validated?" as "No"
    #KSDE-129
    When I click on "Edit" in the page details
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    #KSDE-130
    And I enter value "Test Grant" into field "Question1__c"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    When I click on "Cancel" in the page details
    And I close the tab
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    When I click on "Save" in the page details
    Then I softly see "Local Plan" page block displayed
    Then I softly see field "Describe how you inform special populations (Individuals with Disabilities, Economically Disadvantaged, Single Parents, English Learners, Non-Traditional Enrollees, Migrant Worker Parents, Homeless (includes Migrant), Active Military Parent, Foster Care Youth) about CTE industries, clusters, pathways and courses." as "Test Grant"
    #KSDE-131
    Then I softly see "School District Information" page block displayed
    Then I softly see "Local Plan" page block displayed
    Then I softly see "Student Performance Data (State Goals)" page block displayed
    Then I softly see "Student Performance Data (Actuals)" page block displayed
    Then I softly see "Student Performance Action Plan" page block displayed
    Then I softly see "Application Files" page block displayed
    Then I softly see "Time and Effort Certification" page block displayed
    Then I softly see "Certification" page block displayed
    #KSED-133
    Then I softly see "School District Information" page block displayed
    Then I see below fields in "School District Information" page block
      | School District Number | Consortium Application |
    When I click on "Edit" in the page details
    Then I softly see value "--None--" for the edit mode dropdown field "KSDE_Consortium_Application__c"
    Then I see only the following ordered options in dropdown field "KSDE_Consortium_Application__c" :
      | --None-- | Yes | No |
    #KSDE-134
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Consortium Application is required.                                                                                                                                                                                                                                                                                                                                                           |
      | Describe how you ensure members of special populations (Individuals with Disabilities, Economically Disadvantaged, Single Parents, English Learners, Non-Traditional Enrollees, Migrant Worker Parents, Homeless (includes Migrant), Active Military Parent, Foster Care Youth) will not be discriminated against on the basis of their status as members of special populations is required. |
      | Describe how you provide equal access for special populations (Individuals with Disabilities, Economically Disadvantaged, Single Parents, English Learners, Non-Traditional Enrollees, Migrant Worker Parents, Homeless (includes Migrant), Active Military Parent, Foster Care Youth) to CTE courses, programs and programs of Study is required.                                            |
      | Describe how career exploration and development coursework, activities and services are incorporated including the middle school level is required.                                                                                                                                                                                                                                           |
      | Describe how you inform students of career information regarding employment opportunities is required.                                                                                                                                                                                                                                                                                        |
      | Describe your district’s system of career guidance and academic counseling is required.                                                                                                                                                                                                                                                                                                       |
      | Describe the activities/ information given to prepare special populations for high skill, high wage or in-demand occupations is required.                                                                                                                                                                                                                                                     |
      | Describe how your CTE programs improve students’ academic and technical skills is required.                                                                                                                                                                                                                                                                                                   |
      | Describe how you prepare CTE participants for non-traditional fields is required.                                                                                                                                                                                                                                                                                                             |
      | Describe Work-Based Learning opportunities for students participating in CTE programs and how the eligible recipient will work with local business/industry to develop or expand work-based learning experiences for students is required.                                                                                                                                                    |
      | Describe how you will provide CTE students with the opportunity to gain postsecondary credit while still attending high school is required.                                                                                                                                                                                                                                                   |
      | Describe efforts to support recruitment, preparation, retention and training of CTE teachers and staff (faculty, administrators and other CTE professionals) is required.                                                                                                                                                                                                                     |
      | Acknowledgement is required.                                                                                                                                                                                                                                                                                                                                                                  |
      | Acknowledgement By is required.                                                                                                                                                                                                                                                                                                                                                               |
      | Acknowledgement Date is required.                                                                                                                                                                                                                                                                                                                                                             |
      | Certify is required.                                                                                                                                                                                                                                                                                                                                                                          |
      | Certified By is required.                                                                                                                                                                                                                                                                                                                                                                     |
      | Signature is required.                                                                                                                                                                                                                                                                                                                                                                        |
      | Certified Date is required.                                                                                                                                                                                                                                                                                                                                                                   |
      | State Goal - 2S1 Academic Proficiency in Reading/Language Arts is required.                                                                                                                                                                                                                                                                                                                   |
      | State Goal - 1S1 Four-Year Graduation Rate is required.                                                                                                                                                                                                                                                                                                                                       |
      | State Goal - 2S2 Academic Proficiency in Mathematics is required.                                                                                                                                                                                                                                                                                                                             |
      | State Goal - 4S1 Non-traditional Program Concentration is required.                                                                                                                                                                                                                                                                                                                           |
      | State Goal - 2S3 Academic Proficiency in Science is required.                                                                                                                                                                                                                                                                                                                                 |
      | State Goal - 3S1 Post-Program Placement is required.                                                                                                                                                                                                                                                                                                                                          |
      | State Goal - 5S2 Program Quality - Attained Postsecondary Credits is required.                                                                                                                                                                                                                                                                                                                |
      | CLNA Document is required.                                                                                                                                                                                                                                                                                                                                                                    |
      | Contractual Provisions and Local Assurances Supporting Document is required.                                                                                                                                                                                                                                                                                                                  |
      | Program Income Form is required.                                                                                                                                                                                                                                                                                                                                                              |
      | Approved Pathways Supporting Document is required.                                                                                                                                                                                                                                                                                                                                            |
      | Please enter data for at least one field in the Student Performance Data (Actuals) section.                                                                                                                                                                                                                                                                                                   |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button.                                                                                                                                                                                                                    |
    #KSDE-135
    Then I softly see "School District Information" page block displayed
    Then I softly cannot see field "Name of the Consortium" inside page block
    When I click on "Edit" in the page details
    And I enter value "Yes" into field "KSDE_Consortium_Application__c"
    Then I softly see "School District Information" page block displayed
    Then I softly see field "Name of the Consortium" inside page block
    #KSDE-136
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | If Consortium Application is equal to Yes, please provide Name of the Consortium.                                                                                                                                                                                                                                                                                                             |
      | Describe how you ensure members of special populations (Individuals with Disabilities, Economically Disadvantaged, Single Parents, English Learners, Non-Traditional Enrollees, Migrant Worker Parents, Homeless (includes Migrant), Active Military Parent, Foster Care Youth) will not be discriminated against on the basis of their status as members of special populations is required. |
      | Describe how you provide equal access for special populations (Individuals with Disabilities, Economically Disadvantaged, Single Parents, English Learners, Non-Traditional Enrollees, Migrant Worker Parents, Homeless (includes Migrant), Active Military Parent, Foster Care Youth) to CTE courses, programs and programs of Study is required.                                            |
      | Describe how career exploration and development coursework, activities and services are incorporated including the middle school level is required.                                                                                                                                                                                                                                           |
      | Describe how you inform students of career information regarding employment opportunities is required.                                                                                                                                                                                                                                                                                        |
      | Describe your district’s system of career guidance and academic counseling is required.                                                                                                                                                                                                                                                                                                       |
      | Describe the activities/ information given to prepare special populations for high skill, high wage or in-demand occupations is required.                                                                                                                                                                                                                                                     |
      | Describe how your CTE programs improve students’ academic and technical skills is required.                                                                                                                                                                                                                                                                                                   |
      | Describe how you prepare CTE participants for non-traditional fields is required.                                                                                                                                                                                                                                                                                                             |
      | Describe Work-Based Learning opportunities for students participating in CTE programs and how the eligible recipient will work with local business/industry to develop or expand work-based learning experiences for students is required.                                                                                                                                                    |
      | Describe how you will provide CTE students with the opportunity to gain postsecondary credit while still attending high school is required.                                                                                                                                                                                                                                                   |
      | Describe efforts to support recruitment, preparation, retention and training of CTE teachers and staff (faculty, administrators and other CTE professionals) is required.                                                                                                                                                                                                                     |
      | Acknowledgement is required.                                                                                                                                                                                                                                                                                                                                                                  |
      | Acknowledgement By is required.                                                                                                                                                                                                                                                                                                                                                               |
      | Acknowledgement Date is required.                                                                                                                                                                                                                                                                                                                                                             |
      | Certify is required.                                                                                                                                                                                                                                                                                                                                                                          |
      | Certified By is required.                                                                                                                                                                                                                                                                                                                                                                     |
      | Signature is required.                                                                                                                                                                                                                                                                                                                                                                        |
      | Certified Date is required.                                                                                                                                                                                                                                                                                                                                                                   |
      | State Goal - 2S1 Academic Proficiency in Reading/Language Arts is required.                                                                                                                                                                                                                                                                                                                   |
      | State Goal - 1S1 Four-Year Graduation Rate is required.                                                                                                                                                                                                                                                                                                                                       |
      | State Goal - 2S2 Academic Proficiency in Mathematics is required.                                                                                                                                                                                                                                                                                                                             |
      | State Goal - 4S1 Non-traditional Program Concentration is required.                                                                                                                                                                                                                                                                                                                           |
      | State Goal - 2S3 Academic Proficiency in Science is required.                                                                                                                                                                                                                                                                                                                                 |
      | State Goal - 3S1 Post-Program Placement is required.                                                                                                                                                                                                                                                                                                                                          |
      | State Goal - 5S2 Program Quality - Attained Postsecondary Credits is required.                                                                                                                                                                                                                                                                                                                |
      | CLNA Document is required.                                                                                                                                                                                                                                                                                                                                                                    |
      | Contractual Provisions and Local Assurances Supporting Document is required.                                                                                                                                                                                                                                                                                                                  |
      | Program Income Form is required.                                                                                                                                                                                                                                                                                                                                                              |
      | Approved Pathways Supporting Document is required.                                                                                                                                                                                                                                                                                                                                            |
      | Consortium Contacts Document is required.                                                                                                                                                                                                                                                                                                                                                     |
      | Memorandum of Understanding Document is required.                                                                                                                                                                                                                                                                                                                                             |
      | Please enter data for at least one field in the Student Performance Data (Actuals) section.                                                                                                                                                                                                                                                                                                   |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button.                                                                                                                                                                                                                    |
    When I click on "Edit" in the page details
    And I enter value "Name of the Consortium" into field "KSDE_Name_of_the_Consortium__c"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Describe how you ensure members of special populations (Individuals with Disabilities, Economically Disadvantaged, Single Parents, English Learners, Non-Traditional Enrollees, Migrant Worker Parents, Homeless (includes Migrant), Active Military Parent, Foster Care Youth) will not be discriminated against on the basis of their status as members of special populations is required. |
      | Describe how you provide equal access for special populations (Individuals with Disabilities, Economically Disadvantaged, Single Parents, English Learners, Non-Traditional Enrollees, Migrant Worker Parents, Homeless (includes Migrant), Active Military Parent, Foster Care Youth) to CTE courses, programs and programs of Study is required.                                            |
      | Describe how career exploration and development coursework, activities and services are incorporated including the middle school level is required.                                                                                                                                                                                                                                           |
      | Describe how you inform students of career information regarding employment opportunities is required.                                                                                                                                                                                                                                                                                        |
      | Describe your district’s system of career guidance and academic counseling is required.                                                                                                                                                                                                                                                                                                       |
      | Describe the activities/ information given to prepare special populations for high skill, high wage or in-demand occupations is required.                                                                                                                                                                                                                                                     |
      | Describe how your CTE programs improve students’ academic and technical skills is required.                                                                                                                                                                                                                                                                                                   |
      | Describe how you prepare CTE participants for non-traditional fields is required.                                                                                                                                                                                                                                                                                                             |
      | Describe Work-Based Learning opportunities for students participating in CTE programs and how the eligible recipient will work with local business/industry to develop or expand work-based learning experiences for students is required.                                                                                                                                                    |
      | Describe how you will provide CTE students with the opportunity to gain postsecondary credit while still attending high school is required.                                                                                                                                                                                                                                                   |
      | Describe efforts to support recruitment, preparation, retention and training of CTE teachers and staff (faculty, administrators and other CTE professionals) is required.                                                                                                                                                                                                                     |
      | Acknowledgement is required.                                                                                                                                                                                                                                                                                                                                                                  |
      | Acknowledgement By is required.                                                                                                                                                                                                                                                                                                                                                               |
      | Acknowledgement Date is required.                                                                                                                                                                                                                                                                                                                                                             |
      | Certify is required.                                                                                                                                                                                                                                                                                                                                                                          |
      | Certified By is required.                                                                                                                                                                                                                                                                                                                                                                     |
      | Signature is required.                                                                                                                                                                                                                                                                                                                                                                        |
      | Certified Date is required.                                                                                                                                                                                                                                                                                                                                                                   |
      | State Goal - 2S1 Academic Proficiency in Reading/Language Arts is required.                                                                                                                                                                                                                                                                                                                   |
      | State Goal - 1S1 Four-Year Graduation Rate is required.                                                                                                                                                                                                                                                                                                                                       |
      | State Goal - 2S2 Academic Proficiency in Mathematics is required.                                                                                                                                                                                                                                                                                                                             |
      | State Goal - 4S1 Non-traditional Program Concentration is required.                                                                                                                                                                                                                                                                                                                           |
      | State Goal - 2S3 Academic Proficiency in Science is required.                                                                                                                                                                                                                                                                                                                                 |
      | State Goal - 3S1 Post-Program Placement is required.                                                                                                                                                                                                                                                                                                                                          |
      | State Goal - 5S2 Program Quality - Attained Postsecondary Credits is required.                                                                                                                                                                                                                                                                                                                |
      | CLNA Document is required.                                                                                                                                                                                                                                                                                                                                                                    |
      | Contractual Provisions and Local Assurances Supporting Document is required.                                                                                                                                                                                                                                                                                                                  |
      | Program Income Form is required.                                                                                                                                                                                                                                                                                                                                                              |
      | Approved Pathways Supporting Document is required.                                                                                                                                                                                                                                                                                                                                            |
      | Consortium Contacts Document is required.                                                                                                                                                                                                                                                                                                                                                     |
      | Memorandum of Understanding Document is required.                                                                                                                                                                                                                                                                                                                                             |
      | Please enter data for at least one field in the Student Performance Data (Actuals) section.                                                                                                                                                                                                                                                                                                   |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button.                                                                                                                                                                                                                    |
     #KSDE-137
    Then I softly see "Local Plan" page block displayed
    Then I see below fields in "Local Plan" page block
      | Describe how you inform special populations (Individuals with Disabilities, Economically Disadvantaged, Single Parents, English Learners, Non-Traditional Enrollees, Migrant Worker Parents, Homeless (includes Migrant), Active Military Parent, Foster Care Youth) about CTE industries, clusters, pathways and courses. | Describe how career exploration and development coursework, activities and services are incorporated including the middle school level. | Describe how you inform students of career information regarding employment opportunities. | Describe your district’s system of career guidance and academic counseling. | Describe how your CTE programs improve students’ academic and technical skills. | Describe the activities/ information given to prepare special populations for high skill, high wage or in-demand occupations. | Describe how you prepare CTE participants for non-traditional fields. | Describe how you provide equal access for special populations (Individuals with Disabilities, Economically Disadvantaged, Single Parents, English Learners, Non-Traditional Enrollees, Migrant Worker Parents, Homeless (includes Migrant), Active Military Parent, Foster Care Youth) to CTE courses, programs and programs of Study. | Describe how you ensure members of special populations (Individuals with Disabilities, Economically Disadvantaged, Single Parents, English Learners, Non-Traditional Enrollees, Migrant Worker Parents, Homeless (includes Migrant), Active Military Parent, Foster Care Youth) will not be discriminated against on the basis of their status as members of special populations. | Describe Work-Based Learning opportunities for students participating in CTE programs and how the eligible recipient will work with local business/industry to develop or expand work-based learning experiences for students. | Describe how you will provide CTE students with the opportunity to gain postsecondary credit while still attending high school. | Describe efforts to support recruitment, preparation, retention and training of CTE teachers and staff (faculty, administrators and other CTE professionals). |
    #KSDE-138
    When I click on "Edit" in the page details
    And I enter value "{AUTOEnvData:StringOf5000Chars}" into field "Question1__c"
    And I enter value "{AUTOEnvData:StringOf5001Chars}" into field "Question2__c"
    And I enter value "{AUTOEnvData:StringOf5000Chars}" into field "Question3__c"
    And I enter value "{AUTOEnvData:StringOf5000Chars}" into field "Question4__c"
    And I enter value "{AUTOEnvData:StringOf5000Chars}" into field "Question5__c"
    And I enter value "{AUTOEnvData:StringOf5000Chars}" into field "Question6__c"
    And I enter value "{AUTOEnvData:StringOf5000Chars}" into field "Question7__c"
    And I enter value "{AUTOEnvData:StringOf5000Chars}" into field "Question8__c"
    And I enter value "{AUTOEnvData:StringOf5000Chars}" into field "Question9__c"
    And I enter value "{AUTOEnvData:StringOf5000Chars}" into field "Question10__c"
    And I enter value "{AUTOEnvData:StringOf5000Chars}" into field "Question11__c"
    And I enter value "{AUTOEnvData:StringOf5000Chars}" into field "Question12__c"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Acknowledgement is required.                                                                                                                                               |
      | Acknowledgement By is required.                                                                                                                                            |
      | Acknowledgement Date is required.                                                                                                                                          |
      | Certify is required.                                                                                                                                                       |
      | Certified By is required.                                                                                                                                                  |
      | Signature is required.                                                                                                                                                     |
      | Certified Date is required.                                                                                                                                                |
      | State Goal - 2S1 Academic Proficiency in Reading/Language Arts is required.                                                                                                |
      | State Goal - 1S1 Four-Year Graduation Rate is required.                                                                                                                    |
      | State Goal - 2S2 Academic Proficiency in Mathematics is required.                                                                                                          |
      | State Goal - 4S1 Non-traditional Program Concentration is required.                                                                                                        |
      | State Goal - 2S3 Academic Proficiency in Science is required.                                                                                                              |
      | State Goal - 3S1 Post-Program Placement is required.                                                                                                                       |
      | State Goal - 5S2 Program Quality - Attained Postsecondary Credits is required.                                                                                             |
      | CLNA Document is required.                                                                                                                                                 |
      | Contractual Provisions and Local Assurances Supporting Document is required.                                                                                               |
      | Program Income Form is required.                                                                                                                                           |
      | Approved Pathways Supporting Document is required.                                                                                                                         |
      | Consortium Contacts Document is required.                                                                                                                                  |
      | Memorandum of Understanding Document is required.                                                                                                                          |
      | Please enter data for at least one field in the Student Performance Data (Actuals) section.                                                                                |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    #KSDE-139
    When I click on "Edit" in the page details
    And I enter value "Test" into field "Question1__c"
    And I enter value "Test" into field "Question2__c"
    When I clear the value from field "Question3__c"
    And I enter value "Test" into field "Question4__c"
    And I enter value "Test" into field "Question5__c"
    And I enter value "Test" into field "Question6__c"
    And I enter value "Test" into field "Question7__c"
    And I enter value "Test" into field "Question8__c"
    And I enter value "Test" into field "Question9__c"
    When I clear the value from field "Question10__c"
    When I clear the value from field "Question11__c"
    When I clear the value from field "Question12__c"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Describe how you inform students of career information regarding employment opportunities is required.                                                                                                                                     |
      | Describe Work-Based Learning opportunities for students participating in CTE programs and how the eligible recipient will work with local business/industry to develop or expand work-based learning experiences for students is required. |
      | Describe how you will provide CTE students with the opportunity to gain postsecondary credit while still attending high school is required.                                                                                                |
      | Describe efforts to support recruitment, preparation, retention and training of CTE teachers and staff (faculty, administrators and other CTE professionals) is required.                                                                  |
      | Acknowledgement is required.                                                                                                                                                                                                               |
      | Acknowledgement By is required.                                                                                                                                                                                                            |
      | Acknowledgement Date is required.                                                                                                                                                                                                          |
      | Certify is required.                                                                                                                                                                                                                       |
      | Certified By is required.                                                                                                                                                                                                                  |
      | Signature is required.                                                                                                                                                                                                                     |
      | Certified Date is required.                                                                                                                                                                                                                |
      | State Goal - 2S1 Academic Proficiency in Reading/Language Arts is required.                                                                                                                                                                |
      | State Goal - 1S1 Four-Year Graduation Rate is required.                                                                                                                                                                                    |
      | State Goal - 2S2 Academic Proficiency in Mathematics is required.                                                                                                                                                                          |
      | State Goal - 4S1 Non-traditional Program Concentration is required.                                                                                                                                                                        |
      | State Goal - 2S3 Academic Proficiency in Science is required.                                                                                                                                                                              |
      | State Goal - 3S1 Post-Program Placement is required.                                                                                                                                                                                       |
      | State Goal - 5S2 Program Quality - Attained Postsecondary Credits is required.                                                                                                                                                             |
      | CLNA Document is required.                                                                                                                                                                                                                 |
      | Contractual Provisions and Local Assurances Supporting Document is required.                                                                                                                                                               |
      | Program Income Form is required.                                                                                                                                                                                                           |
      | Approved Pathways Supporting Document is required.                                                                                                                                                                                         |
      | Consortium Contacts Document is required.                                                                                                                                                                                                  |
      | Memorandum of Understanding Document is required.                                                                                                                                                                                          |
      | Please enter data for at least one field in the Student Performance Data (Actuals) section.                                                                                                                                                |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button.                                                                 |
    #KSDE-142
    Then I see the following headers in table with id "StudentPerformanceData" :
      | Actions | Category | 1S1 Graduation | 1S1 Graduation Gap Or Exceed | 2S1 Reading Language Arts | 2S1 Reading Language Arts Gap Or Exceed | 2S2 Math | 2S2 Math Gap Or Exceed | 2S3 Science | 2S3 Science Gap Or Exceed | 3S1 Placement | 3S1 Placement Gap Or Exceed | 4S1 Nontraditional | 4S1 Nontraditional Gap Or Exceed | 5S2 Postsecondary Credits | 5S2 Postsecondary Credits Gap Or Exceed |
    Then I softly see the text containing :
      | Enter data into the chart below. Data is posted at https://datacentral.ksde.gov/cte.aspx. Choose the school year completed in the prior calendar year. Please fill in the required details Here is an example for your reference: click here |
    #KSDE-141
    Then I softly see value "LEA Overall Score" for title "Category" inside table "StudentPerformanceData"
    Then I softly see value "Individuals with Disabilities" for title "Category" inside table "StudentPerformanceData"
    Then I softly see value "Economically Disadvantaged" for title "Category" inside table "StudentPerformanceData"
    Then I softly see value "Single Parents" for title "Category" inside table "StudentPerformanceData"
    Then I softly see value "English Learners" for title "Category" inside table "StudentPerformanceData"
    Then I softly see value "Non-Traditional Enrollees" for title "Category" inside table "StudentPerformanceData"
    Then I softly see value "Migrant Worker Parents" for title "Category" inside table "StudentPerformanceData"
    Then I softly see value "Homeless (includes Migrant)" for title "Category" inside table "StudentPerformanceData"
    Then I softly see value "Active Military Parent" for title "Category" inside table "StudentPerformanceData"
    Then I softly see value "Foster Care Youth" for title "Category" inside table "StudentPerformanceData"
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category          | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | LEA Overall Score | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    #KSDE-151
    Then I softly see "Student Performance Action Plan" page block displayed
    Then I softly see the text containing :
      | For each gap area, select a category, root cause, subcategory, and action plan step. Action plan steps can be found in the Action Plan Reference Document: click here |

    Examples:
      | userType | Application Name                                                |
      | SPI3     | {SavedValue:Automation Runtime Announcement Application Intake} |

  @KSDE-152 @KSDE-154 @KSDE-155 @KSDE-156 @KSDE-157 @KSDE-159 @KSDE-160 @KSDE-161 @KSDE-162 @KSDE-163 @KSDE-164 @KSDE-165 @KSDE-166 @KSDE-168 @KSDE-712
  Scenario Outline:Verify the Indicator field validation for the Action Plan Modal
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "program-{SavedValue:InternalProgram_2}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<userType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Application Name>" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    When I enter "Edition1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I save the field labeled "EGMS ID" as "appEGMSID"
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name   | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Health Science | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name   | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Health Science | $1,000.00  | $1,000.00                    | $0.00                      | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
#    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
#      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
#      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $1,000.00                    |
    When I edit the following rows inline in flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "Edit" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $1,000.00                    |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | Supplies    | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $1,000.00                    | $0.00                      | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
#    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
#      | Name                       | Is Key Contact |
#      | {SavedValue:SPI3 Username} | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    #KSDE-152
    Then I softly see top right button "Add" inside flex table "StudentPerformanceActionPlan"
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    #KSDE-154
    When I navigate to "Overview" sub tab
    Then I softly see "Performance Details" page block displayed
    #KSDE-712
    Then I see below fields in "Performance Details" page block
      | Indicator | Identified Gap | Category |
    Then I softly see "Cause" page block displayed
    Then I see below fields in "Cause" page block
      | Root Cause | Subcategory |
    Then I softly see "Resolution" page block displayed
    Then I see below fields in "Resolution" page block
      | Action Plan |
    When I click modal button "Close"
    When I click modal button "OK"
    Then I see the following rows under the following headers in table with id "StudentPerformanceActionPlan" :
      | Indicator | Identified Gap | Category | Root Cause | Subcategory | Action Plan |
    #KSDE-155
    Then I softly see top right button "Add" inside flex table "StudentPerformanceActionPlan"
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    Then I softly see asterisk mark on "Indicator"
    Then I softly see value "--None--" for the edit mode dropdown field "Indicator__c"
    Then I see only the following ordered options in dropdown field "Indicator__c" :
      | --None-- | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
    #KSDE-156
    Then I softly see field "Identified Gap" as "N/A"
    #KSDE-157
    And I wait for "3" seconds
    And I enter value "Implement targeted intervention strategies for underperforming students" into field "Action_Plan__c"
    And I enter value "English Learners" into field "Category__c"
    And I enter value "Policies/Processes" into field "Root_Cause__c"
    And I enter value "Scheduling barriers" into field "Subcategory__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To save, Indicator is required in the Performance Details section. |
    #KSDE-159
    And I enter value "2S2 Math" into field "Indicator__c"
    And I wait for "3" seconds
    And I enter value "English Learners" into field "Category__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "StudentPerformanceActionPlan" :
      | Indicator | Identified Gap | Category         | Root Cause         | Subcategory         | Action Plan                                                             |
      | 2S2 Math  | N/A            | English Learners | Policies/Processes | Scheduling barriers | Implement targeted intervention strategies for underperforming students |
    #KSDE-160
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    Then I softly see asterisk mark on "Category"
    Then I softly see value "--None--" for the edit mode dropdown field "Category__c"
    Then I see only the following ordered options in dropdown field "Category__c" :
      | --None-- | LEA Overall Score | Individuals with Disabilities | Economically Disadvantaged | Single Parents | English Learners | Non-Traditional Enrollees | Migrant Worker Parents | Homeless (includes Migrant) | Active Military Parent | Foster Care Youth |
    #KSDE-161
    And I enter value "2S2 Math" into field "Indicator__c"
    And I enter value "--None--" into field "Category__c"
    And I enter value "Implement targeted intervention strategies for underperforming students" into field "Action_Plan__c"
    And I enter value "Policies/Processes" into field "Root_Cause__c"
    And I wait for "2" seconds
    And I enter value "Scheduling barriers" into field "Subcategory__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To save, Category is required in the Performance Details section. |
    #KSDE-162
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    Then I softly see asterisk mark on "Root Cause"
    Then I softly see value "--None--" for the edit mode dropdown field "Root_Cause__c"
    Then I see only the following ordered options in dropdown field "Root_Cause__c" :
      | --None-- | Beliefs/Expectations | Policies/Processes | Environment | Instruction | People |
    #KSDE-163
    And I enter value "English Learners" into field "Category__c"
    And I enter value "--None--" into field "Root_Cause__c"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To save, Root Cause is required in the Cause section.  |
      | To save, Subcategory is required in the Cause section. |
    #KSDE-164
    And I enter value "Beliefs/Expectations" into field "Root_Cause__c"
    Then I softly see asterisk mark on "Subcategory"
    Then I see only the following ordered options in dropdown field "Subcategory__c" :
      | --None-- | Lack of Awareness about CTE | CTE Stigma | Implicit bias/stereotypes about particular learner groups | N/A |
    #KSDE-165
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To save, Subcategory is required in the Cause section. |
    #KSDE-168
    And I enter value "Beliefs/Expectations" into field "Root_Cause__c"
    And I enter value "Lack of Awareness about CTE" into field "Subcategory__c"
    When I clear the value from field "Action_Plan__c"
    Then I softly see asterisk mark on "Action Plan"
    Then I softly see the following messages in the page details contains:
      | To save, Action Plan is required in the Resolution section. |
    #KSDE-166
    And I enter value "{AUTOEnvData:StringOf3000Chars}" into field "Action_Plan__c"
    When I click modal button "Save"
    Then I see the following rows under the following headers in table with id "StudentPerformanceActionPlan" :
      | Indicator | Identified Gap | Category         | Root Cause           | Subcategory                 | Action Plan                                                             |
      | 2S2 Math  | N/A            | English Learners | Policies/Processes   | Scheduling barriers         | Implement targeted intervention strategies for underperforming students |
      | 2S2 Math  | N/A            | English Learners | Beliefs/Expectations | Lack of Awareness about CTE | {AUTOEnvData:StringOf3000Chars}                                         |

    Examples:
      | userType | Application Name                                                |
      | SPI3     | {SavedValue:Automation Runtime Announcement Application Intake} |

  @KSDE-169 @KSDE-174 @KSDE-170 @KSDE-171 @KSDE-175 @KSDE-176 @KSDE-177 @KSDE-178 @KSDE-179 @KSDE-180 @KSDE-181 @KSDE-182 @KSDE-183 @KSDE-184
    @KSDE-185 @KSDE-186 @KSDE-187 @KSDE-188 @KSDE-189 @KSDE-190 @KSDE-716 @KSDE-717
  Scenario Outline:Verify the column label for the Application File table
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "program-{SavedValue:InternalProgram_2}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<userType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Application Name>" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly cannot see "Proposal" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly do not see "Project Information" page block displayed
    When I navigate to "Budget" sub tab
    Then I softly do not see "Budget Narrative" page block displayed
    When I navigate to "Overview" sub tab
    When I enter "Edition1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    Then I softly see field "Budgeted Amount" inside page block
    Then I softly see field "Subaward Ceiling" as "$10,000.00"
    Then I softly see field "Subaward Floor" as "$1,000.00"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name   | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Health Science | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name   | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Health Science | $1,000.00  | $1,000.00                    | $0.00                      | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $1,000.00                    |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | Supplies    | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $1,000.00                    | $0.00                      | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
#    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
#      | Name                       | Is Key Contact |
#      | {SavedValue:SPI3 Username} | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Form Name" as "Perkins Secondary Improvement Grant"
    Then I softly see "School District Information" page block displayed
    Then I softly see "Local Plan" page block displayed
    Then I softly see "Student Performance Data (State Goals)" page block displayed
    Then I softly see "Student Performance Data (Actuals)" page block displayed
    Then I softly see "Student Performance Action Plan" page block displayed
    Then I softly see "Application Files" page block displayed
    Then I softly see "Time and Effort Certification" page block displayed
    Then I softly see "Certification" page block displayed
    When I enter "KSDE_ApplicationForm-2" values from "Application_Field_Values.xlsx"
    And I enter value "Checked" into field "Acknowledgement__c"
    And I enter value "Automation Test" into field "Acknowledgement_By__c"
    And I enter value "0" into field "Acknowledgement_Date__c"
    And I enter value "Checked" into field "Certify__c"
    And I enter value "Automation Test" into field "Certified_By__c"
    And I enter value "Automation Test" into field "Signature__c"
    And I enter value "0" into field "Certified_Date__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category          | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | LEA Overall Score | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                      | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Individuals with Disabilities | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                   | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Economically Disadvantaged | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category       | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Single Parents | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category         | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | English Learners | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                  | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Non-Traditional Enrollees | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category               | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Migrant Worker Parents | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                    | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Homeless (includes Migrant) | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category               | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Active Military Parent | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category          | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Foster Care Youth | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    Then I see the following rows under the following headers in table with id "StudentPerformanceData" :
      | Category                      | 1S1 Graduation | 1S1 Graduation Gap Or Exceed | 2S1 Reading Language Arts | 2S1 Reading Language Arts Gap Or Exceed | 2S2 Math | 2S2 Math Gap Or Exceed | 2S3 Science | 2S3 Science Gap Or Exceed | 3S1 Placement | 3S1 Placement Gap Or Exceed | 4S1 Nontraditional | 4S1 Nontraditional Gap Or Exceed | 5S2 Postsecondary Credits | 5S2 Postsecondary Credits Gap Or Exceed |
      | LEA Overall Score             | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Individuals with Disabilities | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Economically Disadvantaged    | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Single Parents                | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | English Learners              | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Non-Traditional Enrollees     | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Migrant Worker Parents        | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Homeless (includes Migrant)   | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Active Military Parent        | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Foster Care Youth             | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    And I enter value "2S2 Math" into field "Indicator__c"
    And I enter value "English Learners" into field "Category__c"
    And I enter value "Automation Test" into field "Action_Plan__c"
    And I enter value "Policies/Processes" into field "Root_Cause__c"
    And I enter value "Scheduling barriers" into field "Subcategory__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "StudentPerformanceActionPlan" :
      | Indicator | Identified Gap | Category         | Root Cause         | Subcategory         | Action Plan     |
      | 2S2 Math  | -60%           | English Learners | Policies/Processes | Scheduling barriers | Automation Test |
    #KSDE-174
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | CLNA Document is required.                                                   |
      | Contractual Provisions and Local Assurances Supporting Document is required. |
      | Program Income Form is required.                                             |
      | Approved Pathways Supporting Document is required.                           |
      | Consortium Contacts Document is required.                                    |
      | Memorandum of Understanding Document is required.                            |
    #KSDE-169
    Then I see the following rows under the following headers in table with id "SecondaryAppFormAttachment" :
      | Actions | Title | Classification | File Extension | Description | Created Date |
    #KSDE-170
    Then I softly see top right button "Add" inside flex table "SecondaryAppFormAttachment"
    And I wait for "2" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    Then I softly see "Add New File" opens in overLay window
    #KSDE-171
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | CLNA Document | Consortium Contacts Document | Contractual Provisions and Local Assurances Supporting Document | Memorandum of Understanding Document | Program Income Form | Approved Pathways Supporting Document |
    #KSDE-175
    And I upload attachment "Attachment.pdf" of type "CLNA Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Contractual Provisions and Local Assurances Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Program Income Form" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Approved Pathways Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on "Validate" in the page details
    #KSDE-176
    Then I softly see the following messages in the page details :
      | Consortium Contacts Document is required.         |
      | Memorandum of Understanding Document is required. |
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Consortium Contacts Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Memorandum of Understanding Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    #KSDE-177
    Then I softly see "Time and Effort Certification" page block displayed
    Then I softly see the text containing :
      | Each eligible recipient is responsible for establishing an effective system for recording time and effort certifications for salaries, honorarium and stipends, and substitutes.  Time and effort forms should be signed  by the employee after work is completed.  The time and effort form must include the following information: Employee Name, Educational Institution Name, Position, Time Period of Work Completed, Category of Work (salary, honorarium / stipend, substitute), Funding source used (Perkins only, Perkins/local funds), Signature / Date by Employee, Signature/Date by Supervisor.  Recipients must maintain time and effort records locally and be able to produce them for KSDE / fiscal monitoring.  An example of time and effort certification is available in Time and Effort Example Reference Documents. |
    #KSDE-178
    Then I softly see "Time and Effort Certification" page block displayed
    Then I see below fields in "Time and Effort Certification" page block
      | Acknowledgement | Acknowledgement By | Acknowledgement Date |
    Then I softly see field "Acknowledgement" as "True"
    #KSDE-179
    And I click on "Edit" in the page details
    When I enter value "UnChecked" into field "Acknowledgement__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Acknowledgement is required. |
    And I click on "Edit" in the page details
    And I enter value "Checked" into field "Acknowledgement__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-180
    Then I softly see field "Acknowledgement Date " as "{Date:M/d/yyyy::d+0}"
    #KSDE-181
    And I click on "Edit" in the page details
    When I clear the value from field "Acknowledgement_Date__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Acknowledgement Date is required.                                                                                                                                          |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I click on "Edit" in the page details
    And I enter value "0" into field "Acknowledgement_Date__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-182
    Then I softly see field "Acknowledgement By" as "Automation Test"
    #KSDE-183
    And I click on "Edit" in the page details
    When I clear the value from field "Acknowledgement_By__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Acknowledgement By is required.                                                                                                                                            |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I click on "Edit" in the page details
    And I enter value "Automation Test" into field "Acknowledgement_By__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-184
    Then I softly see "Certification" page block displayed
    Then I softly see the text containing :
      | I verify that the information included in this application is true and accurate. |
    #KSDE-185
    Then I softly see field "Certified By" as "Automation Test"
    #KSDE-186
    And I click on "Edit" in the page details
    When I clear the value from field "Certified_By__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Certified By is required.                                                                                                                                                  |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I click on "Edit" in the page details
    And I enter value "Automation Test" into field "Certified_By__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-187
    Then I softly see field "Signature" as "Automation Test"
    #KSDE-188
    And I click on "Edit" in the page details
    When I clear the value from field "Signature__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Signature is required.                                                                                                                                                     |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I click on "Edit" in the page details
    And I enter value "Automation Test" into field "Signature__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-189
    Then I softly see field "Certified Date" as "{Date:M/d/yyyy::d+0}"
    #KSDE-190
    And I click on "Edit" in the page details
    When I clear the value from field "Certified_Date__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Certified Date is required.                                                                                                                                                |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I click on "Edit" in the page details
    And I enter value "{Date:M/d/yyyy::d+0}" into field "Certified_Date__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-716
    Then I softly see "Certification" page block displayed
    Then I see below fields in "Certification" page block
      | Certify | Certified By | Signature | Certified Date |
    Then I softly see field "Certify" as "True"
    #KSDE-717
    And I click on "Edit" in the page details
    When I enter value "UnChecked" into field "Certify__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Certify is required. |
    And I click on "Edit" in the page details
    And I enter value "Checked" into field "Certify__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details

    Examples:
      | userType | Application Name                                                |
      | SPI3     | {SavedValue:Automation Runtime Announcement Application Intake} |

  @KSDE-723 @KSDE-724 @KSDE-725 @KSDE-726 @KSDE-727 @KSDE-728 @KSDE-729 @KSDE-730 @KSDE-731 @KSDE-732 @KSDE-733 @KSDE-734 @KSDE-735 @KSDE-736
  Scenario Outline: Test the State Goal - 1S1 Graduation field number field functionality for the Student Performance Data (State Goals) Section
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "program-{SavedValue:InternalProgram_2}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<userType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Application Name>" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly cannot see "Proposal" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly do not see "Project Information" page block displayed
    When I navigate to "Budget" sub tab
    Then I softly do not see "Budget Narrative" page block displayed
    When I navigate to "Overview" sub tab
    When I enter "Edition1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    Then I softly see field "Budgeted Amount" inside page block
    Then I softly see field "Subaward Ceiling" as "$10,000.00"
    Then I softly see field "Subaward Floor" as "$1,000.00"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name   | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Health Science | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name   | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Health Science | $1,000.00  | $1,000.00                    | $0.00                      | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $1,000.00                    |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | Supplies    | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $1,000.00                    | $0.00                      | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
#    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
#      | Name                       | Is Key Contact |
#      | {SavedValue:SPI3 Username} | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Form Name" as "Perkins Secondary Improvement Grant"
    Then I softly see "School District Information" page block displayed
    Then I softly see "Local Plan" page block displayed
    Then I softly see "Student Performance Data (State Goals)" page block displayed
    Then I softly see "Student Performance Data (Actuals)" page block displayed
    Then I softly see "Student Performance Action Plan" page block displayed
    Then I softly see "Application Files" page block displayed
    Then I softly see "Time and Effort Certification" page block displayed
    Then I softly see "Certification" page block displayed
    When I enter "KSDE_ApplicationForm-2" values from "Application_Field_Values.xlsx"
    And I enter value "Checked" into field "Acknowledgement__c"
    And I enter value "Automation Test" into field "Acknowledgement_By__c"
    And I enter value "0" into field "Acknowledgement_Date__c"
    And I enter value "Checked" into field "Certify__c"
    And I enter value "Automation Test" into field "Certified_By__c"
    And I enter value "Automation Test" into field "Signature__c"
    And I enter value "0" into field "Certified_Date__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category          | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | LEA Overall Score | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                      | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Individuals with Disabilities | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                   | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Economically Disadvantaged | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category       | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Single Parents | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category         | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | English Learners | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                  | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Non-Traditional Enrollees | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category               | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Migrant Worker Parents | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                    | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Homeless (includes Migrant) | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category               | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Active Military Parent | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category          | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Foster Care Youth | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    Then I see the following rows under the following headers in table with id "StudentPerformanceData" :
      | Category                      | 1S1 Graduation | 1S1 Graduation Gap Or Exceed | 2S1 Reading Language Arts | 2S1 Reading Language Arts Gap Or Exceed | 2S2 Math | 2S2 Math Gap Or Exceed | 2S3 Science | 2S3 Science Gap Or Exceed | 3S1 Placement | 3S1 Placement Gap Or Exceed | 4S1 Nontraditional | 4S1 Nontraditional Gap Or Exceed | 5S2 Postsecondary Credits | 5S2 Postsecondary Credits Gap Or Exceed |
      | LEA Overall Score             | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Individuals with Disabilities | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Economically Disadvantaged    | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Single Parents                | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | English Learners              | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Non-Traditional Enrollees     | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Migrant Worker Parents        | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Homeless (includes Migrant)   | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Active Military Parent        | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Foster Care Youth             | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    And I enter value "2S2 Math" into field "Indicator__c"
    And I enter value "English Learners" into field "Category__c"
    And I enter value "Automation Test" into field "Action_Plan__c"
    And I enter value "Policies/Processes" into field "Root_Cause__c"
    And I enter value "Scheduling barriers" into field "Subcategory__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "StudentPerformanceActionPlan" :
      | Indicator | Identified Gap | Category         | Root Cause         | Subcategory         | Action Plan     |
      | 2S2 Math  | -60%           | English Learners | Policies/Processes | Scheduling barriers | Automation Test |
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "CLNA Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Consortium Contacts Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Contractual Provisions and Local Assurances Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Memorandum of Understanding Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Program Income Form" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Approved Pathways Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #KSDE-723
    Then I softly see "Student Performance Data (State Goals)" page block displayed
    Then I see below fields in "Student Performance Data (State Goals)" page block
      | State Goal - 1S1 Four-Year Graduation Rate | State Goal - 2S1 Academic Proficiency in Reading/Language Arts | State Goal - 2S2 Academic Proficiency in Mathematics | State Goal - 2S3 Academic Proficiency in Science | State Goal - 3S1 Post-Program Placement | State Goal - 4S1 Non-traditional Program Concentration | State Goal - 5S2 Program Quality - Attained Postsecondary Credits |
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Graduation__c"
    And I click on "Save" in the page details
    Then I softly see field "State Goal - 1S1 Four-Year Graduation Rate" as "1,234,567,890,123,456.25%"
    #KSDE-730
    And I click on "Edit" in the page details
    When I clear the value from field "SG_Graduation__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | State Goal - 1S1 Four-Year Graduation Rate is required.                                                                                                                    |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Graduation__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-724
    Then I softly see "Student Performance Data (State Goals)" page block displayed
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Reading_Language_Arts__c"
    And I click on "Save" in the page details
    Then I softly see field "State Goal - 2S1 Academic Proficiency in Reading/Language Arts" as "1,234,567,890,123,456.25%"
    #KSDE-731
    And I click on "Edit" in the page details
    When I clear the value from field "SG_Reading_Language_Arts__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | State Goal - 2S1 Academic Proficiency in Reading/Language Arts is required.                                                                                                |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Reading_Language_Arts__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-725
    Then I softly see "Student Performance Data (State Goals)" page block displayed
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Math__c"
    And I click on "Save" in the page details
    Then I softly see field "State Goal - 2S2 Academic Proficiency in Mathematics" as "1,234,567,890,123,456.25%"
    #KSDE-732
    And I click on "Edit" in the page details
    When I clear the value from field "SG_Math__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | State Goal - 2S2 Academic Proficiency in Mathematics is required.                                                                                                          |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Math__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-726
    Then I softly see "Student Performance Data (State Goals)" page block displayed
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Science__c"
    And I click on "Save" in the page details
    Then I softly see field "State Goal - 2S3 Academic Proficiency in Science" as "1,234,567,890,123,456.25%"
    #KSDE-733
    And I click on "Edit" in the page details
    When I clear the value from field "SG_Science__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | State Goal - 2S3 Academic Proficiency in Science is required.                                                                                                              |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Science__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-727
    Then I softly see "Student Performance Data (State Goals)" page block displayed
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Placement__c"
    And I click on "Save" in the page details
    Then I softly see field "State Goal - 3S1 Post-Program Placement" as "1,234,567,890,123,456.25%"
    #KSDE-734
    And I click on "Edit" in the page details
    When I clear the value from field "SG_Placement__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | State Goal - 3S1 Post-Program Placement is required.                                                                                                                       |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Placement__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-728
    Then I softly see "Student Performance Data (State Goals)" page block displayed
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Nontraditional__c"
    And I click on "Save" in the page details
    Then I softly see field "State Goal - 4S1 Non-traditional Program Concentration" as "1,234,567,890,123,456.25%"
    #KSDE-735
    And I click on "Edit" in the page details
    When I clear the value from field "SG_Nontraditional__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | State Goal - 4S1 Non-traditional Program Concentration is required.                                                                                                        |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Nontraditional__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-729
    Then I softly see "Student Performance Data (State Goals)" page block displayed
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Postsecondary_Credits__c"
    And I click on "Save" in the page details
    Then I softly see field "State Goal - 5S2 Program Quality - Attained Postsecondary Credits" as "1,234,567,890,123,456.25%"
    #KSDE-736
    And I click on "Edit" in the page details
    When I clear the value from field "SG_Postsecondary_Credits__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | State Goal - 5S2 Program Quality - Attained Postsecondary Credits is required.                                                                                             |
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I click on "Edit" in the page details
    When I enter value "1234567890123456.25" into field "SG_Postsecondary_Credits__c"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details

    Examples:
      | userType | Application Name                                                |
      | SPI3     | {SavedValue:Automation Runtime Announcement Application Intake} |

  @KSDE-737 @KSDE-738 @KSDE-739 @KSDE-740
  Scenario Outline:Verify the Subcategory field for the Action Plan Modal when "Policies/Processes" is selected in Root Cause field
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "program-{SavedValue:InternalProgram_2}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<userType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Application Name>" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    #KSDE-737
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    Then I softly see asterisk mark on "Root Cause"
    And I enter value "Policies/Processes" into field "Root_Cause__c"
    And I wait for "3" seconds
    Then I softly see asterisk mark on "Subcategory"
    Then I see only the following ordered options in dropdown field "Subcategory__c" :
      | --None-- | Admissions barriers | Scheduling barriers | Disciplinary barriers | Lack of policies that support diversity | Lack of systemic counseling and advisement | Siloed departments and services | N/A |
    #KSDE-738
    And I select dropdown value "Environment" in field "Root_Cause__c"
    And I wait for "3" seconds
    Then I softly see asterisk mark on "Subcategory"
    Then I see only the following ordered options in dropdown field "Subcategory__c" :
      | --None-- | Lack of access to relevant facilities and equipment | Lack of access to qualified CTE instructors and industry partners | Financial barriers | Tangible barriers | N/A |
    #KSDE-739
    And I select dropdown value "Instruction" in field "Root_Cause__c"
    And I wait for "3" seconds
    Then I softly see asterisk mark on "Subcategory"
    Then I see only the following ordered options in dropdown field "Subcategory__c" :
      | --None-- | Lack of relevant, engaging hands-on and work-based learning experiences | Bias in instruction/curriculum | Barriers to learning and student progress | N/A |
    #KSDE-740
    And I select dropdown value "People" in field "Root_Cause__c"
    And I wait for "3" seconds
    Then I softly see asterisk mark on "Subcategory"
    Then I see only the following ordered options in dropdown field "Subcategory__c" :
      | --None-- | Lack of diversity in the CTE educator workforce | Lack of diversity among industry partners | N/A |

    Examples:
      | userType | Application Name                                                |
      | SPI3     | {SavedValue:Automation Runtime Announcement Application Intake} |

  @KSDE-841 @KSDE-842
  Scenario Outline:Verify the validation if the user misses data in the Student Performance Data (Actuals) section
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "program-{SavedValue:InternalProgram_2}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<userType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Application Name>" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    When I enter "Edition1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name   | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Health Science | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name   | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Health Science | $1,000.00  | $1,000.00                    | $0.00                      | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $1,000.00                    |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | Supplies    | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $1,000.00                    | $0.00                      | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
#    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
#      | Name                       | Is Key Contact |
#      | {SavedValue:SPI3 Username} | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "KSDE_ApplicationForm-2" values from "Application_Field_Values.xlsx"
    And I enter value "Checked" into field "Acknowledgement__c"
    And I enter value "Automation Test" into field "Acknowledgement_By__c"
    And I enter value "0" into field "Acknowledgement_Date__c"
    And I enter value "Checked" into field "Certify__c"
    And I enter value "Automation Test" into field "Certified_By__c"
    And I enter value "Automation Test" into field "Signature__c"
    And I enter value "0" into field "Certified_Date__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    And I enter value "2S2 Math" into field "Indicator__c"
    And I enter value "English Learners" into field "Category__c"
    And I enter value "Automation Test" into field "Action_Plan__c"
    And I enter value "Policies/Processes" into field "Root_Cause__c"
    And I enter value "Scheduling barriers" into field "Subcategory__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "CLNA Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Consortium Contacts Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Contractual Provisions and Local Assurances Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Memorandum of Understanding Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Program Income Form" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Approved Pathways Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on "Validate" in the page details
    #KSDE-841
    Then I softly see the following messages in the page details :
      | Please enter data for at least one field in the Student Performance Data (Actuals) section. |
    #KSDE-842
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category          | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | LEA Overall Score | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I click on "Validate" in the page details
    Then I softly cannot see the following messages in the page details :
      | Please enter data for at least one field in the Student Performance Data (Actuals) section. |
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

    Examples:
      | userType | Application Name                                                |
      | SPI3     | {SavedValue:Automation Runtime Announcement Application Intake} |

    ##################################### Email validation ##########################################################