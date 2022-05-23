

EXEC sp_changedbowner 'sa'

EXEC sys.sp_cdc_enable_db 

EXEC sys.sp_cdc_enable_table 
@source_schema = N'dbo', 
@source_name = N'Persons', 
@role_name = NULL,
@capture_instance = NULL,
@supports_net_changes = 1,
@captured_column_list = N'PersonID, LastName, FirstName, Address, City',
@filegroup_name = N'PRIMARY';
;
GO

SELECT * FROM CDC.change_tables ct 
SELECT * FROM cdc.dbo_Persons_CT 

EXEC sys.sp_cdc_disable_table 
@source_schema = N'dbo', 
@source_name = N'Persons', 
@capture_instance = N'dbo_Persons';


INSERT INTO dbo.Persons VALUES (11,'Allan', 'Meurer', 'Humaitá', 'Tubarão');
UPDATE dbo.Persons SET LastName = 'Hugo' WHERE PersonID = 6;


SELECT * FROM dbo.Persons p 


CREATE TABLE dbo.Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),    
    PRIMARY KEY (PersonID)
);
