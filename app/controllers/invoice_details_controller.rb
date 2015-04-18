class InvoiceDetailsController < ApplicationController

  # GET /invoices
  def index

    @columns = ['invid', 'invdate', 'amount', 'tax', 'total', 'note']

    @invoice_details = InvoiceDetail.paginate(
      :page     => params[:page],
      :per_page => params[:rows],
      :order    => order_by_from_params(params))

    if true
      render :json => json_for_jqgrid(@invoice_details, @columns)
    end

  end

  def show

    @columns = ['invid', 'invdate', 'amount', 'tax', 'total', 'note']

    @invoice_details = InvoiceDetail.where(invid: params[:id]).paginate(
      :page     => params[:page],
      :per_page => params[:rows],
      :order    => order_by_from_params(params))

    if true
      render :json => json_for_jqgrid(@invoice_details, @columns)
    end
  end

end
