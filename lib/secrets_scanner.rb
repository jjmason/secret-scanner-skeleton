require 'secrets_scanner/core_ext'
##
#
# This module's primary role is to act as a namespace.
# It might also contain high level entry point methods (as class methods)
# so that a command line interface or a program using this as a library
# doesn't really need to know anything about the internals.
#
# This module should never be `include`ed, except perhaps when you're playing
# around in a shell or a quick test script.
module SecretsScanner

  # Instead of `requiring` a bunch of stuff every time this file is loaded,
  # we can use `autoload` magic to load files for various components on
  # demand.
  #
  # Warning: autoload is *not* thread safe.  If you're going to be using
  # this library in a multi-threaded context, it's best to require all of tthese
  # by hand before starting any threads.
  autoload :Code, 'secrets_scanner/code'
  autoload :CLI,  'secrets_scanner/cli'
  autoload :Config, 'secrets_scanner/config'
  autoload :ConfigFile, 'secrets_scanner/config_file'
  autoload :Scanner, 'secrets_scanner/scanner'
  autoload :Enumerator, 'secrets_scanner/enumerator'


  # Some singleton class magic happening here.  Google it
  # if you're interested, tl;dr; methods within
  # the class << self block are defined on the module,
  # rather than instances of classes including it.
  #
  # E.g., I can say SecretsScanner.scan(...) or c = SecretsScanner.config
  class << self
    # top level method: scan a directory for secrets, using
    # either you're own config or the default/global config.
    def scan root, config = nil

    end

    # Return the defualt or global config
    def config
      # Lazy creation is a common pattern
      # in ruby, generally done like this.  Note that here the `@config` variable refers
      # to an instance variable of the module, not instances of classes including the
      # module.  This is preferable to the (deprecated) @@cvar syntax for class/module
      # vars.
       @config ||= Config.new
    end

    # Another common pattern: Configure a system with a block.  sYou can then do this:
    # SecretsScanner.configure do |c|
    #   c.some_option = 'foo'
    #   c.something_else = true
    # end
    def configure
      yield config if block_given?
    end
  end

end