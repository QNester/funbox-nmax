require 'spec_helper'
include Nmax

RSpec.describe Nmax do
  it 'has a version number' do
    expect(Nmax::VERSION).not_to be nil
  end

  it '#find_decimals_in_stdin return array of integers' do
    n = Random.new(10000).rand
    file = File.open('spec/test.txt', 'r')
    result = find_decimals_in_stdin(file, n)
    expect(result.class).to eq(Array)
    expect(result.all? { |int| int.is_a? Integer}).to eq(true)
  end
end
