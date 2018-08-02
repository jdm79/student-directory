def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "Please enter the hobby of the student"
  hobby = gets.chomp
  puts "Please enter the height of the student"
  height = gets.chomp
  puts "Please enter the place of birth of the student"
  place_of_birth = gets.chomp
  
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby, height: height, POB: place_of_birth}
    puts "We now have #{students.count} students"
    # get another name from the user
    puts "Please enter the name of the student"
    name = gets.chomp
    if name.empty?
      break
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

# def print(students)
#   students.each do |student|
#     if student[:name].length < 12 
#       puts "#{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

def print(students)
  count = 0
  while count < students.length 
      puts "Person #{count+1}. ".center(4) + "#{students[count][:name]}" 
      puts "hobby: #{students[count][:hobby]}"
      puts "height: #{students[count][:height]}"
      puts "POB: #{students[count][:POB]}"
      count += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.length} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
