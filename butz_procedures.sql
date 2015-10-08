drop procedure payroll;

DELIMITER //
	CREATE procedure payroll (id int)
		SQL security invoker

	BEGIN

		declare payment decimal(10,2);
		declare empType ENUM('employee_sales', 'employee_billable', 'employee');
		declare empCommissionRevenue decimal(10,2);

		SELECT salary into payment 
		FROM Employee
		WHERE emp_id = id;
		
		SELECT emp_type into empType 
		FROM Employee
		WHERE emp_id = id;

		IF empType = 'employee_sales' then
			SELECT commission * revenue / 100 into empCommissionRevenue
			FROM SalesEmployee
			WHERE emp_id = id;
			
			SET payment := payment + empCommissionRevenue;
		END IF;

		SELECT emp_id as 'Employee ID', 
					 concat(f_name, ' ', l_name) as 'Employee Name', 
	         payment as 'Annual Salary',
	         empType as 'Employee Type' 
		FROM Employee 
		WHERE emp_id = id;

	END //
DELIMITER ;

-- TODO

DELIMITER //

	CREATE procedure payrolls ()
		SQL security invoker
	BEGIN

		declare counter int;
		SET @inc := 0;
		
		SELECT count(*) into counter 
		FROM Employee;

		payroll: loop
		
		-- IF empType = 'employee_sales' then
		-- 	SELECT commission * revenue / 100 into empCommissionRevenue
		-- 	FROM SalesEmployee
		-- 	WHERE emp_id = id;
			
		-- 	SET payment := payment + empCommissionRevenue;
		-- END IF;

		-- SELECT emp_id as 'Employee ID', concat(f_name, ' ', l_name) as 'Employee Name', 
	 --           payment as 'Annual Salary', empType as 'Employee Type' 
		-- FROM Employee 
		-- WHERE emp_id = id;
		
	END //
DELIMITER ;





