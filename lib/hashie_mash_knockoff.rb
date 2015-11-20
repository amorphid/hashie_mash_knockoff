require 'json'
require 'srm'
require 'hashie_mash_knockoff/version'
require 'hashie_mash_knockoff/add_default_values'
require 'hashie_mash_knockoff/add_instance_methods'

class HashieMashKnockoff
  def initialize(kwargs = {}, defaults = {})
    @hash = AddDefaultValues.new.add(kwargs, defaults)
    decorate_self(self, @hash)
  end

  def [](key)
    @hash[key]
  end

  def to_hash
    @hash
  end

  def to_json
    to_hash.to_json
  end

  alias :to_h :to_hash

  private

  def decorate_self(hashie_mash_knockoff, kwargs)
    hashie_mash_knockoff.tap do |hashie_mash_knockoff|
      AddInstanceMethods.new.add(hashie_mash_knockoff, kwargs)
    end
  end
end
