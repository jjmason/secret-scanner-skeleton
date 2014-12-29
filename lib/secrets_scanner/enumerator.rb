module SecretsScanner
  # Base class for enumerators for filesystems, tarballs, github, etc.  Created with
  # an instance of Config, and a root file
  class Enumerator
    include Enumerable

    attr_reader :root
    attr_reader :config

    def initialize root, config = nil
      @root = root
      @config ||= SecretsScanner.config
    end

    def each
      return enum_for(__method__) unless block_given?
      each_file do |file|
        yield file
      end
      self # hide the result returned from #each_file so we don't have to put any
           # particular constraints on it's return value.
    end

    protected
    def each_file
      raise NotImplementedError, "Subclasses of #{self.class.name} must implement #each_file"
    end
  end
end