Feature: Convert an xml file into a yaml file
  In order to have xml data saved in yaml format
  I will need to run the xml2yaml script with an xml file

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

  Scenario: Convert an xml file into a yaml file
    When I successfully run `xml2yaml test.xml`
    Then the output should match /^$/
    And a file named "test.yaml" should exist
    And the file "test.yaml" should match /^---\ncatalog:/

