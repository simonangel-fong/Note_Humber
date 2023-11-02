
# zeppelin

```java
%spark

// Create a DataFrame from CSV file
val drivers = (
    spark.read
    .option("header", "true")       // Use first line as header
    .option("inferSchema", "true")  // Infer schema
    .csv("/user/root/lab/drivers.csv"))

// After you have created the dataframe  please print the schema in a new paragraph
%spark2
// Print the schema in a tree format
drivers.printSchema()

// Once you have printed the schema please list the data using the following in new paragraph
%spark2
drivers.select("name","location").show()

// Creates or replaces a local temporary view with this DataFrame.
%spark2
drivers.createOrReplaceTempView("driversView")

// Execute the following using the driversview as table 
%spark2.sql
select certified, count(*) as "count"  from driversView
group by certified

%spark2
drivers.filter(drivers.certified = "Y").show()


/////////////////////////////////////////////////////////////////////////

// Create a timesheet DataFrame from CSV file
val timesheet = (
    spark.read
    .option("header", "true")       // Use first line as header
    .option("inferSchema", "true")  // Infer schema
    .csv("/user/root/lab/timesheet.csv"))     

// Print the schema in a tree format
timesheet.printSchema()

// list the data using the following in new paragraph
%spark2
timesheet.select("week","mileslogged").show()

// Convert timesheet DataFrame to a temporary view for SQL use 
%spark2
timesheet.createOrReplaceTempView("timesheetView")

// write an SQL that will join the two tables and show the sum of the hours logged by driverid in a Bar chart 
%spark2.sql

```
