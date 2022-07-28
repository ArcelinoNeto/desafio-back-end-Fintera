RSpec.describe Entiti do
  describe "associations" do
    it { is_expected.to have_many :entiti_users }
    it { is_expected.to belong_to :account }
  end
end
