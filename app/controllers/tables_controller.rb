class TablesController < ApplicationController
	def index
	end

	def create
		@table = Table.create
		redirect_to(table_url(@table))
	end

	def show
		@table = Table.find(params[:id])
	end

	def deal
		@table = Table.find(params[:id])
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.deal }
		end
	end	

	def flop
		@table = Table.find(params[:id])
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.flop }
		end
	end	

	def turn
		@table = Table.find(params[:id])
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.turn }
		end
	end	

	def river
		@table = Table.find(params[:id])
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.river }
		end
	end
end