--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-tsa-dm.sql

--Student ID: 33719047
--Student Name: Venkata Shankara Sai Advait Manduva
--Unit Code: FIT9132
--Applied Class No:

/* Comments for your marker:




*/

---**This command shows the outputs of triggers**---
---**Run the command before running the insert statements.**---
---**Do not remove**---
SET SERVEROUTPUT ON
---**end**---

--3(a)
DROP SEQUENCE booking_seq;

CREATE SEQUENCE booking_seq START WITH 100 INCREMENT BY 10;

--3(b)
INSERT INTO cabin VALUES (
    4,
    4,
    4,
    10,
    'I',
    220,
    'Awesome Resort Cabin4'
);

--3(c)
INSERT INTO booking VALUES (
    booking_seq.NEXTVAL,
    4,
    4,
    TO_DATE('26/05/2023', 'DD/MM/YYYY'),
    TO_DATE('28/05/2023', 'DD/MM/YYYY'),
    4,
    4,
    440,
    18,
    8
);

--3(d)
UPDATE booking
SET
    booking_to = TO_DATE('29/05/2023', 'DD/MM/YYYY'),
    booking_total_points_cost = 660
WHERE
        resort_id = 4
    AND cabin_no = 4
    AND booking_from = TO_DATE('26/05/2023', 'DD/MM/YYYY');

--3(e)
DELETE FROM booking
WHERE
        resort_id = 4
    AND cabin_no = 4;

DELETE FROM cabin
WHERE
        resort_id = 4
    AND cabin_no = 4;