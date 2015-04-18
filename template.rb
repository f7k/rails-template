def source_paths
  [
    File.expand_path("rails_root", File.dirname(__FILE__)),
    super
  ]
end

inside "app" do
  inside "assets" do
    inside "javascripts" do
      remove_file "application.js"
      copy_file "application.js"
    end

    inside "stylesheets" do
      remove_file "application.css"
      copy_file "application.css.sass"
    end
  end

  inside "concerns" do
    create_file ".keep"
  end

  inside "controllers" do
    remove_file "concerns"
  end

  inside "models" do
    remove_file "concerns"
  end

  inside "views" do
    inside "layouts" do
      remove_file "application.html.erb"
      template "application.html.slim"
    end
  end
end

inside "config" do
  inside "initializers" do
    remove_file "session_store.rb"
    template "secret_token.rb"
    template "session_store.rb"
  end

  inside "locales" do
    remove_file "en.yml"
    create_file ".keep"
  end

  remove_file "database.yml"
  remove_file "secrets.yml"
  template "database.sample.yml"
  create_link "database.yml", "database.sample.yml"
end

inside "docs" do
  create_file ".keep"
end

inside "spec" do
  inside "support" do
    inside "matchers" do
      create_file ".keep"
    end

    inside "shared_examples" do
      create_file ".keep"
    end

    copy_file "capybara.rb"
    copy_file "database_cleaner.rb"
    copy_file "factory_girl.rb"
  end

  copy_file "factories.rb"
  copy_file "i18n_spec.rb"
  copy_file "rails_helper.rb"
  copy_file "spec_helper.rb"
end

environment <<-CODE
config.generators do |gen|
      gen.javascripts false
      gen.stylesheets false
      gen.helper_specs false
      gen.view_specs false
    end
CODE

remove_file ".gitignore"
remove_file "Gemfile"
remove_file "Rakefile"
remove_file "README.rdoc"
create_file ".sample.env"
copy_file ".default.reek"
copy_file ".gitignore"
copy_file ".rspec"
copy_file ".rubocop.yml"
copy_file "Procfile"
copy_file "Rakefile"
template ".ruby-gemset.sample"
template ".ruby-version.sample"
template "Gemfile", "Gemfile"
create_link ".env", ".sample.env"
create_link ".ruby-gemset", ".ruby-gemset.sample"
create_link ".ruby-version", ".ruby-version.sample"

git :init
git add: "."
git commit: "-a -m 'Initial commit'"
