DELETE FROM employees
WHERE employee_id IN (
    SELECT employee_id
    FROM (
        SELECT employee_id,
               ROW_NUMBER() OVER (
                   PARTITION BY employee_name, department, salary
                   ORDER BY employee_id
               ) AS rn
        FROM employees
    ) t
    WHERE rn > 1
);