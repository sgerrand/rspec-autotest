require "autotest/rails_rspec"

describe Autotest::RailsRspec do

  let(:rails_rspec_autotest) { Autotest::RailsRspec.new }

  describe 'exceptions' do
    let(:exceptions_regexp) { rails_rspec_autotest.exceptions }

    it "matches './log/test.log'" do
      expect(exceptions_regexp).to match('./log/test.log')
    end

    it "matches 'log/test.log'" do
      expect(exceptions_regexp).to match('log/test.log')
    end

    it "does not match './spec/models/user_spec.rb'" do
      expect(exceptions_regexp).not_to match('./spec/models/user_spec.rb')
    end

    it "does not match 'spec/models/user_spec.rb'" do
      expect(exceptions_regexp).not_to match('spec/models/user_spec.rb')
    end
  end

  describe 'mappings' do
    it 'runs model specs when support files change' do
      rails_rspec_autotest.find_order = %w(spec/models/user_spec.rb spec/support/blueprints.rb)
      expect(rails_rspec_autotest.test_files_for('spec/support/blueprints.rb')).to(
        include('spec/models/user_spec.rb'))
    end
  end

end
