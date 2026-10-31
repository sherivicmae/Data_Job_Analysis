/*
 -- Question : What are the top paying data analyst jobs? 
 - Identify the top 10 highest paying Data Analyst roles that are remote (wfh)
 - focus on the job postings with specified salaries (no nulls)
 - why? highlight the top-paying opportunities for data analyst, employment.
 */
SELECT job_fact.job_id,
    job_fact.job_title,
    job_fact.job_location,
    job_fact.job_schedule_type,
    job_fact.salary_year_avg,
    job_fact.job_posted_date,
    company.name AS company_name
FROM job_postings_fact AS job_fact
    LEFT JOIN company_dim AS company ON job_fact.company_id = company.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_fact.job_location = 'Anywhere'
    AND job_fact.salary_year_avg IS NOT NULL
ORDER BY job_fact.salary_year_avg DESC
LIMIT 10;