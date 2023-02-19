class Post < ApplicationRecord
    belongs_to :author
    has_many :category_posts
    has_many :categories, :through => :category_posts

    validates :title, presence: true
    validates :description, presence: true
end