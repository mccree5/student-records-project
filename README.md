This is a  system to manage student records using PostgreSQL and Bash scripts. The system allows users to:

- Set up a PostgreSQL database.
- Seed test data into the database.
- Insert new student records manually.
- Query student records.
- Back up the database.

## Features

- **Database Setup**: Initialize the database and create necessary tables with the schema.
- **Seed Data**: Populate the database with test student records for demonstration.
- **Insert New Students**: Allows the user to insert new student records via the terminal.
- **Query Students**: Retrieve and display student records in the database.
- **Backup Database**: Create backups of the database in case of future restoration needs.

## Prerequisites

Make sure you have the following software installed on your system:

- **PostgreSQL**: A relational database management system. Make sure you have a running PostgreSQL service.
- **Bash**: The scripts use Bash to automate tasks.
- **Linux/Ubuntu**: This project is designed for use on Linux-based systems.

### Installing PostgreSQL

If you do not have PostgreSQL installed, you can install it with the following commands (on Ubuntu):

```bash
