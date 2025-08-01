<<<<<<< HEAD
WITH skills_demand AS(
 SELECT 
    skills_dim.skill_id,
    skills,
    COUNT (skills_job_dim.job_id) AS demand_count
 FROM job_postings_fact
 INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
 INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
 WHERE
 job_title_short='Data Analyst' AND
 salary_year_avg IS NOT NULL AND
 job_work_from_home = TRUE

  GROUP BY
    skills_dim.skill_id
 limit 25
), average_salary AS (
 SELECT 
    skills_job_dim.skill_id,
    ROUND(AVG(salary_year_avg),0) AS average_salary
 FROM job_postings_fact
 INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
 INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
 WHERE
 job_title_short='Data Analyst' AND
 salary_year_avg IS NOT NULL AND
 job_work_from_home = TRUE

GROUP BY
    skills_job_dim.skill_id
 limit 25
)
SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    average_salary.average_salary
FROM skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE 
    demand_count > 10
ORDER BY
    average_salary DESC,
    demand_count DESC
    
LIMIT 10;

=======
WITH skills_demand AS(
 SELECT 
    skills_dim.skill_id,
    skills,
    COUNT (skills_job_dim.job_id) AS demand_count
 FROM job_postings_fact
 INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
 INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
 WHERE
 job_title_short='Data Analyst' AND
 salary_year_avg IS NOT NULL AND
 job_work_from_home = TRUE

  GROUP BY
    skills_dim.skill_id
 limit 25
), average_salary AS (
 SELECT 
    skills_job_dim.skill_id,
    ROUND(AVG(salary_year_avg),0) AS average_salary
 FROM job_postings_fact
 INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
 INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
 WHERE
 job_title_short='Data Analyst' AND
 salary_year_avg IS NOT NULL AND
 job_work_from_home = TRUE

GROUP BY
    skills_job_dim.skill_id
 limit 25
)
SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    average_salary.average_salary
FROM skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE 
    demand_count > 10
ORDER BY
    average_salary DESC,
    demand_count DESC
    
LIMIT 10;

>>>>>>> 70c889d21951f5c515b8313fd861c41bb58a775d
   