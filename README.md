NOTE: This was my first Rails app, please be kind.


Rails app
=========

CONSOOM! is a Rails 3.1 app running on Ruby 1.9.2 and deployed to Heroku's Cedar stack. It has an RSpec and Cucumber test suite which should be run before commiting to the master branch.

Running tests
-------------

Create aliases:

    alias bake="bundle exec rake"
    alias cuc="bundle exec cucumber"
    alias s="bundle exec rspec"

Run the whole test suite with:

    bake

Run individual features:

    cuc features/visitor_signs_in.feature

Run individual specs:

    s spec/models/user_spec.rb

Tab complete to make it even faster!

When a spec or feature file has many specs in them, you sometimes want to run just what you're working on. In that case, specify a line number:

    s spec/models/user_spec.rb:8
    cuc features/visitor_signs_in.feature:105

Laptop setup
------------

Getting the code:

    git clone git@github.com:<organization>/<app>.git

Postgres:

    brew install postgres --no-python

Setting up Ruby:

    rvm install 1.9.2
    rvm use 1.9.2 --default
    gem install bundler git_remote_branch heroku taps

App:

    cd app
    bundle
    bake db:create
    bake db:schema:load

Install Qt:

    brew install qt

For rebasing and maintaining a clean history, edit your ~/.gitconfig to include these aliases:

    [alias]
      up = !git fetch origin && git rebase origin/master
      down = !git checkout master && git merge @{1} --ff-only

For cheap and easy branches:

    gem install git_remote_branch

Development process
-------------------

To run the app in development mode, use Foreman:

    foreman start

It will pick up on the Procfile and use Thin as the app server instead of Webrick, which will also be used by Heroku's Cedar stack.

    git pull --rebase
    grb create feature-branch
    be rake

This creates a new branch for your feature. Name it something relevant. Run the tests to make sure everything's passing. Then, implement the feature.

    be rake
    git add -A
    git commit
    git push origin feature-branch

Open up the Github repo, change into your feature-branch branch. Press the "Pull request" button. It should automatically choose the commits that are different between master and your feature-branch. Create a pull request and share the link in Campfire with the team. When someone else gives you the thumbs-up, you can merge into master:

    git up
    git down
    git push origin master

