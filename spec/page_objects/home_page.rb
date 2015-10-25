require_relative "../../spec/page_objects/abstract_page"
require_relative "../../spec/page_objects/log_in_page"
require_relative "../../spec/page_objects/new_movie_page"
require_relative "../../spec/page_objects/registration_page"



class HomePage < AbstractPage

	def initialize(driver)
		super(driver)
	end




	def navigate_to_new_movie_page
		return NewMoviePage.new(@@driver)
	end

	def get_success_confirmation
		@@driver.find_element(:id, "notice").text
	end
end