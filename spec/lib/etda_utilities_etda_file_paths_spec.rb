RSpec.describe EtdaUtilities::EtdaFilePaths, type: :model do
  describe 'EtdaFilePaths' do
    context '#base_path' do
      it 'returns workflow_base_path' do
        expect(described_class.new.workflow_base_path).to eql('tmp/')
      end
      it 'returns explore_default path' do
        expect(described_class.new.explore_base_path).to eql('tmp/')
      end
    end
    context '#this_host' do
      it 'returns default host' do
        expect(described_class.new.this_host).to eql('localhost/')
      end
    end
    context 'workflow uploads' do
      it 'returns final-files path' do
        expect(subject.workflow_upload_final_files_path).to eql('tmp/localhost/final-submission-files')
      end
      it 'returns format-review path' do
        expect(subject.workflow_upload_format_review_path).to eql('tmp/localhost/format-review-files')
      end
    end
    context '#workflow_restricted' do
      it 'returns path of published restricted files' do
        expect(subject.workflow_restricted).to eql('tmp/localhost/restricted')
      end
    end
    context 'explore published paths' do
      it 'returns path of restricted to institution files' do
        expect(subject.explore_psu_only).to eql('tmp/localhost/restricted_institution')
      end
      it 'returns path of open_access files' do
        expect(subject.explore_open).to eql('tmp/localhost/open')
      end
    end
  end
end
