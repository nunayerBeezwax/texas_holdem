class TablesController < ApplicationController
	before_filter :find_model

	def find_model
		@table = Table.find(params[:id])
	end

	def index
	end

	def create
		@table = Table.create
		redirect_to(table_url(@table))
	end

	def show
	end

	def deal
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.deal }
		end
	end	

	def flop
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.flop }
		end
	end	

	def turn
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.turn }
		end
	end	

	def river
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.river }
		end
	end

	def clear
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.clear}
		end
	end
end