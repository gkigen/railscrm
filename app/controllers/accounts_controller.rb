class AccountsController < ApplicationController
	def index
    @accounts = Account.all.order('created_at DESC')
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
    
  end

  def create
    # Instantiate a new object using form parameters
    @account = Account.new(account_params)
    # Save the object
    if @account.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Account created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      
      render('new')
    end
  end

  def edit
    @account = Account.find(params[:id])
    
  end

  def update
    # Find an existing object using form parameters
    @account = Account.find(params[:id])
    # Update the object
    if @account.update_attributes(account_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Account updated successfully."
      redirect_to(:action => 'show', :id => @account.id)
    else
      # If update fails, redisplay the form so user can fix problems
      
      render('edit')
    end
  end

  def delete
    @account = Account.find(params[:id])
  end

  def destroy
    account = Account.find(params[:id]).destroy
    flash[:notice] = "Account '#{account.company}' destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def account_params
      # same as using "params[:account]", except that it:
      # - raises an error if :account is not present
      # - allows listed attributes to be mass-assigned
      params.require(:account).permit(:company, :address, :mobile,:industry,:county, :created_at)
    end

end
