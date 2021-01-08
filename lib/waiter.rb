class Waiter
  attr_accessor :name, :exp

  @@all = []

  def initialize(name, exp)
    @name = name
    @exp = exp
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    best_tipped = meals.max {|meal_a, meal_b| meal_a.tip <=> meal_b.tip}
    best_tipped.customer
  end

end