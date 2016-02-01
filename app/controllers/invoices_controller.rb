class InvoicesController < ApplicationController
	def index
    @invoices = Invoice.all.order('created_at DESC')
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
   
  end

  def create
    # Instantiate a new object using form parameters
    @invoice = Invoice.new(invoice_params)
    # Save the object
    if @invoice.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "invoice created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      
      render('new')
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
    
  end

  def update
    # Find an existing object using form parameters
    @invoice = Invoice.find(params[:id])
    # Update the object
    if @invoice.update_attributes(invoice_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Invoice updated successfully."
      redirect_to(:action => 'show', :id => @invoice.id)
    else
      # If update fails, redisplay the form so user can fix problems
     
      render('edit')
    end
  end

  def delete
    @invoice = Invoice.find(params[:id])
  end

  def destroy
    invoice = Invoice.find(params[:id]).destroy
    flash[:notice] = "Invoice '#{invoice.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def invoice_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:invoice).permit(:name, :description, :invoiceno,:ammount, :created_at)
    end

end
