class TablesController < ApplicationController

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
		find_model
	end

	def deal
		find_model
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.deal }
		end
	end	

	def flop
		find_model
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.flop }
		end
	end	

	def turn
		find_model
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.turn }
		end
	end	

	def river
		find_model
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.river }
		end
	end

	def winner 
		find_model
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.winner }
		end
	end

	def clear
		find_model
		respond_to do |f|
			f.html {}
			f.json { render :json => @table.clear}
		end
	end

	def take_seat
		find_model
		player = Player.order("RANDOM()").first
		if !(@table.players.include? player)
			player.sit(@table, params['seat'].gsub(/[^\d]/, '').to_i)
		end
		respond_to do |f|
			f.html{}
			f.json { render :json => player}
		end
	end
end