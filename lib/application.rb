require "pathname"
PROJECT_DIR = Pathname.new(File.expand_path(File.join("..", ".."), __FILE__))
$LOAD_PATH.unshift(PROJECT_DIR.join("lib"))

require "logger"
LOGGER = Logger.new(STDOUT)
