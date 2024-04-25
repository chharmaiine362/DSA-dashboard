/*******************
Cleaning Script
********************/
DROP TABLE IF EXISTS predictions;
DROP TABLE IF EXISTS prices;
DROP TABLE IF EXISTS company_attraction;
DROP TABLE IF EXISTS attractoins;
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
    name VARCHAR(255) NOT NULL UNIQUE
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
    isAdult BOOLEAN,
    price DECIMAL(10, 2),
    PRIMARY KEY (attraction_id, year, isAdult),
    CONSTRAINT fk_prices_attraction_id FOREIGN KEY (attraction_id) REFERENCES attractions(id) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS predictions (
    attraction_id INTEGER,
    year INTEGER NOT NULL,
    isAdult BOOLEAN,
    price DECIMAL(10, 2),
    PRIMARY KEY (attraction_id, year, isAdult),
    CONSTRAINT fk_predictions_attraction_id FOREIGN KEY (attraction_id) REFERENCES attractions(id) ON UPDATE CASCADE
);

/*******************
Insert Values
********************/
--
-- Data for Name: companies; Type: TABLE DATA;
--
INSERT INTO companies (name) VALUES ('Gardens by the Bay');
INSERT INTO companies (name) VALUES ('Mandai Wildlife Group');
INSERT INTO companies (name) VALUES ('Genting Singapore');
INSERT INTO companies (name) VALUES ('Mount Faber Leisure Group');

--
-- Data for Name: attractions; Type: TABLE DATA;
--
INSERT INTO attractions (name) VALUES ('Cloud Forest + Flower Dome');
INSERT INTO attractions (name) VALUES ('Singapore Zoo');
INSERT INTO attractions (name) VALUES ('Universal Studios Singapore');
INSERT INTO attractions (name) VALUES ('Cable Car Sky Pass');

--
-- Data for Name: company_attraction; Type: TABLE DATA;
--
INSERT INTO company_attraction (company_id, attraction_id) VALUES (1, 1);
INSERT INTO company_attraction (company_id, attraction_id) VALUES (2, 2);
INSERT INTO company_attraction (company_id, attraction_id) VALUES (3, 3);
INSERT INTO company_attraction (company_id, attraction_id) VALUES (4, 4);

--
-- Data for Name: prices; Type: TABLE DATA;
--
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2012, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2013, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2014, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2015, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2016, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2017, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2018, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2019, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2020, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2021, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2022, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2023, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2024, 0, 18.00);

INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2012, 1, 28.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2013, 1, 28.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2014, 1, 28.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2015, 1, 28.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2016, 1, 28.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2017, 1, 28.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2018, 1, 28.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2019, 1, 28.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2020, 1, 28.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2021, 1, 28.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2022, 1, 28.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2023, 1, 28.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (1, 2024, 1, 32.00);

INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2012, 0, 13.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2013, 0, 14.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2014, 0, 18.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2015, 0, 21.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2016, 0, 22.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2017, 0, 22.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2018, 0, 23.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2019, 0, 25.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2020, 0, 25.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2021, 0, 25.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2022, 0, 31.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2023, 0, 33.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2024, 0, 34.00);

INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2012, 1, 20.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2013, 1, 22.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2014, 1, 28.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2015, 1, 32.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2016, 1, 33.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2017, 1, 33.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2018, 1, 35.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2019, 1, 37.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2020, 1, 38.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2021, 1, 37.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2022, 1, 44.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2023, 1, 48.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (2, 2024, 1, 49.00);

INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2012, 0, 54.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2013, 0, 54.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2014, 0, 54.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2015, 0, 54.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2016, 0, 54.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2017, 0, 56.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2018, 0, 56.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2019, 0, 59.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2020, 0, 59.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2021, 0, 61.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2022, 0, 61.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2023, 0, 61.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2024, 0, 62.00);

INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2012, 1, 74.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2013, 1, 74.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2014, 1, 74.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2015, 1, 74.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2016, 1, 74.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2017, 1, 76.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2018, 1, 76.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2019, 1, 79.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2020, 1, 79.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2021, 1, 81.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2022, 1, 81.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2023, 1, 82.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (3, 2024, 1, 83.00);

INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2012, 1, 26.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2013, 1, 26.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2014, 1, 29.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2015, 1, 29.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2016, 1, 29.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2017, 1, 33.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2018, 1, 35.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2019, 1, 35.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2020, 1, 35.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2021, 1, 35.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2022, 1, 35.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2023, 1, 35.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2024, 1, 35.00);

INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2012, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2013, 0, 15.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2014, 0, 18.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2015, 0, 18.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2016, 0, 18.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2017, 0, 22.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2018, 0, 25.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2019, 0, 25.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2020, 0, 25.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2021, 0, 25.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2022, 0, 25.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2023, 0, 25.00);
INSERT INTO prices (attraction_id, year, isAdult, price) VALUES (4, 2024, 0, 25.00);