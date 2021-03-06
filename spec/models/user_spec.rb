require 'rails_helper'

describe User do

  describe "#create" do

    it "ユーザーの登録が可能か" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameが空の場合" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "balanceが空の場合" do
      user = build(:user, balance: "")
      user.valid?
      expect(user.errors[:balance]).to include("can't be blank")
    end

    it "emailが空の場合" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "emailが重複していた場合" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "passwordが空の場合" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "password_confirmationが空の場合" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが5文字いないでは登録できないこと" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

  end

end