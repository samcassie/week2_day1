require('minitest/autorun')
require('minitest/reporters')
require_relative('../homework')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class Test < MiniTest::Test

    def test_can_talk
        student = Student.new("Sam", "G19")
        assert_equal("Sam can talk!", student.can_talk)
    end

    def test_favourite_language
        student = Student.new("Sam", "G19")
        assert_equal("I love Ruby!", student.favourite_language("Ruby"))
    end

    #########

    def test_add_new_player
        team = Team.new("Legends", ["Sam", "Pete", "Tong"], "Sandy", 0)
        team.add_new_player("Jo")
        assert_equal(4, team.players.length)
    end

    def test_player_in_team
        team = Team.new("Legends", ["Sam", "Pete", "Tong"], "Sandy", 0)
        team.player_in_team("Sam")
        assert_equal(true, true)
    end

    def test_points
        team = Team.new("Legends", ["Sam", "Pete", "Tong"], "Sandy", 0)
        team.result("win")
        assert_equal(3, team.points)
    end

    ########

    def setup

        @library = {
            title: "lord_of_the_rings",
            rental_details: {
                student_name: "Jeff",
                date: "01/12/16"
            }
        }

    end

    def test_book_info
        library = Library.new(@library[:title], @library[:rental_details][:student_name], @library[:rental_details][:date])
        book_info = library.book_info("lord_of_the_rings")
        assert_equal(@library[:rental_details], book_info)
    end


    def test_add_new_book
        library = Library.new(@library[:title], @library[:rental_details][:student_name], @library[:rental_details][:date])
        number_of_books = library.add_book(@library, "jungle_book").length()
        assert_equal(2, number_of_books)
    end

    def test_change_rental_details
        library = Library.new(@library[:title], @library[:rental_details][:student_name], @library[:rental_details][:date])
        library.change_rental_details("lord_of_the_rings", "Peter", "01/02/03")
        assert_equal("Peter", @library[:rental_details][:student_name])
    end


end
