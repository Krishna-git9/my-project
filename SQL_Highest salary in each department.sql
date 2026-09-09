SELECT *
FROM (
    SELECT employee_id,
           employee_name,
           department,
           salary,
           RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS rnk
    FROM employees
) t
WHERE rnk = 1;

