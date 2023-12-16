# Feature Documentation: Delivery Date Tracking

## Overview

The Delivery Date Tracking feature provides a mechanism for tracking delivery dates in the company's internal application. Although the feature has been temporarily reverted, this documentation will serve as a guide for developers who may need to reintegrate the feature in the future and for end-users who would benefit from its functionality.

## Table of Contents

1. [Introduction](#introduction)
2. [Key Components](#key-components)
3. [How It Works](#how-it-works)
4. [Integration Steps](#integration-steps)
5. [Usage Guide for End-Users](#usage-guide-for-end-users)
6. [Considerations](#considerations)
7. [Reverting the Feature](#reverting-the-feature)
8. [Future Development](#future-development)


## Introduction
The Delivery Date Tracking feature improves the application by allowing users to associate delivery dates with specific records.

## Key Components

- **Delivery Date Column:** A database column (`delivery_date`) was added to the backend Azure SQL Database to store delivery dates.

## How It Works

The feature operates by adding a new column to the database schema, allowing users to input and retrieve delivery dates for relevant records.

## Integration Steps

If you plan to reintegrate the feature in the future, follow these steps:

1. **Branching:**
   - Create a new branch for feature development based on the `main` branch.
   - Make changes to the codebase to accommodate the feature.

2. **Database Update:**
   - Ensure that the `delivery_date` column is added to the backend Azure SQL Database with the appropriate data type.

3. **Code Modifications:**
   - Integrate code changes to handle the new feature.
   - Update any relevant documentation to reflect the changes made.

4. **Testing:**
   - Thoroughly test the feature to ensure proper functionality.

5. **Documentation:**
   - Update or create documentation to reflect the changes made and guide users and developers on using the feature.

6. **Pull Request:**
   - Create a pull request for the new feature branch, ensuring that the changes are reviewed and approved.

7. **Merge:**
   - After approval, merge the feature branch into the `main` branch.


## Usage Guide for End-Users

### Adding Delivery Dates

To add a delivery date to a record:

1. Navigate to the relevant section of the application.
2. Locate the record for which you want to add a delivery date.
3. Edit the record and find the "Delivery Date" field.
4. Input the desired delivery date.
5. Save the changes.

### Retrieving Delivery Dates

To view delivery dates associated with records:

1. Access the record or report section.
2. Look for the "Delivery Date" field in the record details.

## Considerations

- The `delivery_date` column was designed to store date values.
- Ensure that relevant validations are in place to handle date inputs appropriately.

## Reverting the Feature

If there's a need to revert the feature:

1. Follow the steps outlined
markdown
Copy code
in the [Revert Section](#reverting-the-feature) of this documentation.
2. Communicate the revert to the team, ensuring everyone is aware of the changes.

## Future Development

While the feature has been reverted for now, there might be future scenarios where it becomes relevant again. Keep the documentation up-to-date, and consider incorporating user feedback for improvements.

---



