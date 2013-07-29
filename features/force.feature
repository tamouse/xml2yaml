Feature: Force the yaml file to be overwritten if it exists
  In order to remove prior results
  I will need to be able to force the overwriting of existing yaml files

  Background:
    Given a file named "test.xml" with:
    """
    <?xml version="1.0"?>
    <catalog>
    <book id="bk101">
      <author>Gambardella, Matthew</author>
      <title>XML Developer's Guide</title>
      <genre>Computer</genre>
      <price>44.95</price>
      <publish_date>2000-10-01</publish_date>
      <description>An in-depth look at creating applications 
      with XML.</description>
    </book>
    </catalog>
    """
    Given a file named "test.yaml" with:
    """
    ---
    something
    """

  Scenario: An existing yaml file will cause an error
    When I run `xml2yaml test.xml`
    Then the exit status should not be 0
    And the stderr should contain "test.yaml exists!"

  Scenario: Using --force to overwrite existing yaml file
    When I run `xml2yaml --force test.xml`
    Then the exit status should be 0
    And the output should match /^$/
