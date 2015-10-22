require_relative "../../spec/page_objects/abstract_page"
require_relative "../../spec/page_objects/home_page"


class LogInPage < AbstractPage


	def initialize(driver)
		@@driver = driver
	end


	def fill_in_email(email = "murat@breakthrough.com")
		@@driver.find_element(:id, 'email').send_keys email
		return LogInPage.new(@@driver)
	end

	def fill_in_password(password = "asdfasdf")
		@@driver.find_element(:id, 'password').send_keys password
		return LogInPage.new(@@driver)
	end

	def submit
		@@driver.find_element(:name, 'commit').click
		sleep(inspection_time=3)
		return HomePage.new(@@driver)
	end

	def submit_invalid_form
		@@driver.find_element(:name, 'commit').click
		sleep(inspection_time=3)
		return LogInPage.new(@@driver)
	end


	def get_invalid_alert
		@@driver.find_element(:id, "alert").text
	end





end