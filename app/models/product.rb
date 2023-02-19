class Product < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
    belongs_to :brand
    has_many :product_tags
    has_many :tags, :through => :product_tags

    def self.search(search_term)
        where("name = ?", search_term)
    end
end