class Person

  def initialize
    @courses = []
  end

  def initialize_course(courses)
    raise 'Courses should be empty' unless @courses.empty?
    @courses += courses
  end

  def courses
    @courses.dup
  end

  def add_course(course)
    @courses << course
  end

  def remove_course(course)
    @courses.delete(course)
  end

  def number_of_advanced_courses
    @courses.select { |course| course.advanced? }.size
  end

  def number_of_courses
    @courses.size
  end
end
