module SecretsScanner
  # A Scanner instance has :config and :root attrs given to it's constructor
  # It can be asked to scan!, and then provides access to a list of secret
  # files.  It also might be a neat trick to make it's #secret_files method
  # run scan! if it hasn't been already.  This class would also be the class
  # to put a caching mechanism on, as well as the scanning passes.
  class Scanner
    attr_reader :root
    attr_reader :config
    def initialize root, config = nil
      @root = root
      @config ||= SecretsScanner.config
    end

    def enumerator
      # enumerator is a Class, so we instantiate it like so.
      @enumerator ||= @config.enumerator.new root, config
    end

    # return an Enumerable containing secret files
    def secrets
      # usually we can just return the enumerator without scanning
      # anything because it will know to cache stuff / lazily perform
      # the enumeration.  But we'll have to apply some filters and maps
      # to it.
    end

    private
    def wrap_enumerator
      # apply lazy maps and filters to our enumerator, and return it
    end
  end
end