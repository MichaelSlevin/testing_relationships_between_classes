require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do
  let (:diary) { double("Diary")}
  let (:sd) { SecretDiary.new(diary) }
  context "when locked" do
    it "refuses to be read" do
      sd.lock
      expect(sd.read).to eq("Go away!")
    end
    it "refuses to be written" do
      sd.lock
      expect(sd.write("message")).to eq("Go away!")
    end
  end

  context "when unlocked" do
    it "gets read" do
      sd.unlock 
      allow(diary).to receive(:read).and_return("read")
      expect(sd.read).to eq("read")
    end

    it "gets written" do
      sd.unlock
      allow(diary).to receive(:write)
      expect(sd.write("message")).to be_nil
    end

  end
end
