class IssuerType < ApplicationRecord
  
  include Normalizers
  
  has_many :issuers
  
  before_save :normalize_name

end
