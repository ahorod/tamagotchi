require('rspec')
require('tamagotchi')

describe('Tamagotchi') do
  before() do
    Tamagotchi.clear()
  end
  describe("#initialize") do
    it("sets the name and life levels of a new Tamagotchi") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.name()).to(eq("lil dragon"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.activity_level()).to(eq(10))
    end
  end

  describe("#is_alive?") do
    it("is alive if the food level is above 0") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.is_alive?()).to(eq(true))
    end
  end

  #   it("is dead if the food level is 0") do
  #     my_pet = Tamagotchi.new("lil dragon")
  #     my_pet.set_food_level() #make a method that will change the food level of your tamagotchi.
  #     expect(my_pet.is_alive()).to(eq(false))
  #   end
  # end
  #
  # describe("#time_passes") do
  #   it("decreases the amount of food the Tamagotchi has left by 1") do
  #     my_pet = Tamagotchi.new("lil dragon")
  #     my_pet.time_passes()  #decide what trigger you will use to make time pass
  #     expect(my_pet.food_level()).to(eq(9))
  #   end
  # end
  describe("#play") do
    it("reduce food level by 3 and increase activity level to 10") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.play()
      expect(my_pet.food_level()).to eq(7)
      expect(my_pet.activity_level()).to eq(10)
    end
  end
  describe("#feed") do
    it("increase food level to 10") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.feed()
      expect(my_pet.food_level()).to eq(10)
    end
  end
  describe("#sleep") do
    it("increase sleep level to 10") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.sleep()
      expect(my_pet.sleep_level()).to eq(10)
    end
  end
  describe("#check_levels") do
    it("check if a minute has passed, then modify levels") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.test_time()
      my_pet.check_levels()
      expect(my_pet.sleep_level()).to eq(9)
      expect(my_pet.food_level()).to eq(9)
      expect(my_pet.activity_level()).to eq(9)
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Tamagotchi.all()).to(eq([]))
    end
  end
  describe("#save") do
   it("adds pet to the array of pets") do
     test_pet = Tamagotchi.new("cat")
     test_pet.save()
     expect(Tamagotchi.all()).to(eq([test_pet]))
   end
 end
 describe(".clear") do
   it("empties out all of the saved pets") do
     Tamagotchi.new("dog").save()
     Tamagotchi.clear()
     expect(Tamagotchi.all()).to(eq([]))
   end
 end

 describe("#id") do
    it("returns the id of the pet") do
      test_pet = Tamagotchi.new("parrot")
      test_pet.save()
      expect(test_pet.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("returns a pet by its id number") do
      test_pet = Tamagotchi.new("dog")
      test_pet.save()
      test_pet2 = Tamagotchi.new("cat")
      test_pet2.save()
      expect(Tamagotchi.find(test_pet.id())).to(eq(test_pet))
    end
  end
end
