# Udacity_SQL_Nanodegree 
## Projects

### 1. [Exploring Deforestation](https://github.com/rishabhCMS/SQL_Deforestation_project):
Understanding which countries and regions around the world have seen a reduction in forest size over the years

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
    
### A. Data Manipulation Language (DML) (Lesson 4) 

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

![ACID Image](https://github.com/rishabhCMS/Udacity_SQL/tree/master/Images/transactionImages.1.png)
