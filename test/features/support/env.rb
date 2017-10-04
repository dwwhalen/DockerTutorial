require 'rspec'
require 'page-object'
require 'page-object/page_factory'
require 'watir'

World(PageObject::PageFactory)

# # if ENV['HEADLESS']
#   require 'headless'
#   headless = Headless.new
#   headless.start
# end

at_exit do
  # unless headless.nil?
  #   headless.destroy
  # end
end