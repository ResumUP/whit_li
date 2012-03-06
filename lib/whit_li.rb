module WhitLi
  class << self
    attr_accessor :token

    def configure
      yield self
      true
    end
  end 

  autoload :Config,     "whit_li/config"
  autoload :Version,    "whit_li/version"
  autoload :Mash,       "whit_li/mash"
  autoload :Errors,     "whit_li/errors"
  autoload :Client,     "whit_li/client"
end
