class Flat < ApplicationRecord
  def self.search(search)
    if search
      @flats = Flat.where("name LIKE '%#{search}%'")
    else
      @flats = Flat.all
    end
  end
end
