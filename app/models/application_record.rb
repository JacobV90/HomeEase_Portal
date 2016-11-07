class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  base_uri = 'https://home-ease.firebaseio.com'
  FIREBASE = Firebase::Client.new(base_uri)
end
