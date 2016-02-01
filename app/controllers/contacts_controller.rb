class ContactsController < ApplicationController
	def index
    @contacts = Contact.all.order('created_at DESC')
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact  = Contact.new
  end

  def create
    # Instantiate a new object using form parameters
    @contact  = Contact.new(contact_params)
    # Save the object
    if @contact .save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Contact created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
     
      render('new')
    end
  end

  def edit
    @contact  = Contact.find(params[:id])
   
  end

  def update
    # Find an existing object using form parameters
    @contact  = Contact.find(params[:id])
    # Update the object
    if @contact .update_attributes(contact_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Contact updated successfully."
      redirect_to(:action => 'show', :id => @contact.id)
    else
      # If update fails, redisplay the form so user can fix problems
      
      render('edit')
    end
  end

  def delete
    @contact = Contact.find(params[:id])
  end

  def destroy
    contact =Contact.find(params[:id]).destroy
    flash[:notice] = "Contact '#{contact.company}' destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def contact_params
      # same as using "params[:contact]", except that it:
      # - raises an error if :contact is not present
      # - allows listed attributes to be mass-assigned
      params.require(:contact).permit(:company, :firstname,:lastname,:address,:email,:mobile,:industry,:leadsource,:county, :created_at)
    end

end
