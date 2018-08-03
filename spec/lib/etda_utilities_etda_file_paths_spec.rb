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
        expect(subject.workflow_upload_final_files_path).to eql('tmp/final_submission_files/')
      end
      it 'returns format-review path' do
        expect(subject.workflow_upload_format_review_path).to eql('tmp/format_review_files/')
      end
    end

    context '#workflow_restricted' do
      it 'returns path of published restricted files' do
        expect(subject.workflow_restricted).to eql('tmp/restricted/')
      end
    end

    context 'explore published paths' do
      it 'returns path of restricted to institution files' do
        expect(subject.explore_psu_only).to eql('tmp/restricted_institution/')
      end
      it 'returns path of open_access files' do
        expect(subject.explore_open).to eql('tmp/open_access/')
      end
    end

    context '#detailed_file_path' do
      it 'uses database record id to build the file path' do
        id = 2
        expect(subject.detailed_file_path(id)).to eq('02/2/')
        id = 11
        expect(subject.detailed_file_path(id)).to eq('11/11/')
      end
      it 'works for bigger numbers' do
        id = 345
        expect(subject.detailed_file_path(id)).to eq('45/345/')
        id = 19857
        expect(subject.detailed_file_path(id)).to eq('57/19857/')
      end
    end

    context '#explore_download_file_path' do
      file_id = 345
      filename = 'myfile.pdf'
      it 'is nil for restricted files' do
        access_level = 'restricted'
        expect(subject.explore_download_file_path(file_id, access_level, filename)).to be_nil
      end
      it 'returns a path for restricted_to_institution records' do
        access_level = 'restricted_to_institution'
        expect(subject.explore_download_file_path(file_id, access_level, filename)).to eq('tmp/restricted_institution/45/345/myfile.pdf')
      end
      it 'returns a path for open_access records' do
        access_level = 'open_access'
        expect(subject.explore_download_file_path(file_id, access_level, filename)).to eq('tmp/open_access/45/345/myfile.pdf')
      end
      it 'returns nil for unrecognized access levels' do
        access_level = 'iambogus'
        expect(subject.explore_download_file_path(file_id, access_level, filename)).to be_nil
      end
      it 'returns nil if access_level is missing' do
        access_level = ''
        expect(subject.explore_download_file_path(file_id, access_level, filename)).to be_nil
      end
      it 'returns nil if file_id is missing' do
        access_level = 'open_access'
        file_id = nil
        expect(subject.explore_download_file_path(file_id, access_level, filename)).to be_nil
      end
    end
  end
end
