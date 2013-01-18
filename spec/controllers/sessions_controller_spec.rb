require 'spec_helper'

describe SessionsController do

	describe "Load login page" do
		it "should be successful" do
    	get :new    	
    	response.should be_successful
  	end	
	end

	describe "Create: CTS ldap login" do
		it "without Params" do
			params = {:user_id => nil, :password => nil}
			post :create, params		
			flash[:notice].should =~ /Username or Password is incorrect/i
		end

		it "with invalid Params" do
			params = {:user_id => "123", :password => "125"}
			post :create, params		
			flash[:notice].should =~ /Username or Password is incorrect/i
		end

		it "with valid Params" do
			params = {:user_id => "348334", :password => "p@ss2win2"}
			post :create, params		
			session[:access_token].should_not be_nil
			flash[:notice].should =~ /Login Success/i
		end		
	end

end
