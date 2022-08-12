class Room < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :reservation, dependent: :destroy

    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true, numericality: true
    validates :address, presence: true
    validates :image, presence: true, blob: { content_type: :image } 
end
