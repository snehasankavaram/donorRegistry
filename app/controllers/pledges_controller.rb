require 'fuzzystringmatch'

class PledgesController < ApplicationController
	def new
		@item = RegistryItem.find(params[:item_id])
		@org_id =  params[:org_id]
		puts @org_id

		@pledge = Pledge.new
		render 'new'
	end

	def search
		options = Pledge.all.where(:org_id => current_org.id)
		result = []
		query = params[:q]

		if query == nil || query == ""
			@pledges = options
		else
			matcher = FuzzyStringMatch::JaroWinkler.create( :native )

			for pledge in options
				@user_name = User.find(pledge.user_id).name
				similarity = matcher.getDistance(@user_name, query)

				if (similarity > 0.8)
					result << pledge
				end
			end
			@pledges = result
		end

    	render 'org_index'
	end

	def mark_fulfilled
		@pledge = Pledge.find(params[:id])
		@pledge.update(:fulfilled => true)
		@pledge.save

		# update received
		@item = RegistryItem.find(@pledge.registry_item_id)

		received= @pledge.quantity.to_i + (@item.amount_received||=0)

		@item.update(:amount_received => received)
		@item.save
	end

	def delete
		Pledge.find(params[:id]).delete
		redirect_to :back
	end

	def create
		@item = RegistryItem.find(params[:pledge][:id])
		@pledge = Pledge.new(pledge_params)

		date = Time.parse(params[:pledge][:delivery_date])

		@pledge.update(:delivery_date => date)
		@pledge.update(:registry_item_id => @item.id)

		if !user_logged_in?
			# do nothing? TODO: fixme
			redirect_to login_path
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

    def index_for_donor
    	@pledges = current_user.pledges
    	render 'donor_index'
    end

    def index_for_org
    	@pledges = Pledge.all.where(:org_id => current_org.id)
    	render 'org_index'
    end

    def update
	  @item = Pledge.find(params[:id])

	  # Quantity update must also update corresponding registry item
	  if pledge_params.include? :quantity
	  	@reg_item = RegistryItem.find(@item.registry_item_id)

	  	orig_pledged = @reg_item.amount_pledged.to_i
	  	orig_needed = @reg_item.amount_needed.to_i

	  	old_offer = @item.quantity.to_i
	  	new_offer = pledge_params[:quantity].to_i

	  	new_pledged = orig_pledged - old_offer + new_offer
	  	new_needed = orig_needed + old_offer - new_offer

	  	@reg_item.update(:amount_needed => new_needed, :amount_pledged => new_pledged)
	  	@reg_item.save
	  end

	  respond_to do |format|
	    if @item.update_attributes(pledge_params)
	      format.json { respond_with_bip(@item) }
	    else
	      format.json { render json: @item.errors, status: :unprocessable_entity }
	    end
	  end
	end

    private

	    def pledge_params
	      params.require(:pledge).permit(:quantity, :item_name, :org_id)
    end

end
