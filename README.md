# Pricefy

A simple ruby gem for handling prices and calculations.

## Getting Started

Just run `bundle install` to get all the depedencies and then `./bin/pricefy` to run the app.

## What it does

Reads some data, classifies it, adds taxes, and prints out neat reports. Pretty straightfroward stuff.

## Usage

```ruby
pricefy = Pricefy.new(filepath: "input.csv", destination_path: "output")
pricefy.run
```

That's it!
