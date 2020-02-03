require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }

  describe '#edit' do

    context 'ログインしている場合' do
      before do
        login user
        get :edit, params: { id: user.id }
      end

      it "インスタンス変数の値の確認" do
        expect(assigns(:user)).to eq user
      end

      it "editページの表示" do
        expect(response).to render_template :edit
      end
    end

    context 'ログインしていない場合' do
      before do
        get :edit, params: { id: user.id }
      end

      it 'ログインページへリダイレクト' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
  end

  describe '#update' do

    context 'ログインしている場合' do

    end

    context 'ログインしていない場合' do

    end
  end

end