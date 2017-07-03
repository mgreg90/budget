class Account < ApplicationRecord
  
  belongs_to :user
  belongs_to :issuer
  
  has_many :cards
    
  before_save :clear_user_primary_accounts, if: :primary
  
  before_create :set_initial_balance_time
  
  validates :initial_balance_in_cents, presence: true
  
  def initial_balance
    initial_balance_in_cents / 100.0
  end
  
  private
  
  def clear_user_primary_accounts
    user.accounts.each do |account|
      account.primary = false
      account.save
    end
  end
  
  def set_initial_balance_time
    self.initial_balance_time = DateTime.now
  end
  
end
