# Tree Plantation Management Database

A MySQL database project for recording trees, volunteers, and plantation activities. It demonstrates relational database design and a range of SQL concepts through a small environmental-management use case.

## Project objective

The system is designed to organize plantation records and answer practical questions such as which trees were planted, where they are located, which volunteers worked on them, and what maintenance activities were performed.

## Database entities

### Trees

Stores tree name, scientific name, category, planting date, height, and location.

### Volunteers

Stores volunteer names, contact details, and addresses.

### Plantation activities

Connects volunteers with trees and records activities such as planting, watering, pruning, fertilizing, and cleaning.

## SQL concepts demonstrated

- Database and table creation
- Primary and foreign keys
- Sample data insertion
- Basic and aliased queries
- Inner and left joins
- Aggregate functions
- Subqueries
- Views
- Trigger-based validation
- Transactions, savepoints, rollback, and commit
- Index creation
- Optional access-control examples

## Repository structure

```text
database/
  tree_plantation_database.sql
docs/
  project_report.md
README.md
LICENSE
.gitignore
```

## How to run

1. Open MySQL Workbench or another MySQL-compatible client.
2. Open `database/tree_plantation_database.sql`.
3. Run the script from top to bottom.
4. Refresh the schemas and open the `TreePlantation` database.
5. Execute the example queries to review the outputs.

## Example questions answered

- How many trees are recorded?
- What is the average tree height?
- Which trees belong to a selected category?
- Which volunteer worked on each tree?
- Which tree was planted most recently?
- Which trees are taller than the average height?

## Limitations

- The included records are a small educational sample.
- Contact information is simplified and not designed for production use.
- The project does not include a graphical interface.
- User authentication, auditing, and advanced validation are outside the current scope.

## Future improvements

- Add tree health and survival-status tracking
- Add environmental-impact estimates
- Create an ER diagram
- Add stored procedures and automated SQL tests
- Build a web dashboard connected to the database

## Author

**Muhammad Kamil Shah**  
BS Data Science

## License

This project is licensed under the MIT License.
