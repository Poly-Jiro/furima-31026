class RecordShippingAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :municipality, :street_number, :building_name, :telephone_number, :record 

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code
    validates :prefecture
    validates :municipality
    validates :street_number
    validates :telephone_number
  end

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :telephone_number, format: {with: /\A[0-9]{,11}\z/})
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  
  def save
    record = Record.create(user: :user, item: :item)
    Shipping_Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, street_number: street_number, building_name: building_name, telephone_number: telephone_number, record: record) 
    )

  end
end