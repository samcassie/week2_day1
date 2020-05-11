class Student

    attr_accessor :name, :cohort

    def initialize(name, cohort)
        @name = name
        @cohort = cohort
    end

    def can_talk
        p "#{name} can talk!"
    end

    def favourite_language(language)
        p "I love #{language}!"
    end

end


class Team

    attr_reader :team_name, :players, :coach, :points
    attr_writer :coach, :points


    def initialize(team_name, players, coach, points)
        @team_name = team_name
        @players = players
        @coach = coach
        @points = points
    end

    def add_new_player(name)
        @players.append(name)
    end

    def player_in_team(name)
        if @team_name.include?name
            return true
        else
            return false
        end
    end

    def result(result)
        case result
        when "win"
            @points += 3
        when "draw"
            @points += 1
        when "lose"
            @points += 0
        end
    end

end


class Library

    attr_reader :title, :student_name, :date, :rental_details
    attr_writer :rental_details, :student_name, :date

    def initialize(title, student_name, date)
        @rental_details = {
            student_name: student_name,
            date: date,
        }
        @title = title
        @student_name = student_name
        @date = date
    end

    def book_info(book_name)
        if book_name == @title
            return @rental_details
        end
    end

    def add_book(array, book_title)
        book = {
            title: book_title,
            rental_details: {
                student_name: "",
                date: "",
            }
        }
        array.merge!(book)
    end

    def change_rental_details(book_name, student_name, date)
        if book_name == @title
            @student_name = student_name
            @date = date
        end
    end

end
