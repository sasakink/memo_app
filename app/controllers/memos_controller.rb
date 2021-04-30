class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end

  def new
  end

  def create
    Memo.create(content: params[:content])
  end

end
