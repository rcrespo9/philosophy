require 'spec_helper'

describe User do 
	before :each do 
		@valid_age = "under 21"
		@valid_gender = "Male"
		@valid_value = "30"
		@valid_remote_addr = "127.0.0.1"
		@valid_remote_host = "127.0.0.1"
		@valid_http_host = "localhost: 3000"
		@valid_http_user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko)"
		@valid_http_accept_language =  "en-US,en;q=0.8"
		@valid_flagged = false
		@user = User.create(age: @valid_age, gender: @valid_gender, value: @valid_value, remote_addr: @valid_remote_addr, remote_host: @valid_remote_host, http_host: @valid_http_host, http_user_agent: @valid_http_user_agent, http_accept_language: @valid_http_accept_language, flagged: @valid_flagged)
		
	end

		describe "User#age" do 
			it "should return the correct age" do 
				@user.age.should eq(@valid_age)
			end
		end

		describe "User#gender" do 
			it "should return the correct gender" do 
				@user.gender.should eq(@valid_gender)
			end
		end

		describe "User#value" do 
			it "should return the correct value" do 
				@user.value.should eq(@valid_value)
			end
		end

		describe "User#remote_addr" do 
			it "should return the correct remote address" do 
				@user.remote_addr.should eq(@valid_remote_addr)
			end
		end

		describe "User#remote_host" do 
			it "should return the correct remote host" do 
				@user.remote_host.should eq(@valid_remote_host)
			end
		end
		
		describe "User#http_host" do 
			it "should return the correct http host" do 
				@user.http_host.should eq(@valid_http_host)
			end

		describe "User#http_user_agent" do 
			it "should return the correct http user agent" do 
				@user.http_user_agent.should eq(@valid_http_user_agent)
			end
		end

		describe "User#http_accept_language" do 
			it "should return the correct http accept language" do 
				@user.http_accept_language.should eq(@valid_http_accept_language)
			end
		end

		describe "User#flagged" do
			it "should return the correct flagged boolean" do
				@user.flagged.should eq(@valid_flagged)
			end
		end
    end
end