# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mogile_image_store}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mitsuhiro Shibuya"]
  s.date = %q{2011-01-07}
  s.description = %q{Rails plugin for using MogileFS as image storage}
  s.email = %q{shibuya@lavan7.co.jp}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "MIT-LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "app/controllers/mogile_images_controller.rb",
    "app/models/mogile_image.rb",
    "config/locales/en.yml",
    "config/locales/ja.yml",
    "config/routes.rb",
    "init.rb",
    "lib/form_helper.rb",
    "lib/mogile_image_store.rb",
    "lib/mogile_image_store/active_record.rb",
    "lib/mogile_image_store/engine.rb",
    "lib/mogile_image_store/image_deletable.rb",
    "lib/mogile_image_store/resizer.rb",
    "lib/mogile_image_store/validators/file_size.rb",
    "lib/mogile_image_store/validators/height.rb",
    "lib/mogile_image_store/validators/image_type.rb",
    "lib/mogile_image_store/validators/width.rb",
    "lib/rails/generators/mogile_image_store/mogile_image_store_generator.rb",
    "lib/rails/generators/mogile_image_store/templates/initializer.rb",
    "lib/rails/generators/mogile_image_store/templates/migration.rb",
    "lib/rails/generators/mogile_image_store/templates/mogile_fs.yml",
    "lib/rails/generators/mogile_image_store/templates/schema.rb",
    "lib/tag_helper.rb",
    "lib/tasks/mogile_image_store.rake",
    "mogile_image_store.gemspec",
    "spec/controllers/image_tests_controller_spec.rb",
    "spec/controllers/mogile_images_controller_spec.rb",
    "spec/dummy/Rakefile",
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/controllers/image_tests_controller.rb",
    "spec/dummy/app/controllers/multiples_controller.rb",
    "spec/dummy/app/helpers/application_helper.rb",
    "spec/dummy/app/helpers/image_tests_helper.rb",
    "spec/dummy/app/helpers/multiples_helper.rb",
    "spec/dummy/app/models/image_test.rb",
    "spec/dummy/app/models/multiple.rb",
    "spec/dummy/app/views/image_tests/_form.html.erb",
    "spec/dummy/app/views/image_tests/edit.html.erb",
    "spec/dummy/app/views/image_tests/index.html.erb",
    "spec/dummy/app/views/image_tests/new.html.erb",
    "spec/dummy/app/views/image_tests/show.html.erb",
    "spec/dummy/app/views/layouts/application.html.erb",
    "spec/dummy/app/views/multiples/_form.html.erb",
    "spec/dummy/app/views/multiples/edit.html.erb",
    "spec/dummy/app/views/multiples/index.html.erb",
    "spec/dummy/app/views/multiples/new.html.erb",
    "spec/dummy/app/views/multiples/show.html.erb",
    "spec/dummy/config.ru",
    "spec/dummy/config/application.rb",
    "spec/dummy/config/boot.rb",
    "spec/dummy/config/database.yml.example",
    "spec/dummy/config/environment.rb",
    "spec/dummy/config/environments/development.rb",
    "spec/dummy/config/environments/production.rb",
    "spec/dummy/config/environments/test.rb",
    "spec/dummy/config/initializers/backtrace_silencers.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/mogile_fs.yml.example",
    "spec/dummy/config/initializers/mogile_image_store.rb",
    "spec/dummy/config/initializers/secret_token.rb",
    "spec/dummy/config/initializers/session_store.rb",
    "spec/dummy/config/locales/en.yml",
    "spec/dummy/config/routes.rb",
    "spec/dummy/db/migrate/20101224074948_create_image_tests.rb",
    "spec/dummy/public/404.html",
    "spec/dummy/public/422.html",
    "spec/dummy/public/500.html",
    "spec/dummy/public/favicon.ico",
    "spec/dummy/public/javascripts/application.js",
    "spec/dummy/public/javascripts/controls.js",
    "spec/dummy/public/javascripts/dragdrop.js",
    "spec/dummy/public/javascripts/effects.js",
    "spec/dummy/public/javascripts/prototype.js",
    "spec/dummy/public/javascripts/rails.js",
    "spec/dummy/public/stylesheets/.gitkeep",
    "spec/dummy/public/stylesheets/scaffold.css",
    "spec/dummy/script/rails",
    "spec/helpers/form_helper_spec.rb",
    "spec/helpers/tag_helper_spec.rb",
    "spec/integration/navigation_spec.rb",
    "spec/models/image_test_spec.rb",
    "spec/models/mogile_image_spec.rb",
    "spec/models/multiple_spec.rb",
    "spec/mogile_image_store/validators/file_size_spec.rb",
    "spec/mogile_image_store/validators/height_spec.rb",
    "spec/mogile_image_store/validators/image_type_spec.rb",
    "spec/mogile_image_store/validators/width_spec.rb",
    "spec/mogile_image_store_spec.rb",
    "spec/routing_spec.rb",
    "spec/sample.bmp",
    "spec/sample.gif",
    "spec/sample.jpg",
    "spec/sample.png",
    "spec/spec_helper.rb",
    "spec/support/factories/image_tests.rb",
    "spec/support/factories/multiples.rb",
    "spec/support/models.rb"
  ]
  s.homepage = %q{http://git.dev.ist-corp.jp/mogile_image_store}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Rails plugin for using MogileFS as image storage}
  s.test_files = [
    "spec/controllers/image_tests_controller_spec.rb",
    "spec/controllers/mogile_images_controller_spec.rb",
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/controllers/image_tests_controller.rb",
    "spec/dummy/app/controllers/multiples_controller.rb",
    "spec/dummy/app/helpers/application_helper.rb",
    "spec/dummy/app/helpers/image_tests_helper.rb",
    "spec/dummy/app/helpers/multiples_helper.rb",
    "spec/dummy/app/models/image_test.rb",
    "spec/dummy/app/models/multiple.rb",
    "spec/dummy/config/application.rb",
    "spec/dummy/config/boot.rb",
    "spec/dummy/config/environment.rb",
    "spec/dummy/config/environments/development.rb",
    "spec/dummy/config/environments/production.rb",
    "spec/dummy/config/environments/test.rb",
    "spec/dummy/config/initializers/backtrace_silencers.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/mogile_image_store.rb",
    "spec/dummy/config/initializers/secret_token.rb",
    "spec/dummy/config/initializers/session_store.rb",
    "spec/dummy/config/routes.rb",
    "spec/dummy/db/migrate/20101224074948_create_image_tests.rb",
    "spec/helpers/form_helper_spec.rb",
    "spec/helpers/tag_helper_spec.rb",
    "spec/integration/navigation_spec.rb",
    "spec/models/image_test_spec.rb",
    "spec/models/mogile_image_spec.rb",
    "spec/models/multiple_spec.rb",
    "spec/mogile_image_store/validators/file_size_spec.rb",
    "spec/mogile_image_store/validators/height_spec.rb",
    "spec/mogile_image_store/validators/image_type_spec.rb",
    "spec/mogile_image_store/validators/width_spec.rb",
    "spec/mogile_image_store_spec.rb",
    "spec/routing_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/factories/image_tests.rb",
    "spec/support/factories/multiples.rb",
    "spec/support/models.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<rmagick>, [">= 0"])
      s.add_runtime_dependency(%q<mogilefs-client>, [">= 0"])
      s.add_development_dependency(%q<rails>, [">= 3.0.0"])
      s.add_development_dependency(%q<sqlite3-ruby>, ["= 1.2.5"])
      s.add_development_dependency(%q<mysql2>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 2.0.1"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<factory_girl>, [">= 0"])
      s.add_development_dependency(%q<cover_me>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug19>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_dependency(%q<rmagick>, [">= 0"])
      s.add_dependency(%q<mogilefs-client>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<sqlite3-ruby>, ["= 1.2.5"])
      s.add_dependency(%q<mysql2>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 2.0.1"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<factory_girl>, [">= 0"])
      s.add_dependency(%q<cover_me>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<ruby-debug19>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0.0"])
    s.add_dependency(%q<rmagick>, [">= 0"])
    s.add_dependency(%q<mogilefs-client>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<sqlite3-ruby>, ["= 1.2.5"])
    s.add_dependency(%q<mysql2>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 2.0.1"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<factory_girl>, [">= 0"])
    s.add_dependency(%q<cover_me>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<ruby-debug19>, [">= 0"])
  end
end

