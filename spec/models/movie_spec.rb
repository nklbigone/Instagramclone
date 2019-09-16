require 'rails_helper'

RSpec.describe Movie, type: :model do
  # It should be valid if there is a title, year of production, running time and rating
  it "is valid with a title, production_year, running_time, rating" do
    movie = Movie.new(
      title: 'DIC',
      production_year: 2000,
      running_time: 120,
      rating: 'G')
    expect(movie).to be_valid
  end
  # It is an invalid state if there is no title
  it "is invalid without a title" do
    movie = Movie.new(title: nil)
    movie.valid?
    expect(movie.errors[:title]).to include("can't be blank")
  end
  it "is invalid with a duplicate title" do
    Movie.create(
      title: 'DIC',
      production_year: 2000,
      running_time: 120,
      rating: 'G')
    movie = Movie.new(
      title: 'DIC',
      production_year: 3000,
      running_time: 150,
      rating: 'PG12')
    movie.valid?
    expect(movie.errors[:title]).to include("has already been taken")
  end
  # Invalid state if title is over 101 characters
it "is invalid with title is 101 or more characters" do
  movie = Movie.new(title: 'a' * 101)
  movie.valid?
  expect(movie.errors[:title]).to include("is too long (maximum is 100 characters)")
end
end
