class Users::DeliveriesController < Users::BaseController
  before_action :set_ticket, only: %i(new create)
  def new
    @delivery = Delivery.new
  end

  def create
    @delivery = current_user.deliveries.new(ticket: @ticket)
    if @delivery.save
      redirect_to :users_complete, notice: '予約しました'
    else
      render :new
    end
  end

  def complete
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end
