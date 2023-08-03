/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-tsa-insert.sql

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

--------------------------------------
--INSERT INTO cabin
--------------------------------------
INSERT INTO cabin VALUES (
    1,
    1,
    1,
    2,
    'C',
    200,
    'Byron Bay Cabin1'
);

INSERT INTO cabin VALUES (
    2,
    1,
    4,
    4,
    'I',
    150,
    'Amazing Resort Cabin1'
);

INSERT INTO cabin VALUES (
    3,
    1,
    2,
    4,
    'I',
    200,
    'Alice Springs Cabin1'
);

INSERT INTO cabin VALUES (
    3,
    2,
    3,
    6,
    'C',
    250,
    'Alice Springs Cabin2'
);

INSERT INTO cabin VALUES (
    3,
    3,
    1,
    1,
    'I',
    500,
    'Alice Springs Cabin3'
);

INSERT INTO cabin VALUES (
    4,
    1,
    4,
    8,
    'I',
    1000,
    'Awsome Resort Cabin1'
);

INSERT INTO cabin VALUES (
    4,
    2,
    1,
    1,
    'I',
    100,
    'Awsome Resort Cabin2'
);

INSERT INTO cabin VALUES (
    5,
    1,
    1,
    2,
    'C',
    500,
    'Byron Super Cabin1'
);

INSERT INTO cabin VALUES (
    5,
    2,
    2,
    4,
    'I',
    200,
    'Byron Super Cabin2'
);

INSERT INTO cabin VALUES (
    5,
    3,
    2,
    2,
    'I',
    100,
    'Byron Super Cabin3'
);

INSERT INTO cabin VALUES (
    6,
    1,
    1,
    2,
    'C',
    500,
    'Gympie Luxury Cabin1'
);

INSERT INTO cabin VALUES (
    6,
    2,
    2,
    4,
    'I',
    200,
    'Gympie Luxury Cabin2'
);

INSERT INTO cabin VALUES (
    6,
    3,
    1,
    1,
    'I',
    500,
    'Gympie Luxury Cabin3'
);

INSERT INTO cabin VALUES (
    7,
    1,
    1,
    2,
    'C',
    500,
    'Taree Exclusive Cabin1'
);

INSERT INTO cabin VALUES (
    7,
    2,
    1,
    1,
    'I',
    1000,
    'Taree Exclusive Cabin2'
);

INSERT INTO cabin VALUES (
    7,
    3,
    2,
    4,
    'I',
    300,
    'Taree Exclusive Cabin3'
);

INSERT INTO cabin VALUES (
    8,
    1,
    2,
    4,
    'C',
    300,
    'King Resort Cabin1'
);

INSERT INTO cabin VALUES (
    8,
    2,
    1,
    1,
    'I',
    200,
    'King Resort Cabin2'
);

INSERT INTO cabin VALUES (
    9,
    1,
    2,
    2,
    'I',
    200,
    'Queen Resort Cabin1'
);

INSERT INTO cabin VALUES (
    9,
    2,
    1,
    2,
    'C',
    100,
    'Queen Resort Cabin2'
);

--------------------------------------
--INSERT INTO booking
--------------------------------------

INSERT INTO booking VALUES (
    1,
    3,
    1,
    TO_DATE('01/03/2023', 'DD/MM/YYYY'),
    TO_DATE('02/03/2023', 'DD/MM/YYYY'),
    2,
    2,
    200,
    10,
    5
);

INSERT INTO booking VALUES (
    2,
    3,
    1,
    TO_DATE('15/03/2023', 'DD/MM/YYYY'),
    TO_DATE('17/03/2023', 'DD/MM/YYYY'),
    4,
    0,
    400,
    14,
    5
);

INSERT INTO booking VALUES (
    3,
    3,
    1,
    TO_DATE('01/04/2023', 'DD/MM/YYYY'),
    TO_DATE('02/04/2023', 'DD/MM/YYYY'),
    4,
    0,
    200,
    14,
    7
);

INSERT INTO booking VALUES (
    4,
    4,
    1,
    TO_DATE('18/03/2023', 'DD/MM/YYYY'),
    TO_DATE('19/03/2023', 'DD/MM/YYYY'),
    4,
    4,
    1000,
    12,
    8
);

