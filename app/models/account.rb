class Account < ApplicationRecord
  belongs_to :user
  
  belongs_to :issuer
  
  has_many :cards
  
  before_save :clear_user_primary_accounts, if: :primary
  
  def clear_user_primary_accounts
    user.accounts.each do |account|
      account.primary = false
      account.save
    end
  end
  
end
