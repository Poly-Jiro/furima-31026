class RecordShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :municipality, :street_number, :building_name, :telephone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code
    validates :prefecture
    validates :municipality
    validates :street_number
    validates :telephone_number
  end

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :telephone_number, format: {with: /\A[0-9]{,11}\z/}
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }

  
  def save
    ShippingAddress.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, street_number: street_number, building_name: building_name, telephone_number: telephone_number) 
  end
end