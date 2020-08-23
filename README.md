# Udacity_SQL_Nanodegree 

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

### Normalizing data (Lesson 2)

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
        
    
            

## Projects

### 1. [Exploring Deforestation](https://github.com/rishabhCMS/SQL_Deforestation_project):
Understanding which countries and regions around th world have seen a reduction in forest size over the years
