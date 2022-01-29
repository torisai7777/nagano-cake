class Item < ApplicationRecord
    attachment :image
    belongs_to :genre
    has_many :order_details
    validates :name, presence: true
  	validates :explanation, presence: true
	  validates :price,presence: true


  def self.search(keyword,method)
      if method == "perfect_match"
          where(name: keyword)
      elsif method == "partial_match"
          where(["name like?",  "%#{keyword}%"])
      end
  end
end