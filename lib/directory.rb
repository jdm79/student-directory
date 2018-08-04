# declaring an instance variable which can be accessed by all methods
@students = []


def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the @students"
  puts "2. Show the @students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close 
end

def input_students
  puts "To finish, just hit return twice after the last question"
  puts "Please enter the name of the student"
  # create an empty array
  # get the first name
  name = gets.chop
  puts "Please enter the cohort of the student (if blank, default is November)"
  cohort = gets.chomp
  if cohort.empty?
    cohort = "november"
  end
  
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: cohort.to_sym}
    if @students.length == 1
      puts "We now have #{@students.count} student"
    else
      puts "We now have #{@students.count} @students"
    end
    # get another name from the user
    puts "Please enter the name of the student"
    name = gets.chomp
    if name.empty?
      break
    end
    puts "Please enter the cohort of the student (if blank, default is November)"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "november"
    end
  end
  # return the array of @students
  @students
end

def print_header
  puts "The @students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    if student[:cohort] == :november
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# def print(@students)
#   count = 0
#   while count < @students.length 
#       puts "Person #{count+1}. ".center(4) + "#{@students[count][:name]}" 
#       puts "cohort: #{@students[count][:cohort]}"
#       puts "hobby: #{@students[count][:hobby]}"
#       puts "height: #{@students[count][:height]}"
#       puts "POB: #{@students[count][:POB]}"
#       # puts @students[count][:cohort].is_a?(Symbol)
#       count += 1
#   end
# end

def print_footer
  if @students.length == 1
    puts "Overall, we have #{@students.length} great student"
  else
    puts "Overall, we have #{@students.length} great @students"
  end
end

interactive_menu

