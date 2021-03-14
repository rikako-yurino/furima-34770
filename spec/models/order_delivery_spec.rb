require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @order_delivery = FactoryBot.build(:order_delivery)
  end
  describe '商品購入' do
    context '内容に問題ない場合' do
      it '必要な情報を適切に入力すると、商品購入情報がデータベースに保存されること' do
        expect(@order_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'クレジットカード情報は必須であること' do
        @order_delivery.token = " "
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end

      it '配送先の情報として、郵便番号が必須であること' do
        @order_delivery.postcode = " "
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号の保存にはハイフンが必要であること' do
        @order_delivery.postcode = "1234567"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postcode Input correctly")
      end

      it '配送先の情報として、都道府県が必須であること' do
        @order_delivery.prefecture_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '配送先の情報として、選択肢1では保存できないこと' do
        @order_delivery.prefecture_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture Select")
      end

      it '配送先の情報として、市区町村が必須であること' do
        @order_delivery.city = " "
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end

      it '配送先の情報として、番地が必須であること' do
        @order_delivery.block = " "
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Block can't be blank")
      end

      it '配送先の情報として、電話番号が必須であること' do
        @order_delivery.phone_number = " "
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は11桁以内の数値でないと保存できないこと' do
        @order_delivery.phone_number = "090-0000-0000"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number Input correctly")
      end
    end
  end
end
