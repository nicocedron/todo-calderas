TodoCalderas.com.ar
===================

Dependencies
-------

 - Ruby 2.3.3
 - Rails 5.1.2

Quick start
-------

If you satisfy all the dependencies you can clone the repository via git:

```
$ git@github.com:nicocedron/todo-calderas.git

```

And then go to your project folder and run:

```
$ bundle install
```

You also have to set up all environment variables and config your database settings, you can do it creating the following files (we have created sample files inside config folder as an example):

```
[app-directory]/
└── config/
    ├── database.yml       -> Database configuration.
    └── application.yml    -> Environment variables here.
```

This application uses Figaro for setting up configuration environment variables. You should create an application.yml file under config/, following the structure described on config/application.sample.yml

Now you can start the server (port by default is 3000):

```
$ rails s
```

Then point your browser to **http://localhost:3000**, and start using the app!

Install Dependencies
-------
- **Ruby & Rails**

    If you don't have Ruby or Rails, I recommend you to use [rvm][1] to manage your Ruby versions and gems; you can follow instructions based on your operating system [here][2].

Coding Style
------
 - Use two spaces for indentation, not tabs.
 - Avoid trailing spaces.

Testing
-------

We are using Rspec for tests. Rspec works out of the box once you run the bundle command. There is only one thing to consider: test files are under the `spec/` directory.

It's worth to mention that all features must provide a feature spec and model specs, all at green state.


[1]: https://rvm.io/rvm/install
[2]: http://railsapps.github.io/installing-rails.html1