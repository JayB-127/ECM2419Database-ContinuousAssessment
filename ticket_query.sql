-- Q1
SELECT e.title "Event Name", e.eventType "Event Type", e.description "Description", e.venue "Venue", e.startDateTime "Start Date/Time", e.endDateTime "End Date/Time", t.ticketType "Ticket Type", t.remainingTickets "Tickets Remaining", t.maxTickets "Maximum Tickets"
FROM Events e
INNER JOIN Tickets t ON e.eventID = t.event AND e.title = "Exeter Food Festival 2023";

-- Q2
SELECT e.title "Event Name", e.startDateTime "Start Date/Time", e.endDateTime "End Date/Time", e.description AS "Description"
FROM Events e
WHERE e.startDateTime BETWEEN '2023-07-01 00:00:00' AND '2023-07-10 23:59:59';

-- Q3
SELECT e.title "Event Name", t.ticketType "Ticket Type", t.remainingTickets "Tickets Remaining", t.maxTickets "Maximum Tickets", t.price "Ticket Price"
FROM Events e
INNER JOIN Tickets t ON e.eventID = t.event AND e.title = "Exmouth Music Festival 2023" AND t.ticketType = "Bronze";

-- Q4
SELECT c.name "Customer Name", e.title "Event Name", tib.ticketType "Ticket Type", tib.quantity "Quantity"
FROM Customers c
INNER JOIN Bookings b ON c.customerID = b.customer
INNER JOIN TicketsInBookings tib ON b.bookingID = tib.booking
INNER JOIN Events e ON tib.event = e.eventID
AND e.title = "Exmouth Music Festival 2023"
AND tib.ticketType = "Gold";

-- Q5
SELECT e.title "Event Name", tib.ticketType "Ticket Type", tib.quantity "Amount Sold"
FROM Events e
INNER JOIN TicketsInBookings tib ON e.eventID = tib.event
ORDER BY tib.quantity DESC;

-- Q6
SELECT b.bookingID "BookingID", c.name "Customer Name", b.bookingDateTime "Booking Date/Time", e.title "Event Name", b.deliveryOption "Delivery Option", tib.ticketType "Ticket Type", tib.quantity "Quantity", b.totalPayment "Total Payment", b.voucher "Voucher Used"
FROM Customers c
INNER JOIN Bookings b ON c.customerID = b.customer
INNER JOIN TicketsInBookings tib ON b.bookingID = tib.booking
INNER JOIN Events e ON tib.event = e.eventID
AND b.bookingID = "1";

-- Q7
SELECT e.title "Event", SUM(tib.quantity * t.price) "Income"
FROM TicketsInBookings tib
INNER JOIN Events e ON tib.event = e.eventID
INNER JOIN Tickets t ON tib.ticketType = t.ticketType
GROUP BY e.title
ORDER BY Income DESC
LIMIT 1;