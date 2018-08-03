# frozen_string_literal: true

RSpec.describe EtdaUtilities::Partner, type: :model do
  describe 'current_partner.id' do
    context "when ENV['PARTNER'] is graduate" do
      before do
        partner_set_env('graduate')
      end

      it 'sets current.id to graduate' do
        expect(described_class.current.id).to eql('graduate')
        expect(described_class.current.id).not_to eql('honors')
        expect(described_class.current.id).not_to eql('milsch')
      end
      it 'responds to graduate?' do
        expect(described_class.current).to be_graduate
        expect(described_class.current).not_to be_honors
        expect(described_class.current).not_to be_milsch
      end
    end

    context "when ENV['PARTNER'] is honors" do
      before do
        partner_set_env('honors')
      end

      it 'sets current.id to honors' do
        expect(described_class.current.id).to eql('honors')
        expect(described_class.current.id).not_to eql('graduate')
        expect(described_class.current.id).not_to eql('milsch')
      end
      it 'responds to honors?' do
        expect(described_class.current).to be_honors
        expect(described_class.current).not_to be_graduate
        expect(described_class.current).not_to be_milsch
      end
    end

    context "when ENV['PARTNER'] is milsch" do
      before do
        partner_set_env('milsch')
      end

      it 'sets current.id to milsch' do
        expect(described_class.current.id).to eql('milsch')
        expect(described_class.current.id).not_to eql('graduate')
        expect(described_class.current.id).not_to eql('honors')
      end
      it 'responds to milsch?' do
        expect(described_class.current).to be_milsch
        expect(described_class.current).not_to be_graduate
        expect(described_class.current).not_to be_honors
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

      it 'defaults to graduate' do
        expect(described_class.current.id).to eql('graduate')
      end
    end
  end
end
