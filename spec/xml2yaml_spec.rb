require 'spec_helper'

describe Xml2yaml do
  it 'should have a version number' do
    Xml2yaml::VERSION.should_not be_nil
  end
  it "should respond to :convert" do
    Xml2yaml.should respond_to :convert
  end
  it "when given an empty string, the yaml will encode a nil" do
    YAML.load(Xml2yaml.convert('')).should be_nil
  end

  context "processing books.xml" do
    let(:xml) {File.read "spec/test_data/books.xml"}
    let(:yaml) {Xml2yaml.convert(xml)}
    let(:hash) {YAML.load(yaml)}
    it "should return a YAML string" do
      yaml.should be_a(String)
      yaml.should =~ /^---\n/
    end
    it "should convert to a hash" do
      hash.should be_a(Hash)
    end
    it "should have one top-level key: 'catalog'" do
      hash.keys.count.should == 1
      hash.keys.should include "catalog"
    end
    context "examining 'catalog'" do
      let(:catalog) {hash["catalog"]}
    
      it "should have one second level key: 'book'" do
        catalog.keys.count.should == 1
        catalog.keys.should include "book"
      end

      context "examining 'catalog/book'" do
        let(:book) {catalog['book']}
        it "should be an array" do
          book.should be_a(Array)
        end
        it "book should have 12 items" do
          book.count.should == 12
        end

        context "examining 'catalog/book.first'" do
          let(:book1) {book.first}
          it "should be a hash" do
            book1.should be_a(Hash)
          end
          %w{id author title genre price publish_date description}.each do |attr|
            it "should have attribute #{attr}" do
              book1.has_key?(attr).should be_true
            end
          end
          
          
        end
        
      end
      
    end
    
  end
  
end
