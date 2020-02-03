require 'rails_helper'

describe Wallet do
  
  describe "#create" do
    
    it "投稿が可能か" do
      wallet = build(:wallet)
      expect(wallet).to be_valid
    end

    it "titleが空の場合" do
      wallet = build(:wallet, title: "")
      wallet.valid?
      expect(wallet.errors[:title]).to include("can't be blank")
    end

    it "priceが空の場合" do
      wallet = build(:wallet, price: "")
      wallet.valid?
      expect(wallet.errors[:price]).to include("can't be blank")
    end

  end

end