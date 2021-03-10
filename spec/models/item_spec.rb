require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '内容に問題ない場合' do
      it '必要な情報を適切に入力すると、商品情報がデータベースに保存されること' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.description_product = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description product can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーの情報が１（"--"で選択されていない状態）では保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it '商品の状態についての情報が必須であること' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it '商品の状態についての情報が１（"--"で選択されていない状態）では保存できないこと' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status Select")
      end

      it '配送料の負担についての情報が必須であること' do
        @item.delivery_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end

      it '配送料の負担についての情報が１（"--"で選択されていない状態）では保存できないこと' do
        @item.delivery_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden Select")
      end

      it '発送元の地域についての情報が必須であること' do
        @item.delivery_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '発送元の地域についての情報が１（"--"で選択されていない状態）では保存できないこと' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area Select")
      end
      
      it '発送までの日数についての情報が必須であること' do
        @item.shipping_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time can't be blank")
      end

      it '発送までの日数についての情報が１（"--"で選択されていない状態）では保存できないこと' do
        @item.shipping_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time Select")
      end

      it '販売価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は、¥300未満は保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      
      it '販売価格は、¥10,000,000以上は保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price Half-width number")
      end

      it '販売価格は、半角英字だけでは登録できないこと' do
        @item.price = "abcdef"
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price Half-width number")
      end

      it '販売価格は、半角英数混合では登録できないこと' do
        @item.price = "123abc"
        @item.valid?
        expect(@item.errors.full_messages).to include(  "Price Half-width number")
      end
    end
  end
end
