RSpec.describe Account do
  describe "associations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
