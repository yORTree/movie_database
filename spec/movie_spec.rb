require("spec_helper")

describe(Movie) do

  describe(".all") do
  it("starts off with no movies") do
    expect(Movie.all()).to(eq([]))
  end
end


  describe(".find") do
    it("returns a movie by its ID number") do
      test_movie = Movie.new({:name => "5th Element", :id => nil})
      test_movie.save()
      test_movie2 = Movie.new({:name => "Bruce Willis", :id => nil})
      test_movie2.save()
      expect(Movie.find(test_movie2.id())).to(eq(test_movie2))
    end
  end

  describe("#==") do
    it("is the same movie if it has the same nameand id") do
      movie = Movie.new({:name => "5th Element", :id => nil})
      movie2 = Movie.new({:name => "5th Element", :id => nil})
      expect(movie).to(eq(movie2))
    end
  end

  describe("#update") do
    it("lets you update movies in the database") do
      movie = Movie.new({:name => "5th Element", :id => nil})
      movie.save()
      movie.update({:name => "6th Element"})
      expect(movie.name()).to(eq("6th Element"))
    end

    it("lets you add an actor to a movie") do
      movie = Movie.new({:name => "5th Element", :id => nil})
      movie.save()
      bruce = Actor.new({:name => "Bruce Willis", :id => nil})
      bruce.save()
      milla = Actor.new({:name => "Milla Jovovich", :id => nil})
      milla.save()
      movie.update({:actor_ids => [bruce.id(), milla.id()]})
      expect(movie.actors()).to(eq([bruce, milla]))
    end
  end

  describe("#actors") do
    it("returns all of the actors in a particular movie") do
      movie = Movie.new({:name => "5th Element", :id => nil})

  describe("#delete") do
    it("lets you delete a movie from the database") do
      movie = Movie.new({:name => "6th Element" , :id => nil})
      movie.save()
      movie2 = Movie.new({:name => "5th Element", :id = nil})
      movie2.save()
      movie.delete()
      expect(Movie.all()).to(eq([movie2]))
    end
  end
end
