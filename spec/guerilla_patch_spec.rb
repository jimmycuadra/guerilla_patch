require "pry"
require "guerilla_patch"

describe GuerillaPatch do
  describe ".patch" do
    before do
      described_class.patch(Fixnum, "TimeExtensions") do
        def minutes
          self * 60
        end
      end
    end

    if RUBY_VERSION < "2"
      it "permanently modifies the object" do
        expect(2.minutes).to eql(120)
      end
    else
      it "does not permanently modify the object" do
        expect { 2.minutes }.to raise_error(NoMethodError)
      end

      it "affects classes using the refinement" do
        c = Class.new do
          using TimeExtensions

          def test_refinement
            2.minutes
          end
        end

        expect(c.new.test_refinement).to eql(120)
      end
    end
  end
end
