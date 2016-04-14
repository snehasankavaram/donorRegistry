class RegistryItemController < ApplicationController
	def itemsForOrgs
		@item = RegistryItem.new
		@items = current_org.registry_items
		render 'item'
	end

	def create
		@item = RegistryItem.new(reg_params)
		@item.update(:amount_received => 0)
		current_org.registry_items << @item
		@item.save
		redirect_to orgs_registry_path
	end

	def update
	  @item = RegistryItem.find(params[:id])


	  respond_to do |format|
	    if @item.update_attributes(reg_params)
	      @item.reload
	      format.json { respond_with_bip(@item) }
	    else
	      format.json { render json: @item.errors, status: :unprocessable_entity }
	    end
	  end


	end


	def delete
		RegistryItem.find(params[:id]).delete
		redirect_to :back
	end

	private

	    def reg_params
	      params.require(:registry_item).permit(:name, :amount_needed, :amount_pledged, :amount_received)
    end
end
