class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  attr_accessor :firebase
  
  base_uri = 'https://home-ease.firebaseio.com'
  FIREBASE = Firebase::Client.new(base_uri)

  private
  
  
end
