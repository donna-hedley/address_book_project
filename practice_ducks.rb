# Our prepare method can now accept workers of any type as long as
# it can respond to prepare_duck. Without strict type restrictions
# we add a huge amount of flexibility to our application. Adding a more
# workers is trivial.

class Duck
  def prepare(workers)
    workers.each{ |worker|
      worker.prepare_duck(self) }
  end
end

class Moulder
  def prepare_duck(duck)
    puts "heat_plastic"
    puts "pour_mold"
  end
end

class Cooker
  def prepare_duck(duck)
    puts "set_oven_temp('150')"
    puts "cook_for('15min')"
  end
end

class Painter
  def prepare_duck(duck)
    puts "paint_body('yellow')"
    puts "paint_beak('orange')"
    puts "paint_eyes"
  end
end

class QualityAssurance
  def prepare_duck(duck)
    puts "float_duck"
    puts "inspect_duck"
  end
end

class Packager
  def prepare_duck(duck)
    puts "wrap_duck"
    puts "box_duck"
  end
end

# All of our classes share the same prepare_duck method signature, but they
# all have different implementations. However, in cases where you need to
# share some code across this interface you can break your duck type into a module.

d = Duck.new
d.prepare([Moulder.new, Cooker.new, Painter.new, QualityAssurance.new, Packager.new])
print d
