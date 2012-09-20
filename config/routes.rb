TwilioTest::Application.routes.draw do

  match '/text/send' => 'txt_tests#send_message', :as => "send_message"
  match '/text/new' => 'txt_tests#new', :as => "new"

  root :to => 'txt_tests#new'
end
