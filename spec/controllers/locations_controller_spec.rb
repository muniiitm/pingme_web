require 'spec_helper'

describe LocationsController do

  describe "Show locations search page" do
    it "with valid access_token" do
      session[:access_token] = "MzQ4MzM0IGViNDQzNTFmM2JiNmU3NTY4MDg0"
      get :new
      assigns(:countries).should_not be_nil
      session[:access_token] = ""
    end

    it "with invalid or empty access_token" do
      session[:access_token] = "K23ksd23z9"
      get :new
      flash[:notice] =~ /Access token mismatched/i
      response.should redirect_to(new_sessions_path)
    end
  end

  describe "Show locations index page" do
    it "with valid access_token" do
      session[:access_token] = "MzQ4MzM0IGViNDQzNTFmM2JiNmU3NTY4MDg0"
      get :index
      assigns(:countries).should_not be_nil
      session[:access_token] = ""
    end

    it "with invalid or empty access_token" do
      session[:access_token] = "K23ksd23z9"
      get :index
      flash[:notice] =~ /Access token mismatched/i
      response.should redirect_to(new_sessions_path)
    end
  end

  describe "Create Location" do
    it "with valid params" do
      session[:access_token] = "MzQ4MzM0IGViNDQzNTFmM2JiNmU3NTY4MDg0"
      params = {}
      params[:user] = {}
      params[:user][:date_range] = "today"
      params[:user][:country] = "India"
      params[:user][:state] = "Tamilnadu"
      params[:user][:city] = "Chennai"
      params[:user][:location] = "Vadapalani, Chennai"
      params[:user][:seat_number] = "PKN7A063"
      params[:user][:contact_phone] = "1234567898"
      params[:user][:vnet] = "2"

      post :create, params
    end
  end


end
