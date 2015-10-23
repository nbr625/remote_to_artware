require './spec/spec_helper'
require 'selenium-webdriver'

require_relative "../../spec/page_objects/home_page"

feature "Signing in to Movielauch" do

  app = nil

  before(:all) do
    app = AbstractPage.new(Selenium::WebDriver.for(:firefox))
  end


  it 'should let user register' do

    success_confirmation = app 
      .navigate_to_home_page
      .navigate_to_login_page
      .fill_in_email
      .fill_in_password
      .submit
    notice = success_confirmation.get_success_confirmation
    expect(notice).to eq('Signed in successfully.')
  end

  it 'should let user sign out after registering' do
    log_out_notice = app  
      .logout 
    success_logout = log_out_notice.get_success_confirmation
    expect(success_logout).to eq('Signed out successfully.')
  end

    it "should not let user sign up without inputing an email" do 
      signup_alert = app
        .navigate_to_sign_up
        .input_password("asdfasdf")
        .input_pw_confirmation("asdfasdf")
        .input_username
        .submit_invalid_sign_up_form

      alert = signup_alert.get_invalid_sign_up_alert
      expect(alert).to eq('Email can\'t be blank')
    end

    it "should not let user sign up if email is taken" do 

      signup_alert = app
        .navigate_to_sign_up
        .input_email('murat@breakthrough.com')
        .input_password("asdfasdf")
        .input_pw_confirmation("asdfasdf")
        .input_username
        .submit_invalid_sign_up_form

      alert = signup_alert.get_invalid_sign_up_alert
      expect(alert).to eq('Email has already been taken')
    end

    it "should not let user sign up with valid credential without inputting a password" do
      signup_alert = app
        .navigate_to_sign_up
        .input_email
        .input_username
        .submit_invalid_sign_up_form

      alert = signup_alert.get_invalid_sign_up_alert
      expect(alert).to eq('Password can\'t be blank')
    end

    it "should not let user sign up without inputing a password confirmation" do  

      signup_alert = app
        .navigate_to_sign_up
        .input_email
        .input_password("asdfasdf")
        .input_username
        .submit_invalid_sign_up_form

      alert = signup_alert.get_invalid_sign_up_alert
      expect(alert).to eq('Password confirmation doesn\'t match Password')
    end

    it "should not let user sign up if password confimation does not match" do  

      signup_alert = app
        .navigate_to_sign_up
        .input_email
        .input_password("asdfasdf")
        .input_pw_confirmation("incorrect")
        .input_username
        .submit_invalid_sign_up_form

      alert = signup_alert.get_invalid_sign_up_alert
      expect(alert).to eq("Password confirmation doesn\'t match Password")
    end

    it "should not let user sign up if username is taken" do  

      signup_alert = app
        .navigate_to_sign_up
        .input_email
        .input_password("asdfasdf")
        .input_pw_confirmation("asdfasdf")
        .input_username("nbr625")
        .submit_invalid_sign_up_form
        
      alert = signup_alert.get_invalid_sign_up_alert
      expect(alert).to eq('Username has already been taken')
    end

  after(:all) do
    app.quit
  end
    

end
