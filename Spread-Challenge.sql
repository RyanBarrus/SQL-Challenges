/***************************************************************************
Objective:
Create a procedure called dbo.SpreadChallenge that produces the expected results given the various inputs.

Description:
A table dbo.Challenge has two columns: ID & Val. 
Different values are inserted into dbo.Challenge for each test case.
Create a procedure called dbo.SpreadChallenge that sorts and spreads the values across columns for each ID.
The first returned column name is ID, and the column should contain the IDS in ascending order.
The remaining returned column names should be integers 1-n representing the sort order of each value within its ID.
IDs that have fewer values should have NULL in columns with sort order beyond the number of values in the ID.
***************************************************************************/


/***************************************************************************
Setup for the table that holds the inputs
***************************************************************************/

CREATE TABLE dbo.Challenge (
[ID] INT,
[Val] VARCHAR(3),
PRIMARY KEY ([ID],[Val])
)


/***************************************************************************
Test 1
***************************************************************************/
INSERT INTO dbo.Challenge VALUES
(1,'a'),
(1,'b'),
(2,'a')

EXEC dbo.SpreadChallenge

TRUNCATE TABLE dbo.Challenge
/***************************************************************************
Expected Result:

ID		1		2
1		a		b
2		a		NULL

***************************************************************************/


/***************************************************************************
Test 2
***************************************************************************/
INSERT INTO dbo.Challenge VALUES
(1,'b'),
(1,'a'),
(1,'c'),
(2,'d'),
(2,'e'),
(3,'f')

EXEC dbo.SpreadChallenge

TRUNCATE TABLE dbo.Challenge
/***************************************************************************
Expected Result:

ID		1		2		3
1		a		b		c
2		d		e		NULL
3		f		NULL	NULL

***************************************************************************/


/***************************************************************************
Test 3
***************************************************************************/
INSERT INTO dbo.Challenge VALUES
(1,'a'),
(2,'a'),
(3,'a'),
(3,'d'),
(4,'a'),
(5,'d'),
(5,'e'),
(5,'f'),
(5,'a'),
(5,'b'),
(5,'c')

EXEC dbo.SpreadChallenge

TRUNCATE TABLE dbo.Challenge
/***************************************************************************
Expected Result:

ID	1	2		3		4		5		6
1	a	NULL	NULL	NULL	NULL	NULL
2	a	NULL	NULL	NULL	NULL	NULL
3	a	d		NULL	NULL	NULL	NULL
4	a	NULL	NULL	NULL	NULL	NULL
5	a	b		c		d		e		f

***************************************************************************/


/***************************************************************************
End Challenge
***************************************************************************/

