require './spec/spec_helper'
require 'selenium-webdriver'
require 'faker'

class AbstractPage

	def initialize(driver)
		@@driver = driver
	end

	def login
	end

	def logout
		@@driver.find_element(:id, "log_out_path").click
		sleep(inspection_time=4)
		return HomePage.new(@@driver)
	end

	def navigate_to_home_page
		@@driver.navigate.to("https://movielaunch.herokuapp.com/")
		sleep(inspection_time=4)
		return HomePage.new(@@driver)
	end

	def navigate_to_login_page
		@@driver.find_element(:id, 'log_in_path').click
		sleep(inspection_time=4)
		return LogInPage.new(@@driver)
	end

	def quit
		@@driver.quit
	end


end