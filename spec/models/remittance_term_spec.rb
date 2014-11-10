require 'spec_helper'

describe RemittanceTerm do
  describe '.import_from_csv' do
    before do
      # stub csv data
      data =
        %Q{Send country,Receive country,Remit name,Send method,Receive method,Send currency,Receive currency,Send amount range ($USD) From,Send amount range ($USD) To,Fees for sending USD,Fees for sending %,FX markup (%),Receiving fee (in Column D currency),Receiving fee (%),Duration (hours),Documentation,Promotions,Service quality\n} +
        %Q{USA,Mexico,Western Union,bank,cash,USD,MXN,0,"2,999",4,,2.49,,,120,,,\n} +
        %Q{USA,Mexico,Western Union,cash,bank,USD,MXN,0,99,4,,2.49,,,72,,,\n} +
        %Q{USA,Mexico,Western Union,cash,cash,USD,MXN,0,99,5,,2.49,,,1,,,\n}
      
      csv_file = Rails.root.join('db/seeds', 'remittance_terms.csv')
      allow(File).to receive(:open).and_call_original
      allow(File).to receive(:open).with(csv_file, universal_newline: false, headers: :first_row) {StringIO.new(data)}

      FactoryGirl.create(:mexico)
      FactoryGirl.create(:service_provider, :western_union)
    
      FactoryGirl.create(:payment_method, :bank)
      FactoryGirl.create(:payment_method, :cash)
    end

    it 'should import 3 records from csv to db' do
      expect{
        RemittanceTerm.import_from_csv
      }.to change(RemittanceTerm, :count).by(3)
    end

    it 'should import all the fields from csv' do
      RemittanceTerm.import_from_csv

      remittance_term = RemittanceTerm.first

      expect(remittance_term.receive_country.name).to eq('Mexico')
      expect(remittance_term.service_provider.name).to eq('Western Union')
      expect(remittance_term.send_method.name).to eq('bank account')
      expect(remittance_term.receive_method.name).to eq('cash')
      expect(remittance_term.receive_currency).to eq('MXN')
      expect(remittance_term.send_amount_range_from).to eq(0)
      expect(remittance_term.send_amount_range_to).to eq(2999)
      expect(remittance_term.fees_for_sending.to_i).to eq(4)
      expect(remittance_term.fees_for_sending_percent).to be_nil
      expect(remittance_term.fx_markup).to eq(2.49)
      expect(remittance_term.duration).to eq(120)
      expect(remittance_term.documentation).to be_nil
      expect(remittance_term.promotions).to be_nil
      expect(remittance_term.service_quality).to be_nil
    end
  end
end
