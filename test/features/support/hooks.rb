browser = Watir::Browser.new :firefox

Before do
  @browser = browser
end

After do
  # @browser.close
end

at_exit do
  browser.close
end