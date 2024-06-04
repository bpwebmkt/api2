class LeadsController < ApplicationController
	include Helpers

	def index
		@lead = Lead.all();
		tip = showMessage();
		render json: {
			status: 200,
			tip: tip,
			message: I18n.t('hello'),
			lead: @lead
		}
	end

	def update
		@lead = Lead.find_by(id: params[:id])
		
		if @lead.update(name: params[:name])

			render json: @lead, status: :ok
		else
			render json: { errors: @lead.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def delete
		@lead = Lead.find_by(id: params[:id])
		if @lead.present?
			@lead.destroy
			render json: @lead
		else
			render json: { status: 3, message: 'Lead not found'}
		end
	end

	def show
		@lead = Lead.find_by(id: params[:id])
		if @lead.present?
			render json: @lead
		else
			render json: {
				status: 3,
				error: 'Lead does not exis'
			}
		end
	end

	def store
		@lead = Lead.new(lead_params)
		if @lead.save
			render json: {
				status: 200,
				lead: @lead,
				params: lead_params
			}
		else
			render :new
		end
	end

	private

	def lead_params
		params.require(:lead).permit(:name, :email, :whatsapp)
	end

end
