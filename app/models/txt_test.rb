class TxtTest < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessor :from, :to, :message
  attr_accessor :account_sid, :auth_token

  attr_accessible :from, :to, :message, :account_sid, :auth_token

end
