require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能の実装' do
    context '出品が成功したとき' do
      it 'name,text,status_id,category_id,fee_id,source_id,shipping_id,price,_user_id,imageがあれば出品できる' do
        expect(@item).to be_valid
      end

      it 'nameが40文字以下なら登録できる' do
        @item.name = 'a' * 40
        expect(@item).to be_valid
      end

      it 'textが1000文字以下なら登録できる' do
        @item.text = 'a' * 1000
        expect(@item).to be_valid
      end

      it 'category_idが1以外なら登録できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end

      it 'status_idが1以外なら登録できる' do
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it 'fee_idが1以外なら登録できる' do
        @item.fee_id = 2
        expect(@item).to be_valid
      end
      it 'source_idが1以外なら登録できる' do
        @item.source_id = 2
        expect(@item).to be_valid
      end
      it 'shipping_idが1以外なら登録できる' do
        @item.shipping_id = 2
        expect(@item).to be_valid
      end
      it 'priceが300~9999999の間なら登録できる' do
        @item.price = 4_505_050
        expect(@item).to be_valid
      end
    end

    context '出品が失敗するとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40文字を超えると出品できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'textが空だと出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'textが1000文字超えると出品できない' do
        @item.text = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Text is too long (maximum is 1000 characters)')
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'status_idが空だと出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'status_idが1だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it 'fee_idが空だと出品できない' do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it 'fee_idが1だと出品できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee Select')
      end
      it 'source_idが空だと出品できない' do
        @item.source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Source can't be blank")
      end
      it 'source_idが1だと出品できない' do
        @item.source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Source Select')
      end
      it 'shipping_idが空だと出品できない' do
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'shipping_idが1だと出品できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping Select')
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが9999999超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが半角数字でないと出品できない' do
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number', 'Price Out of setting range')
      end

      it 'ユーザーが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
