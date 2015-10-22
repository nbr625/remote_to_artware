require './spec/spec_helper'
require 'selenium-webdriver'

require_relative "../../spec/page_objects/home_page"

feature "Signing in to Movielauch" do

  app = nil

  before(:all) do
    app = AbstractPage.new(Selenium::WebDriver.for(:firefox))
  end


  it 'should let me in with a valid account' do

    success_confirmation = app 
      .navigate_to_home_page
      .navigate_to_login_page
      .fill_in_email
      .fill_in_password
      .submit
    notice = success_confirmation.get_success_confirmation
    expect(notice).to eq('Signed in successfully.')
  end

  it 'should let user sign out after login' do
    log_out_notice = app  
      .logout 
    success_logout = log_out_notice.get_success_confirmation
    expect(success_logout).to eq('Signed out successfully.')
  end

  it 'should not let me in with an invalid email' do
    alert_message = app 
      .navigate_to_login_page
      .fill_in_email("invalid@gmail.com")
      .fill_in_password
      .submit_invalid_form
    notice = success_confirmation.get_invalid_alert
    expect(notice).to eq("Invalid email or password.")
  end


  it 'should not let me in with an invalid password' do
    alert_message = app 
      .navigate_to_login_page
      .fill_in_email
      .fill_in_password("password")
      .submit_invalid_form
    notice = success_confirmation.get_invalid_alert
    expect(notice).to eq("Invalid email or password.")
  end

  after(:all) do
    app.quit
  end
    

end
