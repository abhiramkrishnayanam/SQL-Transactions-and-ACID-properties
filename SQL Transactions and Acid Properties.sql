#1. Transaction Management with the Teachers Table
/*A transaction ensures that a group of SQL commands are executed together, either all succeeding or all failing, ensuring data integrity. For example, 
let’s say we want to transfer a salary amount from one teacher to another, ensuring that the total amount deducted from one teacher is added to another.*/
use challenge;
-- Start a transaction
START TRANSACTION;

-- Deduct salary from Teacher 1
UPDATE teachers
SET salary = salary - 5000
WHERE name = 'John Doe';

-- Add salary to Teacher 2
UPDATE teachers
SET salary = salary + 5000
WHERE name = 'Jane Smith';

-- If both updates are successful, commit the transaction
COMMIT;
-- If any issue arises (e.g., one teacher doesn't exist), rollback the transaction
-- ROLLBACK;
-- Example scenario: Atomic transaction for salary transfer

/*If the salary transfer process fails after deducting the salary from "John Doe" but before adding it to "Jane Smith," both operations 
will be rolled back, ensuring no partial updates to the database.*/

START TRANSACTION;
UPDATE teachers
SET salary = salary - 5000
WHERE name = 'John Doe';

-- Simulate failure after the first update
-- The next update won't execute unless the first one succeeds
UPDATE teachers
SET salary = salary + 5000
WHERE name = 'Jane Smith';

-- Rollback if any update fails
ROLLBACK;
