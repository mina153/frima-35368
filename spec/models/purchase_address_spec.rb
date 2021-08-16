require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    # item.image = fixture_file_upload('public/images/test_image.png')
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id)
  end

  describe '商品購入' do

    context "商品購入できるとき" do
      it "全ての値が正しく入力されていれば購入できること" do
        expect(@purchase_address).to be_valid
      end
      it 'building_numberは空でも購入できること' do
        @purchase_address.building_number = ""
        expect(@purchase_address).to be_valid
      end
      it 'phone_numberは数字なら購入できる' do
        @purchase_address.phone_number = 12345678901
        expect(@purchase_address).to be_valid
      end
      it 'phone_numberは10~11桁以内なら購入できる' do
        @purchase_address.phone_number = 12345678901
        expect(@purchase_address).to be_valid
      end
    end



    context "商品購入できないとき" do
      # it "numberが空だと購入できないこと" do
      #   @purchase_address.number = ""
      #   @purchase_address.valid?
      #   expect(@purchase_address.errors.full_messages).to include("Number can't be blank")
      # end     
      # it "exp_monthが空だと購入できないこと" do
      #   @purchase_address.exp_month = ""
      #   @purchase_address.valid?
      #   expect(@purchase_address.errors.full_messages).to include("Exp_month can't be blank")
      # end
      # it "exp_yearが空だと購入できないこと" do
      #   @purchase_address.exp_year = ""
      #   @purchase_address.valid?
      #   expect(@purchase_address.errors.full_messages).to include("Exp_year can't be blank")
      # end
      # it "cvcが空だと購入できないこと" do
      #   @purchase_address.cvc = ""
      #   @purchase_address.valid?
      #   expect(@purchase_address.errors.full_messages).to include("Cvc can't be blank")
      # end
      it "tokenが空だと購入できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと購入できないこと" do
        @purchase_address.postal_code = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフンがないと購入できないこと" do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it "shipping_prefecture_idが1だと購入できないこと" do
        @purchase_address.shipping_prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping prefecture can't be blank")
      end
      it "cityが空だと購入できないこと" do
        @purchase_address.city = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空だと購入できないこと" do
        @purchase_address.house_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空だと購入できないこと" do
        @purchase_address.phone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが10桁を下回ると購入できないこと(11桁以内)" do
        @purchase_address.phone_number = 123456789
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is too short")
      end
      it "phone_numberが数字以外が混合していると購入できないこと" do
        @purchase_address.phone_number = "300a"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
    end
  end
end
