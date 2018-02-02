# frozen_string_literal: true

RSpec.describe EtdaUtilities::EtdaFilePaths, type: :model do
  describe 'EtdaFilePaths' do
    context '#base_path' do
      it 'returns default workflow_base_path' do
        expect(described_class.new.workflow_base_path).to eql('tmp/')
      end
      it 'returns default explore_default path' do
        expect(described_class.new.explore_base_path).to eql('tmp/')
      end
    end
    context 'workflow uploads' do
      it 'returns final-files path' do
        expect(subject.workflow_upload_final_files_path).to eql('tmp/final-submission-files')
      end
      it 'returns format-review path' do
        expect(subject.workflow_upload_format_review_path).to eql('tmp/format-review-files')
      end
    end
    context '#workflow_restricted' do
      it 'returns path of published restricted files' do
        expect(subject.workflow_restricted).to eql('tmp/restricted')
      end
    end
    context 'explore published paths' do
      it 'returns path of restricted to institution files' do
        expect(subject.explore_psu_only).to eql('tmp/restricted_institution')
      end
      it 'returns path of open_access files' do
        expect(subject.explore_open).to eql('tmp/open')
      end
    end
    context '#detailed_file_path' do
      it 'uses database record id to build the file path' do
        id = 2
        expect(subject.detailed_file_path(id)).to eq('02/2')
        id = 11
        expect(subject.detailed_file_path(id)).to eq('11/11')
      end
      it 'works for bigger numbers' do
        id = 345
        expect(subject.detailed_file_path(id)).to eq('45/345')
        id = 19857
        expect(subject.detailed_file_path(id)).to eq('57/19857')
      end
    end
  end
end
