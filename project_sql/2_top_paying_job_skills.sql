/*
 Question: What are the skills of the top paying jobs?
 - we use the first query of the top paying jobs
 - find the skills associated with the top paying jobs
 
 */
WITH top_paying_jobs AS (
    SELECT job_fact.job_id,
        job_fact.job_title,
        job_fact.salary_year_avg,
        company.name AS company_name
    FROM job_postings_fact AS job_fact
        LEFT JOIN company_dim AS company ON job_fact.company_id = company.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_fact.job_location = 'Anywhere'
        AND job_fact.salary_year_avg IS NOT NULL
    ORDER BY job_fact.salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_jobs.*,
    skills
FROM top_paying_jobs
    INNER JOIN skills_job_dim AS skills_jd ON top_paying_jobs.job_id = skills_jd.job_id
    INNER JOIN skills_dim AS skills_d ON skills_jd.skill_id = skills_d.skill_id
ORDER BY top_paying_jobs.salary_year_avg DESC