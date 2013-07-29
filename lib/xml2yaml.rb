
require 'active_support/core_ext/hash/conversions'
require 'yaml'

require 'xml2yaml/version.rb'



module Xml2yaml

  def self.convert(xml)
    Hash.from_xml(xml).to_yaml
  end

end
