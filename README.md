# Marketing Campaign Database Project

This project was developed as part of a Data Analytics exercise. It covers the design and implementation of a relational database for marketing campaigns. The process started with a Crow’s Foot ERD, which was refined into a **Functional Diagram** that served as the foundation for database creation and relationships. The project also includes SQL scripts, test data, and a final dashboard design.

## Project Overview

**Sprint 1 – Functional Diagram Design**  

- Creation of a Functional ER diagram based on the initial Crow’s Foot ERD and stakeholder requirements.  
- Identification of entities, attributes, and relationships for the database design.  

**Sprint 2 – Database Implementation in SQL**  

- Build the database schema in SQLite with all keys, datatypes, and constraints.  
- Insert at least 5 sample entries per table.  
- Run SQL queries to validate the database.  

**Sprint 3 – Dashboard Creation**  

- Clean and prepare data as needed.  
- Design and iterate on a Tableau dashboard using campaign KPIs (e.g., CPC, conversions, audience performance).  
- Start assembling presentation materials.  

**Sprint 4 – Finalization & Presentation**  

- Deliver the final Functional Diagram.  
- Provide SQL code and example queries.  
- Include screenshots of the database in action.  
- Share the Tableau dashboard design and usage logic.  

## Database Structure

The database includes the following core tables:

- **Clients** – client information  
- **Employees** – internal employees  
- **Influencers** – social media influencers  
- **Platforms** – platforms like Instagram, YouTube, TikTok  
- **Campaigns** – marketing campaigns with budgets and timelines  
- **Contents** – campaign content (posts, videos, articles)  
- **Cooperations** – mapping influencers to campaigns  
- **Bookings** – booked platforms per campaign  
- **Metrics** – KPIs such as impressions, clicks, engagement, conversion rate  
- **Payments** – campaign-related payments  
- **Advertisement** – ad formats and budgets  

📌 See [Functional Diagram](./MarketFlash_Functional_Diagram.png).

## SQL Code

The file [`database_setup.sql`](./database_setup.sql) includes:

- Drop & Create statements for all tables  
- Definition of primary & foreign keys  
- At least 5 sample entries per table  
- Example data for meaningful analysis  

## Example Queries (Extra Challenges)

- **Average cost per click (CPC)**  
- **Average cost per conversion**  
- **Audience segment performance**  

## Deliverables

- ✅ Functional ER diagram  
- ✅ SQL scripts with test data  
- ✅ Tableau Public dashboard (optional)  
- ✅ Presentation slides (project summary & results)  

## How to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/<username>/<repo>.git
2. Open SQLite and run the setup script:

.read database_setup.sql
3. Extend the database with your own queries and connect it to BI tools (e.g., Tableau).
✍️ Author: Thomas Jortzig
📅 Year: 2025
