require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_order = FactoryBot.build(:purchase_order, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入ができる' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_order.building_name = ''
        expect(@purchase_order).to be_valid
      end
    end

    context '商品購入ができない' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_order.post_code = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンがないと保存できないこと' do
        @purchase_order.post_code = '1111111'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeが全角を含むと保存できないこと' do
        @purchase_order.post_code = '１１１-１１１１'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'municipalityが空だと保存できないこと' do
        @purchase_order.prefecture_id = '1'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @purchase_order.municipality = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_order.address = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_order.phone_number = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @purchase_order.phone_number = '０００００００００００'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが10、11桁以外だと保存できないこと' do
        @purchase_order.phone_number = '123456789'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberにハイフンがあると保存できないこと' do
        @purchase_order.phone_number = '000-0000-0000'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_order.user_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_order.item_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenがないと保存できないこと' do
        @purchase_order.token = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
