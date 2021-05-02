class MemosController < ApplicationController
  def index
    @memos = Memo.all.order("created_at DESC")
  end

  def new
  end

  def create
    @memo = Memo.new(content: params[:content])
    if @memo.valid?
      @memo.save
    else
      render 'new'
    end
  end

end
