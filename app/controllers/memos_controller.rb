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

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    memo = Memo.find(params[:id])
    memo.update(memo_params)
  end

  def memo_params
    params.require(:memo).permit(:content)
  end
end
