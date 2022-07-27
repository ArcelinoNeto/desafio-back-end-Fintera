RSpec.describe EntitiUser do
  describe "associations" do
    it { is_expected.to belong_to :entiti }
    it { is_expected.to belong_to :user }
  end
end
