class ListsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のオブジェクトを生成する。
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
   @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id]) #データを一件取得
    list.destroy #データを削除
    redirect_to '/list' #投稿一覧画面へリダイレクト
  end

  private
  #ストロングパラメーター
  def list_params
   params.require(:list).permit(:title, :body, :image)
  end
end
