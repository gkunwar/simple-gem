# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{simple-gem}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Patrick Reagan"]
  s.date = %q{2009-01-05}
  s.default_executable = %q{simple-gem}
  s.email = %q{reaganpr@gmail.com}
  s.executables = ["simple-gem"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "lib/..", "lib/simple_gem/..", "test/..", "test/simple_gem/..", "templates/..", "templates/.gitignore.erb", "bin/simple-gem"]
  s.has_rdoc = true
  s.homepage = %q{http://sneaq.net}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Make gems. Simple.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
