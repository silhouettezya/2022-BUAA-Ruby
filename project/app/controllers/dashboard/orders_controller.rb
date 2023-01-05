class Dashboard::OrdersController < Dashboard::BaseController

  def index
    @orders = current_user.orders.page(params[:page] || 1).per_page(params[:per_page] || 10)
                          .includes([:address]).order("id desc")
  end

end
