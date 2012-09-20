This is a simple test for Twilio - Heroku integration.  

Using the `number_to_phone` helper method to add the country code causes problems.  

Here is the code that I was using:

     client.account.sms.messages.create( :from => number_to_phone(from.to_i, :country_code => 1, :delimiter => ''), 
                                               :to => number_to_phone(to.to_i, :country_code => 1, :delimiter => ''), 
                                                                                    :body => String.new("Numbers converted with number_to_phone: #{@txt_test.message}"))


And here's the error that it produces:

    Error: undefined method `ord' for nil:NilClass


I've verified that the `number_to_phone` method produces a non-nil result.  I believe the issue is possibly caused by the fact that `number_to_phone` yields an `ActiveSupport::SafeBuffer` instead of a `String`

