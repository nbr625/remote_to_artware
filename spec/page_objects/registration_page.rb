require_relative "../../spec/page_objects/abstract_page"
require_relative "../../spec/page_objects/home_page"
require 'faker'

class RegistrationPage < AbstractPage

	def input_email(email = Faker::Internet.email)
		@@driver.find_element(:id, "email").send_keys email
		return RegistrationPage.new(@@driver)
	end

	def input_password(password = "asdfasdf")
		@@driver.find_element(:id, "password").send_keys password
		return RegistrationPage.new(@@driver)
	end

	def input_pw_confirmation(confirm = "asdfasdf")
		@@driver.find_element(:id, "password_confirmation").send_keys confirm
		return RegistrationPage.new(@@driver)
	end 
	def input_username(username = Faker::Lorem.word)
		@@driver.find_element(:id, "password_confirmation").send_keys username
		return RegistrationPage.new(@@driver)
	end

	def submit
		@@driver.find_element(:name, "commit").click
		sleep(inspection_time=3)
		return HomePage.new(@@driver)

	end

	def submit_invalid_registration_form
		@@driver.find_element(:name, "commit").click
		sleep(inspection_time=3)
		return RegistrationPage.new(@@driver)
	end


	def get_invalid_sign_up_alert
		@@driver.find_element(:xpath, '/html/body/div[2]/div/div[1]/form/div[1]/ul/li[1]').text
	end

end