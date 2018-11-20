require 'sinatra/base'

class App < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :super_hero
  end

  post '/teams' do
    @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
    team_heroes = params[:members]
    team_heroes.map do |hero|
      Hero.new(name: hero[:name], power: hero[:power], bio: hero[:bio])
    end
    @heroes = Hero.all

    erb :team
  end
end
