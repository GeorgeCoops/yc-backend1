class Post < ApplicationRecord
    has_many :post_images
    validates :position, :company, :location, :instagram, :facebook, :instagram, :length, :description, presence: true
end
