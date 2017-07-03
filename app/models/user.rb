class User < ApplicationRecord
  has_many :accounts
  has_secure_password
  
  before_save :normalize_name
  
  def greeting
    nickname || (first_name && first_name.capitalize) || email
  end
  
  def primary_account
    accounts.where(primary: true).first
  end
    
  private
  
  def normalize_name
    first_name.upcase! if first_name
    middle_initial.upcase! if middle_initial
    last_name.upcase! if last_name
  end
  
end
