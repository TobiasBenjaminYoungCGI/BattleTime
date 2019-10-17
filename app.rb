require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'
class Battle < Sinatra::Base

  before do
    @game = Game.start
  end

  get '/' do
    erb :index
  end

  get '/secret' do
    erb :the_video
  end

  get '/name_choice' do
    erb :name_choice
  end

  post '/name_assign' do
    player1 = Player.new(params[:name1].empty? ? "Player1" : params[:name1])
    player2 = Player.new(params[:name2].empty? ? "Player2" : params[:name2])
    @game = Game.setup(player1, player2)
    redirect '/battle_form'
  end

  get '/battle_form' do
    erb :battle_form
  end

  post '/attack' do
    @game.switchTurn
    @game.attack(@game.current_turn)
    if @game.complete?
      redirect '/gameover'
    end
    redirect '/battle_form'
  end

  post '/heal' do
    @game.heal(@game.current_turn)
    @game.switchTurn
    redirect '/battle_form'
  end

  post '/boost' do
    @game.powerup(@game.current_turn)
    @game.switchTurn
    redirect '/battle_form'
  end

  get '/gameover' do
    erb :gameover
  end

end
