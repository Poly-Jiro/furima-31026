require 'rails_helper'

describe RecordShippingAddress do
  before do
    @record_shipping_address = FactoryBot.build(:record_shipping_address)
 end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@record_shipping_address).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @record_shipping_address.postal_code = nil
      @record_shipping_address.valid?
      expect(@record_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '都道府県が空だと保存できないこと' do
      @record_shipping_address.prefecture = nil
      @record_shipping_address.valid?
      expect(@record_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空だと保存できないこと' do
      @record_shipping_address.municipality = nil
      @record_shipping_address.valid?
      expect(@record_shipping_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @record_shipping_address.street_number = nil
      @record_shipping_address.valid?
      expect(@record_shipping_address.errors.full_messages).to include("Street number can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @record_shipping_address.telephone_number = nil
      @record_shipping_address.valid?
      expect(@record_shipping_address.errors.full_messages).to include("Telephone number can't be blank")
    end
    it '郵便番号は-がないと保存できないこと' do
      @record_shipping_address.postal_code = 123456
      @record_shipping_address.valid?
      expect(@record_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '電話番号は11桁内でないと保存できないこと' do
      @record_shipping_address.telephone_number = 111111111111
      @record_shipping_address.valid?
      expect(@record_shipping_address.errors.full_messages).to include("Telephone number is invalid")
    end
end