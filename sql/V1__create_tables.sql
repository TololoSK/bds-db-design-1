CREATE TABLE contact (
	id_contact ${autoincrement},
	phone_number VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL
);

CREATE TABLE passenger (
	id_passenger ${autoincrement},
	first_name VARCHAR(45) NOT NULL,
	surname VARCHAR(45) NOT NULL,
	id_contact INT NOT NULL,
	FOREIGN KEY (id_contact) REFERENCES contact (id_contact)
);
CREATE TABLE luggage(
	id_luggage ${autoincrement},
	weight FLOAT NOT NULL,
	id_passenger INT NOT NULL,
	FOREIGN KEY (id_passenger) REFERENCES passenger (id_passenger)
);
CREATE TABLE address(
	id_address ${autoincrement},
	country VARCHAR(45),
	city VARCHAR(45),
	street VARCHAR(45),
	house_number VARCHAR(45),
	postal_code VARCHAR(45)
);
CREATE TABLE passenger_has_address(
	id_address INT NOT NULL,
	id_passenger INT NOT NULL,
	FOREIGN KEY (id_address) REFERENCES address (id_address),
	FOREIGN KEY (id_passenger) REFERENCES passenger (id_passenger)
);
CREATE TABLE employee_type(
	id_employee_type ${autoincrement},
	position VARCHAR(45) NOT NULL
);
CREATE TABLE employee(
	id_employee ${autoincrement},
	first_name VARCHAR(45) NOT NULL,
	surname VARCHAR(45) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
	id_employee_type INT NOT NULL,
	FOREIGN KEY (id_employee_type) REFERENCES employee_type (id_employee_type)
);
CREATE TABLE salary(
	id_salary ${autoincrement},
	salary FLOAT NOT NULL,
	paid_at DATE NOT NULL,
	primary_account_number VARCHAR(45) NOT NULL,
	id_employee INT NOT NULL,
	FOREIGN KEY (id_employee) REFERENCES employee (id_employee)
);
CREATE TABLE ticket_type(
	id_ticket_type ${autoincrement},
	class VARCHAR(45) NOT NULL,
    capacity INT NOT NULL,
	cost FLOAT NOT NULL
);
CREATE TABLE airline(
	id_airline ${autoincrement},
	airline_name VARCHAR(45) NOT NULL
);
CREATE TABLE aircraft(
	id_aircraft ${autoincrement},
	type VARCHAR(45) NOT NULL,
	manufacturer VARCHAR(45) NOT NULL,
	capacity INT NOT NULL
);
CREATE TABLE flight(
	id_flight ${autoincrement},
	gate VARCHAR(45) NOT NULL,
	departure_time TIMESTAMP NOT NULL,
	id_aircraft INT NOT NULL,
	FOREIGN KEY (id_aircraft) REFERENCES aircraft (id_aircraft)
);
CREATE TABLE flight_crew(
	id_flight INT NOT NULL,
	id_employee INT NOT NULL,
	FOREIGN KEY (id_flight) REFERENCES flight (id_flight),
	FOREIGN KEY (id_employee) REFERENCES employee (id_employee)
);
CREATE TABLE ticket(
	id_passenger ${autoincrement},
	id_ticket_type INT NOT NULL,
	id_flight INT NOT NULL,
	id_airline INT NOT NULL,
	FOREIGN KEY (id_passenger) REFERENCES passenger (id_passenger),
	FOREIGN KEY (id_ticket_type) REFERENCES ticket_type (id_ticket_type),
	FOREIGN KEY (id_flight) REFERENCES flight (id_flight),
	FOREIGN KEY (id_airline) REFERENCES airline (id_airline)
);
