require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  describe "Iteration 2" do
    it "exists and has attributes" do
      biker = Biker.new("Kenny", 30)

      expect(biker).to be_an_instance_of(Biker)
      expect(biker.name).to eq("Kenny")
      expect(biker.max_distance).to eq(30)
      expect(biker.rides).to eq({})
      expect(biker.acceptable_terrain).to eq([])
    end

    it "can learn new terrains" do
      biker = Biker.new("Kenny", 30)

      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)

      expect(biker.acceptable_terrain).to eq([:gravel, :hills])
    end

    it "can log rides" do
      biker = Biker.new("Kenny", 30)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride1, 91.1)
      
      biker.log_ride(ride2, 60.9)
      biker.log_ride(ride2, 61.6)

      expect(biker.rides).to eq({})
    end
  end
end




# biker.rides
# => {
#      #<Ride:0x00007fc62ca32a10...> => [92.5, 91.1],
#      #<Ride:0x00007fc62cb42ba8...> => [60.9, 61.6]
#    }

# biker.personal_record(ride1)
# => 91.1

# biker.personal_record(ride2)
# => 60.9