require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do

    context "商品出品できるとき" do
      it "全ての値が正しく入力されていれば出品できること" do
        expect(@item).to be_valid
      end
      it 'priceが300円以上なら出品できる' do
        @item.price = 400
        expect(@item).to be_valid
      end
      it 'priceが9,999,999円以下なら出品できる' do
        @item.price = 50000
        expect(@item).to be_valid
      end
      it 'priceが半角数字なら出品できる' do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end



    context "商品出品できないとき" do
      it "imageが空だと出品できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it "item_nameが空だと出品できないこと" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "explanationが空だと出品できないこと" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが1だと出品できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "state_idが1だと出品できないこと" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it "shipping_fee_idが1だと出品できないこと" do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it "shipping_prefecture_idが1だと出品できないこと" do
        @item.shipping_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping prefecture can't be blank")
      end
      it "shipping_day_idが1だと出品できないこと" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "priceが空だと出品できないこと" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300円未満だと出品できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "priceが9,999,999円を超えると出品できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "priceが全角数字だと出品できないこと" do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width number.")
      end
      it "priceが半角英数混合では出品できないこと" do
        @item.price = "300a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width number.")
      end
      it "priceが半角英語だけでは登録できないこと" do
        @item.price = "onehundred"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width number.")
      end
      it "ユーザー情報がない場合は登録できないこと" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end


