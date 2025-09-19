PRAGMA foreign_keys = OFF;

-- Tabellen löschen, falls vorhanden
DROP TABLE IF EXISTS advertisement;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS metrics;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS cooperations;
DROP TABLE IF EXISTS contents;
DROP TABLE IF EXISTS campaigns;
DROP TABLE IF EXISTS platforms;
DROP TABLE IF EXISTS influencers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS clients;

-- Tabellen neu erstellen

CREATE TABLE clients (
    Client_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    CompanyName VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    PhoneNo VARCHAR(20) NOT NULL,
    ContactPerson VARCHAR(20) NOT NULL
);

CREATE TABLE employees (
    EmpID VARCHAR(10) NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    PhoneNo VARCHAR(20) NOT NULL,
    SupervisorID VARCHAR(10),
    FOREIGN KEY (SupervisorID) REFERENCES employees(EmpID)
);

CREATE TABLE influencers (
    Influencer_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Influencer_Name VARCHAR(50) NOT NULL,
    Social_Handle VARCHAR(50),
    Follower_Count SMALLINT,
    Contact_Details VARCHAR(100)
);

CREATE TABLE platforms (
    Platform_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Platform_Name VARCHAR(50) NOT NULL,
    URL VARCHAR(50),
    Contact_Person VARCHAR(20),
    Contact_Phone VARCHAR(20),
    Contact_Email VARCHAR(50)
);

CREATE TABLE campaigns (
    Campaign_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Campaign_Name VARCHAR(50) NOT NULL,
    StartDate TEXT NOT NULL,
    EndDate TEXT NOT NULL,
    Budget FLOAT NOT NULL,
    Client_ID VARCHAR(10) NOT NULL,
    Employee_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (Client_ID) REFERENCES clients(Client_ID),
    FOREIGN KEY (Employee_ID) REFERENCES employees(EmpID)
);

CREATE TABLE contents (
    Content_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Title VARCHAR(50) NOT NULL,
    Description VARCHAR(200),
    Media_Type VARCHAR(50),
    Creation_Date TEXT NOT NULL,
    Campaign_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (Campaign_ID) REFERENCES campaigns(Campaign_ID)
);

CREATE TABLE cooperations (
    Cooperation_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Influencer_ID VARCHAR(10) NOT NULL,
    Campaign_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (Influencer_ID) REFERENCES influencers(Influencer_ID),
    FOREIGN KEY (Campaign_ID) REFERENCES campaigns(Campaign_ID)
);

CREATE TABLE bookings (
    Bookings_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Campaign_ID VARCHAR(10) NOT NULL,
    Platform_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (Campaign_ID) REFERENCES campaigns(Campaign_ID),
    FOREIGN KEY (Platform_ID) REFERENCES platforms(Platform_ID)
);

CREATE TABLE metrics (
    Metrics_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Impressions SMALLINT NOT NULL,
    Clicks SMALLINT NOT NULL,
    Engagement SMALLINT NOT NULL,
    Conversion_Rate FLOAT NOT NULL,
    Campaign_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (Campaign_ID) REFERENCES campaigns(Campaign_ID)
);

CREATE TABLE payments (
    Payment_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Date TEXT NOT NULL,
    Amount FLOAT NOT NULL,
    Payment_Type VARCHAR(50),
    Payment_Details VARCHAR(100),
    Campaign_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (Campaign_ID) REFERENCES campaigns(Campaign_ID)
);

CREATE TABLE advertisement (
    Ad_ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Ad_Name VARCHAR(50),
    Type VARCHAR(50),
    Duration TEXT NOT NULL,
    Budget FLOAT,
    Campaign_ID VARCHAR(10) NOT NULL,
    Platform_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (Campaign_ID) REFERENCES campaigns(Campaign_ID),
    FOREIGN KEY (Platform_ID) REFERENCES platforms(Platform_ID)
);


