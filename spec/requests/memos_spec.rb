require 'rails_helper'

RSpec.describe "Memos", type: :request do

  before do
    @memo = FactoryBot.create(:memo)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのメモのテキストが存在する" do
      get root_path
      expect(response.body).to include(@memo.content)
    end
    it "indexアクションにリクエストするとレスポンスに投稿入力フォームが存在する" do
      get root_path
      expect(response.body).to include('メモ新規投稿')
    end
  end

  describe "GET #edit" do
    it 'editアクションにリクエストすると正常にレスポンスが返ってくる' do
      get edit_memo_path(@memo)
      expect(response.status).to eq 200
    end
    it 'editアクションにリクエストするとレスポンスに更新入力フォームが存在する' do
      get edit_memo_path(@memo)
      expect(response.body).to include('メモ')
    end
  end
  describe "DELETE #destroy" do
    it 'destroyアクションにリクエストすると正常にレスポンスが返ってくる' do
      delete memo_path(@memo)
      expect(response.status).to eq 200
    end
  end
end