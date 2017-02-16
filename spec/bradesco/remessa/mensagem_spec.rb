require 'spec_helper'
require 'support/bradesco/remessa_mock'

describe Cnabs::Bradesco::Remessa::Mensagem do
  subject(:mensagem) { Cnabs::Bradesco::Remessa::Mensagem.new(mensagem_hash) }

  let(:mensagem_hash) { Bradesco::RemessaMock.mensagem }

  describe '#build' do
    let(:line) { '2PAGAVEL EM QUALQUER BANCO ATE O VENCIMENTO, APOS O VENCIMENTO COBRAR JUROS 9%AM. APOS 3 DIAS DO VENCIMENTO, SERA ENCAMINHADO PARA PROTESTO                     . COMUNICAMOS P/ FINS DO ART.290 DO COD CIVIL QUE ADQUIRIMOS ESTE TITULO        . ATRAVES DE CESSAO                                                             .00000000000000000000000000000000000000       0090028901477922200003487571%s' }
    let(:sequencial) { '000003' }

    it 'builds the "mensagem" part' do
      expect(mensagem.build).to eq(line)
    end
  end
end
