--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-tsa-alter.sql

--Student ID: 33719047
--Student Name: Venkata Shankara Sai Advait Manduva
--Unit Code: FIT9132
--Applied Class No:

/* Comments for your marker:




*/

--4(a)
DROP TABLE cabin_bookings;

CREATE TABLE cabin_bookings (
    resort_id        NUMERIC(4),
    cabin_no         NUMERIC(3),
    cabin_nobookings NUMERIC(3)
);

INSERT INTO cabin_bookings (
    resort_id,
    cabin_no,
    cabin_nobookings
)
    SELECT
        cabin.resort_id,
        cabin.cabin_no,
        nvl(b.booking_cnt, 0) cabin_nobookings
    FROM
        cabin
        LEFT JOIN (
            SELECT
                resort_id,
                cabin_no,
                COUNT(0) booking_cnt
            FROM
                booking
            GROUP BY
                resort_id,
                cabin_no
        ) b
        ON b.resort_id = cabin.resort_id
           AND b.cabin_no = cabin.cabin_no;

DESC CABIN_BOOKINGS;

SELECT
    *
FROM
    cabin_bookings;

--4(b)

--Create staff_role table
DROP TABLE staff_role CASCADE CONSTRAINT PURGE;

CREATE TABLE staff_role(
    role_id CHAR(1),
    role_name VARCHAR(20),
    job_description VARCHAR(100)
);

COMMENT ON COLUMN staff_role.role_id IS 
    'Role Identifier';

COMMENT ON COLUMN staff_role.role_name IS 
    'Role Name';

COMMENT ON COLUMN staff_role.job_description IS 
    'Role Description';

ALTER TABLE staff_role ADD CONSTRAINT staff_role_pk
PRIMARY KEY (role_id);

ALTER TABLE staff_role ADD CONSTRAINT staff_role_uq UNIQUE (role_id, role_name);

INSERT INTO staff_role VALUES(
    'A',
    'Admin',
    'Take bookings, and reply to customer inquiries'
);

INSERT INTO staff_role VALUES(
    'C',
    'Cleaning',
    'Clean cabins and maintain resorts public areas'
);

INSERT INTO staff_role VALUES(
    'M',
    'Marketing',
    'Prepare and present marketing ideas and deliverables'
);

--Add role_id column to staff table

ALTER TABLE staff ADD role_id CHAR(1);

COMMENT ON COLUMN staff.role_id IS 
    'Role Identifier of the staff';

ALTER TABLE staff 
    ADD CONSTRAINT staff_role_staff_fk FOREIGN KEY (role_id)
    REFERENCES staff_role(role_id);

UPDATE staff
SET role_id='A';

DESC staff_role;
DESC staff;
select * FROM staff_role;
SELECT * FROM staff;

--4(c)
DROP TABLE cabin_cleaning CASCADE CONSTRAINT PURGE;

CREATE TABLE cabin_cleaning(
    cleaning_id NUMERIC(8),
    resort_id NUMERIC(4),
    cabin_no NUMERIC(3),
    cleaning_date DATE,
    cleaning_start_time TIMESTAMP,
    cleaning_end_time TIMESTAMP,
    staff_id NUMERIC(5)
);
COMMENT ON COLUMN cabin_cleaning.cleaning_id IS
    'Cabin cleaning identifier';

COMMENT ON COLUMN cabin_cleaning.resort_id IS
    'Resort identifier';

COMMENT ON COLUMN cabin_cleaning.cabin_no IS
    'Cabin number within the Resort';

COMMENT ON COLUMN cabin_cleaning.cleaning_date IS
    'Cabin cleaning date';

COMMENT ON COLUMN cabin_cleaning.cleaning_start_time IS
    'Cabin cleaning start time on that day';

COMMENT ON COLUMN cabin_cleaning.cleaning_end_time IS
    'Cabin cleaning end time on that day';

COMMENT ON COLUMN cabin_cleaning.staff_id IS
    'staff identifier';

ALTER TABLE cabin_cleaning ADD CONSTRAINT cabin_cleaning_pk PRIMARY KEY ( cleaning_id
);

ALTER TABLE cabin_cleaning
    ADD CONSTRAINT cabin_cleaning_uq UNIQUE ( cleaning_id,
                                              resort_id,
                                              cabin_no,
                                              cleaning_date );

ALTER TABLE cabin_cleaning
    ADD CONSTRAINT cabin_cabin_cleaning_fk FOREIGN KEY ( resort_id,
                                                         cabin_no )
        REFERENCES cabin ( resort_id,
                           cabin_no );

ALTER TABLE cabin_cleaning
    ADD CONSTRAINT staff_cabin_cleaning_fk FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id );

DESC cabin_cleaning;
