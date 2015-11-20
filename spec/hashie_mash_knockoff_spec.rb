require 'spec_helper'

describe HashieMashKnockoff do
  let(:hash) do
    {
      a: 'b',
      c: { d: 'e' },
      f: {},
      'g' => 'h'
    }
  end

  subject { described_class.new(hash) }

  it { expect(subject.a).to eq(hash[:a]) }

  it { expect { subject.a  = '' }.to raise_error(NoMethodError) }

  it { expect(subject[:a]).to eq(hash[:a]) }

  it { expect { subject[:a]  = '' }.to raise_error(NoMethodError) }

  it { expect(subject.c).to be_instance_of(described_class) }

  it { expect(subject[:c]).to eq(hash[:c]) }

  it { expect(subject[:c]).to be_instance_of(Hash) }

  it { expect(subject.c.d).to eq(hash[:c][:d]) }

  it { expect(subject.f).to eq(hash[:f]) }

  it { expect(subject.f).to be_instance_of(Hash) }

  it { expect(subject[:f]).to eq(hash[:f]) }

  it { expect(subject[:f]).to be_instance_of(Hash) }

  context '#.to_hash' do
    it { expect(subject.to_hash).to eq(hash) }
    it { expect(subject.to_h).to eq(hash) }
  end

  context '#to_json' do
    it { expect(subject.to_json).to eq(hash.to_json) }
  end
end
