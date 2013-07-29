# Xml2yaml

Convert an xml file to a yaml file.

## Installation

Add this line to your application's Gemfile:

    gem 'xml2yaml'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xml2yaml

## Usage -- Command Line

    $ xml2yaml [options] XMLFILES....

For each xml file given on the command line, a yaml file is written
alongside it.

### Options

`xml2yaml` has only a few options:

- **--force**: force the overwriting of the yaml file if it already
  exists. The default is to raise an error if the yaml file already
  exists.

- **--verbose**: turn on informational output to follow along with
  the progress of the script.

- **--debug**: turn on extra debugging information to help solve
  problems.

### Examples

        $ xml2yaml books.xml

produces `books.yaml`

        $ xml2yaml ~/Downloads/my_wp_blog.xml ~/Downloads/my_other_wp_blog.xml

produces `~/Downloads/my_wp_blog.yaml` and
`~/Downloads/my_other_wp_blog.yaml`.

        $ touch test.yaml
        $ xml2yaml test.xml

Causes an error since `test.yaml` already exists.

        $ touch test.yaml
        $ xml2yaml --force test.xml

Overwrites the existing `test.yaml` with no warnings.

## Usage -- Library

    require 'xml2yaml'

    File.write("books.yaml", Xml2yaml.convert(File.read("books.xml")))




## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
