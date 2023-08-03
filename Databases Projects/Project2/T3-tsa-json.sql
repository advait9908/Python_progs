--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-tsa-json.sql

--Student ID: 33719047
--Student Name: Venkata Shankara Sai Advait Manduva
--Unit Code: FIT9132
--Applied Class No:

/* Comments for your marker:

 


*/

/*3(a)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

select json_object(
    '_id' VALUE town_id,
    'name' VALUE (t.town_name||', '||t.town_state),
    'location' VALUE JSON_OBJECT(
        'latitude' VALUE t.town_lat,
        'longitude' VALUE t.town_long
    ),
    'avg_temperature' VALUE JSON_OBJECT(
        'summer' VALUE t.town_avg_summer_temp,
        'winter' VALUE t.town_avg_winter_temp
    ),
    'no_of_resorts' VALUE count(0),
    'resorts' VALUE JSON_ARRAYAGG(
        json_object(
            'id' VALUE resort_id,
            'name' VALUE r.resort_name,
            'address' VALUE r.resort_street_address,
            'phone' VALUE r.resort_phone,
            'year_built' VALUE extract(year from r.resort_yr_built_purch),
            'company_name' VALUE c.company_name
    ) )FORMAT JSON) ||','
from tsa.town t NATURAL JOIN tsa.resort r
NATURAL JOIN tsa.company c
group by 
    town_id, 
    t.town_name, 
    t.town_state, 
    t.town_lat, 
    t.town_long, 
    t.town_avg_summer_temp, 
    t.town_avg_winter_temp  
order by town_id;

