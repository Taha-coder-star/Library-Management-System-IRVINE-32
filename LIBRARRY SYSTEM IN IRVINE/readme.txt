
Library Management System in x86 Assembly Language (using Irvine32 Library)

Overview
--------
This program is a Library Management System implemented in x86 Assembly Language using the Irvine32 Library. 
The system provides basic functionalities for managing library members, books, and displaying popular books. 
It is intended for learning and demonstration purposes.

Features
--------
1. Menu-Driven Interface
   - Displays a menu with options for user interaction.

2. Member Management
   - Register a new member (up to 5 members).
   - View the list of registered members.

3. Book Management
   - Add new books (up to 5 books) with their titles and authors.
   - Search for a book by title.
   - View the list of registered books.

4. Popular Books
   - Displays a pre-defined list of the most popular books in the library.

5. Exit Program
   - Gracefully exits the program.

Program Flow
------------
1. The program starts by displaying the main menu.
2. The user selects an option by entering a number corresponding to a menu item.
3. Based on the choice, the appropriate procedure is executed.
4. After executing the task, the program returns to the main menu unless the exit option is selected.

Menu Options
------------
Option	Description
1       Register a Member
2       View Members
3       Add Books
4       Search Books
5       View Books
6       Exit Program

Procedures
----------
1. Menu
   - Displays the menu with options for user input.

2. RegisterMember
   - Registers a new member by taking the user’s name.
   - Stores up to 5 members.
   - Displays a success message or an error if the limit is reached.

3. ViewMembers
   - Displays the list of registered members.
   - If no members are registered, it shows a "No members registered yet" message.

4. AddBooks
   - Allows the user to add a book by entering the title and author.
   - Stores up to 5 books.
   - Displays a success message or an error if the limit is reached.

5. SearchBooks
   - Searches for a book by title.
   - Displays the book's details if found.
   - If no match is found, it displays a "No book with the given title exists" message.

6. ViewBooks
   - Displays the list of registered books with their authors.
   - Shows a "No books registered yet" message if no books exist.

7. StrCmp
   - A utility procedure that compares two strings byte by byte.

8. ExitProgram
   - Clears the screen and exits the program.

Data Structures
---------------
1. Buffers: Used for temporary user inputs (50 bytes each).
2. Static Arrays: Fixed-size arrays for storing member names, book titles, and author names (5 entries each).
3. Counters: Tracks the number of registered members and books (NUM_MEMBERS and NUM_BOOKS).

Requirements
------------
Development Environment
- Microsoft Windows
- MASM32 Assembler
- Irvine32 Library

Execution
- Compile the program using MASM32.
- Ensure the Irvine32.inc and associated .dll files are correctly set up.

Limitations
-----------
1. Fixed storage for members and books (up to 5 entries each).
2. No persistent storage; all data is stored in memory and lost upon exiting.
3. Basic string comparison does not support case-insensitivity.

Usage Instructions
------------------
1. Compile and run the program.
2. Navigate through the menu by entering the corresponding option number.
3. Perform desired tasks like adding books, registering members, or searching books.
4. Exit the program when done.


--------------------------------------------
--  WELCOME TO LIBRARY MANAGEMENT SYSTEM  --
--------------------------------------------
1-> Register a Member
2-> View Members
3-> Add Books
4-> Search Books
5-> View Books
6-> Exit program
Choose Your Option: _


Please enter your name to register: Alice
Member registered successfully: Alice



Please enter the book title: The Great Gatsby
Please enter the author's name: F. Scott Fitzgerald
Book registered successfully: The Great Gatsby


List of Registered Books:
The Great Gatsby
Author: F. Scott Fitzgerald

Troubleshooting
Error: "Member limit reached" or "Book limit reached"
The maximum capacity (5 members/books) has been reached. Restart the program to reset.
No output for members/books:
Ensure at least one member/book is registered before viewing.
Credits
Developer: Taha Ahmed Tuaha Ahmed Umar bin Abid

Library: Irvine32 for Assembly Language utilities