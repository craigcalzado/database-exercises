SELECT * FROM numbers2;

SELECT * 
FROM numbers2
WHERE n < 8;

SELECT *
FROM numbers2
WHERE supergroup = 'one';

SELECT
n AS the_original_number,
category,
n * 2 AS n_times_two
FROM numbers2; 

SELECT 'This is so much fun!!!' AS message;
