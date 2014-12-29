module SecretsScanner
  # Contains configuration variables for the SecretsScanner
  # Typically a "global" singleton instance (SecretsScanner.config)
  # will be used, but you can also create a special instance and
  # pass it to Scanner.new or SecretsScanner.scan
  class Config
    # just define variables as attr_accessor, or attr_default
    attr_defualt :enumerator, SecretsScanner::Enumerator::FileSystem

    # Something else to configure (wouldn't worry about it for now)
    attr_default :log_level, 'warn'
  end
end