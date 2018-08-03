def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chop
  puts "Please enter the cohort of the student (if blank, default is November)"
  cohort = gets.chomp
  if cohort.empty?
    cohort = "november"
  end
  # cohort.default = "november"
  puts "Please enter the hobby of the student"
  hobby = gets.chomp
  puts "Please enter the height of the student"
  height = gets.chomp
  puts "Please enter the place of birth of the student"
  place_of_birth = gets.chomp
  
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, hobby: hobby, height: height, POB: place_of_birth}
    if students.length == 1
      puts "We now have #{students.count} student"
    else
      puts "We now have #{students.count} students"
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
    puts "Please enter the hobby of the student"
    hobby = gets.chomp
    puts "Please enter the height of the student"
    height = gets.chomp
    puts "Please enter the place of birth of the student"
    place_of_birth = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    if student[:cohort] == :november
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# def print(students)
#   count = 0
#   while count < students.length 
#       puts "Person #{count+1}. ".center(4) + "#{students[count][:name]}" 
#       puts "cohort: #{students[count][:cohort]}"
#       puts "hobby: #{students[count][:hobby]}"
#       puts "height: #{students[count][:height]}"
#       puts "POB: #{students[count][:POB]}"
#       # puts students[count][:cohort].is_a?(Symbol)
#       count += 1
#   end
# end

def print_footer(students)
  if students.length == 1
    puts "Overall, we have #{students.length} great student"
  else
    puts "Overall, we have #{students.length} great students"
  end
end

students = input_students
print_header
print(students)
print_footer(students)
