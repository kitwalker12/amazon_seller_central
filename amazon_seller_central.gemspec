$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "amazon_seller_central/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "amazon_seller_central"
  s.version     = AmazonSellerCentral::VERSION
  s.authors     = ["Aditya Raghuwanshi"]
  s.email       = ["adi.version1@gmail.com"]
  s.homepage    = "https://github.com/kitwalker12/amazon_seller_central"
  s.summary     = "Amazon Seller Central API"
  s.description = "Amazon Seller Central API for Ruby"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"
end
