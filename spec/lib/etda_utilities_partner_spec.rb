# frozen_string_literal: true

RSpec.describe EtdaUtilities::Partner, type: :model do
  describe 'current_partner.id' do
    context "when ENV['PARTNER'] is graduate" do
      before do
        partner_set_env('graduate')
      end

      it 'sets current.id to graduate' do
        expect(described_class.current.id).to eql('graduate')
      end
      it 'responds to graduate?' do
        expect(described_class.current).to be_graduate
      end
    end

    context "when ENV['PARTNER'] is honors" do
      before do
        partner_set_env('honors')
      end

      it 'sets current.id to honors' do
        expect(described_class.current.id).to eql('honors')
      end
      it 'responds to honors?' do
        expect(described_class.current).to be_honors
      end
    end

    context "when ENV['PARTNER'] is milsch" do
      before do
        partner_set_env('milsch')
      end

      it 'sets current.id to milsch' do
        expect(described_class.current.id).to eql('milsch')
      end
      it 'responds to milsch?' do
        expect(described_class.current).to be_milsch
      end
    end

    context "when ENV['PARTNER'] is sset" do
      before do
        partner_set_env('sset')
      end

      it 'sets current.id to sset' do
        expect(described_class.current.id).to eql('sset')
      end
      it 'responds to sset?' do
        expect(described_class.current).to be_sset
      end
    end

    context "when ENV['PARTNER'] is not a valid partner" do
      before do
        partner_set_env('boguspartner')
      end

      it 'reports an error' do
        expect { described_class.current.id }.to raise_error(ArgumentError)
      end
    end

    context "when ENV['PARTNER'] is not set" do
      before do
        ENV.delete('PARTNER')
      end

      it 'reports an error' do
        expect { described_class.current.id }.to raise_error(KeyError)
      end
    end
  end
end
