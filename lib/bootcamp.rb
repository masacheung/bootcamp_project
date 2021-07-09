class Bootcamp

    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = Array.new
        @students = Array.new
        @grades = Hash.new {|h, k| h[k] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(string)
        @teachers << string
    end

    def enroll(string)
        if @students.length < @student_capacity
            @students << string
            return true
        else
            return false
        end
    end

    def enrolled?(student)
        @students.each do |ele|
            if ele == student
                return true
            end
        end
        return false
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if self.enrolled?(student)
            @grades[student] << grade
            return true
        else
            return false
        end
    end

    def num_grades(student)
        if enrolled?(student)
            @grades[student].length
        else
            return nil
        end
    end

    def average_grade(student)
        if @grades[student] == []
            return nil
        else
            @grades[student].sum / @grades[student].length
        end
    end
end
