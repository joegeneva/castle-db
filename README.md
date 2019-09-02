# castle-db
A work sample demonstrating database knowledge using a schema inspired by castles.

## Castle Schema
This is my attempt to create a database schema for a castle that could be used to track people living in it. Things like where they are scheduled to be, what skills they know, and how much they get paid for those jobs.

## SQL Queries
The initial queries I have uploaded work with the skill tables. 

One uses two tables and three inner joins to display all the skills and levels for each person in the database.

The second displays skills that noone has learned yet, making use of a right join.

## EER Diagrams
I used MySql's EER(enhanced entity–relationship) Diagram tool to make the schema at a high level, and easily export it for use in the real database. I've uploaded images of it to make it easy to take a quick look at it.

## Future Development
I plan to add triggers, procs, functions, and views. I am going to try to use only SQL given that this project was created to demonstrate my knowedge of it.
I will add a proc to add a skill to someone. If that skill does not exist, it will be created.

I will also be adding more constraints to the schema, making columns reject null values, that they are unique, and using check. I will also try making a primary key consisting of multiple keys.

I will not use ENUMS, given they are not supported by other databases.
