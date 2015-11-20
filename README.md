# HashieMashKnockoff

- A [Hashie::Mash](https://github.com/intridea/hashie#mash) knockoff
- This is a prototype
- Built and tested with Ruby 2.2.3

## Setup

Add it to your Gemfile or...

```
gem install hashie_mash_knockoff
```

## Test

```
bundle exec rspec
```

## Usage

```
require 'hashie_mash_knockoff'

# access hash keys with method calls
hash     = { a: 'b', c: { d: 'e' }, f: {} }
hashie_mash_knockoff = HashieMashKnockoff.new(hash)
hashie_mash_knockoff.a         # returns 'b'
hashie_mash_knockoff.a = ''    # raises NoMethodError
hashie_mash_knockoff[:a]       # returns 'b'
hashie_mash_knockoff[:a] = ''  # raises NoMethodError
hashie_mash_knockoff.c         # returns instance of HashIsh w/ hash of { d: 'e' }
hashie_mash_knockoff.c.class   # returns HashIsh
hashie_mash_knockoff[:c]       # returns { d: 'e' }
hashie_mash_knockoff[:c].class # returns Hash
hashie_mash_knockoff.c.d       # returns 'e'
hashie_mash_knockoff.f         # returns {}
hashie_mash_knockoff.f.class   # returns Hash
hashie_mash_knockoff[:f]       # returns {}
hashie_mash_knockoff[:f].class # returns Hash

# set default values
hash     = { a: nil, b: { c: false }, d: { e: '>_<' } }
defaults = { a: 123, b: { c: true  }, d: { e: 'ಠ_ಠ' } }
hashie_mash_knockoff = HashieMashKnockoff.new(hash, defaults)
hashie_mash_knockoff.a   # returns 123,  overrides falsey nil
hashie_mash_knockoff.b.c # returns true, overrides falsey false
hashie_mash_knockoff.d.e # returns 'lol', not overriden due to 'lol' being truthy
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
