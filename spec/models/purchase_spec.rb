require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase, user_id: user.id, item_id: item.id)
    sleep 1
  end

 describe ' 商品購入機能' do
    context '購入できるとき' do
      it '必要な情報全てに適切な値を入れると購入できる' do
       expect(@purchase).to be_valid
      end
   end

    context '購入できないとき' do
      context 'カード情報が正しく入力されてないとき' do
        it 'トークンが生成されていないとき' do
          @purchase.token = ""
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Token can't be blank")
        end
      end
      context '住所等配達先が正しく入力されてないとき' do
    it 'postal_codeが空のとき登録できない' do
      @purchase.postal_code = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code can't be blank", "Postal code Input correctly")
    end

    it 'postal_codeにハイフンがないと登録できない' do
      @purchase.postal_code = "8112222"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code Input correctly")
    end


    it 'source_idが空だと登録できない' do
      @purchase.source_id = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Source can't be blank")
    end

    it 'source_idが1だと登録できない' do
      @purchase.source_id = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Source Select")
    end


    it 'cityが空だと登録できない' do
      @purchase.city = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空だと登録できない' do
      @purchase.house_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numberが空だと登録できない' do
      @purchase.phone_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが10桁未満だと登録できない' do
      @purchase.phone_number = "123456789"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number Input only number")
    end

    it 'phone_numberが11桁より大きいと登録できない' do
      @purchase.phone_number = "1234567890122"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number Input only number")
    end

    it 'phone_numberが数字以外だと登録できない' do
      @purchase.phone_number = "sada"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number Input only number")
    end
  end
    end
   end
end

