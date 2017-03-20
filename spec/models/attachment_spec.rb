require 'rails_helper'

RSpec.describe Attachment, type: :model do
  subject { build :attachment }

  context 'association' do
    it { should belong_to :comment }
  end

  context 'validation' do
    it { should validate_presence_of(:file) }
  end
end