-- Insert into clients
INSERT INTO clients VALUES ('CL001', 'FreshJuice Co.', '123 Juice Ave', 'contact@freshjuice.com', '555-1010', 'Laura Kim');
INSERT INTO clients VALUES ('CL002', 'TechGizmo', '456 Tech Blvd', 'info@techgizmo.com', '555-2020', 'James Moore');
INSERT INTO clients VALUES ('CL003', 'EcoStyle', '789 Green St', 'hello@ecostyle.com', '555-3030', 'Tina Wang');
INSERT INTO clients VALUES ('CL004', 'FitLife', '321 Wellness Rd', 'support@fitlife.com', '555-4040', 'Mark Davis');
INSERT INTO clients VALUES ('CL005', 'QuickFix', '654 Fast Ln', 'contact@quickfix.com', '555-5050', 'Sara Bell');

-- Insert into employees
INSERT INTO employees VALUES ('EMP001', 'Alice', 'Brown', '1 Company Rd', 'alice@company.com', '555-1111', 'None');
INSERT INTO employees VALUES ('EMP002', 'Brian', 'Stone', '2 Company Rd', 'brian@company.com', '555-2222', 'None');
INSERT INTO employees VALUES ('EMP003', 'Claire', 'Holt', '3 Company Rd', 'claire@company.com', '555-3333', 'None');
INSERT INTO employees VALUES ('EMP004', 'Derek', 'Smith', '4 Company Rd', 'derek@company.com', '555-4444', 'None');
INSERT INTO employees VALUES ('EMP005', 'Ella', 'Nguyen', '5 Company Rd', 'ella@company.com', '555-5555', 'None');
UPDATE employees SET SupervisorID = 'EMP001' WHERE EmpID = 'EMP002';
UPDATE employees SET SupervisorID = 'EMP001' WHERE EmpID = 'EMP003';
UPDATE employees SET SupervisorID = 'EMP002' WHERE EmpID = 'EMP004';
UPDATE employees SET SupervisorID = 'EMP002' WHERE EmpID = 'EMP005';

-- Insert into influencers
INSERT INTO influencers VALUES ('INF001', 'Anna Smith', '@annasmith', 25000, 'anna@example.com');
INSERT INTO influencers VALUES ('INF002', 'Ben Lee', '@benlee', 15000, 'ben@example.com');
INSERT INTO influencers VALUES ('INF003', 'Cara Kim', '@carakim', 35000, 'cara@example.com');
INSERT INTO influencers VALUES ('INF004', 'David Zhou', '@dzhou', 20000, 'david@example.com');
INSERT INTO influencers VALUES ('INF005', 'Eva Roth', '@evaroth', 18000, 'eva@example.com');

-- Insert into platforms
INSERT INTO platforms VALUES ('PL001', 'Instagram', 'https://instagram.com', 'Support Team', '123-456', 'support@instagram.com');
INSERT INTO platforms VALUES ('PL002', 'YouTube', 'https://youtube.com', 'YouTube Help', '234-567', 'help@youtube.com');
INSERT INTO platforms VALUES ('PL003', 'TikTok', 'https://tiktok.com', 'TikTok Support', '345-678', 'support@tiktok.com');
INSERT INTO platforms VALUES ('PL004', 'Facebook', 'https://facebook.com', 'FB Team', '456-789', 'contact@facebook.com');
INSERT INTO platforms VALUES ('PL005', 'LinkedIn', 'https://linkedin.com', 'LinkedIn Help', '567-890', 'help@linkedin.com');

-- Insert into campaigns
INSERT INTO campaigns VALUES ('CA001', 'Juice Launch', '2024-01-01', '2024-03-01', 50000.0, 'CL001', 'EMP001');
INSERT INTO campaigns VALUES ('CA002', 'Tech Teaser', '2024-02-01', '2024-04-15', 75000.0, 'CL002', 'EMP002');
INSERT INTO campaigns VALUES ('CA003', 'Eco Spring', '2024-03-01', '2024-05-01', 60000.0, 'CL003', 'EMP003');
INSERT INTO campaigns VALUES ('CA004', 'Wellness Week', '2024-04-01', '2024-06-01', 55000.0, 'CL004', 'EMP004');
INSERT INTO campaigns VALUES ('CA005', 'Fast Repair', '2024-05-01', '2024-07-01', 40000.0, 'CL005', 'EMP005');

