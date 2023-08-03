--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-tsa-select.sql

--Student ID: 33719047
--Student Name: Venkata Shankara Sai Advait Manduva
--Unit Code: FIT9132
--Applied Class No:

/* Comments for your marker:

  


*/

/*2(a)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT point_of_interest.town_id as "TOWN_ID"
,town_name AS "TOWN_NAME"
,point_of_interest.poi_type_id AS "POI_TYPE_ID"
,poi_type_descr AS "POI_TYPE_DESCR"
,count(0) as "POI_COUNT"
FROM tsa.point_of_interest 
Join tsa.poi_type
on tsa.point_of_interest.poi_type_id=tsa.poi_type.poi_type_id
Join tsa.town 
on tsa.point_of_interest.town_id=tsa.town.town_id
where tsa.point_of_interest.town_id in (SELECT town_id as "poi_count" from tsa.point_of_interest 
group by town_id having count(poi_id)>1)
group by point_of_interest.town_id,town_name,point_of_interest.poi_type_id,poi_type_descr
ORDER BY point_of_interest.town_id,poi_type_descr;


/*2(b)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer



select m2.member_id as "MEMBER_ID"
, m2.member_gname || m2.member_fname as "MEMBER_NAME"
, m2.resort_id as "RESORT_ID"
, r1.resort_name as "RESORT_NAME"
, count(m1.member_id) as "NUMBER_OF_RECOMMENDATIONS"
from tsa.member m1
Join tsa.member m2
on m1.member_id_recby=m2.member_id
Join tsa.resort r1
on m2.resort_id=r1.resort_id
where m1.member_id_recby is not null
group by m2.member_id, m2.member_gname || m2.member_fname, m2.resort_id, r1.resort_name
having count(m1.member_id)=(select max(count(tsa.member.member_id)) from tsa.member
where tsa.member.member_id_recby is not null
group by tsa.member.member_id_recby)
order by RESORT_ID,MEMBER_ID;


/*2(c)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

select tsa.point_of_interest.poi_id AS "POI_ID"
,tsa.point_of_interest.poi_name AS "POI_NAME"
,case (max(NVL(tsa.review.review_rating,0))) when 0 then 'NR' else to_char(max(NVL(tsa.review.review_rating,0))) end AS "MAX_RATING"
,case (min(NVL(tsa.review.review_rating,0))) when 0 then 'NR' else to_char(min(NVL(tsa.review.review_rating,9))) end AS "MIN_RATING"
,case (avg(NVL(tsa.review.review_rating,0))) when 0 then 'NR' else to_char(round(avg(NVL(tsa.review.review_rating,0)),1)) end AS "AVG_RATING"
from tsa.point_of_interest
left Join tsa.review
on tsa.point_of_interest.poi_id=tsa.review.poi_id
group by tsa.point_of_interest.poi_id,tsa.point_of_interest.poi_name
order by tsa.point_of_interest.poi_id;

/*2(d)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

select tsa.point_of_interest.poi_name AS "POI_NAME"
,tsa.poi_type.poi_type_descr AS "POI_TYPE_DESCR"
,tsa.town.town_name AS "TOWN_NAME"
,lpad(to_char('Lat: '||tsa.town.town_lat || ' Long: ' || tsa.town.town_long),35,' ') AS "TOWN_LOCATION"
,NVL(count(tsa.review.review_rating),0) AS "REVIEWS_COMPLETED"
,case (sum(NVL(tsa.review.review_rating,0))/(select sum(tsa.review.review_rating) from tsa.review))*100
when 0 then 'No reviews completed'
else to_char(round((sum(NVL(tsa.review.review_rating,0))/(select sum(tsa.review.review_rating) from tsa.review))*100,2)||'%')
end AS "PERCENT OF REVIEWS"
from tsa.point_of_interest 
left join tsa.review
on tsa.point_of_interest.poi_id=tsa.review.poi_id
inner join tsa.town 
on tsa.point_of_interest.town_id=tsa.town.town_id
inner join tsa.poi_type
on tsa.point_of_interest.poi_type_id=tsa.poi_type.poi_type_id
group by tsa.point_of_interest.poi_name, tsa.poi_type.poi_type_descr,tsa.town.town_name, lpad(to_char('Lat: '||tsa.town.town_lat || ' Long: ' || tsa.town.town_long),35,' ')
order by tsa.town.town_name, Reviews_Completed desc, POI_NAME;


/*2(e)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

select m1.resort_id AS "RESORT_ID"
,tsa.resort.resort_name AS "RESORT_NAME"
,m1.member_no AS "MEMBER_NO"
,(m1.member_gname || ' '|| m1.member_fname) AS "MEMBER_NAME"
,to_char(m1.member_date_joined, 'dd-Mon-yyyy') AS "DATE_JOINED"
,rec.member_no||' '||rec.member_gname||' ' || rec.member_fname AS "RECOMMENDED_BY_DETAILS" 
,lpad('$'||round(sum(mc_total),0),13,' ') AS "TOTAL_CHARGES"
from (select * from tsa.member where member_id_recby is not null) m1
join tsa.resort
on m1.resort_id=tsa.resort.resort_id
Join tsa.member_charge
on m1.member_id=tsa.member_charge.member_id
Join (select town_id from tsa.town where upper(town_name) != upper('Byron Bay')) t_town
on tsa.resort.town_id=t_town.town_id
Join tsa.member rec
on m1.member_id_recby=rec.member_id
where tsa.member_charge.mc_total < (
    select avg(mc_total) from tsa.member m2 Join tsa.member_charge
    on m2.member_id=tsa.member_charge.member_id
    where m2.resort_id=m1.resort_id
)
group by m1.resort_id,tsa.resort.resort_name,m1.member_no,(m1.member_gname || ' '|| m1.member_fname)
,to_char(m1.member_date_joined, 'dd-Mon-yyyy')
,rec.member_no||' '||rec.member_gname||' ' || rec.member_fname
order by m1.resort_id, m1.member_no;

/*2(f)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

select  poi.resort_id AS "RESORT_ID"
,tsa.resort.resort_name AS "RESORT_NAME"
,poi.poi_name AS "POI_NAME"
,poi.poi_street_address AS "POI_STREET_ADDRESS"
,town1.town_name AS "POI_TOWN"
,town1.town_state AS "POI_STATE"
--,case poi.poi_open_time when null then 'Not Applicable' else to_char(poi.poi_open_time) end AS "POI_OPENING_TIME"
,NVL(to_char(poi.poi_open_time),'Not Applicable') AS "POI_OPENING_TIME"
,to_char(geodistance(town1.town_lat,town1.town_long,town2.town_lat,town2.town_long),'990.0') || ' Kms' AS "DISTANCE" 
from
(select tsa.resort.resort_id, tsa.point_of_interest.poi_name,tsa.point_of_interest.poi_street_address, tsa.point_of_interest.poi_open_time, tsa.point_of_interest.town_id
from tsa.point_of_interest,tsa.resort) poi
Join tsa.town town1
on poi.town_id=town1.town_id
Join tsa.resort
on tsa.resort.resort_id=poi.resort_id
Join tsa.town town2
on tsa.resort.town_id=town2.town_id
where geodistance(town1.town_lat,town1.town_long,town2.town_lat,town2.town_long)<=100
order by RESORT_NAME,DISTANCE;