require 'spec_helper'

describe Activity do
  # Associations
  it { should belong_to(:user) }
  it { should belong_to(:source) }

  # Validations
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:source) }
  it { should validate_presence_of(:source_type) }

  context "add LineItem activity" do
  end
end
