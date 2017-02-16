require 'spec_helper'
require 'support/bradesco/remessa_mock'

describe Kinabo::Bradesco::Remessa::Builder do
  subject(:builder) { Kinabo::Bradesco::Remessa::Builder.new(builder_hash) }

  let(:header_hash) { Bradesco::RemessaMock.header }
  let(:boletos_hash) { Bradesco::RemessaMock.boletos }
  let(:builder_hash) { { header: header_hash, boletos: boletos_hash } }

  let(:fixture) { File.open('spec/fixtures/remessa/bradesco.rem').read }

  describe '#build' do
    it 'builds all the parts' do
      expect(builder.build).to eq(fixture)
    end
  end
end

