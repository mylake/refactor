## calling code
# movie = Movie.new('The Watchmen', NewReleasePrice.new)
## and later
# movie.price = RegularPrice.new

class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_writer :price

  def initialize(title, the_price_code)
    @title, self.price_code = title, the_price_code
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    @price.frequent_renter_points(days_rented)
  end
end
