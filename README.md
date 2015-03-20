# Setup instructions:

Clone this repository:

    % git clone git://github.com/noelrappin/ancient_city.git

Move into the repository directory

    % cd ancient_city

Install gems -- install bunder if needed

    % gem install bundler

Then use bundler to install gems

    % bundle install

There is no further step, the application repo contains SQLite3 databases that
are already seeded with data.

Run the application with

    % rails server

If you use RVM, and this command errors with something like "bin/rails:3: undefined method `require_relative'", you'll need to
cd out of the directory and back into it

    % cd ..

    % cd ancient_city

This reloads the rvm version

Hit it in the browser at http://localhost:3000

Run tests with

    % rspec
