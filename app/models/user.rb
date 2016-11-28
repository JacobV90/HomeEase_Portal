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
    properties_id = properties.collect {|property| property.id}
    raw_issues = properties_id.map {|prop_id| FIREBASE.get("MaintenanceIssues/prop_id:#{prop_id}").body}
    relevent_issues = raw_issues.select {|issues| not issues.nil?}
    relevent_issues.map! {|issues| issues.drop(1)}
    relevent_issues.flatten!()
  end  
  
end
