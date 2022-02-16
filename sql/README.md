#### Changing a Database Column Size and Type:

```sql
ALTER TABLE tablename MODIFY columnname VARCHAR(20);
```

#### Add a column, use:

```sql
ALTER TABLE table_name ADD column_name datatype;
```

#### Change or reset auto_increment

```sql
ALTER TABLE table_name AUTO_INCREMENT = value;
```

#### DELETE a column, use:

```sql
ALTER TABLE table_name DROP COLUMN column_name;
```

#### UPDATE Statement

```sql
update table_name
set column1 = value1,
    column2 = value2,
    ...
[where search_condition];
```

#### UPDATE Example

```sql
update table01 set sid = 21090114130110 where id = 1;
```

#### DELETE row from table

```sql
DELETE FROM table_name WHERE id > 1;
```

#### ETC

```sql
LOAD DATA LOCAL INFILE '/home/permana/Documents/data_test_01'
INTO TABLE students
FIELDS TERMINATED BY ',';
```
