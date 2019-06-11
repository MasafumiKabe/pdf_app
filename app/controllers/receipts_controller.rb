class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.all
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)

    if @receipt.save
      flash[:success] = '領収書情報を登録しました。'
      redirect_to @receipt
    else
      flash.now[:danger] = '領収書情報の登録に失敗しました。'
      render :new
    end
  end

  def destroy
    @receipt = Receipt.find(params[:id])
    @receipt.destroy
    flash[:success] = '領収書情報を削除しました。'
    redirect_to receipts_url
  end
end

private

def receipt_params
  params.require(:receipt).permit(:name, :date, :price, :publisher, :representative, :provision)
end
