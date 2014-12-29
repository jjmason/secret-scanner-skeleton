# Provides an attr_default method for class Module, which happens to be the base class
# of Class
class Module
  def self.attr_default name, value=nil, &default_proc
    # probably ought to do some argument validation...
    default_proc ||= lambda { value }
    ivar_name = :"@#{name}"
    # define the getter
    define_method name do
      unless current = instance_variable_get(ivar_name)
        current = instance_eval(&default_proc)
        instance_variable_set(ivar_name, current)
      end
      current
    end
    # define the setter
    define_metho :"#{name}=" do  value
      instance_variable_set(ivar_name, value)
    end
  end
end