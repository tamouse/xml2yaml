Feature: Show extra info for debugging purposes
  In order to *really* see what my program is doing on the inside
  I will need to be set the debug option

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

  Scenario: turn on the debug feature
    When I successfully run `xml2yaml --debug test.xml`
    Then the output should contain "DEBUG"
    And the output should contain "DEBUG - options:"
    And the output should contain "DEBUG - xmlfile: test.xml"
    And the output should contain "DEBUG - yamlfile: test.yaml"

  

