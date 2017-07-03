require 'csv'
class CsvToTransaction
  attr_reader :tempfile, :headers
  
  def self.map(tempfile)
    new(tempfile).translate
  end
  
  def initialize(tempfile)
    @tempfile = tempfile
  end
  
  def translate
    hashes = transaction_hashes
    binding.pry
  end
  
  def transaction_hashes
    body.map do |body_line|
      body_line.map.with_index do |datum, idx|
        [headers[idx], datum]
      end.to_h
    end
  end
  
  def arr_off_arrs
    CSV.parse(File.open(tempfile))
  end
  
  def body
    arr_off_arrs[1..-1]
  end
  
  def headers
    @headers ||= arr_off_arrs.first.map do |header|
      header.gsub(' ', '_').downcase.to_sym
    end
  end
  
end