class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :text
    validates :price
    validates :user
    validates :status_id
    validates :fee_id
    validates :source_id
    validates :schedule_id 
    validates :category_id
  end

end
