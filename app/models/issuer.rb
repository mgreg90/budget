class Issuer < ApplicationRecord
  
  include Normalizers
  
  belongs_to :issuer_type
  
  has_many :account
  
  before_save :normalize_name
    
end
