require 'spec_helper'

describe HashieMashKnockoff::AddInstanceMethods do
  let(:adder) { described_class.new }
  let(:hashie_mash_knockoff) { HashieMashKnockoff.new }

  context '#add' do
    it 'to change by 0' do
      expect { adder.add(hashie_mash_knockoff, {}) }.
        to change { hashie_mash_knockoff.methods.length }.
        by(0)
    end

    it 'to change by 1' do
      expect { adder.add(hashie_mash_knockoff, { a: 1 }) }.
        to change { hashie_mash_knockoff.methods.length }.
        by(1)
    end

    it 'to change by 2' do
      expect { adder.add(hashie_mash_knockoff, { a: 1, b: 2 }) }.
        to change { hashie_mash_knockoff.methods.length }.
        by(2)
    end
  end

  context '#hashie_mash_knockoff' do
    it 'to be a HashieMashKnockoff' do
      expect(adder.hashie_mash_knockoff({})).
        to be_instance_of(HashieMashKnockoff)
    end
  end
end
