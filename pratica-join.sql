-- Exercício 01
SELECT
  users.id,
  users.name,
  cities.name AS cities
FROM
  public.users
  JOIN public.cities ON users."cityId" = cities.id;

-- Exercício 02
SELECT
  testimonials.id,
  writers.name AS writer,
  recipients.name AS recipient,
  testimonials.message
FROM
  public.testimonials
  JOIN public.users AS writers ON writers.id = testimonials."writerId"
  JOIN public.users AS recipients ON recipients.id = testimonials."recipientId";

-- Exercício 03 
SELECT
  users.id,
  users.name,
  courses.name AS course,
  schools.name AS school,
  educations."endDate"
FROM
  public.educations
  JOIN public.users ON users.id = educations."userId"
  JOIN public.courses ON courses.id = educations."courseId"
  JOIN public.schools ON schools.id = educations."schoolId"
WHERE
  users.id = 30
  AND educations.status ILIKE 'finished';

-- Exercício 04
SELECT
  users.id,
  users.name AS name,
  roles.name AS role,
  companies.name AS company,
  experiences."startDate"
FROM
  public.experiences
  JOIN public.users ON users.id = experiences."userId"
  JOIN public.roles ON roles.id = experiences."roleId"
  JOIN public.companies ON companies.id = experiences."companyId"
WHERE
  users.id = 50
  AND experiences."endDate" IS NULL;

--Bônus
SELECT
  schools.id,
  schools.name,
  courses.name AS course,
  companies.name AS company,
  roles.name AS role
FROM
  public.applicants
  JOIN public.users ON users.id = applicants."userId"
  JOIN public.jobs ON jobs.id = applicants."jobId"
  JOIN public.roles ON roles.id = jobs."roleId"
  JOIN public.companies ON companies.id = jobs."companyId"
  JOIN public.educations ON educations."userId" = users.id
  JOIN public.courses ON courses.id = educations."courseId"
  JOIN public.schools ON schools.id = educations."schoolId"
WHERE
  roles.name ILIKE 'Software Engineer'
  AND companies.id = 10
  AND jobs.active = TRUE;