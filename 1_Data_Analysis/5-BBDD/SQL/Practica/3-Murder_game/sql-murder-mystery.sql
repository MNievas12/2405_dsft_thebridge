SELECT * 
FROM crime_scene_report LIMIT 10;

SELECT * 
FROM crime_scene_report
WHERE date = 20180115 AND type = 'murder' AND city = 'SQL City';
--The first witness lives at the last house on "Northwestern Dr". 
--The second witness, named Annabel, lives somewhere on "Franklin Ave".

SELECT * FROM person LIMIT 10;


SELECT i.*,
p.name
FROM person p
INNER JOIN interview i ON p.id = i.person_id
WHERE address_number = (SELECT MAX(address_number) FROM person WHERE address_street_name LIKE '%Northwestern Dr%')
AND address_street_name LIKE '%Northwestern Dr%'
-- Morty Schapiro id = 14887
-- He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
SELECT MAX(address_number) FROM person WHERE address_street_name LIKE '%Northwestern Dr%';
SELECT * FROM (SELECT * FROM person WHERE id > 100);


SELECT i.*, p.name
FROM person p
INNER JOIN interview i ON i.person_id = p.id
WHERE name LIKE '%Annabel%' AND address_street_name LIKE '%Franklin Ave%'
-- I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.
-- Annabel Miller id = 16371

SELECT * FROM get_fit_now_member LIMIT 10;

SELECT * 
FROM get_fit_now_member
WHERE id LIKE '48Z%' AND membership_status = 'gold';
-- Joe Germuska id = 28819
-- Jeremy Bowers id = 67318

SELECT m.name,
c.*
FROM get_fit_now_member m
INNER JOIN get_fit_now_check_in c ON m.id = c.membership_id
WHERE id LIKE '48Z%' AND membership_status = 'gold' AND check_in_date = 20180109;


SELECT m.name,
i.*
FROM get_fit_now_member m
INNER JOIN get_fit_now_check_in c ON m.id = c.membership_id
INNER JOIN person p ON p.id = m.person_id
INNER JOIN drivers_license dl ON p.license_id = dl.id
INNER JOIN interview i ON p.id = i.person_id
WHERE m.id LIKE '48Z%' 
AND membership_status = 'gold' 
AND check_in_date = 20180109 
AND dl.plate_number LIKE '%H42W%';

--I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

SELECT person_id,
COUNT(event_id) AS NVeces
FROM facebook_event_checkin
WHERE event_name = 'SQL Symphony Concert' 
AND date BETWEEN 20171201 AND 20171231
GROUP BY 1
HAVING NVeces = 3
;



SELECT person_id,
p.name
FROM facebook_event_checkin f
INNER JOIN person p ON f.person_id = p.id
INNER JOIN drivers_license dl ON p.license_id = dl.id
WHERE event_name = 'SQL Symphony Concert' 
AND dl.car_model LIKE '%Model S%'
AND date BETWEEN 20171201 AND 20171231
GROUP BY 1
HAVING COUNT(event_id) = 3
;
-- Miranda Priestly id = 99716




