require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')
require('pry')

get('/') do
  erb(:index)
end

get('/fake') do
  name = params.fetch('name')
  @@tamagotchi = Tamagotchi.new(name)
  @name = @@tamagotchi.name()
  @fed = @@tamagotchi.food_level()
  @happy = @@tamagotchi.activity_level()
  @energy = @@tamagotchi.sleep_level()
  erb(:play)
end

get('/test') do
  @name = @@tamagotchi.name()
  @fed = @@tamagotchi.food_level()
  @happy = @@tamagotchi.activity_level()
  @energy = @@tamagotchi.sleep_level()
  if params[:commit] == 'status'
    @@tamagotchi.check_levels()
    @fed = @@tamagotchi.food_level()
    @happy = @@tamagotchi.activity_level()
    @energy = @@tamagotchi.sleep_level()
  elsif params[:commit] == 'feed'
    @@tamagotchi.feed()
    @fed = @@tamagotchi.food_level()
    @happy = @@tamagotchi.activity_level()
    @energy = @@tamagotchi.sleep_level()
  elsif params[:commit] == 'play'
    @@tamagotchi.play()
    @fed = @@tamagotchi.food_level()
    @happy = @@tamagotchi.activity_level()
    @energy = @@tamagotchi.sleep_level()
  elsif params[:commit] == 'sleep'
    @@tamagotchi.sleep()
    @fed = @@tamagotchi.food_level()
    @happy = @@tamagotchi.activity_level()
    @energy = @@tamagotchi.sleep_level()
  end
  erb(:play)
end
