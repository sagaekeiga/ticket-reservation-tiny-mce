class TicketImagesController < ApplicationController
  protect_from_forgery except: :create # リクエスト検証をスキップ
  def create
    p 2
    p params[:file]
    p 1
    ticket_image = TicketImage.new(image: params[:file]) # ajaxで送られてきたデータは params[:file] で取得する
    ticket_image.save
    render json: { url: ticket_image.image.url }　# 作成した画像のURLを返す
  end
end