-- Insert into contents
INSERT INTO contents VALUES ('CT001', 'Instagram Post', 'Spring promo post', 'Image', '2024-01-05', 'CA001');
INSERT INTO contents VALUES ('CT002', 'YouTube Ad', 'Gadget review', 'Video', '2024-02-10', 'CA002');
INSERT INTO contents VALUES ('CT003', 'TikTok Challenge', 'Eco trend', 'Video', '2024-03-12', 'CA003');
INSERT INTO contents VALUES ('CT004', 'Facebook Article', 'Fitness tips', 'Article', '2024-04-18', 'CA004');
INSERT INTO contents VALUES ('CT005', 'LinkedIn Blog', 'Tech hiring trends', 'Text', '2024-05-21', 'CA005');

-- Insert into cooperations
INSERT INTO cooperations VALUES ('CO001', 'INF001', 'CA001');
INSERT INTO cooperations VALUES ('CO002', 'INF002', 'CA002');
INSERT INTO cooperations VALUES ('CO003', 'INF003', 'CA003');
INSERT INTO cooperations VALUES ('CO004', 'INF004', 'CA004');
INSERT INTO cooperations VALUES ('CO005', 'INF005', 'CA005');

-- Insert into bookings
INSERT INTO bookings VALUES ('BK001', 'CA001', 'PL001');
INSERT INTO bookings VALUES ('BK002', 'CA002', 'PL002');
INSERT INTO bookings VALUES ('BK003', 'CA003', 'PL003');
INSERT INTO bookings VALUES ('BK004', 'CA004', 'PL004');
INSERT INTO bookings VALUES ('BK005', 'CA005', 'PL005');

-- Insert into metrics
INSERT INTO metrics VALUES ('ME001', 100000, 1500, 1200, 0.08, 'CA001');
INSERT INTO metrics VALUES ('ME002', 85000, 1300, 1100, 0.09, 'CA002');
INSERT INTO metrics VALUES ('ME003', 92000, 1400, 1000, 0.11, 'CA003');
INSERT INTO metrics VALUES ('ME004', 78000, 1100, 950, 0.1, 'CA004');
INSERT INTO metrics VALUES ('ME005', 66000, 900, 850, 0.13, 'CA005');

-- Insert into payments
INSERT INTO payments VALUES ('PA001', '2024-01-10', 2000.0, 'Credit Card', 'Initial deposit', 'CA001');
INSERT INTO payments VALUES ('PA002', '2024-02-15', 3000.0, 'Bank Transfer', 'Second phase', 'CA002');
INSERT INTO payments VALUES ('PA003', '2024-03-20', 2500.0, 'PayPal', 'Promo push', 'CA003');
INSERT INTO payments VALUES ('PA004', '2024-04-25', 2700.0, 'Credit Card', 'Retargeting', 'CA004');
INSERT INTO payments VALUES ('PA005', '2024-05-30', 1800.0, 'Bank Transfer', 'Final invoice', 'CA005');

-- Insert into advertisement
INSERT INTO advertisement VALUES ('AD001', 'Spring Juice Ad', 'Video', '30s', 10000.0, 'CA001', 'PL001');
INSERT INTO advertisement VALUES ('AD002', 'Tech Intro', 'Banner', '15s', 15000.0, 'CA002', 'PL002');
INSERT INTO advertisement VALUES ('AD003', 'Eco Friendly Tips', 'Video', '45s', 12000.0, 'CA003', 'PL003');
INSERT INTO advertisement VALUES ('AD004', 'Fitness Hacks', 'Article', '60s', 13000.0, 'CA004', 'PL004');
INSERT INTO advertisement VALUES ('AD005', 'Speedy Repair', 'Video', '20s', 9000.0, 'CA005', 'PL005');

PRAGMA foreign_keys = ON;
