require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

 describe '購入手続きをする,orderの中身を入れる' do
    context '購入できるとき' do
      it 'postal_code, source_id, city, house_number, phone_numberがあれば登録できる' do
       expect(@order).to be_valid
      end
   end

   context '購入できないとき' do
    it 'postal_codeが空のとき登録できない' do
      @order.postal_code = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank", "Postal code Input correctly")
    end

    it 'postal_codeにハイフンがないと登録できないde' do
      @order.postal_code = "8112222"
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code Input correctly")
    end


    it 'source_idが空だと登録できない' do
      @order.source_id = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Source can't be blank")
    end

    it 'source_idが1だと登録できない' do
      @order.source_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Source Select")
    end


    it 'cityが空だと登録できない' do
      @order.city = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空だと登録できない' do
      @order.house_number = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numberが空だと登録できない' do
      @order.phone_number = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが10桁未満だと登録できない' do
      @order.phone_number = "123456789"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number Input only number")
    end

    it 'phone_numberが11桁より大きいと登録できない' do
      @order.phone_number = "1234567890122"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number Input only number")
    end

    it 'phone_numberが数字以外だと登録できない' do
      @order.phone_number = "sada"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number Input only number")
    end







   end

end


end
