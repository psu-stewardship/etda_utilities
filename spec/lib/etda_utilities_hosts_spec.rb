# frozen_string_literal: true

RSpec.describe EtdaUtilities::Hosts, type: :model do
  describe 'Hosts' do
    describe '#workflow_submit_host' do
      it 'returns the correct production host for workflow graduate' do
        expect(subject.workflow_submit_host('graduate')).to eq('submit-etda.libraries.psu.edu')
      end
      it 'returns the correct production host for workflow honors' do
        expect(subject.workflow_submit_host('honors')).to eq('submit-honors.libraries.psu.edu')
      end
      it 'returns the correct production host for workflow millennium scholars' do
        expect(subject.workflow_submit_host('milsch')).to eq('submit-millennium-scholars.libraries.psu.edu')
      end
      it 'returns the correct production host for workflow sset' do
        expect(subject.workflow_submit_host('sset')).to eq('submit-sset.libraries.psu.edu')
      end
      it 'returns the correct QA host for workflow graduate' do
        expect(subject.workflow_submit_host('graduate', 'qa')).to eq('submit-etda-qa.libraries.psu.edu')
      end
      it 'returns the correct QA host for workflow honors' do
        expect(subject.workflow_submit_host('honors', 'qa')).to eq('submit-honors-qa.libraries.psu.edu')
      end
      it 'returns the correct QA host for workflow millennium scholars' do
        expect(subject.workflow_submit_host('milsch', 'qa')).to eq('submit-millennium-scholars-qa.libraries.psu.edu')
      end
      it 'returns the correct QA host for workflow sset' do
        expect(subject.workflow_submit_host('sset', 'qa')).to eq('submit-sset-qa.libraries.psu.edu')
      end
      it 'returns the correct host for workflow if environment is development' do
        expect(subject.workflow_submit_host('graduate', 'development')).to eq('localhost')
      end
    end

    describe '#explore_host' do
      it 'returns the correct production host for explore graduate' do
        expect(subject.explore_host('graduate')).to eq('etda.libraries.psu.edu')
      end
      it 'returns the correct production host for explore honors' do
        expect(subject.explore_host('honors')).to eq('honors.libraries.psu.edu')
      end
      it 'returns the correct production host for explore millennium scholars' do
        expect(subject.explore_host('milsch')).to eq('millennium-scholars.libraries.psu.edu')
      end
      it 'returns the correct production host for explore sset' do
        expect(subject.explore_host('sset')).to eq('sset.libraries.psu.edu')
      end
      it 'returns the correct QA host for explore graduate' do
        expect(subject.explore_host('graduate', 'qa')).to eq('etda-explore-qa.libraries.psu.edu')
      end
      it 'returns the correct QA host for explore honors' do
        expect(subject.explore_host('honors', 'qa')).to eq('honors-explore-qa.libraries.psu.edu')
      end
      it 'returns the correct QA host for explore millennium scholars' do
        expect(subject.explore_host('milsch', 'qa')).to eq('millennium-scholars-explore-qa.libraries.psu.edu')
      end
      it 'returns the correct QA host for explore sset' do
        expect(subject.explore_host('sset', 'qa')).to eq('sset-explore-qa.libraries.psu.edu')
      end
      it 'returns the correct host for explore if environment is development' do
        expect(subject.explore_host('graduate', 'development')).to eq('localhost')
      end
    end
  end
end
