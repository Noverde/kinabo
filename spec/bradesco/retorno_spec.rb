require 'spec_helper'

describe Kinabo::Bradesco::Retorno do
  let(:path) { 'spec/fixtures/retorno/bradesco.ret' }
  subject(:cnab) { Kinabo::Bradesco::Retorno.new(path) }

  describe '#header' do
    it 'reads the header part' do
      header = cnab.header

      expect(header[:id_registro]).to be_zero
      expect(header[:id_arquivo_retorno]).to eq(2)
      expect(header[:literal_retorno]).to eq('RETORNO')
      expect(header[:literal_servico]).to eq('COBRANCA')
      expect(header[:codigo_empresa]).to eq(4359923)
      expect(header[:nome_empresa]).to eq('BOA VISTA FUNDO DE INVESTIMENT')
      expect(header[:numero_bradesco_c3]).to eq(237)
      expect(header[:nome_banco]).to eq('BRADESCO')
      expect(header[:data_gravacao_arquivo]).to eq('2017-02-07'.to_date)
      expect(header[:densidade_gravacao]).to eq(1600000)
      expect(header[:numero_aviso_bancario]).to eq(1466)
      expect(header[:data_credito]).to eq('2017-02-08'.to_date)
      expect(header[:numero_sequencial]).to eq(1)
    end
  end

  describe '#entries' do
    it 'reads the entries parts' do
      entries = cnab.entries

      expect(entries.size).to eq(4)

      expect(entries.first[:id_registro]).to eq(1)
      expect(entries.first[:tipo_empresa]).to eq(2)
      expect(entries.first[:numero_empresa]).to eq(12592411000100)
      expect(entries.first[:id_empresa]).to eq(190028601487922)
      expect(entries.first[:numero_controle]).to eq(1113978)
      expect(entries.first[:nosso_numero]).to eq('200003487571')
      expect(entries.first[:carteira]).to eq(9)
      expect(entries.first[:id_ocorrencia]).to eq(2)
      expect(entries.first[:data_ocorrencia]).to eq('2017-02-07'.to_date)
      expect(entries.first[:numero_documento]).to eq('23273 - 1')
      expect(entries.first[:data_vencimento]).to eq('2017-03-10'.to_date)
      expect(entries.first[:valor]).to eq(5309.49)
      expect(entries.first[:banco_cobrador]).to eq(237)
      expect(entries.first[:agencia_cobradora]).to eq(435)
      expect(entries.first[:especie_titulo]).to eq('')
      expect(entries.first[:despesas_cobranca]).to eq(0)
      expect(entries.first[:outras_despesas]).to eq(0)
      expect(entries.first[:juros_operacao]).to eq(0)
      expect(entries.first[:iof]).to eq(0)
      expect(entries.first[:abatimento]).to eq(0)
      expect(entries.first[:desconto]).to eq(0)
      expect(entries.first[:valor_pago]).to eq(0)
      expect(entries.first[:juros_mora]).to eq(0)
      expect(entries.first[:outros_creditos]).to eq(0)
      expect(entries.first[:motivo_ocorrencia]).to eq('')
      expect(entries.first[:data_credito]).to be_nil
      expect(entries.first[:origem_pagamento]).to eq(0)
      expect(entries.first[:cheque_bradesco]).to eq(0)
      expect(entries.first[:motivo_rejeicao]).to eq('0000000000')
      expect(entries.first[:numero_cartorio]).to eq(0)
      expect(entries.first[:numero_protocolo]).to eq('')

      expect(entries.first[:numero_sequencial]).to eq(2)
      expect(entries[1][:numero_sequencial]).to eq(3)
      expect(entries[2][:numero_sequencial]).to eq(4)
      expect(entries[3][:numero_sequencial]).to eq(5)
    end
  end
end
