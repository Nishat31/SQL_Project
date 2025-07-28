<<<<<<< HEAD
 SELECT 
    skills,
    COUNT (skills_job_dim.job_id) AS demand_count
 FROM job_postings_fact
 INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
 INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
 WHERE
 job_title_short='Data Analyst' AND
 job_country LIKE '%Bangladesh%'

  GROUP BY
    skills
ORDER BY 
    demand_count DESC
=======
 SELECT 
    skills,
    COUNT (skills_job_dim.job_id) AS demand_count
 FROM job_postings_fact
 INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
 INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
 WHERE
 job_title_short='Data Analyst' AND
 job_country LIKE '%Bangladesh%'

  GROUP BY
    skills
ORDER BY 
    demand_count DESC
>>>>>>> 70c889d21951f5c515b8313fd861c41bb58a775d
 limit 5;