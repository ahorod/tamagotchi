require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')
require('pry')

get('/') do
  erb(:index)
end

get('/tamagotchis') do
  @tamagotchis = Tamagotchi.all()
  erb(:tamagotchis)
end

get('/tamagotchis/new') do
  erb(:tamagotchi_form)
end

post('/tamagotchis') do
  name = params.fetch('name')
  tamagotchi = Tamagotchi.new(name)
  tamagotchi.save()
  erb(:index)
end

get('/tamagotchis/:id') do
  @tamagotchi = Tamagotchi.find(params.fetch("id"))
  erb(:play)
end

get ('/play/:id') do
  @tamagotchi = Tamagotchi.find(params.fetch("id"))
  erb(:play)
end

post('/play/:id') do
  @tamagotchi = Tamagotchi.find(params.fetch("id"))
  if params[:commit] == 'status'
    @tamagotchi.check_levels()
  elsif params[:commit] == 'feed'
    @tamagotchi.feed()
  elsif params[:commit] == 'play'
    @tamagotchi.play()
  elsif params[:commit] == 'sleep'
    @tamagotchi.sleep()
  end
  erb(:play)
end
