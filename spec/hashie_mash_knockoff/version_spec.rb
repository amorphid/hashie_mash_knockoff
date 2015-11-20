require 'spec_helper'

describe HashieMashKnockoff do
  let(:version) { HashieMashKnockoff::VERSION }

  it 'has a pattern' do
    expect(version).to match(/\d+\.\d+\.\d+/)
  end
end