For more details and screenshots of the feature branch code review process, read [this blog post](http://robots.thoughtbot.com/post/2831837714/feature-branch-code-reviews).

Staging and production environments
-----------------------------------

We're using Heroku as a hosting provider. Deploying to Heroku is done via git. So, set up your git remotes for each environment:

    git remote add staging git@heroku.com:<app>-staging.git
    git remote add production git@heroku.com:<app>-production.git

Some helpful aliases for accessing staging and production consoles are:

    alias staging='heroku run console --remote staging'
    alias production='heroku run console --remote production'

Deploying
---------

To deploy to staging:

    be rake deploy:staging

Staging deploys are aliased for convenience:

    be rake deploy

To deploy to production:

    be rake deploy:production

Using these commands are important because they will compile the asset pipeline.

Heroku
------

To access data on Heroku:

    heroku console --remote staging
    heroku console --remote production

That will drop you into a Rails console for either environment. You can run ActiveRecord queries from there.

To run a rake task on Heroku:

    heroku rake db:migrate --remote staging
    heroku rake db:migrate --remote production

Any rake task can be run with heroku rake ...

To dump staging or production data into your development environment:

    heroku db:pull --remote staging
    heroku db:pull --remote production

You will see progress bars for each db index and table.

We can create a database backup at any time:

    heroku pgbackups:capture --remote production

View backups:

    heroku pgbackups --remote production

To destroy a backup:

    heroku pgbackups:destroy b003 --remote production

Transfer production data to staging:

    heroku pgbackups:capture --remote production
    heroku pgbackups:restore DATABASE `heroku pgbackups:url --remote production`

More information in the [Dev Center](http://devcenter.heroku.com/articles/pgbackups).

To check the status of running app servers, background jobs, cron jobs, etc:

    heroku ps --remote staging
    heroku ps --remote production

To see the performance of the staging application, see:

    https://heroku.newrelic.com/...

To see the performance of the production application, see:

    https://heroku.newrelic.com/...

Rollout
-------

To check if feature is enabled for a user:

    Rollout.activate? :feature, user

For example:

    Rollout.active? :user_suggests_story, current_user

To enable a feature:

    Rollout.activate_user :feature, user

For example:

    Rollout.activate_user :user_suggests_story, current_user

Amazon Web Services
-------------------

Install the Heroku config plugin:

    heroku plugins:install git://github.com/ddollar/heroku-config.git

Pull the Heroku config from staging:

    heroku config:pull --remote staging

You'll see the Amazon credentials as config vars. You should delete lines that don't apply, like Redis to Go connection strings.



Git
---

Choose a Github Issue.

Create a local feature branch off of master for development.

    git checkout master
    git pull
    git checkout -b 123-feature-xyz

Do work in your feature branch and commit the changes.

    git add -A
    git status
    git commit

Write a [good commit message](http://goo.gl/w11us).

    [#123] Summary of changes under 50 characters

    * More information about commit (under 72 characters)
    * More information about commit (under 72 characters)

A good commit message:

* Prefixes the subject line with a Github Issue number.
* Uses the present tense.

Share your feature branch

    git push origin [branch]

Rebase frequently to incorporate upstream changes.

    git checkout master
    git pull
    git checkout [branch]
    git rebase master
    <resolve conflicts>

Interactive rebase (squash) your commits (if necessary).

    git rebase -i master

Merge your branch back to master and push your changes.

    git checkout master
    git diff --stat master [branch]
    git merge [branch] --ff-only
    git push origin master

Delete your remote feature branch.

    git push origin :[branch]

Delete your local feature branch.

    git branch -d [branch]

Close Github Issue.

Programming
-----------

* Aggressively DRY code during development.
* Avoid abbreviations.
* Avoid comments.
* Avoid global variables.
* Avoid long parameter lists.
* Be consistent.
* Delete trailing whitespace.
* Don't duplicate the functionality of a built-in library.
* Don't over-design.
* Don't program defensively.
* Don't use an empty line at the beginning or end of methods, blocks or
  conditionals.
* Don't vertically align tokens on consecutive lines.
* Don't write more code than you need.
* Exceptions should be exceptional. Don't suppress them or use them for control
  flow.
* Guesses at future functionality should not be designed into the application.
* Keep methods small.
* Keep the code simple.
* Limit lines to a maximum of 80 characters.
* Make sure all tests pass before code is merged into a shared repository.
* Name variables, methods, and classes with intention-revealing names..
* No spaces after `(`, `[`. No spaces before `]`, `)`.
* Order variables and methods alphabetically when possible.
* Prefer single function exit points unless the complexity of the code is
  greatly reduced by multiple returns.
* Treat acronyms as words in names (`XmlHttpRequest` not `XMLHTTPRequest`),
  even if the acronym is the entire name (`class Html` not `class HTML`).
* Use 2 space indentation (no tabs) unless otherwise noted.
* Use an empty line between methods, blocks and conditionals.
* Use ASCII (or UTF-8, if you have to).
* Use default iterators for languages/types that support them.
* Use descriptive names that are both immediately obvious (to a new developer)
  and as short as possible without using abbreviations.
* Use implicit line joining where possible and indent continued lines.
* Use spaces around operators, after commas, colons and semicolons, around `{`
  and before `}`.
* Use standard language conventions for API documentation.
* Use Unix-style line endings (`\n`).

Ruby
----

* Avoid `%q`, `%Q`, `%x`, `%s`, and `%W`.
* Avoid conditional modifiers (lines that end with conditionals).
* Avoid hashes as optional parameters. Does the method do too much?
* Avoid including code and gems in source control that are specific to your
  development machine or process. Examples: `.rvmrc`s, file watchers, debuggers.
* Avoid meta-programming.
* Avoid monkey-patching core classes.
* Avoid return unless required.
* Avoid superfluous parentheses when calling methods, but keep them when you
  assign the return value.
        x = Math.sin(y)
        array.delete e
* Avoid ternary operators (`boolean ? true : false`). Use multi-line `if`
  instead to emphasize code branches.
* Don't use `unless` with `else`.
* Prefer `map` over `collect` and `reduce` over `inject` due to symmetry and
  familarity with mapping and reducing in other technologies.
* Prefer `detect` over `find` and `find_all` over `select` to avoid confusion
  with ActiveRecord and keep `select`/`reject` symmetry.
* Use `_` for unused block parameters.
        hash.map { |_, v| v + 1 }
* Use `%()` for single-line strings needing interpolation and double-quotes.
* Use `%w()` over `['', '']` for an array of words.
* Use `&&` and `||` for boolean expressions.
* Use `||=` freely.
* Use `{...}` over `do..end` for single-line blocks.
* Use `!` suffix for dangerous methods (modifies `self`).
* Use `?` suffix for predicate methods (return a boolean).
* Use `CamelCase` for classes and modules, `snake_case` for variables and
  methods, `SCREAMING_SNAKE_CASE` for constants.
* Use `def` with parentheses when there are arguments.
* Use `do..end` over `{...}` for multi-line blocks.
* Use heredocs for multi-line strings.
* Use `/(?:first|second)/` over `/(first|second)/` when you don't need the
  captured group.
* Use `private` over `protected` to indicate scope.
* Use `def self.method` over `def Class.method` or `class << self`.
* Use `Set` over `Array` for arrays with unique elements. The lookup is faster.
* Use single-quotes for strings unless variable interpolation is required.
* Use `unless boolean?` instead of `if !boolean?`.
* Use [Factory Girl](https://github.com/thoughtbot/factory_girl) for setting up
  complicated test data.

Rails
-----

* Aim for skinny models and skinny controllers.
* Avoid the `:except` option in routes.
* Avoid `member` and `collection` routes.
* Avoid Single Table Inheritance.
* Consider extracting `private` methods to their own object.
* Deploy to [Heroku](http://heroku.com).
* Don't invoke a model's class directly from a view.
* Don't use SQL or SQL fragments (`where('inviter_id is not null')`) outside of
  models.
* Set `config.action_mailer.raise_delivery_errors = true` in the development
  environment.
* Initialize code in `config/initializers`.
* Keep the `db/schema.rb` under version control.
* Limit database defaults to counter caches and booleans.
* Limit the number of instance variables shared between controller and view.
* Name initializers for their gem name. Example: `paperclip.rb`
* Order controller contents: filters, public methods, `private` methods.
* Order model contents: constants, attributes, associations, nested attributes,
  named scopes, validations, callbacks, public methods, `private` methods.
* Prefer classes to modules when designing functionality that is shared by
  multiple models.
* Prefer gems over plugins.
* Prefer presenters (Ruby objects responsible for presentation) over view
  helpers.
* Put all copy text in models, views, controllers, and mailers in
  `config/locales`.
* Set `config.action_mailer.delivery_method = :test` in the test environment.
* Use `_path` over `_url` for named routes everywhere except mailer views.
* Use `def self.method` over the `named_scope :method` DSL.
* Use [Foreman](https://github.com/ddollar/foreman) to run Rails apps in
  development mode.
* Use `I18n.t 'dot.separated.key'` over
  `I18n.t :key, :scope => [:dot, :separated]`.
* Use [Haml](http://haml-lang.com) over ERb.
* Use `has_and_belongs_to_many` if all you need is a join table. Start simple.
* Use namespaced locale lookup in the views by prefixing a period: `t '.title'`.
* Use nested routes to express `belongs_to` relationships between resources.
* Use one `ActionMailer` for the app. Name it `Mailer`.
* Use [single recipient SMTP](https://gist.github.com/2042496) in the staging
  environment.
* Use the default `render 'partial'` syntax over `render :partial => 'partial'`.
* Use the `:only` option to explicitly state exposed routes.

Testing
-------

* Avoid `its`, `specify`, `subject`, and other DSLs. Prefer explicitness and
  consistency.
* Disable real HTTP requests to external services.
* Don't prefix `it` blocks with 'should'.
* Prefix `context` blocks names with 'given' when receiving input. Prefix with
  'when' in most other cases.
* Name outer `describe` blocks after the method under test. Use `self.method`
  for class methods and `method` for instance methods. This matches the method
  definition itself.
* Run specs with `--format documentation`.
* Stub requests to external services.
* Use a `context` block for each execution path through the method.
* Use `before` blocks to clearly define the 'setup' phase of the
  [Four Phase Test](http://xunitpatterns.com/Four%20Phase%20Test.html).
* Use integration tests to execute the entire app.
* Use one expectation per `it` block.
* Use stubs and spies (not mocks) to isolate unit tests as much as possible.
