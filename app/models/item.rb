class Item < ApplicationRecord
    
  belongs_to :user
  # belongs_to :image テストコードを書くときに重複していたので注意
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :fee
  belongs_to :source
  belongs_to :schedule
  belongs_to :category

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
    # validates :user  rails6からはいらない
    validates :status_id
    validates :fee_id
    validates :source_id
    validates :schedule_id 
    validates :category_id
  end

  with_options numericality: { other_than: 1} do
    validates :status_id
    validates :fee_id
    validates :source_id
    validates :schedule_id 
    validates :category_id  
  end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :price, format: { with: /\d{3,7}/, message: 'は半角数字で設定してください' }

end