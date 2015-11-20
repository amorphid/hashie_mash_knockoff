class HashieMashKnockoff
  class AddInstanceMethods
    def add(hashie_mash_knockoff, kwargs)
      kwargs.each do |key, value|
        define_method(hashie_mash_knockoff, key, value)
      end
    end

    def define_method(hashie_mash_knockoff, name, value)
      return_value = method_value(value)

      hashie_mash_knockoff.send(:define_singleton_method, name) do
        return_value
      end
    end

    def hashie_mash_knockoff(hash)
      HashieMashKnockoff.new(hash)
    end

    def has_keys?(value)
      value.keys.size > 0
    end

    def should_be_a_hashie_mash_knockoff?(value)
      Srm.is_a_hash?(value) && has_keys?(value)
    end

    def method_value(value)
      should_be_a_hashie_mash_knockoff?(value) ? hashie_mash_knockoff(value) : value
    end
  end
end
