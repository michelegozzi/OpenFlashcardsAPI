require 'rails_helper'
require 'pp'

RSpec.describe ::V1::ApiTopicsController, type: :controller do



  describe "GET #index" do
  
    context "via api token" do
      
      let!(:user)  { create :user }
      
      context "without topics" do
        it "responds successfully with an HTTP 200 status code via facebook token" do
          request.env['HTTP_AUTHORIZATION'] = 'Token token="'+user.api_keys.first.access_token+'"'
          request.env['HTTP_ACCEPT'] = 'application/openflashcards.api.v1'
          get :index, nil
          expect(response).to be_success
          expect(response).to have_http_status(200)
          
          #pp response.body
          parsed_body = JSON.parse(response.body)
          #pp parsed_body
          expect(parsed_body.length).to be == 0
        end
      end
      
      context "with topic" do
        let!(:topic)  { create :topic }

        it "responds successfully with an HTTP 200 status code" do
          request.env['HTTP_AUTHORIZATION'] = 'Token token="'+user.api_keys.first.access_token+'"'
          request.env['HTTP_ACCEPT'] = 'application/openflashcards.api.v1'
          get :index, nil
          expect(response).to be_success
          expect(response).to have_http_status(200)
          
          parsed_body = JSON.parse(response.body)
          expect(parsed_body.length).to be >= 1
          expect(parsed_body[0].present?).to be true
          expect(parsed_body[0]["name"]).to eq("US Citizenship Civic Test")
        end
      end
    end
    
    context "via api facebook token" do
      context "without topics" do
        it "responds successfully with an HTTP 200 status code via facebook token" do
          request.env['HTTP_AUTHORIZATION'] = 'Bearer '+ ENV["FB_API_TOKEN"]
          request.env['HTTP_ACCEPT'] = 'application/openflashcards.facebook.v1'
          get :index, nil
          ###get :index, nil, :accept => 'application/openflashcards.facebook.v1'
          ###get :index, nil, { 'HTTP_AUTHORIZATION' => 'Bearer '+ ENV["FB_API_TOKEN"], 'HTTP_ACCEPT' => 'application/openflashcards.facebook.v1' }
          expect(response).to be_success
          expect(response).to have_http_status(200)
          
          #pp response.body
          parsed_body = JSON.parse(response.body)
          #pp parsed_body
          expect(parsed_body.length).to be == 0
        end
      end
  
      context "with topic" do
        #topic = FactoryGirl.create(:topic)
        let!(:topic)  { create :topic }
        #let(:article) { build :article, title: 'article title', author: author }

        it "responds successfully with an HTTP 200 status code" do
          request.env['HTTP_AUTHORIZATION'] = 'Bearer '+ ENV["FB_API_TOKEN"]
          request.env['HTTP_ACCEPT'] = 'application/openflashcards.facebook.v1'
          get :index, nil
          ###get :index, nil, :accept => 'application/openflashcards.facebook.v1'
          expect(response).to be_success
          expect(response).to have_http_status(200)
          
          parsed_body = JSON.parse(response.body)
          expect(parsed_body.length).to be >= 1
          expect(parsed_body[0].present?).to be true
          expect(parsed_body[0]["name"]).to eq("US Citizenship Civic Test")
          
          #expect(foo).to eq(bar)
          #expect(foo).not_to eq(bar)
        end
      end
    end
  end
  
  describe "GET #show" do
    context "via api facebook token" do
      context "without topics" do
        let!(:topic)  { create :topic }

        it "responds successfully with an HTTP 200 status code" do
          #pp topic.id.to_s
          request.env['HTTP_AUTHORIZATION'] = 'Bearer '+ ENV["FB_API_TOKEN"]
          request.env['HTTP_ACCEPT'] = 'application/openflashcards.facebook.v1'
          get :show, id: topic.id.to_s
          ###get :show, id: topic.id.to_s, :accept => 'application/openflashcards.facebook.v1'
          expect(response).to be_success
          expect(response).to have_http_status(200)

          #pp response.body
          parsed_body = JSON.parse(response.body)
          #pp parsed_body
          expect(parsed_body.length).to be >= 1
          expect(parsed_body["name"].present?).to be true
          expect(parsed_body["name"]).to eq(topic.name)
          expect(parsed_body["description"].present?).to be true
          expect(parsed_body["description"]).to eq(topic.description)
        end
      end
    end
  end
  
  describe "POST #create" do #, :type => :request do
    context "via api facebook token" do
      it "responds successfully with an HTTP 200 status code" do
        name = Faker::Lorem.sentence(3, true, 4)
        description = Faker::Lorem.sentence(4, true, 8)
        params = { :topic => { :name => name, :description => description } }
        request.env['HTTP_AUTHORIZATION'] = 'Bearer '+ ENV["FB_API_TOKEN"]
        request.headers['Content-Type'] = 'application/json'
        request.headers['Accept'] = 'application/openflashcards.facebook.v1'
        
        post :create, params.to_json
        
        expect(response).to be_success
        expect(response).to have_http_status(200)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body.length).to be >= 1
        expect(parsed_body["name"].present?).to be true
        expect(parsed_body["name"]).to eq(name)
        expect(parsed_body["description"].present?).to be true
        expect(parsed_body["description"]).to eq(description)
        ##expect(parsed_body["questions"].present?).to be true
        expect(parsed_body["questions"].length).to be == 0
      end
    end
    
    
    #=> params contains { "controller" => "user", "action" => "reset_password", "token" => 0 }
  end
  
  describe "PUT #update" do
    context "via api facebook token" do
      
      let!(:topic)  { create :topic }

      it "responds successfully with an HTTP 200 status code" do
        name = topic.name
        new_description = Faker::Lorem.sentence(4, true, 8)
        params = { :topic => { :name => name, :description => new_description } }
        request.env['HTTP_AUTHORIZATION'] = 'Bearer '+ ENV["FB_API_TOKEN"]
        request.headers['Content-Type'] = 'application/json'
        request.headers['Accept'] = 'application/openflashcards.facebook.v1'
        
        put :update, id: topic.id.to_s #, params.to_json
        
        
        expect(response).to be_success
        expect(response).to have_http_status(200)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body.length).to be >= 1
        expect(parsed_body["name"].present?).to be true
        expect(parsed_body["name"]).to eq(name)
        expect(parsed_body["description"].present?).to be true
        expect(parsed_body["description"]).to eq(new_description)
        ##expect(parsed_body["questions"].present?).to be true
        expect(parsed_body["questions"].length).to be == 0
      end
      
    end
  end
  
  
  
  
end
