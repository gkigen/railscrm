class ComplaintsController < ApplicationController
	def index
    
    @complaints = Complaint.all.order('created_at DESC')
  end

  def show
    @complaint = Complaint.find(params[:id])
  end

  def new
    @complaint = Complaint.new
    
  end

  def create
    # Instantiate a new object using form parameters
    @complaint = Complaint.new(complaint_params)
    # Save the object
    if @complaint.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "complaint created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
     
      render('new')
    end
  end

  def edit
    @complaint = Complaint.find(params[:id])
    
  end

  def update
    # Find an existing object using form parameters
    @complaint = Complaint.find(params[:id])
    # Update the object
    if @complaint.update_attributes(complaint_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Case updated successfully."
      redirect_to(:action => 'show', :id => @complaint.id)
    else
      # If update fails, redisplay the form so user can fix problems
     
      render('edit')
    end
  end

  def delete
    @complaint = Complaint.find(params[:id])
  end

  def destroy
    complaint = Complaint.find(params[:id]).destroy
    flash[:notice] = "Complaint '#{complaint.company}'  destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def complaint_params
      # same as using "params[:case]", except that it:
      # - raises an error if :case is not present
      # - allows listed attributes to be mass-assigned
      params.require(:complaint).permit(:company, :state, :handledby, :created_at)
    end

end
