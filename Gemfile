source "https://rubygems.org"

gemspec

%w[rspec rspec-core rspec-expectations rspec-mocks].each do |lib|
  library_path = File.expand_path("../../#{lib}", __FILE__)
  if File.exist?(library_path) && !ENV['USE_GIT_REPOS']
    gem lib, :path => library_path
  else
    gem lib, :git => "git://github.com/rspec/#{lib}.git", :branch => '2-99-maintenance'
  end
end

### deps for rdoc.info
platforms :ruby do
  gem 'yard',          '0.8.6.1', :require => false
  gem 'redcarpet',     '2.1.1'
  gem 'github-markup', '0.7.2'
end

### dep for ci/coverage
gem 'coveralls', :require => false

eval File.read('Gemfile-custom') if File.exist?('Gemfile-custom')
