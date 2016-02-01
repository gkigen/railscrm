class OpportunitysController < ApplicationController
	def index
    @opportunities = Opportunity.all.order('created_at DESC')
  end

  def show
    @opportunitie = Opportunity.find(params[:id])
  end

  def new
    @opportunitie = Opportunity.new
   
  end

  def create
    # Instantiate a new object using form parameters
    @opportunitie = Opportunity.new(opportunitie_params)
    # Save the object
    if @opportunitie.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Opportunity created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      
      render('new')
    end
  end

  def edit
    @opportunitie = Opportunity.find(params[:id])
   
  end

  def update
    # Find an existing object using form parameters
    @opportunitie = Opportunity.find(params[:id])
    # Update the object
    if @opportunitie.update_attributes(opportunitie_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Opportunity updated successfully."
      redirect_to(:action => 'show', :id => @opportunitie.id)
    else
      # If update fails, redisplay the form so user can fix problems
      
      render('edit')
    end
  end

  def delete
    @opportunitie = Opportunity.find(params[:id])
  end

  def destroy
    opportunitie = Opportunity.find(params[:id]).destroy
    flash[:notice] = "Opportunity '#{opportunitie.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def opportunitie_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:opportunitie).permit(:name, :account, :salesstage,:leadsource,:nextstep,:ammount,:description, :created_at)
    end

end
