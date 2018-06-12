require 'csv'

class Place < ApplicationRecord
  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      place = find_by(id: row["id"]) || new
      place.attributes = row.to_hash
      place.save!
    end
  end
end
