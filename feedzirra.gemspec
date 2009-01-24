# -*- encoding: utf-8 -*-
 
Gem::Specification.new do |s|
  s.name = %q{feedzirra}
  s.version = "0.0.1"
 
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Paul Dix"]
  s.date = %q{2009-01-22}
  s.email = %q{paul@pauldix.net}
  s.files = [
    "lib/feedzirra.rb",
    "lib/feedzirra/feed.rb",
    "lib/feedzirra/atom.rb",
    "lib/feedzirra/atom_feed_burner.rb",
    "lib/feedzirra/rdf.rb",
    "lib/feedzirra/rss.rb",
    "README.textile", "Rakefile", 
    "spec/spec.opts", 
    "spec/spec_helper.rb",
    "spec/feedzirra/feed_spec.rb",
    "spec/feedzirra/atom_spec.rb",
    "spec/feedzirra/atom_feed_burner_spec.rb",
    "spec/feedzirra/rdf_spec.rb",
    "spec/feedzirra/rss_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/pauldix/feedzirra}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A feed fetching and parsing library that treats the internet like Godzilla treats Japan: it dominates and eats all.}
 
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2
 
    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["> 0.0.0"])
      s.add_runtime_dependency(%q<pauldix-sax-machine>, [">= 0.0.5"])
    else
      s.add_dependency(%q<nokogiri>, ["> 0.0.0"])
      s.add_dependency(%q<pauldix-sax-machine>, [">= 0.0.5"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["> 0.0.0"])
    s.add_dependency(%q<pauldix-sax-machine>, [">= 0.0.5"])
  end
end