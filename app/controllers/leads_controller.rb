class LeadsController < ApplicationController
	def index
    @leads = Lead.all.order('created_at DESC')
  end

  def show
    @lead = Lead.find(params[:id])
  end

  def new
    @lead = Lead.new
    
  end

  def create
    # Instantiate a new object using form parameters
    @lead = Lead.new(lead_params)
    # Save the object
    if @lead.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Lead created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      
      render('new')
    end
  end

  def edit
    @lead = Lead.find(params[:id])
    
  end

  def update
    # Find an existing object using form parameters
    @lead = Lead.find(params[:id])
    # Update the object
    if @lead.update_attributes(lead_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Lead updated successfully."
      redirect_to(:action => 'show', :id => @lead.id)
    else
      # If update fails, redisplay the form so user can fix problems
      
      render('edit')
    end
  end

  def delete
    @lead = Lead.find(params[:id])
  end

  def destroy
    lead = Lead.find(params[:id]).destroy
    flash[:notice] = "Lead '#{lead.company}' destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def lead_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:lead).permit(:company, :address,:email,:mobile,:industry,:leadsource,:county,:converted, :created_at)
    end

end
