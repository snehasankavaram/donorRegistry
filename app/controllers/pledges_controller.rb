class PledgesController < ApplicationController
	def new
		@item = RegistryItem.find(params[:item_id])
		@pledge = Pledge.new
		render 'test'
	end

	def create
		@item = RegistryItem.find(params[:pledge][:id])
		@pledge = Pledge.new(pledge_params)

		if !logged_in?
			# do nothing?
			render login_path
		else
			# add to user's pledges
			current_user.pledges << @pledge

	    	if @pledge.save
	    		# render thanks for pledging page
	    		pledges = @item.amount_pledged
	    		pledges = pledges + params[:pledge][:quantity].to_i

	    		needed = @item.amount_needed
	    		needed = needed - params[:pledge][:quantity].to_i

	    		@item.update(:amount_pledged => pledges, :amount_needed => needed)
	    		@item.save

	    		render 'thanks'
	    	else
	      		render 'new'
	      	end
      	end
    end


    def index
    	@pledges = Pledge.all
    end

    private

	    def pledge_params
	      params.require(:pledge).permit(:quantity, :delivery_date, :item_name)
    end

end
