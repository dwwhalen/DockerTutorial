require 'watir'
require 'headless'

# if ENV['HEADLESS']
  headless = Headless.new
  headless.start
# end
browser = Watir::Browser.start 'www.google.com'
# puts b.title
# b.close
# headless.destroy

Before do
  @browser = browser
end

After do
  # @browser.close
end

at_exit do
  # if ENV['HEADLESS']
    headless.destroy
  # else
  #   browser.close
  # end

end