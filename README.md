# LibraryDatabase

An interactive PostgreSQL database was created as a robust information repository for a fictional library. The database was constructed using a diverse collection of book data obtained from a random GoodReads user's CSV file, ensuring that it accurately represents a wide range of literary works. To enhance its functionality and showcase versatility, fictitious Patreon information was generated and seamlessly integrated into the database.

The meticulously designed database serves as a comprehensive resource for the fictional library, enabling efficient storage and retrieval of book-related information. Leveraging the power of PostgreSQL, a series of thoughtfully crafted queries were executed to analyze and address key questions concerning various aspects of the library's operations. These queries delve into the library's collection, user interactions, and other pertinent factors, shedding light on valuable insights for effective library management.

### The database schema contains the following tables:

- BOOKS: isbn_ID, title, author, publication_date, language, number_of_copies 
- PATRONS: patron_ID, first_name, last_name, address, phone_number, email_address, library_card_number, account_balance
- BOOK_BORROWING: borrowing_ID, patron_ID, isbn_ID, borrow_date, due_date, return_date
- BOOK_RESERVATION: reservation_ID, patron_ID, isbn_ID, reservation_date, expiration_date

### SQL queries answer the following questions: 

- Which patrons are currently borrowing books, and what are the titles of the borrowed books?
- Which books have been borrowed the most, and how many times have they been borrowed?
- Which books have the highest number of reservations?
- How many patrons have borrowed more than one book at the same time?
- Which patrons have overdue books, what are the book titles, and when were they due?
- What is the total amount of money owed to the library by all patrons?
- Which patrons have outstanding account balances, and how can they be contacted?
- Who is the author with the highest number of books in the library?
- What is the average duration, in days, of book borrowing?
- Which patron has checked out the highest number of books in the library's history?
- Which day of the week sees the highest number of book borrowings? 


