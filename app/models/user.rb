class User < ActiveRecord::Base

  before_save :ensure_authentication_token
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :trackable, :omniauthable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :authentication_token

  has_many :dishorders

  
  def self.find_for_googleapps_oauth(access_token, signed_in_resource=nil)
    data = access_token['info']
    if user = User.where(:email => data['email']).first 
      return user
    else
      User.create!(:email => data['email'], :first_name => data['first_name'], :last_name => data['last_name'])
    end
  end
end
