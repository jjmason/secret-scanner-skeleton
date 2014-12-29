require 'find'
module SecretsScanner
  class Enumerator
    # E.g, Enumerator is the superclass of FileSystem
    class FileSystem < self
      def each_file
        Find.find do |path|
          # check path out, maybe prune or whatever
          yield path
        end
      end
    end
  end
end