/*
 Question: What are the most in-demand skills for data analyst?
 - identify the top 5 skills for data analyst
 - focus on all job postings
 - why? highlight the highest demand for data analyst position
 
 
 */
SELECT skills,
    COUNT(skills_jd.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim AS skills_jd ON job_postings_fact.job_id = skills_jd.job_id
    INNER JOIN skills_dim AS skills_d ON skills_jd.skill_id = skills_d.skill_id
WHERE job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
GROUP BY skills_d.skills
ORDER BY demand_count DESC
LIMIT 5;