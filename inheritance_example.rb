class Animal
    attr_accessor :name, :alive, :leg_count, :eye_count
    def initialize(name, alive, leg_count, eye_count)
      @name = name
      @alive = alive
      @leg_count = leg_count
      @eye_count = eye_count
    end
    def alive
      @alive
    end

    def eye_count
      @eye_count
    end

    def leg_count
      @leg_count
    end

    def speak
      puts "nerts"
    end
end



class Mammal  < Animal

  def initialize(name, alive, leg_count, eye_count)
      super(name, alive, leg_count, eye_count)
  end

  def breathe
    puts "inhale and exhale"
  end

  def speak
    puts "Meow!"
  end
end


=begin
Betty = Mammal.new("cat", true, 4, 4,)


if Betty.alive
  puts "hello, I'm #{Betty.name}. I have #{Betty.leg_count} legs and #{Betty.eye_count} eyes"
else
  puts "Opps! #{Betty.name} is dead"
end

Betty.speak

=end


=begin
class Cat < Mammal
  def speak
    puts "Meow"
  end
end

class Dog  < Mammal
  def initialize(breed)
    @breed = breed
  end
end

class Lab < Dog
  def initialize(breed)
    super(breed)
    @name = name
  end
  def to_s
    "(#@breed, #@name)"
  end
end


puts Cat.new().alive(false)
puts Lab.new("Labrador", "Benzy").alive(true).to_s
puts Lab.new("Labrador", "Benzy").to_s

=end
