## Property Tracker Lab

Today you're going to make a table for tracking properties for sale and let.

An entry in the properties table must have a selection of 4 of these properties:

- address
- value
- number of bedrooms
- year built
- buy/let status
- square footage
- build (detached, semi-detached, flat, etc)

## Your property class should have:

1. Full CRUD functionality
2. The ability to find properties by id
3. The ability to find properties by address

## Here's some steps to follow:

1. Set up your directory structure
2. Create `console.rb` which will be used to create some new objects and practice your methods as required (use this as you are writing the class & methods to test them)
3. Create a Ruby file for your Property class
4. Write your class definition in the file - `initialize`, `attr_reader`s, instance variables
5. Make the database - `createdb` in command line
6. Make a .sql file and write some SQL to create your database table
7. Run the .sql file to set up the table (`psql -d database_name -f file_name.sql`)
8. Implement `save`, `update` and `delete` methods on your class
9. Implement a `find` method that returns one instance of your class when an id is passed in.
10. Implement a `find_by_address` method that returns one instance of your class when a name is passed in, or nil if no instance is found.
