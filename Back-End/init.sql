/*******************
Cleaning Script
********************/
DROP TABLE IF EXISTS predictions;
DROP TABLE IF EXISTS prices;
DROP TABLE IF EXISTS company_attraction;
DROP TABLE IF EXISTS attractions;
DROP TABLE IF EXISTS companies;
DROP DATABASE IF EXISTS sg_attractions;

/*******************
Create the schema
********************/
CREATE DATABASE IF NOT EXISTS sg_attractions;
USE sg_attractions;

CREATE TABLE IF NOT EXISTS companies (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS attractions (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    acronym VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS company_attraction (
    company_id INTEGER,
    attraction_id INTEGER,
    PRIMARY KEY (company_id, attraction_id),
    CONSTRAINT fk_attraction_id FOREIGN KEY (attraction_id) REFERENCES attractions(id) ON UPDATE CASCADE,
    CONSTRAINT fk_company_id FOREIGN KEY (company_id) REFERENCES companies(id) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS prices (
    attraction_id INTEGER,
    year INTEGER NOT NULL,
    category VARCHAR(255) NOT NULL CHECK(category IN ('Child', 'Adult', 'Senior')),
    price DECIMAL(10, 2),
    PRIMARY KEY (attraction_id, year, category),
    CONSTRAINT fk_prices_attraction_id FOREIGN KEY (attraction_id) REFERENCES attractions(id) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS predictions (
    attraction_id INTEGER,
    year INTEGER NOT NULL,
    category VARCHAR(255) NOT NULL CHECK(category IN ('Child', 'Adult', 'Senior')),
    price DECIMAL(10, 2),
    PRIMARY KEY (attraction_id, year, category),
    CONSTRAINT fk_predictions_attraction_id FOREIGN KEY (attraction_id) REFERENCES attractions(id) ON UPDATE CASCADE
);

/*******************
Insert Values
********************/
--
-- Data for Name: companies; Type: TABLE DATA;
--
INSERT INTO companies (name) VALUES 
('Gardens by the Bay'),
('Mandai Wildlife Group'),
('Genting Singapore'),
('Mount Faber Leisure Group');

--
-- Data for Name: attractions; Type: TABLE DATA;
--
INSERT INTO attractions (name, acronym) VALUES 
('Cloud Forest + Flower Dome', 'GBTB'),
('Singapore Zoo', 'ZOO'),
('Universal Studios Singapore', 'USS'),
('Cable Car Sky Pass', 'Mount Faber');

--
-- Data for Name: company_attraction; Type: TABLE DATA;
--
INSERT INTO company_attraction (company_id, attraction_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

--
-- Data for Name: prices; Type: TABLE DATA;
--

-- GBTB data
INSERT INTO prices (attraction_id, year, category, price) VALUES 
(1, 2012, 'Child', 15.00),
(1, 2013, 'Child', 15.00),
(1, 2014, 'Child', 15.00),
(1, 2015, 'Child', 15.00),
(1, 2016, 'Child', 15.00),
(1, 2017, 'Child', 15.00),
(1, 2018, 'Child', 15.00),
(1, 2019, 'Child', 15.00),
(1, 2020, 'Child', 15.00),
(1, 2021, 'Child', 15.00),
(1, 2022, 'Child', 15.00),
(1, 2023, 'Child', 15.00),
(1, 2024, 'Child', 18.00),
(1, 2012, 'Adult', 28.00),
(1, 2013, 'Adult', 28.00),
(1, 2014, 'Adult', 28.00),
(1, 2015, 'Adult', 28.00),
(1, 2016, 'Adult', 28.00),
(1, 2017, 'Adult', 28.00),
(1, 2018, 'Adult', 28.00),
(1, 2019, 'Adult', 28.00),
(1, 2020, 'Adult', 28.00),
(1, 2021, 'Adult', 28.00),
(1, 2022, 'Adult', 28.00),
(1, 2023, 'Adult', 28.00),
(1, 2024, 'Adult', 32.00),
(1, 2012, 'Senior', 15.00),
(1, 2013, 'Senior', 15.00),
(1, 2014, 'Senior', 15.00),
(1, 2015, 'Senior', 15.00),
(1, 2016, 'Senior', 15.00),
(1, 2017, 'Senior', 15.00),
(1, 2018, 'Senior', 15.00),
(1, 2019, 'Senior', 15.00),
(1, 2020, 'Senior', 15.00),
(1, 2021, 'Senior', 15.00),
(1, 2022, 'Senior', 15.00),
(1, 2023, 'Senior', 15.00),
(1, 2024, 'Senior', 18.00);

-- ZOO data
INSERT INTO prices (attraction_id, year, category, price) VALUES 
(2, 2012, 'Child', 13.00),
(2, 2013, 'Child', 14.00),
(2, 2014, 'Child', 18.00),
(2, 2015, 'Child', 21.00),
(2, 2016, 'Child', 22.00),
(2, 2017, 'Child', 22.00),
(2, 2018, 'Child', 23.00),
(2, 2019, 'Child', 25.00),
(2, 2020, 'Child', 25.00),
(2, 2021, 'Child', 25.00),
(2, 2022, 'Child', 31.00),
(2, 2023, 'Child', 33.00),
(2, 2024, 'Child', 34.00),
(2, 2012, 'Adult', 20.00),
(2, 2013, 'Adult', 22.00),
(2, 2014, 'Adult', 28.00),
(2, 2015, 'Adult', 32.00),
(2, 2016, 'Adult', 33.00),
(2, 2017, 'Adult', 33.00),
(2, 2018, 'Adult', 35.00),
(2, 2019, 'Adult', 37.00),
(2, 2020, 'Adult', 38.00),
(2, 2021, 'Adult', 37.00),
(2, 2022, 'Adult', 44.00),
(2, 2023, 'Adult', 48.00),
(2, 2024, 'Adult', 49.00),
(2, 2012, 'Senior', 15.00),
(2, 2013, 'Senior', 17.00),
(2, 2014, 'Senior', 23.00),
(2, 2015, 'Senior', 27.00),
(2, 2016, 'Senior', 28.00),
(2, 2017, 'Senior', 28.00),
(2, 2018, 'Senior', 30.00),
(2, 2019, 'Senior', 32.00),
(2, 2020, 'Senior', 33.00),
(2, 2021, 'Senior', 32.00),
(2, 2022, 'Senior', 39.00),
(2, 2023, 'Senior', 43.00),
(2, 2024, 'Senior', 44.00);

-- USS data
INSERT INTO prices (attraction_id, year, category, price) VALUES 
(3, 2012, 'Child', 54.00),
(3, 2013, 'Child', 54.00),
(3, 2014, 'Child', 54.00),
(3, 2015, 'Child', 54.00),
(3, 2016, 'Child', 54.00),
(3, 2017, 'Child', 56.00),
(3, 2018, 'Child', 56.00),
(3, 2019, 'Child', 59.00),
(3, 2020, 'Child', 59.00),
(3, 2021, 'Child', 61.00),
(3, 2022, 'Child', 61.00),
(3, 2023, 'Child', 61.00),
(3, 2024, 'Child', 62.00),
(3, 2012, 'Adult', 74.00),
(3, 2013, 'Adult', 74.00),
(3, 2014, 'Adult', 74.00),
(3, 2015, 'Adult', 74.00),
(3, 2016, 'Adult', 74.00),
(3, 2017, 'Adult', 76.00),
(3, 2018, 'Adult', 76.00),
(3, 2019, 'Adult', 79.00),
(3, 2020, 'Adult', 79.00),
(3, 2021, 'Adult', 81.00),
(3, 2022, 'Adult', 81.00),
(3, 2023, 'Adult', 82.00),
(3, 2024, 'Adult', 83.00),
(3, 2012, 'Senior', 36.00),
(3, 2013, 'Senior', 36.00),
(3, 2014, 'Senior', 36.00),
(3, 2015, 'Senior', 36.00),
(3, 2016, 'Senior', 36.00),
(3, 2017, 'Senior', 38.00),
(3, 2018, 'Senior', 38.00),
(3, 2019, 'Senior', 41.00),
(3, 2020, 'Senior', 41.00),
(3, 2021, 'Senior', 43.00),
(3, 2022, 'Senior', 43.00),
(3, 2023, 'Senior', 43.00),
(3, 2024, 'Senior', 43.00);

-- Mount Faber data
INSERT INTO prices (attraction_id, year, category, price) VALUES 
(4, 2012, 'Adult', 26.00),
(4, 2013, 'Adult', 26.00),
(4, 2014, 'Adult', 29.00),
(4, 2015, 'Adult', 29.00),
(4, 2016, 'Adult', 29.00),
(4, 2017, 'Adult', 33.00),
(4, 2018, 'Adult', 35.00),
(4, 2019, 'Adult', 35.00),
(4, 2020, 'Adult', 35.00),
(4, 2021, 'Adult', 35.00),
(4, 2022, 'Adult', 35.00),
(4, 2023, 'Adult', 35.00),
(4, 2024, 'Adult', 35.00),
(4, 2012, 'Child', 15.00),
(4, 2013, 'Child', 15.00),
(4, 2014, 'Child', 18.00),
(4, 2015, 'Child', 18.00),
(4, 2016, 'Child', 18.00),
(4, 2017, 'Child', 22.00),
(4, 2018, 'Child', 25.00),
(4, 2019, 'Child', 25.00),
(4, 2020, 'Child', 25.00),
(4, 2021, 'Child', 25.00),
(4, 2022, 'Child', 25.00),
(4, 2023, 'Child', 25.00),
(4, 2024, 'Child', 25.00),
(4, 2012, 'Senior', 20.00),
(4, 2013, 'Senior', 20.00),
(4, 2014, 'Senior', 23.00),
(4, 2015, 'Senior', 23.00),
(4, 2016, 'Senior', 23.00),
(4, 2017, 'Senior', 28.00),
(4, 2018, 'Senior', 30.00),
(4, 2019, 'Senior', 30.00),
(4, 2020, 'Senior', 30.00),
(4, 2021, 'Senior', 30.00),
(4, 2022, 'Senior', 30.00),
(4, 2023, 'Senior', 30.00),
(4, 2024, 'Senior', 30.00);