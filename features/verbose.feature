Feature: Show progress of operations
  In order to see what my program is doing
  I will need to be set the verbose option

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

  Scenario: turn on the verbose feature
    When I successfully run `xml2yaml --verbose test.xml`
    Then the output should contain "Converting test.xml"
    And the output should contain "Wrote test.yaml"

  

