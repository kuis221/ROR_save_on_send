require 'spec_helper'

describe ServiceProvider do
  let(:xoom){FactoryGirl.create(:service_provider, :xoom)}
  let(:western_union){FactoryGirl.create(:service_provider, :western_union)}

  describe '#average_rating' do
    before do
      feedback_3 = FactoryGirl.create(:feedback, service_quality: 3, approved: true)
      feedback_4 = FactoryGirl.create(:feedback, service_quality: 4, approved: true)
      FactoryGirl.create(:feedback, service_quality: 4, commendable: xoom, approved: true)
      
      FactoryGirl.create(:recent_transaction, 
                         service_provider: xoom,
                         feedback: feedback_3)

      FactoryGirl.create(:recent_transaction, 
                         service_provider: xoom,
                         feedback: feedback_4)

    end

    it 'should return average rating for provider' do
      expect(xoom.average_rating).to eq(4)
    end

    it 'should ignore not approved feedback' do
      FactoryGirl.create(:feedback, service_quality: 1, commendable: xoom, approved: false)
      FactoryGirl.create(:recent_transaction, 
                         service_provider: xoom,
                         feedback: FactoryGirl.create(:feedback, service_quality: 1, approved: false)
                        )

      expect(xoom.average_rating).to eq(4)
    end

    it 'should return nil if provider doesn\'t have any approved feedback' do
      expect(western_union.average_rating).to be_nil
    end
  end
end
