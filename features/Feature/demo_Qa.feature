Feature: Demo_tools_QA
  Scenario Outline: goto toolsqa and get the registration completed
    Given navigate to demotoolQa website
    Then click on add button
    Then enter the first name "<first_name>", last name "<last_name>", email "<email>", age "<age>", salary "<salary>", and department "<department>"
    Then click on search and enter the registered first name "<first_name>
    Then delete the search result
    Examples:
      | first_name | last_name | email                | age | salary | department   |
      | Anmol       | Suhane       | anmol@yopmail.com | 30  | 50000  | Quality   |
      | Test      | Test       | Test@yopmail.com | 100 | 10000  | Developer   |
