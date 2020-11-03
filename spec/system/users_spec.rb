require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit new_user_registration_path

      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email.delete('@')
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'last-name', with: @user.family_name
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name-kana', with: @user.family_name_kana
      select '1930', from: 'user[birthday(1i)]'
      select '1', from: 'user[birthday(2i)]'
      select '1', from: 'user[birthday(3i)]'
      expect do
        find('input[name="commit"]').click
      end.to change { User.count }.by(0)
      expect(current_path).to eq '/users/sign_up'
    end
  end
end
