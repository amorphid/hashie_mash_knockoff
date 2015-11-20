require 'spec_helper'

describe HashieMashKnockoff::AddDefaultValues do
  subject { described_class.new }

  def add(hash, defaults)
    subject.add(hash, defaults)
  end

  context '#add_defaults' do
    it 'adds if empty hash' do
      expect(add(
        {},
        {a: 1}
      )).to eq({a: 1})
    end

    it 'adds if nil' do
      expect(add(
        {a: nil},
        {a: 1}
      )).to eq({a: 1})
    end

    it 'adds if false' do
      expect(add(
        {a: false},
        {a: 1}
      )).to eq({a: 1})
    end

    it 'does not add if 0' do
      expect(add(
        {a: 0},
        {a: 1}
      )).to eq({a: 0})
    end

    it 'does not add if empty string' do
      expect(add(
        {a: ''},
        {a: 1}
      )).to eq({a: ''})
    end

    it 'does not add if true' do
      expect(add(
        {a: true},
        {a: 1}
      )).to eq({a: true})
    end

    it 'adds if nested empty hash' do
      expect(add(
        { a: {} },
        { a: {b: 1} }
      )).to eq({a: {b: 1} })
    end

    it 'adds if nested empty nil' do
      expect(add(
        {a: {b: nil} },
        {a: {b: 1} }
      )).to eq({a: {b: 1} })
    end

    it 'adds if nested false' do
      expect(add(
        {a: {b: false} },
        {a: {b: 1} }
      )).to eq({a: {b: 1} })
    end

    it 'does not add if nested 0' do
      expect(add(
        { a: {b: 0} },
        { a: {b: 1} }
      )).to eq({a: {b: 0} })
    end

    it 'does not add if nested empty string' do
      expect(add(
        {a: {b: ''} },
        {a: {b: 1} }
      )).to eq({a: {b: ''} })
    end

    it 'does not add if nested true' do
      expect(add(
        {a: {b: true} },
        {a: {b: 1} }
      )).to eq({a: {b: true} })
    end
  end

  context '#truthy?' do
    it 'is true if 0' do
      expect(subject.truthy?(
        { a: 0 },
        :a
      )).to eq(true)
    end

    it 'is true if empty string' do
      expect(subject.truthy?(
        { a: '' },
        :a
      )).to eq(true)
    end

    it 'is true if true' do
      expect(subject.truthy?(
        { a: true },
        :a
      )).to eq(true)
    end

    it 'is false if empty hash' do
      expect(subject.truthy?(
        {},
        :a
      )).to eq(false)
    end

    it 'is false if nil' do
      expect(subject.truthy?(
        { a: nil },
        :a
      )).to eq(false)
    end

    it 'is false if false' do
      expect(subject.truthy?(
        { a: false },
        :a
      )).to eq(false)
    end
  end
end
