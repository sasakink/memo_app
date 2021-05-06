require 'rails_helper'

RSpec.describe "メモ新規投稿", type: :system do
  before do
    @memo = FactoryBot.build(:memo)
  end

  context 'メモ新規投稿できるとき' do
    it 'メモを入力すれば新規投稿できて投稿完了ページに移動する' do
      visit new_memo_path
      expect(page).to have_content('メモ新規投稿ページ')
      fill_in 'content', with: @memo.content
      expect{
        find('input[name="commit"]').click
      }.to change {Memo.count}.by(1)
      expect(current_path).to eq memos_path
    end
    it '誤った情報では新規投稿できずメモ新規投稿ページに留まる' do
      visit new_memo_path
      expect(page).to have_content('メモ新規投稿ページ')
      fill_in 'content', with: ''
      expect{
        find('input[name="commit"]').click
      }.to change {Memo.count}.by(0)
      expect(current_path).to eq memos_path
    end
  end
end
