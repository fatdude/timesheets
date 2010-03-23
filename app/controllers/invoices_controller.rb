class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.xml
  def index
    @filter = InvoiceFilter.new(params[:invoice_filter])

    if params[:client_id]
      @client = Client.find params[:client_id]
      @invoices = @client.invoices.paid_status(@filter.paid).sent_status(@filter.sent).between(@filter.date_from, @filter.date_to).all
    else
      @invoices = Invoice.paid_status(@filter.paid).sent_status(@filter.sent).between(@filter.date_from, @filter.date_to).by_client(@filter.client_id).all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.xml
  def show
    @invoice = Invoice.includes([:activities, :client]).find_by_code(params[:id].upcase)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.xml
  def new
    @client = Client.find params[:client_id] if params[:client_id]
    @invoice = Invoice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoice }
      format.js { render :format => :html, :layout => false }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.editable.find_by_code(params[:id].upcase)

    if @invoice
      respond_to do |format|
        format.html
        format.js { render :format => :html, :layout => false }
      end
    else
      respond_to do |format|
        format.html { redirect_to(invoices_url, :error => "Sorry, couldn't find that invoice") }
      end
    end
  end

  # POST /invoices
  # POST /invoices.xml
  def create
    client_id = params[:client_id] || params[:invoice][:client_id]
    @client = Client.find client_id
    @invoice = @client.invoices.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to(@invoice, :notice => 'Invoice was successfully created.') }
        format.xml  { render :xml => @invoice, :status => :created, :location => @invoice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.xml
  def update
    @invoice = Invoice.includes(:activities).find_by_code(params[:id].upcase)

    if @invoice
      respond_to do |format|
        if @invoice.update_attributes(params[:invoice])
          format.html { redirect_to(@invoice, :notice => 'Invoice was successfully updated.') }
          format.xml  { head :ok }
          format.js
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
          format.js
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to(invoices_url, :error => "Sorry, couldn't find that invoice") }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.xml
  def destroy
    @invoice = Invoice.unsent.find_by_code(params[:id].upcase)

    if @invoice
      @invoice.destroy
      flash[:notice] = "Invoice has been removed"
    else
      flash[:error] = "Sorry, couldn't find that invoice"
    end

    respond_to do |format|
      format.html { redirect_to(invoices_url) }
      format.xml  { head :ok }
      format.js
    end
  end
end

