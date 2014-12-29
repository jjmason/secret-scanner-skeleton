# Some useful extensions for core classes.

# Here we're going to load files manually and do so when this file is required.
# This way we'll always get all of the files under 'core_ext'.

Dir[File.dirname(__FILE__) + "/core_ext/*.rb"].each{ |path| load(path) }
