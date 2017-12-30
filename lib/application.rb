require "pathname"
PROJECT_DIR = Pathname.new(File.expand_path(File.join("..", ".."), __FILE__))
$LOAD_PATH.unshift(PROJECT_DIR.join("lib"))

def log(message) # TODO move to helper class/file
  puts "#{Time.now}: #{message}"
end
