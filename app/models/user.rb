class User
  include Mongoid::Document
  field :age, type: Integer
  field :gender, type: String
  field :days, type: Integer
  field :remote_addr, type: String
  field :remote_host, type: String
  field :server_name, type: String
  field :server_port, type: String
  field :http_host, type: String
  field :http_user_agent, type: String
  field :http_accept_language, type: String
end