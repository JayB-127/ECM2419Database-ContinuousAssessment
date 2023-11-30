-- Q1
UPDATE Tickets
SET maxTickets = maxTickets + 100,
remainingTickets = remainingTickets + 100
WHERE event = 1 AND ticketType = "Adult";

-- Q2
INSERT INTO Bookings (bookingDateTime, totalPayment, deliveryOption, successfulPayment, customer, voucher)
VALUES
(NOW(), ROUND(62.75 - (0.1 * 62.75), 2), "email", 1, 1, "FOOD10");

INSERT INTO TicketsInBookings (quantity, booking, event, ticketType)
VALUES
(2, 4, 1, "Adult"),
(1, 4, 1, "Child");

UPDATE Tickets
SET remainingTickets = remainingTickets - 2
WHERE event = 1 AND ticketType = "Adult";

UPDATE Tickets
SET remainingTickets = remainingTickets - 1
WHERE event = 1 AND ticketType = "Child";

-- Q3
DELETE FROM TicketsInBookings
WHERE booking = 3;

DELETE FROM Bookings
WHERE bookingID = 3;

UPDATE Tickets
SET remainingTickets = remainingTickets + 3
WHERE event = 3 AND ticketType = "Day";

-- Q4
INSERT INTO Vouchers (voucherCode, discount, event)
VALUES
("SUMMER20", 20, 2);