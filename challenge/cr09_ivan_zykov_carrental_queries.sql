--1. How much each reservation costs?
SELECT reservations.reservatioin_id, reservations.res_date, datediff(reservations.finish_date, reservations.start_date) * cars.price_day AS 'Total costs'
FROM reservations
INNER JOIN cars
	ON reservations.fk_car_id = cars.car_id

--2. Show all cars and all their charecteristics
SELECT cars.car_id, car_brands.name AS 'Brand', car_models.name AS 'Model', cars.car_year, cars.color, car_models.transmission, car_models.clima, cars.price_day
FROM cars
INNER JOIN car_models
	ON cars.fk_car_model_id = car_models.car_model_id
INNER JOIN car_brands
	ON car_models.fk_car_brand_id = car_brands.car_brand_id

--3. Show locations, address and corresponding employees
SELECT locations.name, locations.street, locations.house_number, locations.zip_code, locations.city, employees.first_name, employees.last_name
FROM locations
INNER JOIN employees
	ON locations.fk_employee_id = employees.employee_id

--4. Show cars taken and not returned
SELECT reservations.reservatioin_id, cars.car_id, cars.color, car_models.name, drivers.first_name, drivers.last_name
FROM cars
INNER JOIN car_models
	ON cars.fk_car_model_id = car_models.car_model_id
INNER JOIN reservations
	ON reservations.fk_car_id = cars.car_id
INNER JOIN car_register AS cr1
	ON	reservations.reservatioin_id = cr1.fk_reservation_id
INNER JOIN drivers
	ON reservations.fk_driver_id = drivers.driver_id
WHERE cr1.return_tag = 0
	AND NOT EXISTS (SELECT car_register.return_tag
               		FROM car_register              
               		WHERE car_register.return_tag = 1
                		AND car_register.fk_reservation_id = cr1.fk_reservation_id)
ORDER BY reservations.reservatioin_id;

--5. Show drivers who caused additional costs
SELECT drivers.first_name, drivers.last_name
FROM drivers
INNER JOIN reservations
	ON drivers.driver_id = reservations.fk_driver_id
INNER JOIN car_register
	ON reservations.reservatioin_id = car_register.fk_reservation_id
INNER JOIN return_checks AS rc1
	ON car_register.car_register_id = rc1.fk_car_register_id
WHERE EXISTS (SELECT fk_return_check_id
              FROM additional_charges_lists
              WHERE additional_charges_lists.fk_return_check_id = rc1.return_check_id)