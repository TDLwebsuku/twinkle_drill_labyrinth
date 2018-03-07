class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	
	# gem paranoiaのため
  acts_as_paranoid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_one :cart

  def update_without_current_password(params, *options)
  	params.delete(:current_password)

  	if params[:password].blank?
  		params.delete(:password)
  		params.delete(:password_confirmation) if params[:password_confirmation].blank?
  	end

  	clean_up_passwords
  	update_attributes(params, *options)
  end
end
