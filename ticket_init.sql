CREATE TABLE Events (
  eventID INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  eventType VARCHAR(255) NOT NULL,
  venue VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  startDateTime DATETIME NOT NULL,
  endDateTime DATETIME NOT NULL
);

CREATE TABLE Vouchers (
  voucherCode VARCHAR(255) PRIMARY KEY,
  discount INT NOT NULL,
  event INT NOT NULL,
  FOREIGN KEY (event) REFERENCES Events(eventID)
);

CREATE TABLE Tickets (
  ticketType VARCHAR(255) NOT NULL,
  event INT,
  PRIMARY KEY (ticketType, event),
  remainingTickets INT NOT NULL,
  maxTickets INT NOT NULL,
  price FLOAT NOT NULL,
  FOREIGN KEY (event) REFERENCES Events(eventID)
);

CREATE TABLE Customers (
  customerID INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL
);

CREATE TABLE Cards (
  cardNum VARCHAR(255) PRIMARY KEY,
  cardType VARCHAR(255) NOT NULL,
  expiryDate VARCHAR(255) NOT NULL,
  securityCode VARCHAR(255) NOT NULL,
  customer INT,
  FOREIGN KEY (customer) REFERENCES Customers(customerID)
);

CREATE TABLE Bookings (
  bookingID INT AUTO_INCREMENT PRIMARY KEY,
  bookingDateTime DATETIME NOT NULL,
  totalPayment FLOAT NOT NULL,
  deliveryOption VARCHAR(255) NOT NULL,
  successfulPayment BOOL NOT NULL,
  customer INT NOT NULL,
  FOREIGN KEY (customer) REFERENCES Customers(customerID),
  voucher VARCHAR(255),
  FOREIGN KEY (voucher) REFERENCES Vouchers(voucherCode)
);

CREATE TABLE TicketsInBookings (
  quantity INT NOT NULL,
  booking INT NOT NULL,
  FOREIGN KEY (booking) REFERENCES Bookings(bookingID),
  event INT NOT NULL,
  ticketType VARCHAR(255) NOT NULL,
  FOREIGN KEY (event, ticketType) REFERENCES Tickets(event, ticketType),
  PRIMARY KEY (booking, ticketType, event)
);


-- POPULATING WITH DUMMY DATA FOR QUERIES:

INSERT INTO Events (title, eventType, venue, description, startDateTime, endDateTime)
VALUES
("Exeter Food Festival 2023", "Food Festival", "Exeter", "Exeter's best food festival", '2023-12-15 11:00:00', '2023-12-17 19:00:00'),
("Exmouth Music Festival 2023","Music Festival","Exmouth","A brilliant music festival",'2023-07-06 13:00:00','2023-07-09 17:30:00'),
("Exeter Dinner Ball 2023", "Dinner Ball", "Exeter", "A fancy dinner event!", '2023-12-02 17:00:00', '2023-12-02 22:30:00');

INSERT INTO Vouchers (voucherCode, discount, event)
VALUES
("FOOD10", 10, 1),
("MUSIC5", 5, 2),
("MUSIC20", 20, 2);

INSERT INTO Tickets (ticketType, event, maxTickets, remainingTickets, price)
VALUES
("Adult", 1, 125, 125, 25),
("Child", 1, 100, 100, 12.75),
("Gold", 2, 25, 19, 50),
("Silver", 2, 30, 29, 40.50),
("Bronze", 2, 50, 50, 35),
("Day", 3, 20, 17, 7.50);

INSERT INTO Customers (name, address, phone)
VALUES
("Ian Cooper", "EX4 3RN", "07329018935"),
("Joe Smiths", "EX2 9PT", "03285627453"),
("Matt Carroll", "EX4 5KR", "07364536297");

INSERT INTO Cards (cardNum, cardType, expiryDate, securityCode, customer)
VALUES
("4726937410032389", "credit", "03/25", "327", 1),
("2390537893743874", "debit", "07/27", "119", 2);

INSERT INTO Bookings (bookingDateTime, totalPayment, deliveryOption, successfulPayment, customer, voucher)
VALUES
('2023-05-14 18:42:33', 140.5, "email", true, 1, NULL),
('2023-06-26 13:17:54', 200, "pick-up", true, 3, NULL),
('2023-07-01 09:46:13', 22.5, "email", true, 2, NULL);

INSERT INTO TicketsInBookings (quantity, booking, event, ticketType)
VALUES
(2, 1, 2, "Gold"),
(1, 1, 2, "Silver"),
(4, 2, 2, "Gold"),
(3, 3, 3, "Day");