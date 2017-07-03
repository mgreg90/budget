class Transaction < ApplicationRecord
  
  belongs_to :card
  
  def self.from_csv(tempfile)
    CsvToTransaction.map(tempfile)
  end
  
end
