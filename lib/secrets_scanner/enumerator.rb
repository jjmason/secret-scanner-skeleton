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

    # so this class is both enumerable (that is, it supports operations like map, select, and so on)
    # typically you'll want to call it's :lazy method and operate on that, or each it instead of building
    # an array.  This way you can apply a chain of filters or transformations to the object without multiple
    # trips or building an in memory array.
    def each
      raise NotImplementedError
    end
  end
end