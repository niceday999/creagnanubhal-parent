#clear all data before hand
DELETE FROM booking_has_room;

DELETE FROM room;

DELETE FROM booking;

DELETE FROM customer;

DELETE FROM address;

COMMIT;


#mock room data

INSERT INTO room(id, name, rate)
     VALUES (1, 'moss', '100');

INSERT INTO room(id, name, rate)
     VALUES (2, 'heather', '150');

INSERT INTO room(id, name, rate)
     VALUES (3, 'blackwatch', '200');

INSERT INTO room(id, name, rate)
     VALUES (4, 'tartan', '250');

COMMIT;
#mock address data

INSERT INTO address(id,
                    line_1,
                    county_province,
                    city,
                    zip_or_postcode,
                    country)
     VALUES (1,
             '1 john smith place',
             'test',
             'Glasgow',
             'G12 1QW',
             'uk');

INSERT INTO address(id,
                    line_1,
                    county_province,
                    city,
                    zip_or_postcode,
                    country)
     VALUES (2,
             '1 jane smith place',
             'test',
             'Glasgow',
             'G12 1QW',
             'uk');

INSERT INTO address(id,
                    line_1,
                    county_province,
                    city,
                    zip_or_postcode,
                    country)
     VALUES (3,
             '1 john doe place',
             'test',
             'Glasgow',
             'G12 1QW',
             'uk');

INSERT INTO address(id,
                    line_1,
                    county_province,
                    city,
                    zip_or_postcode,
                    country)
     VALUES (4,
             '1 jane doe place',
             'test',
             'Glasgow',
             'G12 1QW',
             'uk');

COMMIT;
#mock customer data

INSERT INTO customer(firstname,
                     lastname,
                     email,
                     phone,
                     id,
                     address_id)
     VALUES ('John',
             'Smith',
             'john@smith.com',
             '123456789',
             1,
             1);

INSERT INTO customer(firstname,
                     lastname,
                     email,
                     phone,
                     id,
                     address_id)
     VALUES ('Jane',
             'Smith',
             'jane@smith.com',
             '123456789',
             2,
             2);

INSERT INTO customer(firstname,
                     lastname,
                     email,
                     phone,
                     id,
                     address_id)
     VALUES ('John',
             'Doe',
             'johnt@doe.com',
             '123456789',
             3,
             3);

INSERT INTO customer(firstname,
                     lastname,
                     email,
                     phone,
                     id,
                     address_id)
     VALUES ('Jane',
             'Doe',
             'jane@doe.com',
             '123456789',
             4,
             4);

COMMIT;
#mock booking data

INSERT INTO booking(customer_id,
                    end_date,
                    id,
                    notes,
                    start_date)
     VALUES (1,
             NOW() + INTERVAL 19 DAY,
             1,
             '',
             NOW() + INTERVAL 1 DAY);

INSERT INTO booking(customer_id,
                    end_date,
                    id,
                    notes,
                    start_date)
     VALUES (2,
             NOW() + INTERVAL 10 DAY,
             2,
             '',
             NOW() + INTERVAL 5 DAY);

INSERT INTO booking(customer_id,
                    end_date,
                    id,
                    notes,
                    start_date)
     VALUES (3,
             NOW() + INTERVAL 8 DAY,
             3,
             '',
             NOW() + INTERVAL 1 DAY);

INSERT INTO booking(customer_id,
                    end_date,
                    id,
                    notes,
                    start_date)
     VALUES (4,
             NOW() + INTERVAL 19 DAY,
             4,
             '',
             NOW() + INTERVAL 5 DAY);

COMMIT;

INSERT INTO booking_has_room(booking_id, room_id)
     VALUES (1, 4);

INSERT INTO booking_has_room(booking_id, room_id)
     VALUES (2, 3);

INSERT INTO booking_has_room(booking_id, room_id)
     VALUES (3, 2);

INSERT INTO booking_has_room(booking_id, room_id)
     VALUES (4, 1);

COMMIT;