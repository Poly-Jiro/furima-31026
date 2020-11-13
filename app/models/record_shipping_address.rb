class RecordShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :price, :postal_code, :prefecture, :municipality, :street_number, :building_name, :telephone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code
    validates :prefecture
    validates :municipality
    validates :street_number
    validates :telephone_number
    validates :token
  end

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :telephone_number, format: { with: /\A[0-9]{,11}\z/ }
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, street_number: street_number, building_name: building_name, telephone_number: telephone_number, record_id: record.id)
    # エラー原因が不明の時はbinding.pryとcreate!(~~~と!をつけることでエラーメッセージを強制的に出力できる。
  end
end
