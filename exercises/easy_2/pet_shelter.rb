
class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def get_pet(pet)
    @pets << pet
  end

  def number_of_pets
    @pets.length
  end
end

class Shelter
  attr_reader :name, :owners, :unadopted_pets

  def initialize
    @owners = []
    @unadopted_pets = []
  end
  
  def adopt(owner, pet)
    owner.get_pet(pet)
    @owners << owner if !@owners.include?(owner)
  end

  def add_unadopted_pet(pet)
    @unadopted_pets << pet
  end

  def no_of_unadopted_pets
    @unadopted_pets.size
  end

  def print_adoptions
    owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.pets.each do |pet|
        puts "a #{pet.type} named #{pet.name}"
      end
    end
  end

  def print_unadopted_pets
    puts "The Animal Shelter has the following unadopted pets:"
    @unadopted_pets.each do |pet|
      puts "a #{pet.type} named #{pet.name}"
    end
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new

shelter.add_unadopted_pet(asta)
shelter.add_unadopted_pet(laddie)
shelter.add_unadopted_pet(fluffy)
shelter.add_unadopted_pet(kat)
shelter.add_unadopted_pet(ben)
shelter.add_unadopted_pet(chatterbox)
shelter.add_unadopted_pet(bluebell)

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_unadopted_pets
shelter.print_adoptions

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The Animal Shelter has #{shelter.no_of_unadopted_pets} unadopted pets."