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
  @name = @tamagotchi.name()
  @fed = @tamagotchi.food_level()
  @happy = @tamagotchi.activity_level()
  @energy = @tamagotchi.sleep_level()
  if params[:commit] == 'status'
    @tamagotchi.check_levels()
    @fed = @tamagotchi.food_level()
    @happy = @tamagotchi.activity_level()
    @energy = @tamagotchi.sleep_level()
  elsif params[:commit] == 'feed'
    @tamagotchi.feed()
    @fed = @tamagotchi.food_level()
    @happy = @tamagotchi.activity_level()
    @energy = @tamagotchi.sleep_level()
  elsif params[:commit] == 'play'
    @tamagotchi.play()
    @fed = @tamagotchi.food_level()
    @happy = @tamagotchi.activity_level()
    @energy = @tamagotchi.sleep_level()
  elsif params[:commit] == 'sleep'
    @tamagotchi.sleep()
    @fed = @tamagotchi.food_level()
    @happy = @tamagotchi.activity_level()
    @energy = @tamagotchi.sleep_level()
  end
  erb(:play)
end
