# Pronounceable Password Generator

## Description
This Rails application is a tool for generating and managing pronounceable passwords. It allows users to create, view, edit, and delete passwords based on specific criteria such as length, case options, and inclusion of non-letter characters.

## Features
- Generate pronounceable passwords with customizable options:
  - Length (4-12 characters)
  - Case options (uppercase, lowercase, mixed, capitalize)
  - Option to include non-letter characters (numbers and special characters)
- View a list of all generated passwords
- Edit existing password settings and regenerate
- Delete individual passwords
- Clear all stored passwords

## Technical Details
- Built with Ruby on Rails
- Uses a custom `PronouncablePasswordGenerator` class for password generation
- Implements full CRUD (Create, Read, Update, Delete) operations
- Includes validations for password parameters

## Setup and Installation
1. Clone the repository
2. Run `bundle install` to install dependencies
3. Set up the database with `rails db:create db:migrate`
4. Start the server with `rails server`

## Usage
Navigate to the homepage to start generating and managing passwords. Use the form to set your desired password criteria and generate new passwords. The list view shows all stored passwords with options to view details, edit, or delete each one.