INSERT INTO booking VALUES (
    5,
    4,
    2,
    TO_DATE('21/03/2023', 'DD/MM/YYYY'),
    TO_DATE('25/03/2023', 'DD/MM/YYYY'),
    1,
    0,
    400,
    3,
    8
);

INSERT INTO booking VALUES (
    6,
    7,
    2,
    TO_DATE('29/03/2023', 'DD/MM/YYYY'),
    TO_DATE('31/03/2023', 'DD/MM/YYYY'),
    1,
    0,
    2000,
    5,
    14
);

INSERT INTO booking VALUES (
    7,
    7,
    1,
    TO_DATE('30/03/2023', 'DD/MM/YYYY'),
    TO_DATE('31/03/2023', 'DD/MM/YYYY'),
    2,
    0,
    500,
    6,
    13
);

INSERT INTO booking VALUES (
    8,
    9,
    1,
    TO_DATE('01/04/2023', 'DD/MM/YYYY'),
    TO_DATE('02/04/2023', 'DD/MM/YYYY'),
    2,
    0,
    200,
    19,
    17
);

INSERT INTO booking VALUES (
    9,
    9,
    1,
    TO_DATE('15/04/2023', 'DD/MM/YYYY'),
    TO_DATE('17/04/2023', 'DD/MM/YYYY'),
    2,
    0,
    400,
    19,
    17
);

INSERT INTO booking VALUES (
    10,
    9,
    1,
    TO_DATE('29/04/2023', 'DD/MM/YYYY'),
    TO_DATE('30/04/2023', 'DD/MM/YYYY'),
    2,
    0,
    200,
    23,
    17
);

INSERT INTO booking VALUES (
    11,
    5,
    2,
    TO_DATE('20/03/2023', 'DD/MM/YYYY'),
    TO_DATE('23/03/2023', 'DD/MM/YYYY'),
    2,
    2,
    600,
    24,
    10
);

INSERT INTO booking VALUES (
    12,
    5,
    2,
    TO_DATE('20/04/2023', 'DD/MM/YYYY'),
    TO_DATE('21/04/2023', 'DD/MM/YYYY'),
    2,
    2,
    200,
    24,
    10
);

INSERT INTO booking VALUES (
    13,
    5,
    2,
    TO_DATE('01/03/2023', 'DD/MM/YYYY'),
    TO_DATE('02/03/2023', 'DD/MM/YYYY'),
    4,
    0,
    200,
    13,
    10
);

INSERT INTO booking VALUES (
    14,
    8,
    2,
    TO_DATE('10/03/2023', 'DD/MM/YYYY'),
    TO_DATE('12/03/2023', 'DD/MM/YYYY'),
    1,
    0,
    400,
    15,
    16
);

INSERT INTO booking VALUES (
    15,
    8,
    1,
    TO_DATE('10/04/2023', 'DD/MM/YYYY'),
    TO_DATE('12/04/2023', 'DD/MM/YYYY'),
    2,
    2,
    600,
    15,
    16
);

INSERT INTO booking VALUES (
    16,
    6,
    1,
    TO_DATE('05/04/2023', 'DD/MM/YYYY'),
    TO_DATE('07/04/2023', 'DD/MM/YYYY'),
    2,
    0,
    1000,
    20,
    12
);

INSERT INTO booking VALUES (
    17,
    6,
    3,
    TO_DATE('04/03/2023', 'DD/MM/YYYY'),
    TO_DATE('06/03/2023', 'DD/MM/YYYY'),
    1,
    0,
    1000,
    2,
    11
);

INSERT INTO booking VALUES (
    18,
    1,
    1,
    TO_DATE('10/03/2023', 'DD/MM/YYYY'),
    TO_DATE('11/03/2023', 'DD/MM/YYYY'),
    2,
    0,
    200,
    8,
    1
);

INSERT INTO booking VALUES (
    19,
    1,
    1,
    TO_DATE('01/04/2023', 'DD/MM/YYYY'),
    TO_DATE('03/04/2023', 'DD/MM/YYYY'),
    1,
    1,
    400,
    9,
    2
);

INSERT INTO booking VALUES (
    20,
    1,
    1,
    TO_DATE('29/04/2023', 'DD/MM/YYYY'),
    TO_DATE('30/04/2023', 'DD/MM/YYYY'),
    2,
    0,
    200,
    8,
    1
);