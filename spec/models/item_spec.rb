require 'rails_helper'
describe Item do
  describe '#create'do
   before do
    @item = FactoryBot.build(:item)
    #  @item.image = fixture_file_upload('app/assets/images/camera.png') こんな書き方もある

   end
   describe '商品出品' do
     context '出品がうまくいくとき' do
       it '出品画像,商品名,商品の説明,カテゴリー,商品の状態,配送料の負担,発送元の地域,発送までの日数,販売価格が存在すれば登録できる' do
         expect(@item).to be_valid
       end
     end

     context '出品がうまくいかないとき' do
       it '商品画像が空だと登録できない' do
         @item.image = nil
         @item.valid?
         expect(@item.errors.full_messages).to include("Image can't be blank")
       end
        it '商品名が存在しないと登録できない' do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品の説明が存在しないと登録できない' do
          @item.description = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'カテゴリーが空だと登録できない' do
          @item.category = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
        end
        it 'カテゴリー選択が--だと登録できない' do
          #@item.categoryはハッシュを表しているので、そこにダイレクトに数字を書くことをしたらエラーとなる。
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it '商品の状態が空だと登録できない' do
          @item.status = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it '商品の状態が--だと登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end
        it '配送料の負担が空だと登録できない' do
          @item.fee = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Fee can't be blank")
        end
        it '配送料の負担が--だと登録できない' do
          @item.fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Fee must be other than 1")
        end
        it '発送元の地域が空だと登録できない' do
          @item.source = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Source can't be blank")
        end
        it '発送元の地域が--だと登録できない' do
          @item.source_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Source must be other than 1")
        end
        it '発送までの日数が空だと登録できない' do
          @item.schedule = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Schedule can't be blank")
        end
        it '発送までの日数が--だと登録できない' do
          @item.schedule_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Schedule must be other than 1")
        end
        it '価格が空だと登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格は¥300以上ではないと登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it '価格は半角数字のみでないと登録できない1' do
          @item.price = "1000a"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it '価格は半角数字のみでないと登録できない2' do
          @item.price = "１０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number", "Price は半角数字で設定してください")
        end
     end  
   end
 end
end
