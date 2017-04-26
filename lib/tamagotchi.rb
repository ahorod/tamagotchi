

class Tamagotchi
  @@tamagotchis = []

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @id = @@tamagotchis.length().+(1)
    @time = Time.now().min()
    @stopwatch = 0
  end

  def id
    @id
  end
  def name
    @name
  end

  def food_level
    @food_level
  end

  def sleep_level
    @sleep_level
  end

  def activity_level
    @activity_level
  end

  define_singleton_method(:all) do
    @@tamagotchis
  end

  define_method(:save) do
   @@tamagotchis.push(self)
 end

 define_singleton_method(:clear) do
  @@tamagotchis = []
end

define_singleton_method(:find) do |identification|
    found_tamagotchi = nil
    @@tamagotchis.each() do |tamagotchi|
      if tamagotchi.id().eql?(identification.to_i())
        found_tamagotchi = tamagotchi
      end
    end
    found_tamagotchi
  end

  def is_alive?
    return @food_level > 0
  end

  def needs_food?
    return @food_level < 5
  end

  def needs_activity?
    return @activity_level < 5
  end

  def needs_sleep?
    return @sleep_level < 2
  end

  def test_time
    @time -= 1
  end

  def play
    self.check_levels()
    @activity_level = 10
    @food_level -= 3
  end

  def feed
    self.check_levels()
    @food_level = 10
  end

  def sleep
    self.check_levels()
    @sleep_level = 10
  end

  def check_levels
    self.is_alive?()
    self.needs_sleep?()
    self.needs_activity?()
    self.needs_food?()
    @stopwatch = Time.now.min() - @time
    if @stopwatch >= 1
      @food_level -= @stopwatch
      @activity_level -= @stopwatch
      @sleep_level -= @stopwatch
      @stopwatch = 0
      @time = Time.now().min()
    end
  end
end
