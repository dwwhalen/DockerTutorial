
# require 'headless'
# @headless = Headless.new
# @headless.start


browser = Watir::Browser.new :firefox


Before do
  @browser = browser
end

After do

end

at_exit do
  unless browser.nil?
    browser.close
  end
  # unless headless.nil?
  #   headless.destroy
  # end
end
