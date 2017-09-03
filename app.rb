require 'sinatra'

class Todo
	attr_accessor :task, :done, :imp, :urgent
	def initialize task
		@task = task
		@done = false
		@imp = imp
		@urgent = urgent
	end
end

tasks = []

t1 = Todo.new "First"
t2 = Todo.new "Second"
t3 = Todo.new "Third"

tasks << t1
tasks << t2
tasks << t3

get '/' do
	data = Hash.new
	data[:tasks] = tasks #: ye ek symbol access krna hota h , which is only to be accessed in the variable and here tasks is the array defined
	erb :index, locals: data
end

post '/add' do
  puts params #check krne k liye
  task = params["task"] #params m aa rha h task naam ka h form wala
  todo = Todo.new task #object new
  tasks << todo
  return redirect '/'
end

post '/done' do
	task = params["task"]

	tasks.each do |todo|
		if todo.task == task #todo object h and task string
			todo.done = !todo.done
		end
	end

    return redirect '/'

end	


post '/important' do

	task = params["task"]
	tasks.each do |todo|
		if todo.task == task

			if params["important_status"]
				todo.imp = true
			else
				todo.imp = false
			end 
			
		end
	end

	redirect '/'

end


post '/urgent' do

	task = params["task"]
	tasks.each do |todo|
		if todo.task == task

			if params["urgent_status"]
				todo.urgent = true
			else
				todo.urgent = false
			end 
			
		end
	end

	return redirect '/'
	
end
#first add field for imp and urgent in the class
#add checb in erb file with each task
#find how to set checkboxes checked and unchecked
#submit the form