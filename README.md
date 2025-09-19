# Marketing Campaign Database Project

This project was developed as part of a Data Analytics exercise. It covers the design and implementation of a relational database for marketing campaigns. The process started with a Crow’s Foot ERD, which was refined into a **Functional Diagram** that served as the foundation for database creation and relationships. The project also includes SQL scripts, test data, and a final dashboard design.

## Project Context

MarketFlash, a growing marketing company, initially managed all campaign data in **Google Sheets**. While this worked at first, the rapid growth to over 1,000 campaigns per year made spreadsheets insufficient in terms of **scalability, transparency, and control**.  

👉 The project therefore had two main goals:

1. **Database setup in SQLite** – design of a structured relational database with entities, relationships, constraints, and test data.  
2. **Dashboard in Tableau** – using cleaned campaign data from Google Sheets to visualize KPIs and provide actionable insights.  

This dual approach demonstrates both:

- how MarketFlash could **migrate from spreadsheets to a scalable database**, and  
- how **stakeholders** can analyze performance KPIs through an interactive Tableau dashboard.  

The work was structured into four sprints, as outlined below.

## Project Overview

### Sprint 1 – Functional Diagram Design

- Creation of a Functional ER diagram based on the initial Crow’s Foot ERD and stakeholder requirements.  
- Identification of entities, attributes, and relationships for the database design.  

### Sprint 2 – Database Implementation in SQL

- Build the database schema in SQLite with all keys, datatypes, and constraints.  
- Insert at least 5 sample entries per table.  
- Run SQL queries to validate the database.  

### Sprint 3 – Dashboard Creation

- Clean and prepare data as needed.  
- Design and iterate on a Tableau dashboard using campaign KPIs (e.g., CPC, conversions, audience performance).  
- Start assembling presentation materials.  

### Sprint 4 – Finalization & Presentation

- Deliver the final Functional Diagram.  
- Provide SQL code and example queries.  
- Include screenshots of the database in action.  
- Share the Tableau dashboard design and usage logic.  

## Database Structure

The [database](database/MarketFlash_db.db) includes the following core tables:

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

📌 See [Functional Diagram](docs/MarketFlash_Functional_Diagram.png).

## SQL Code

The file [`database_setup.sql`](sql/MarketFlash_database_setup.sql) includes:

- Drop & Create statements for all tables  
- Definition of primary & foreign keys  
- At least 5 sample entries per table  
- Example data for meaningful analysis  

## Data Sources

- **SQLite Database (Test Data):**  
  Created as a proof of concept to demonstrate the database schema, relationships, and SQL queries.  
  Includes sample entries to validate table structure and constraints.  

- **Google Sheet (Live Data):**  
  The actual campaign data used for the Tableau Dashboard was managed in Google Sheets.  
  A cleaned version of this sheet was connected live to Tableau for building the interactive dashboards and Story.  

This dual setup reflects the project’s aim: to **design a scalable database** while also **demonstrating business insights with real campaign data**.

## Dashboard (Tableau)

The dashboard answers *“How are our campaigns performing?”* with:

- **KPIs:** Total Campaigns, Avg. Length (days), Conversion Rate, Avg. Cost, Avg. CPC, Avg. Cost per Conversion  
- **Funnel:** Views → Likes → Clicks → Conversions (click to filter)  
- **Time series:** Funnel over time with conversion overlay  
- **Segments:** Audience & Channel performance (pie charts & filters)  
- **Geography:** Region treemap (size = #campaigns, color = #clients)  

> Filters: Month, Channel, Age Range, Campaign No, Client, Executive  

## Deliverables

- ✅ Functional Database Diagram  
- ✅ SQL scripts with test data
- ✅ SQLite database
- ✅ Tableau Public dashboard  

The final project deliverables were provided as a **Tableau Story**.  
The Story guides the client through the following steps:

1. **Project Background & Task** – Starting point, business context, and project goals.  
2. **Database – Functional Diagram** – Final ER diagram showing entities and relationships.  
3. **Database – Setup** – Implementation in SQLite with schema, constraints, and test data (verified in Beekeeper Studio).  
4. **Database – Testing** – SQL queries run on each table to confirm data integrity.  
5. **Dashboard – Mockup** – Initial wireframe design with key KPIs, filters, and charts.  
6. **Dashboard – Live Version** – Final Tableau dashboard with interactive filters, funnel metrics, audience/channel breakdowns, and regional campaign performance.  

## How to Use

1. **Clone the repository**

   ```bash
   git clone https://github.com/<username>/<repo>.git
   cd <repo>
   ```

2. **Create the SQLite database and run the setup**

   Using the SQLite CLI:

   ```bash
   sqlite3 marketflash.db
   .read database_setup.sql
   .tables
   .quit
   ```

   Or with DB Browser for SQLite:

   Open the app → *Execute SQL* → load `database_setup.sql` → *Run*.

3. **Explore & visualize**

   Run your own SQL queries against `marketflash.db`.  
   *(Note: the DB only includes structural design and small test data for demonstration.)*  

   To replicate the full dashboard, Tableau needs to be connected to a dataset (Google Sheets).  
   A published version of the dashboard is available under the link below.

---

📊 **Tableau Public Story Link:** [View on Tableau Public](https://public.tableau.com/shared/RMMSWWZB9?:display_count=n&:origin=viz_share_link)  
✍️ **Author:** Thomas Jortzig  
📅 **Date:** July 2025
