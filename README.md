# Udacity_SQL_Nanodegree 
## Projects

### 1. [Exploring Deforestation](https://github.com/rishabhCMS/SQL_Deforestation_project):
Understanding which countries and regions around the world have seen a reduction in forest size over the years

### article for interview
1. https://towardsdatascience.com/the-practical-sql-guide-i-wish-i-had-when-i-started-data-analysis-537c93907268


## SQL Basics Learned

**1. SQL SELECT, FROM statements, WHERE, HAVING , IN , LIKE clauses, LOGICAL AND, OR operations**

**2. SQL JOINS, Primary keys, Foreign Keys**

**3. Data Aggreagation functions , SUM, AVG, COUNT, and GROUP BY Clause**

**4. Sub-Query**

    - INLINE Sub-query
  
    - Nested
  
    - WITH
  
    - SCALAR sub-query
  
**5. Data Cleaning Functions**

    - LEFT(String, # of charaters) Extracts a number of characters from a string starting from the left
  
    - RIGHT(String, # of Charaters) Extracts a number of characters from a string starting from the right
  
    - CONCAT(String1, String2...) Concatenates given strings into one string
  
    - COALESCE(col1, col2, ...) returns the for non-null entry for a column
  
    - STRPOS(String, Sub-String) returns the position of the first occurence of a sub-string in a string
  
    - SUBSTR(String, start, length) Gets the sub-string from the given string, with a start pos and length of sub-string in the given string  

    - POSISTION(Sub-string IN String) erturns the position of the first occurence of a sub-string in a string

    - CAST( col_name AS data_type) Changes the data type of a given column
    
    - REPLACE(col, "a","b") replaces char in the columns

## Management of Relational & Non-Relational Databases (Course 2)

### A. Normalizing data (Lesson 2)

**1. What makes data denormalized?**

    - inconsistent data-types in a column
    
    - repeating columns
    
    - repeating values in a column
    
**2. Pitfalls of denormalized data**

    - Incosistent data types in a column affect out ability to reason and make sense of data.
    
    - Repeating values in a column affect our ability to manipulate and query the data.
    
    - Inabilty to uniquely identify a row to target them for data manipulation.
    
    - Irrelevant dependencies causing repetitions and anomalies
    
    - Repeated columns, which disable us from scaling the number of items of related data
    
**3. How to normalize data?**

    - First Normal Form 1NF
    
        - Make all values in a column of a single data-type.
        
        - Make sure each cell contains a single value.
            - if multiple values in a column are disjoint, make separate columns for both values
            - if multiple values in a column are of same type, then make duplicate rows for each value.
        
        - Make sure there are no repeating columns of the same data-type
            - go through each row in that column to make sure they are consistent (same data-type)
        
        - Make sure that each row of data can be uniquely identified by a column or a combination of columns
        
    - Second Normal Form 2NF
        
        - Bring table to 1NF
        
        - Remove Partial dependencies
            - a column is said to be a partial dependency if
                - it is not part of the Primary Key (PK)
                - depends on one part of the PK (example: if PK (col1,col2) and col3 depends only on col2, then col3 is a partial dependency)
    
    - Third Normal Form 3NF
    
        - Bring table to 2NF
        
        - Remove transitive dependencies
            - a column is a said to be a transitive dependency if 
                - When a column is not part of the Primary Key (PK).
                - But, depends on the PK through another key (example: if col is PK, col3 depends on col2 and col2 depends on col1, then col3 is transitive dependency
    
    - When not to Normalize?
        - When you like you have to a lot of joins to get the original data schema

![alt text](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/NormalzingImages/Glossary.png)
    
### A. Data Definition Language (DDL) (Lesson 3)         

**1. Creating Tables**

````sql
CREATE TABLE "students" (
                        "first_name" VARCHAR,
                        "last_name" VARCHAR,
                        "age" INTEGER,
                        "roll_no" INTEGER
                        )
````

**2. Numeric Data Types**

    -Numeric types consist of two-, four-, and eight-byte integers, four- and eight-byte floating-point number
        - INTEGER type store whole numbers, that is, numbers without fractional components, of various ranges.
            - SMALLINT : -32768 to +32767
            - INTEGER : -2147483648 to +2147483647
            - BIGINT : -9223372036854775808 to +9223372036854775807
        - Arbitrary Precision 
            -INEXACT:
                - NUMERIC can store numbers with a very large number of digits. NUMERIC(precision, scale)
                - DECIMAL up to 131072 digits before the decimal point; up to 16383 digits after the decimal point
        - Floating-Point : 
            -EXACT
                - REAL : 6 decimal digits precision
                - DOUBLE PRECISION :15 decimal digits precision
        - Serial : used for creating unique auto-increment identifiers 
        
**3. Text Data Types**
    
    -Variable length with Limit
        - CHARACTER VARYING(n)
        - VARCHAR(n)
    -fixed-length, blank padded
        - CHARACTER(n)
        - CHAR(n)
    -variable unlimited length
        - TEXT
**4. DATE/TIME Date Types**

![alt text](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/DDLImages/datetime.png)
        
**5. Other Data Types**
        
        - JSON
        - ARRAYS
        - Geometry

**6. Modifying Table Structure**

````sql
CREATE TABLE "customers" (
    id SERIAL,
    first_name VARCHAR,
    last_name VARCHAR,
    phone_number VARCHAR
);

ALTER TABLE "students" ADD COLUMN "email_address" SET DATA TYPE VARCHAR;
````

**7. Other DDL commands**

    - DROP: completely removes the table from DB [DON'T DO THIS EVER!]
        - ````sql DROP TABLE "table_name" ````
    - TRUNCATE : empties the table entries while ratining the table structure
        - ````sql TRUNCATE TABLE "table_name" RESTART IDENTITY ````
        - RESTART IDENTITY helps in resetting the index for new entries
    - COMMENT : add comment to a column
        - ````sql COMMENT ON COLUMN "table_name"."col_name" IS "write your comment"````
        - to see the comment in sql terminal use "\d+"
**8. Other Special commands**

    - \dt : to see all tables in DB
    - \d table_name : to see the decription of the table
    - ctrl + L : clear the screen
    - TABLE table_name : for seeing the content of the tables
**9. Glossary**

![alt text](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/DDLImages/glossary.png)
    
### B. Data Manipulation Language (DML) (Lesson 4) 

**1. [Inserting](https://www.postgresql.org/docs/9.6/sql-insert.html) Data in postgres**

**A. First Form**
- Imagine that below is the schema of your 

![alt text](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/DMLImages/schema.png)

**method 1**
- since ID column is serial you don't need to give values for it
````sql
INSERT INTO "movies" ("name", "release_date") VALUES
    ('chak de India', '2007-08-10'),
    ('bhaag milkha bhaag', '2013-07-12')
````
**method 2**
- you can also give values for a column of type SERIAL
````sql
INSERT INTO "movies" ("id", "name", "release_date") VALUES
    (1, 'chak de India', '2007-08-10'),
    (2, 'bhaag milkha bhaag', '2013-07-12')
````
**method 3**
- you can also use DEFAULT keyword for column of type SERIAL
````sql
INSERT INTO "movies" ("id", "name", "release_date") VALUES
    (DEFAULT, 'chak de India', '2007-08-10'),
    (DEFAULT, 'bhaag milkha bhaag', '2013-07-12')
````
**B. Second Form**

````sql
SELECT * FROM posts
````
![table name post ](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/DMLImages/posttable.png)

- we want to create a new table named "categories" to take distinct values from the above table

````sql
CREATE TABLE "categories" (
    "id" SERIAL,
    "name" VARCHAR);
````
![table name category ](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/DMLImages/cattable.png)

- we want to first get distinct entries from "posts" in the "name" column, and then insert those to "name" column in "categories" table

````sql
INSERT INTO "categories" ("name") SELECT DISTINCT "name" FROM "posts"
````
![table name category ](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/DMLImages/insrtdinto.png)

- Exercise solution
    - tables in the DB
    
![schema ](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/DMLImages/exerciseschema.png)

````sql
INSERT INTO "people" ("first_name", "last_name") 
    SELECT "first_name", "last_name" FROM "denormalized_people";
````   
![dntable ](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/DMLImages/dntable.png)
````sql   
INSERT INTO "people_emails" ("person_id", "email_address")   
    SELECT "p"."id", 
            regexp_split_to_table("dn"."emails",',') 
    FROM "denormalized_people" "dn"
    JOIN "people" "p"
    ON ("p"."first_name" = "dn"."first_name" AND "p"."last_name" = "dn"."last_name");
````
![people table ](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/DMLImages/peopletable.png)
![people_emails table ](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/DMLImages/people_emails.png)

**2. [Updating](https://www.postgresql.org/docs/9.6/sql-update.html) Data in postgres**

````sql
UPDATE "table_name" SET "col1"="val1", ..... WHERE ...
````

    - quick trick
    ````sql
    SELECT SUBSTR(col,1) || 'abc' FROM table_name
    -- this will add the string 'abc' to the end of each column
    ````

    - if you have col for date as text type, 
    you can convert that to interval type and extract date
    
    ````sql
    SELECT (CURRENT_TIMESTAMP - "Born_ago"::INTERVAL)::DATE FROM people
    ````
    
    video(https://youtu.be/1BedkII_V9w)
    
    ````sql
    -- Update the last_name column to be capitalized
    UPDATE "people" SET "last_name" =
      SUBSTR("last_name", 1, 1) ||
      LOWER(SUBSTR("last_name", 2));

    -- Change the born_ago column to date_of_birth
    ALTER TABLE "people" ADD column "date_of_birth" DATE;

    UPDATE "people" SET "date_of_birth" = 
      (CURRENT_TIMESTAMP - "born_ago"::INTERVAL)::DATE;

    ALTER TABLE "people" DROP COLUMN "born_ago";
    ````

**2. [Deleting](https://www.postgresql.org/docs/9.6/sql-delete.html) Data in postgres**

**Basic Syntax**

````sql
DELETE FROM table_name WHERE...
````

````sql
-- Extracting year from date column
select date_part('year', your_column) from your_table;

--OR

select extract(year from your_column) from your_table;
````
![quiz img](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/DMLImages/quiz.png)

**3. Transactions Data in postgres**

![ACID Image](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/transactionImages/1.png)

A large portion of interactions with a database don't happen with a human using the psql command line, but instead through application code. When interacting with Postgres through its command line, a feature called AUTOCOMMIT is automatically enabled. This feature makes it so that every command you run is wrapped in a transaction. It's possible to turn off this feature by executing \set AUTOCOMMIT off from the psql command line.

In the case where AUTOCOMMIT is off, or in the case where the database is being interacted with through application code, starting a transaction is achieved using the START TRANSACTION or BEGIN commands, which are equivalent. Any commands executed after this will be run in isolation from any other transactions. If the application — or the psql program — crashes at any point, all the commands will be discarded. We can also manually discard all the commands executed after starting a transaction by running ROLLBACK. In order to make the changes permanent, one has to execute the command COMMIT or END, which are equivalent.

````sql
\set AUTOCOMMIT off; -- turing off the psql auto commit to test some transaction methods

COMMIT; --to commit transactions manually
````

````sql
setting up a transaction manually
BEGIN;

INSERT INTO "users", "state", "date_of_birth") VALUES
    ('users', 'CA', '2008-05-01');  -- a small transaction

COMMIT;
````

- If you are exploring a new database that you're not familiar with and would like to see the effect of running some DML queries, make sure that you \set AUTOCOMMIT off before. You'll be in a much safer position, and any mistakes you make can be manually rolled back using the ROLLBACK command.

- In the context of interacting with Postgres through an application layer, we can do the same thing: if the application detects an error condition in the middle of a transaction, it can issue a ROLLBACK to abort the whole transaction, and return an error to the user.


### Exercise Solution

````sql
\set AUTOCOMMIT off;
BEGIN;
-- PART 1: delete entries containing state-name 'CA', 'NY'
DELETE FROM "user_data" WHERE "state" IN ('CA', 'NY');

-- Part 2: Split the "name" column into first_name and last_name
    -- SPLIT_PART("col_name", 'delemiter', part of split you want)
SELECT SPLIT_PART("name", ' ', 1) FROM "user_data"; -- splts the name col and takes the frist entry

-- first create the first_name and last_name columns 
ALTER TABLE "user_data" 
    ADD COLUMN "first_name" VARCHAR,
    ADD COLUMN "last_name" VARCHAR;

-- Now inster the entries in the new column
UPDATE "user_data" SET
    "first_name" = SPLIT_PART("name",' ', 1),
    "last_name" = SPLIT_PART("name", ' ', 2);

-- drop the "name" column now
ALTER TABLE "user_data", DROP COLUMN "name";
    

-- Part3 : change from state to state_id

--create the state table
CREATE TABLE "state_id" (
    "id" SMALLSERIAL,
    "state" CHAR(2)
);
INSERT INTO "states" ("state")
  SELECT DISTINCT "state" FROM "user_data";
  
 -- state_id column in user_data table
ALTER TABLE "user_data" ADD COLUMN "state_id" SMALLINT;

-- add state_id to "user_data" table
UPDATE "user_data" SET "state_id" = (
  SELECT "s"."id"
  FROM "states" "s"
  WHERE "s"."state" = "user_data"."state"
);

ALTER TABLE "user_data" DROP COLUMN "state";
````

![Glossary](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/transactionImages/glossary.png)


### C. Consistency with constraints (Lesson 5)

        Source of truth is the place in the Db where you store your final data, it's called the source of truth bc it's a place where you can get accurate and 
        trust worthy info about your customers and business. So we need to enfore some sort of **constraints** to keep the data consistent
        
        Constaints is the process we make sure our data obeys the rules of the DB. Constraints are usually used to enforce business rules.
        
**In this lesson we'll see various methods that postgres applies to validate the data and keep the data consistent**

**1. [Unique Constraints](https://www.postgresql.org/docs/9.6/ddl-constraints.html)**
        a unique constraint is a type of rules that can be applied to a column or set of columns to have uniques entries for each row.
        an example woulb to the used_id column to have a unique id for each employee.
        
````sql
-- Method 1 for imposeing constraint
--Step 1: Create a table "users"
CREATE TABLE "users" (
    "user_id" SERIAL,
    "user_name" VARCHAR);
    
-- Step 2a: Alter the column "user_name" to hold only unique entries, this produces a
-- postgres geenrated name for the constraint
ALTER TABLE "users" ADD UNIQUE ("user_name");
-- Step 2b: Giving name to the constraint (giving name to a constraint)
ALTER TABLE "users" ADD CONSTRAINT "unique_user_names" UNIQUE ("user_name");



-- Step 3: Now insert values into the "user_name" colmn of the table "users"
INSERT INTO "users" ("user_name") VALUES ('user1');
INSERT INTO "users" ("user_name") VALUES ('user2');

-- Step 4: This will not be allowed bc if the constraint we imposed for the "user_name" column to hold unique values
INSERT INTO "users" ("user_name") VALUES ('user1');

-- Step 5: If you want to drop a contraint
ALTER TABLE "users" DROP CONSTRAINT "unique_username";
````

````sql
-- variation for declaring constraint

CREATE TABLE "users" (
    "user_id" SERIAL,
    "user_name" VARCHAR UNIQUE);
    
CREATE TABLE "users" (
    "user_id" SERIAL,
    "user_name" VARCHAR
    UNIQUE("user_name");

CREATE TABLE "users" (
    "user_id" SERIAL,
    "user_name" VARCHAR
    CONSTRAINT "unique_username" UNIQUE("user_name");
````
**1 a. Primary key Constraint**
        
        - special unique constraint
        - UNIQUE + NOT NULL 
        - One Primary Constraint per table
        - Primary key Constraints can target one or more columns
````sql
-- UNIQUE constraint allows NULL values
CREATE TABLE "users" (
    "user_id" SERIAL PRIMARY KEY,
    "user_name" VARCHAR UNIQUE NOT NULL);
````

        - Natural key : It is a key that exists in the table and has a business value
        - Surrogate key is a system geenrated key which uniquely identifies a row but has no business values
        - [Refere here](https://www.mssqltips.com/sqlservertip/5431/surrogate-key-vs-natural-key-differences-and-when-to-use-in-sql-server/)

**EXERCISE**

````sql
ALTER TABLE "books" ADD PRIMARY KEY ("id");

ALTER TABLE "books" ADD UNIQUE ("isbn");

ALTER TABLE "authors" ADD PRIMARY KEY ("id");

ALTER TABLE "authors" ADD UNIQUE ("email_address");

ALTER TABLE "book_authors" ADD PRIMARY KEY ("book_id", "author_id");

ALTER TABLE "book_authors" ADD UNIQUE ("book_id", "contribution_rank");
````
**1 b. Foreign key Constraints**

        you need to able to tell postgres about the Foreign Key and its reference to the primary key in the table
````sql
-- Foreign key constraint

ALTER TABLE "table_1" 
    ADD FOREIGN KEY ("col_in_table_1") REFERENCES "table_2" ("col_in_table2");
--here table_1 has a Foreign key and table_2 has a primary key
-- Foreign key constraint is going to restrict to values that exist in the other column


-- method 2: declaring Foreign key contraint while creating the table
-- assume "table_1" already exits and "col_1" is the Primary key in that table
CREATE "table_2" (
    "col_2" INTEGER REFERENCES "table_1" ("col_1"),
    FOREIGN KEY("col_3") REFERENCES "table_1" ("col_1") 
    );
````
**1 c. Foreign key Constraints: [Modifiers](https://www.postgresql.org/docs/9.6/ddl-constraints.html)**
    Modifiers? : Imagine a FB_users table, which contains user_id and name columns, and a FB_comments table which relates comments to the id.
    here, the user_id in FB_users is a PK and id in FB_cmments is a FK referenced to user_id in FB_users (FK contraint)
    
    1. I want to delete a user from FB_users but I will not be able to bc of the FK constraint
    2. I want to delete a user from both the tables entirely which again in not allowed by FK constaint
    
    So, we use modifiers to over-ride the FK constraints, and then psotgres takes care of this automaticaly for us

````sql
-- cascade modifier
CREATE "table_2" (
    "col_2" INTEGER REFERENCES "table_1" ("col_1"),
    FOREIGN KEY("col_3") REFERENCES "table_1" ("col_1") ON DELETE CASCADE  --if you don't put ON DELETE CASCADE it menas ON DELETE RESTRICT
    );
--whenever an entry in col_1 from table_1 is deleted, cascade that operation to the table_2
````
    Adding ON DELETE CASCADE to a foreign key constraint will have the effect that when the referenced data gets deleted, the referencing rows of data will be automatically deleted as well.
    
    adding ON DELETE SET NULL, delets only the PK but keeps the FK by assigning it NULL value
    
**EXERCISE**
        
````sql
ALTER TABLE "employees"
  ADD CONSTRAINT "valid_manager"
  FOREIGN KEY ("manager_id") REFERENCES "employees" ("id") ON DELETE SET NULL;

ALTER TABLE "employee_projects"
  ADD CONSTRAINT "valid_employee"
  FOREIGN KEY ("employee_id") REFERENCES "employees" ("id");

ALTER TABLE "employee_projects"
  ADD CONSTRAINT "valid_project"
  FOREIGN KEY ("project_id") REFERENCES "projects" ("id") ON DELETE CASCADE;
````
**1 d. [Check Constraints](https://www.postgresql.org/docs/9.6/ddl-constraints.html)**

        CHECK constraints allow us to implement custom business rules at the level of the database. Examples of such rules would be: "a product can't have a negative quantity" or "the discount price should always be less than the regular price".
        
        A CHECK constraint can be added either after a table was created, or during table creation. Like all other constraints, it can be added along with the column definition, or along with all the column definitions.

[Check ConstarintVideo](https://youtu.be/R3f_k-7-8EA)
[Check ConstarintVideo](https://youtu.be/HPGWtXCR-S4)

**Quiz**

        Given a table users with a date_of_birth column of type DATE, write the SQL to add a requirement for users to be at least 18 years old.

````sql
ALTER TABLE "users"
  ADD CONSTRAINT "users_must_be_over_18" CHECK (
    CURRENT_TIMESTAMP - "date_of_birth" > INTERVAL '18 years'
  );
````


    Unique constraints, which prevent duplicate values for a given column or columns, except for NULL which is allowed to appear many times.
    Not null constraints, which prevent a column from containing the value NULL.
    Primary key constraints, which, in addition to being a combination of Unique and Not Null constraints, are special: there can only be one per table, it's the official column or set of columns to uniquely identify a row in that table, and it's the default column(s) that will be used when setting up a foreign key constraint referencing that table.
    Foreign key constraints, which restrict values in a column to only those values present in another column. They maintain what we called "referential integrity".
    Check constraints, which can be used to implement custom checks against data that gets added or modified in our tables.
    
**Exercise**

    1. Identify the primary key for each table
    2. Identify the unique constraints necessary for each table
    3. Identify the foreign key constraints necessary for each table
    4. In addition to the three types of constraints above, you'll have to implement some custom business rules:
        - Usernames need to have a minimum of 5 characters
        - A book's name cannot be empty
        - A book's name must start with a capital letter
        - A user's book preferences have to be distinct

````sql
-- Primary and unique keys
ALTER TABLE "users"
  ADD PRIMARY KEY ("id"),
  ADD UNIQUE ("username"),
  ADD UNIQUE ("email");

ALTER TABLE "books"
  ADD PRIMARY KEY ("id"),
  ADD UNIQUE ("isbn");

ALTER TABLE "user_book_preferences"
  ADD PRIMARY KEY ("user_id", "book_id");


-- Foreign keys
ALTER TABLE "user_book_preferences"
  ADD FOREIGN KEY ("user_id") REFERENCES "users",
  ADD FOREIGN KEY ("book_id") REFERENCES "books";


-- Usernames need to have a minimum of 5 characters
ALTER TABLE "users" ADD CHECK (LENGTH("username") >= 5);


-- A book's name cannot be empty
ALTER TABLE "books" ADD CHECK(LENGTH(TRIM("name")) > 0);


-- A book's name must start with a capital letter
ALTER TABLE "books" ADD CHECK (
  SUBSTR("name", 1, 1) = UPPER(SUBSTR("name", 1, 1))
);


-- A user's book preferences have to be distinct
ALTER TABLE "user_book_preferences" ADD UNIQUE ("user_id", "preference");
````
[Video Solution](https://youtu.be/hsZs4KUYO5Y)

![alt image](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/constraintsImages/Glossary.png)

### D. Performance with indexes (Lesson 6)

**1. Creating an Index on column**

````sql
-- commant to tell how much each query takes to execute
\timing ON;

-- creating index
CREATE INDEX "custom_index_name" on "table_name" ("col_name");

-- DROP INDEX "indexname";
````

    indexing can seriously increse the speed by which we can access information from the DB

![hi](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/IndexImages/indexexample.png)


**2. Creating an Index on expressions**

````sql
-- the following with take longer because now it has to also evaluate the expression
SELECT * FROM table_name WHERE
    REGEXP_REPLACE("col_name" regexpression) = "123456";
    
-- creating index on expressions
CREATE INDEX "index_name" ON "table_name" (
     REGEXP_REPLACE("col_name" regexpression);
     
-- now you can search for the required value using select , this will be much faster
-- bc now we have created a separate data structure
SELECT * FROM table_name WHERE
    REGEXP_REPLACE("col_name" regexpression) = "123456";
````

[Postgers string functions](https://www.postgresql.org/docs/9.6/functions-string.html)

**3. Drop Index**

````sql
DROP INDEX index_name
````

**4. Pattern Matching**

````sql
SELECT * FROM table_name WHERE "col_name" LIKE 'rish%'; -- col_name starts with 'rish'

--Special operator classes have to be used when creating the indexes in order to allow pattern-matching queries
CREATE INDEX ON table_name (column_to_partially_match XX_PATTERN_OPS);

-- you can replace 'XX' with TEXT or VARCHAR depending on your pattern requirement
````
    Follow this link for the full Postgres CREATE INDEX [documentation](https://www.postgresql.org/docs/9.6/sql-createindex.html), keeping in mind that we'll be looking at more parts of this syntax in future videos.
    
    
**5. Multi-Column Indexing**

![image](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/IndexImages/multicolumn.png)

````sql
CREATE INDEX ON "table" ("col1" ,"col2");

SELECT * FROM table WHERE
    "col1" = "rishabh" AND 
    "col2" = "uniyal"

-- a small caveat here is that the index will only work if you wantto search using col1 first
-- so, you'll have to create a new index if you want too search using col2
````
**5. Unique Indexing**

````sql
-- creating unique constrains is equivalent to creating unique index
CREATE TABLE "users" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR UNIQUE
);

CREATE UNIQUE INDEX "unique_usr_name" ON "users" (LOWER("username"));    
````
**Exercise**

Given the business requirements below, add the necessary constraints and indexes to support each use-case:

We need to be able to quickly find books and authors by their IDs.

We need to be able to quickly tell which books an author has written.

We need to be able to quickly find a book by its ISBN #.

We need to be able to quickly search for books by their titles in a case-insensitive way, even if the title is partial. For example, searching for "the" should return "The Lord of the Rings".

For a given book, we need to be able to quickly find all the topics associated to it.

For a given topic, we need to be able to quickly find all the books tagged with it.

**Exercise Solution**

````sql
-- Constraints
ALTER TABLE "authors"
  ADD PRIMARY KEY ("id");

ALTER TABLE "topics"
  ADD PRIMARY KEY("id"),
  ADD UNIQUE ("name"),
  ALTER COLUMN "name" SET NOT NULL;

ALTER TABLE "books"
  ADD PRIMARY KEY ("id"),
  ADD UNIQUE ("isbn"),
  ADD FOREIGN KEY ("author_id") REFERENCES "authors" ("id");

ALTER TABLE "book_topics"
  ADD PRIMARY KEY ("book_id", "topic_id");
-- or ("topic_id", "book_id") instead...?

-- We need to be able to quickly find books and authors by their IDs.
-- Already taken care of by primary keys

-- We need to be able to quickly tell which books an author has written.
CREATE INDEX "find_books_by_author" ON "books" ("author_id");

-- We need to be able to quickly find a book by its ISBN #.
-- The unique constraint on ISBN already takes care of that 
--   by adding a unique index

-- We need to be able to quickly search for books by their titles
--   in a case-insensitive way, even if the title is partial. For example, 
--   searching for "the" should return "The Lord of the rings".
CREATE INDEX "find_books_by_partial_title" ON "books" (
  LOWER("title") VARCHAR_PATTERN_OPS
);

-- For a given book, we need to be able to quickly find all the topics 
--   associated with it.
-- The primary key on the book_topics table already takes care of that 
--   since there's an underlying unique index

-- For a given topic, we need to be able to quickly find all the books 
--   tagged with it.
CREATE INDEX "find_books_by_topic" ON "book_topics" ("topic_id");
````

**Veryfying Index usage with [explain](https://www.postgresql.org/docs/9.6/sql-explain.html)**

Postgres' timing feature is a very poor debugging tool, it may tell you one of your queries is slow but it will bot give a resaon for it
So, we can use postgres' EXPLAIN command to get the query plan

````sql
-- adding EXPLAIN to the beginning of the query will not execute the query but will give you a query plan

EXPLAIN SELECT * FROM "table_name" WHERE "col" = "somehing";
````

![](https://github.com/rishabhCMS/Udacity_SQL/blob/master/Images/IndexImages/query.png)

in the image above **Without Indexing**

- seq scan : that postgres performed a squential row by row sacn for this query

- cost : is just a unitless number which should only be used as comparison in the same query after you have made a few changes 

- rows: number of expected rows

- width :

- Postgres goes through every row of data, filters it against any WHERE condition in the query, and adds it to the returned data set.

below **with indexing**

        1. query plan has a tree like structure where we read from the most indented to the least indented
        
        2.EXPLAIN can also show us a really interesting and important behaviour: simply having an index on a column of a table does NOT mean that Postgres will use that index when executing a query with a WHERE condition on the indexed column.
        
        
        

### E. Intro to Non-Relational Databases (Lesson 7)
