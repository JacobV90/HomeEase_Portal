class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :properties, dependent: :destroy
  
  after_create :send_to_firebase
  before_destroy :delete_from_firebase
  
  def send_to_firebase
    puts "sending user to firebase"
    FIREBASE.update("",{
      "Owners/#{self.id}" => {
        :owner_id => self.id,
        :first_name => self.first_name,
        :last_name => self.last_name,
        :email => self.email,
        :phone_number => self.phone_number
      }
    })
  end
  
  def delete_from_firebase
    FIREBASE.delete("Owners/#{self.id}")
  end
  
  def findIssues
    raw_issues = properties.map do |prop|
      prop_id = prop.id
      issues = FIREBASE.get("MaintenanceIssues/prop_id:#{prop_id}").body
      if not issues.nil?
        issues = issues.drop(1)
        issues.map {|issue| issue["property"] = prop}
      end
      issues
    end
    relevent_issues = raw_issues.select {|issues| not issues.nil?}
    relevent_issues.flatten!
  end  
  
end
