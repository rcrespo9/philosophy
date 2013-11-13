class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :age, type: String
  field :gender, type: String
  field :value, type: String
  field :remote_addr, type: String
  field :remote_host, type: String
  field :http_host, type: String
  field :http_user_agent, type: String
  field :http_accept_language, type: String
  field :flagged, type: Boolean
end