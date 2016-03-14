class PledgesController < ApplicationController
	def new
		@item = RegistryItem.find(params[:item_id])
		@pledge = Pledge.new
		render 'new'
	end

	def create
		@item = RegistryItem.find(params[:pledge][:id])
		@pledge = Pledge.new(pledge_params)

		date = Time.parse(params[:pledge][:delivery_date])

		@pledge.update(:delivery_date => timed_date)

		if !user_logged_in?
			# do nothing? TODO: fixme
			render login_path
		else
			# add to user's pledges
			current_user.pledges << @pledge

	    	if @pledge.save
	    		# render thanks for pledging page
	    		pledges = @item.amount_pledged
	    		if pledges == nil
	    			pledges = 0
	    		end

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
    	@pledges = current_user.pledges
    end

    private

	    def pledge_params
	      params.require(:pledge).permit(:quantity, :item_name)
    end

end
