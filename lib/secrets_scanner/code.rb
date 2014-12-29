# ideally we won't `require` anything from this library here.

module SecretsScanner
  # This module provides some useful methods for determining
  # whether a code file contains secrets.
  module Code
    autoload :CodeFile, 'secrets_scanner/code/code_file'
    class << self
      def file path
        # TODO, maybe return nil if it isn't code?
        # TODO, create a SecretScanner::Code::File for this path
      end

      def is_code? path
        # more to this, of course...
        extensions.member? File.extname(path)
      end

      def extensions
        # lazily load extensions
        @extensions ||= load_extensions
      end

      # Additional public method go here.232

      # No need to expose the `load_extensions` method
      private
      def load_extensions
        # load and return the file extensions.
      end
    end
  end
end
