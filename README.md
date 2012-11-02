[![Build Status](https://travis-ci.org/jimmycuadra/guerilla_patch.png)](https://travis-ci.org/jimmycuadra/guerilla_patch)

# GuerillaPatch

**GuerillaPatch** is a Ruby gem to ease the transition to Ruby 2.0 when redefining behavior in existing objects (monkey patching). Ruby 2.0 introduces a new feature called *refinements* which allows you to create monkey patches that only exist in a scope where the refinement is explicitly included, preventing your changes from affected code that has not opted in.

Using GuerillaPatch, you can use a common interface for writing a monkey patch that will use refinements if available, working seemlessly for both Ruby 1.9 and Ruby 2.0.

## Installation

Add this line to your application's Gemfile:

    gem 'guerilla_patch'

And then execute:

    $ bundle

Or install it yourself with:

    $ gem install guerilla_patch

## Usage

To create a new monkey patch, use `GuerillaPatch.patch`. The first argument is the object you are patching, and the second argument is the name to use for the refinement if run under Ruby 2.0. Pass a block with the methods you want to add to the object, or any other modifications you want to make.

``` ruby
GuerillaPatch.patch(Fixnum, "TimeExtensions") do
  def minutes
    self * 60
  end
end
```

Then, in Ruby 1.9:

``` ruby
2.minutes # => 120
```

And in Ruby 2.0:

``` ruby
class MyApp
  using TimeExtensions

  def minutes_to_seconds(m)
    m.minutes
  end
end

MyApp.new.minutes_to_seconds(2) # => 120
```
