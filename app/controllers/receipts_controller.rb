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

  def output
    @receipt = Receipt.find(params[:id])

    # PDFの出力
    respond_to do |format|
      format.html
      format.pdf do
        report = Thinreports::Report.new(layout: "#{Rails.root}/app/pdfs/receipt.tlf")

        report.start_new_page

        report.page.item(:name).value(@receipt.name)
        report.page.item(:date).value(@receipt.date)
        report.page.item(:publisher).value(@receipt.publisher)
        report.page.item(:representative).value(@receipt.representative)
        report.page.item(:price).value(@receipt.price)
        report.page.item(:provision).value(@receipt.provision)

        send_data report.generate,
                  filename:    '#{@receipt.name}.pdf',
                  type:        'application/pdf',
                  disposition: 'inline'
      end
    end
  end
end

private

def receipt_params
  params.require(:receipt).permit(:name, :date, :price, :publisher, :representative, :provision)
end
