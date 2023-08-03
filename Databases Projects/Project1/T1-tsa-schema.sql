--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-tsa-schema.sql

--Student ID: 33719047
--Student Name: Venkata Shankara Sai Advait Manduva
--Unit Code: FIT9132
--Applied Class No:

/* Comments for your marker:




*/

-- Task 1 Add Create table statements for the white TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- BOOKING
CREATE TABLE booking (
    booking_id                NUMERIC(8),
    resort_id                 NUMERIC(4),
    cabin_no                  NUMERIC(3),
    booking_from              DATE,
    booking_to                DATE,
    booking_noadults          NUMERIC(2),
    booking_nochildren        NUMERIC(2),
    booking_total_points_cost NUMERIC(4),
    member_id                 NUMERIC(6),
    staff_id                  NUMERIC(5)
);

COMMENT ON COLUMN booking.booking_id IS
    'Surrogate key added replace BOOKING composite PK';

COMMENT ON COLUMN booking.resort_id IS
    '
    Resort Identifier, for this booking';

COMMENT ON COLUMN booking.cabin_no IS
    'Cabin number within the resort, for this booking';

COMMENT ON COLUMN booking.booking_from IS
    'Date booking from';

COMMENT ON COLUMN booking.booking_to IS
    'Date booking to';

COMMENT ON COLUMN booking.booking_noadults IS
    'Booking number of adults';

COMMENT ON COLUMN booking.booking_nochildren IS
    'Booking number of children';

COMMENT ON COLUMN booking.booking_total_points_cost IS
    'Total cost to the member in points for this booking';

COMMENT ON COLUMN booking.member_id IS
    'Unique member id accross TSA for member who made this booking';

COMMENT ON COLUMN booking.staff_id IS
    'Staff identifier of staff member who took this booking';

ALTER TABLE booking ADD CONSTRAINT booking_pk PRIMARY KEY ( booking_id );

ALTER TABLE booking
    ADD CONSTRAINT booking_uq UNIQUE ( booking_id,
                                       resort_id,
                                       cabin_no,
                                       booking_from );

-- CABIN
CREATE TABLE cabin (
    resort_id               NUMERIC(4),
    cabin_no                NUMERIC(3),
    cabin_nobedrooms        NUMERIC(1),
    cabin_sleeping_capacity NUMERIC(2),
    cabin_bathroom_type     CHAR(1),
    cabin_points_cost_day   NUMERIC(4),
    cabin_description       VARCHAR(250)
);

COMMENT ON COLUMN cabin.resort_id IS
    'Resort Identifier';

COMMENT ON COLUMN cabin.cabin_no IS
    'Cabin number within the Resort';

COMMENT ON COLUMN cabin.cabin_nobedrooms IS
    'Number of bedrooms in cabin';

COMMENT ON COLUMN cabin.cabin_sleeping_capacity IS
    'Cabin Sleeping Capacity';

COMMENT ON COLUMN cabin.cabin_bathroom_type IS
    'Type of Cabin Bathroom: I - Inside cabin C - Outside Common';

COMMENT ON COLUMN cabin.cabin_points_cost_day IS
    'Number of member points cabin costs per day';

COMMENT ON COLUMN cabin.cabin_description IS
    'Cabin description';

ALTER TABLE cabin ADD CONSTRAINT cabin_pk PRIMARY KEY ( resort_id,
                                                        cabin_no );




-- Add all missing FK Constraints below here

ALTER TABLE booking
    ADD CONSTRAINT cabin_booking_fk FOREIGN KEY ( resort_id,
                                                  cabin_no )
        REFERENCES cabin ( resort_id,
                           cabin_no );

ALTER TABLE booking
    ADD CONSTRAINT member_booking_fk FOREIGN KEY ( member_id )
        REFERENCES member ( member_id );

ALTER TABLE booking
    ADD CONSTRAINT staff_booking_fk FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id );

ALTER TABLE cabin
    ADD CONSTRAINT resort_cabin_fk FOREIGN KEY ( resort_id )
        REFERENCES resort ( resort_id );

--**Trigger for checking and updating member.member_points for each booking.**--
--**Run this code before attempting Task 2 and Task 3**--
--**DO NOT REMOVE. DO NOT MODIFY**--
CREATE OR REPLACE TRIGGER check_member_points BEFORE
    INSERT OR DELETE OR UPDATE OF booking_total_points_cost ON booking
    FOR EACH ROW
DECLARE
    var_mem_points NUMBER;
BEGIN
    IF inserting THEN
        SELECT
            member_points
        INTO var_mem_points
        FROM
            member
        WHERE
            member_id = :new.member_id;

        IF var_mem_points < :new.booking_total_points_cost THEN
            raise_application_error(-20001, 'Not enough member points for this booking'
            );
        ELSE
            var_mem_points := var_mem_points - :new.booking_total_points_cost;
            UPDATE member
            SET
                member_points = var_mem_points
            WHERE
                member_id = :new.member_id;

        END IF;

        dbms_output.put_line('New booking added for member '
                             || :new.member_id
                             || '. Remaining points for this member: '
                             || var_mem_points);

    END IF;

    IF deleting THEN
        SELECT
            member_points
        INTO var_mem_points
        FROM
            member
        WHERE
            member_id = :old.member_id;

        var_mem_points := var_mem_points + :old.booking_total_points_cost;
        UPDATE member
        SET
            member_points = var_mem_points
        WHERE
            member_id = :old.member_id;

        dbms_output.put_line('Booking '
                             || :old.booking_id
                             || ' for member '
                             || :old.member_id
                             || ' was deleted. Remaining points for this member: '
                             || var_mem_points);

    END IF;

    IF updating THEN
        SELECT
            member_points
        INTO var_mem_points
        FROM
            member
        WHERE
            member_id = :new.member_id;

        var_mem_points := var_mem_points + :old.booking_total_points_cost;
        IF var_mem_points < :new.booking_total_points_cost THEN
            raise_application_error(-20001, 'Not enough member points for this booking'
            );
        ELSE
            var_mem_points := var_mem_points - :new.booking_total_points_cost;
            UPDATE member
            SET
                member_points = var_mem_points
            WHERE
                member_id = :new.member_id;

            dbms_output.put_line('Booking '
                                 || :old.booking_id
                                 || ' for member '
                                 || :new.member_id
                                 || ' was updated. Remaining points for this member: '
                                 || var_mem_points);

        END IF;

    END IF;

END;
/
--**End of trigger**--