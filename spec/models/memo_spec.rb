require 'rails_helper'

RSpec.describe Memo, type: :model do
  before do
    @memo = FactoryBot.build(:memo)
  end

  describe 'メモ新規投稿' do
    context 'メモが登録できるとき' do
      it 'メモが存在すれば登録できる' do
        expect(@memo).to be_valid
      end
    end
    context 'メモが登録できないとき' do
      it 'メモが空では登録できない' do
        @memo.content = ''
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Content can't be blank")
      end
    end
  end
end
