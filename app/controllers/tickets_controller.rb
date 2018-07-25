class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to :tickets, notice: 'チケットを作成しました。'
    else
      render :new
    end
  end

  def index
    @tickets = Ticket.all
  end

  private

  def ticket_params
    params.require(:ticket).permit(
      :title,     # チケット名
      :body,      # チケットの内容
      :number,    # チケット販売可能枚数
      :expired_at # チケットの予約締切日時
    )
  end
end
