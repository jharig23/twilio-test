class TxtTestsController < ApplicationController
  
  require 'twilio-ruby'
  include ActionView::Helpers::NumberHelper

  def new
    @txt_test = TxtTest.new
    render :new
  end

  def send_message
    @message = ""
    @txt_test = TxtTest.new(params[:txt_test])
    puts "txt_test = #{@txt_test}"
    account_sid = "ACxxxxxxxxxxxxxxxxxxxxxxxx"
    auth_token = "yyyyyyyyyyyyyyyyyyyyyyyyy"
    client = Twilio::REST::Client.new @txt_test.account_sid, @txt_test.auth_token
    from = @txt_test.from
    to = @txt_test.to
    
    # send raw
    begin
      client.account.sms.messages.create( :from => "+1" + from,
                                          :to => "+1" + to, 
                                          :body => @txt_test.message)
      @message = @message + "\n\nSent message as raw"
    rescue
      @message = @message + "\n\nUnable to send RAW text message!  \nError: #{$!}"
    end

    # send as String
    begin
      client.account.sms.messages.create( :from => String.new("+1#{from}"), 
                                          :to => String.new("+1#{to}"), 
                                          :body => String.new("Sent as String: #{@txt_test.message}"))
      @message = @message + "\n\nSent message converted to string"
    rescue
      @message = @message + "\n\nUnable to send as String text message!  \nError: #{$!}"
    end

    
    # convert to phone number
    begin
      client.account.sms.messages.create( :from => number_to_phone(from.to_i, :country_code => 1, :delimiter => ''), 
                                          :to => number_to_phone(to.to_i, :country_code => 1, :delimiter => ''), 
                                          :body => String.new("Numbers converted with number_to_phone: #{@txt_test.message}"))
      @message = @message + "\n\nSent message converted to phone number"
    rescue
      @message = @message + "\n\nUnable to send as formatted phone number!  \nError: #{$!}"
    end

    # convert to phone number, then string
    begin
      client.account.sms.messages.create( :from => String.new(number_to_phone(from.to_i, :country_code => 1, :delimiter => '')), 
                                          :to => String.new(number_to_phone(to.to_i, :country_code => 1, :delimiter => '')), 
                                          :body => String.new("Numbers converted with number_to_phone: #{@txt_test.message}"))
      @message = @message + "\n\nSent message as formatted phone number, converted to string"
    rescue
      @message = @message + "\n\nUnable to send as formatted phone number, converted to String!  \nError: #{$!}"
    end

    render :new
  end

end

