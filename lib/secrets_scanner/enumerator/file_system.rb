require 'find'
module SecretsScanner
  class Enumerator
    # E.g, Enumerator is the superclass of FileSystem
    class FileSystem < self
      def each
        # return a lazy enumerator if no block is given
        return enum_for(__method__).lazy unless block_given?
        Find.find do |path|
          # check path out, maybe prune or whatever
          yield path
        end
      end
    end
  end
end