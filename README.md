# Rails Template

### About

This template...

* Changes CSS to SASS
* Changes ERB to Slim
* Creates initializer for secret token (secret key base)
* Configures dotenv
* Configures Foreman
* Configures Reek
* Configures Rubocop
* Configures RVM
* Installs RSpec environment
* Makes other small changes
* Makes initial commit

For more details see [template.rb](template.rb) and [Gemfile](rails_root/Gemfile).

### Usage

```
$ git clone https://github.com/f7k/rails-template
$ rails new blog --skip-test-unit --skip-bundle --template=./rails-template/template.rb
$ cd blog
$ bundle
$ rake db:create
$ foreman start
```

It uses pg username `postres` and password `secret` by default.

All files based on sample-files are gitignored.

Remove symlink `/blog/.ruby-gemset` if you don't want to use gemset.
