-- Determines what books are being borrowed and by which patron
SELECT patrons.first_name, patrons.last_name, books.title
FROM book_borrowing
JOIN patrons ON book_borrowing.patron_ID = patrons.patron_id
JOIN books ON book_borrowing.isbn_ID = books.isbn_ID
WHERE return_date IS NULL;

-- Determines which books are being borrowed and how many have been borrowed
SELECT books.title, COUNT(*) as num_borrowed
FROM book_borrowing
JOIN books ON book_borrowing.isbn_ID = books.isbn_ID
GROUP BY books.title
ORDER BY num_borrowed DESC;

-- Determines which books are being reserved the most
SELECT books.title, book_reservations.isbn_ID, COUNT(*) as num_reservations
FROM book_reservations
JOIN books ON book_reservations.isbn_ID = books.isbn_ID
GROUP BY books.title, book_reservations.isbn_ID
ORDER BY num_reservations DESC;

-- Determines all the instances where one patron is borrowing more than one book
SELECT COUNT(*) as total_patrons
FROM (
SELECT patron_ID
FROM book_borrowing
GROUP BY patron_ID, return_date
HAVING COUNT(*) > 1 AND return_date IS NULL)
AS patrons_with_mutiple_borrowings;

-- Determines which books are overdue and by whom, as well as the original due date
SELECT patrons.first_name, patrons.last_name, books.title, book_borrowing.due_date
FROM book_borrowing
JOIN patrons ON book_borrowing.patron_ID = patrons.patron_ID
JOIN books ON book_borrowing.isbn_ID = books.isbn_ID
WHERE book_borrowing.return_date IS NULL AND book_borrowing.due_date < CURRENT_DATE;

-- Determines how much money in total is owed to the library 
SELECT SUM(account_balance) as total_money_owed
FROM patrons;

-- Determining all the patrons that owe money; provides all their info so we can contact them
SELECT *
FROM patrons
WHERE account_balance > 0;

-- Determining the most prominent author in our library
SELECT author, COUNT(*) as num_books
FROM books
GROUP BY author
ORDER BY num_books DESC
LIMIT 1;

-- Determines the average borrow time for all books in days
SELECT ROUND(AVG(return_date - borrow_date), 2) as avg_borrow_time_in_days
FROM book_borrowing
WHERE return_date IS NOT NULL;

-- Finds which patron has checked out the most books in the complete lifetime of the library
-- This includes books which they currently have checked out as well as returned books 
SELECT patrons.first_name, patrons.last_name, COUNT(DISTINCT books.title) as num_books
FROM patrons
LEFT JOIN book_borrowing ON patrons.patron_ID = book_borrowing.patron_ID
LEFT JOIN books ON book_borrowing.isbn_ID = books.isbn_ID
GROUP BY patrons.patron_ID
ORDER BY num_books DESC
LIMIT 1;

-- Determines which day of the weeks are most popular in terms of book borrowing
SELECT TO_CHAR(date_trunc('day', borrow_date), 'Day') AS day_of_week, COUNT(*) AS num_borrowed
FROM book_borrowing
GROUP BY day_of_week
ORDER BY num_borrowed DESC;
