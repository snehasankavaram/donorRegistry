class RegistryItemController < ApplicationController
	def itemsForOrgs
		@item = RegistryItem.new
		@items = current_org.registry_items
		render 'item'
	end

	def create
		@item = RegistryItem.new(reg_params)
		current_org.registry_items << @item
		@item.save
		redirect_to orgs_registry_path
	end

	private

	    def reg_params
	      params.require(:registry_item).permit(:name, :amount_needed)
    end
end
