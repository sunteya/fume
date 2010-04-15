# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fume}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sunteya"]
  s.date = %q{2010-04-15}
  s.email = %q{Sunteya@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".gitignore",
     "README",
     "Rakefile",
     "VERSION.yml",
     "depends.rb",
     "fume.gemspec",
     "lib/fume.rb",
     "lib/fume/authlogic.rb",
     "lib/fume/daemon.rb",
     "lib/fume/formtastic.rb",
     "lib/fume/logger_support.rb",
     "lib/fume/rails_ext.rb",
     "lib/fume/searchlogic.rb",
     "lib/fume/simple_theme.rb",
     "lib/fume/smart_logger.rb",
     "rails/init.rb",
     "rails_generators/fume/fume_generator.rb",
     "rails_generators/fume/rspec/rspec_gen.rb",
     "rails_generators/fume/rspec/templates/spec/support/erb_macros.rb",
     "rails_generators/fume/rspec/templates/spec/support/fume_controller_macros.rb",
     "rails_generators/fume/simple_theme/simple_theme_gen.rb",
     "rails_generators/fume/simple_theme/templates/public/stylesheets/reset.css",
     "rails_generators/fume/simple_theme/templates/public/stylesheets/reset.less",
     "rails_generators/fume/simple_theme/templates/public/themes/simple_theme/demo.html",
     "rails_generators/fume/simple_theme/templates/public/themes/simple_theme/simple-theme-ie-patch.js",
     "rails_generators/fume/simple_theme/templates/public/themes/simple_theme/simple-theme.css",
     "rails_generators/fume/simple_theme/templates/public/themes/simple_theme/simple-theme.less",
     "rails_generators/fume/simple_theme/templates/public/themes/simple_theme/src/base.less",
     "rails_generators/fume/simple_theme/templates/public/themes/simple_theme/src/function.less",
     "rails_generators/fume/simple_theme/templates/public/themes/simple_theme/src/layout.less",
     "rails_generators/fume/simple_theme/templates/public/themes/simple_theme/src/reset.less",
     "rails_generators/fume/simple_theme/templates/public/themes/simple_theme/src/vendor/yui-3.0/base.css",
     "rails_generators/fume/simple_theme/templates/public/themes/simple_theme/src/vendor/yui-3.0/fonts.css",
     "rails_generators/fume/simple_theme/templates/public/themes/simple_theme/src/vendor/yui-3.0/reset.css",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-1.3.2.js",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.js",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness.css",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-bg_flat_30_cccccc_40x100.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-bg_flat_50_5c5c5c_40x100.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-bg_glass_20_555555_1x400.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-bg_glass_40_0078a3_1x400.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-bg_glass_40_ffc73d_1x400.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-bg_gloss-wave_25_333333_500x100.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-bg_highlight-soft_80_eeeeee_1x100.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-bg_inset-soft_25_000000_1x100.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-bg_inset-soft_30_f58400_1x100.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-icons_222222_256x240.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-icons_4b8e0b_256x240.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-icons_a83300_256x240.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-icons_cccccc_256x240.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-1.7.2.ui-darkness/ui-icons_ffffff_256x240.png",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery-ui-i18n-1.7.2.js",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery.ba-url-1.11.js",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery.corner-2.03.js",
     "rails_generators/fume/simple_theme/templates/public/themes/vendor/jquery.timepicker-0.2.1.js",
     "spec/fume/daemon_spec.rb",
     "spec/fume/logger_support_spec.rb",
     "spec/fume/smart_logger_spec.rb",
     "spec/rails_stub.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/sunteya/fume}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{a simple rails scaffold.}
  s.test_files = [
    "spec/fume/daemon_spec.rb",
     "spec/fume/logger_support_spec.rb",
     "spec/fume/smart_logger_spec.rb",
     "spec/rails_stub.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<gem_loader>, [">= 0.2.0"])
      s.add_runtime_dependency(%q<actionpack>, ["~> 2.3.5"])
      s.add_development_dependency(%q<authlogic>, [">= 2.1.3"])
      s.add_development_dependency(%q<searchlogic>, [">= 2.4.12"])
      s.add_development_dependency(%q<formtastic>, [">= 0.9.7"])
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
    else
      s.add_dependency(%q<gem_loader>, [">= 0.2.0"])
      s.add_dependency(%q<actionpack>, ["~> 2.3.5"])
      s.add_dependency(%q<authlogic>, [">= 2.1.3"])
      s.add_dependency(%q<searchlogic>, [">= 2.4.12"])
      s.add_dependency(%q<formtastic>, [">= 0.9.7"])
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
    end
  else
    s.add_dependency(%q<gem_loader>, [">= 0.2.0"])
    s.add_dependency(%q<actionpack>, ["~> 2.3.5"])
    s.add_dependency(%q<authlogic>, [">= 2.1.3"])
    s.add_dependency(%q<searchlogic>, [">= 2.4.12"])
    s.add_dependency(%q<formtastic>, [">= 0.9.7"])
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
  end
end

