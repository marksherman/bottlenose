# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bottlenose::Application.initialize!

# Load some libraries.
load "audit.rb"
load "score.rb"
