# Tree Plantation Management Database — Project Report

## Overview

The Tree Plantation Management Database was designed to record and analyze tree-plantation activities. It tracks trees, volunteers, and maintenance work while demonstrating foundational and intermediate MySQL concepts.

## Database design

The system contains three related tables:

1. **Trees** stores tree names, scientific names, categories, planting dates, heights, and locations.
2. **Volunteers** stores volunteer names and contact information.
3. **PlantationActivities** links volunteers to trees and records activities such as planting, watering, pruning, cleaning, and fertilizing.

Primary keys uniquely identify records, while foreign keys preserve the relationships between volunteers, trees, and activities.

## SQL operations demonstrated

- Database and table creation
- Data insertion and updates
- Basic and aliased `SELECT` queries
- Inner and left joins
- A reusable activity view
- Aggregate functions including `COUNT` and `AVG`
- A subquery for trees above average height
- A trigger that prevents invalid non-positive heights
- Transactions, savepoints, rollback, and commit
- An index on tree category
- Optional privilege-management examples

## Sample insights

Using the included sample records, the database can answer questions such as:

- How many trees are recorded?
- What is the average tree height?
- Which trees belong to the medicinal category?
- Which volunteer worked on each tree?
- Which tree was planted most recently?

## Limitations

The sample database is intentionally small and educational. A production system would need stronger validation, duplicate protection, audit fields, user authentication, and a larger dataset.

## Future improvements

- Add tree-health observations and survival status
- Track environmental impact and estimated carbon absorption
- Add volunteer attendance and contribution summaries
- Build a web dashboard on top of the database
- Add stored procedures and automated tests

## Author

**Muhammad Kamil Shah**  
BS Data Science
