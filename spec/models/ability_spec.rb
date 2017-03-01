require 'cancan/matchers'

describe User, type: :model do
  let(:user) { create :user }
  let(:project) { create :project, user: user }
  let(:task) { create :task, project: project }

  context 'when user signed in' do
    subject { Ability.new(user) }

    it { should be_able_to(:manage, project) }
    it { should be_able_to(:manage, task) }
  end
end
