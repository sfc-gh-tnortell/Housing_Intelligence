-- ================================================================
-- HOUSING INTELLIGENCE HOUSE CHARACTERISTICS V2 - 60 PROPERTIES
-- ================================================================
-- Comprehensive property data across 5 states (TX, CA, FL, CO, AZ)
-- Each house will be sold to exactly one customer (1:1 relationship)

USE DATABASE HOUSING_INTELLIGENCE;
USE SCHEMA CORE;

-- ================================================================
-- HOUSE CHARACTERISTICS DATA - 60 properties (12 per state)
-- ================================================================
INSERT INTO HOUSE_CHARACTERISTICS VALUES
-- ================================================================
-- TEXAS PROPERTIES (2001-2012) - 12 properties
-- ================================================================
(2001, '2847 Barton Hills Drive', 'Austin', 'TX', '78704', 'Travis County', 4, 3.0, 2650, 9500, 2018, 'Single Family', 2, true, true, false, true, true, 'Hardwood', 'Central Air', 'Central Air', 'Barton Hills', 'Austin ISD', 88, 'Low', '0.5 miles to Zilker Park', '2022-01-15', 625000.00, 14200.00, 0.00, '2019-03-15', 485000.00, 'Excellent', 'Updated kitchen 2021, new HVAC 2020', 'A+'),

(2002, '1205 West 6th Street Unit 304', 'Austin', 'TX', '78703', 'Travis County', 2, 2.0, 1450, 0, 2019, 'Condo', 2, false, false, false, true, false, 'Luxury Vinyl', 'Central Air', 'Central Air', 'West 6th', 'Austin ISD', 95, 'Low', 'Walking distance to downtown', '2022-02-01', 385000.00, 7800.00, 425.00, '2020-08-12', 295000.00, 'Excellent', 'High-end finishes, city views', 'A'),

(2003, '15823 Spotted Eagle Drive', 'Austin', 'TX', '78738', 'Travis County', 5, 4.0, 3850, 12000, 2020, 'Single Family', 3, true, true, true, true, true, 'Travertine', 'Central Air', 'Central Air', 'Steiner Ranch', 'Leander ISD', 45, 'Low', 'Gated community, lake access', '2022-02-10', 875000.00, 18500.00, 320.00, '2021-01-20', 695000.00, 'Excellent', 'New construction, smart home features', 'A+'),

(2004, '3401 Red River Street', 'Austin', 'TX', '78751', 'Travis County', 3, 2.0, 1650, 6500, 2015, 'Townhouse', 2, false, true, false, true, false, 'Polished Concrete', 'Central Air', 'Central Air', 'Mueller', 'Austin ISD', 82, 'Low', '2 blocks to Mueller Lake Park', '2022-02-15', 465000.00, 9200.00, 185.00, '2017-06-30', 385000.00, 'Good', 'Modern design, energy efficient', 'A'),

(2005, '8317 Adirondack Trail', 'Austin', 'TX', '78759', 'Travis County', 4, 3.5, 2940, 10800, 2021, 'Single Family', 3, true, true, true, true, true, 'Hardwood', 'Central Air', 'Central Air', 'Anderson Mill', 'Round Rock ISD', 52, 'Low', 'Top-rated schools nearby', '2022-02-20', 745000.00, 16800.00, 0.00, NULL, NULL, 'Excellent', 'Brand new, builder upgrades', 'A+'),

(2006, '1122 Colorado Street Unit 2105', 'Austin', 'TX', '78701', 'Travis County', 1, 1.0, 980, 0, 2017, 'Condo', 1, false, false, false, false, false, 'Luxury Vinyl', 'Central Air', 'Central Air', 'Downtown Austin', 'Austin ISD', 98, 'Medium', 'Walking to everything downtown', '2022-03-01', 285000.00, 5600.00, 485.00, '2018-11-15', 225000.00, 'Good', 'High-rise living, downtown views', 'B+'),

(2007, '11604 Shoreview Drive', 'Austin', 'TX', '78732', 'Travis County', 3, 2.5, 2180, 8200, 2016, 'Single Family', 2, false, true, false, true, true, 'Tile', 'Central Air', 'Central Air', 'The Hills', 'Lake Travis ISD', 35, 'Low', 'Lake community amenities', '2022-03-05', 535000.00, 12400.00, 245.00, '2018-05-22', 445000.00, 'Excellent', 'Lake views, updated throughout', 'A'),

(2008, '4700 East Cesar Chavez Street', 'Austin', 'TX', '78702', 'Travis County', 2, 1.5, 1320, 5800, 2014, 'Duplex', 1, false, false, false, true, true, 'Stained Concrete', 'Central Air', 'Central Air', 'East Austin', 'Austin ISD', 79, 'Medium', 'Close to Franklin Barbecue', '2022-03-10', 385000.00, 7400.00, 0.00, '2016-09-10', 285000.00, 'Good', 'Trendy area, walkable to restaurants', 'B+'),

(2009, '12156 Timber Heights Drive', 'Houston', 'TX', '77043', 'Harris County', 5, 4.5, 4250, 15200, 2019, 'Single Family', 4, true, true, true, true, true, 'Marble', 'Central Air', 'Central Air', 'Memorial Villages', 'Spring Branch ISD', 62, 'Low', 'Country club community', '2022-07-15', 1285000.00, 28500.00, 0.00, '2020-12-08', 995000.00, 'Excellent', 'Luxury finishes, chef\'s kitchen', 'A+'),

(2010, '2801 Post Oak Boulevard Unit 4502', 'Houston', 'TX', '77056', 'Harris County', 3, 3.0, 2150, 0, 2020, 'Condo', 2, false, false, false, true, false, 'Hardwood', 'Central Air', 'Central Air', 'Galleria', 'HISD', 85, 'Low', 'Galleria shopping center', '2022-08-01', 685000.00, 12800.00, 650.00, NULL, NULL, 'Excellent', 'High-rise luxury, city skyline views', 'A'),

(2011, '6719 Brompton Road', 'Houston', 'TX', '77005', 'Harris County', 4, 3.0, 3180, 11500, 2017, 'Single Family', 3, false, true, false, true, true, 'Hardwood', 'Central Air', 'Central Air', 'West University', 'HISD', 78, 'Low', 'Top Houston school district', '2022-08-15', 925000.00, 19200.00, 0.00, '2019-04-18', 745000.00, 'Excellent', 'Traditional charm, modern updates', 'A'),

(2012, '1425 Reinicke Street', 'Houston', 'TX', '77007', 'Harris County', 2, 2.0, 1580, 4200, 2016, 'Townhouse', 2, false, true, false, true, false, 'Luxury Vinyl', 'Central Air', 'Central Air', 'Heights', 'HISD', 89, 'Medium', 'Walking to Heights shops', '2022-08-20', 485000.00, 8950.00, 125.00, '2018-02-14', 385000.00, 'Good', 'Historic Heights charm', 'B+'),

-- ================================================================
-- CALIFORNIA PROPERTIES (2013-2024) - 12 properties
-- ================================================================
(2013, '1847 Lombard Street', 'San Francisco', 'CA', '94123', 'San Francisco County', 3, 2.5, 2200, 3500, 2015, 'Townhouse', 2, false, true, false, true, false, 'Hardwood', 'Central Heat', 'None', 'Marina District', 'SFUSD', 98, 'Low', '2 blocks to Crissy Field', '2022-03-20', 1485000.00, 18500.00, 0.00, '2018-06-25', 1145000.00, 'Excellent', 'Classic SF architecture, bay views', 'A'),

(2014, '425 1st Street Unit 4901', 'San Francisco', 'CA', '94105', 'San Francisco County', 2, 2.0, 1350, 0, 2018, 'Condo', 1, false, false, false, false, false, 'Polished Concrete', 'Central Heat', 'None', 'SOMA', 'SFUSD', 94, 'Medium', 'Walking to tech companies', '2022-04-01', 925000.00, 14200.00, 785.00, '2020-03-12', 725000.00, 'Excellent', 'Modern high-rise, tech worker favorite', 'A'),

(2015, '2156 California Street', 'Mountain View', 'CA', '94040', 'Santa Clara County', 4, 3.0, 2680, 7200, 2019, 'Single Family', 3, false, true, true, true, true, 'Hardwood', 'Central Heat', 'Central AC', 'Whisman School Area', 'Mountain View Whisman', 82, 'Low', '1 mile to Google campus', '2022-04-10', 1625000.00, 19800.00, 0.00, '2021-01-15', 1285000.00, 'Excellent', 'Tech hub location, modern upgrades', 'A+'),

(2016, '12847 Saratoga Sunnyvale Road', 'Saratoga', 'CA', '95070', 'Santa Clara County', 5, 4.5, 3950, 18500, 2020, 'Single Family', 4, true, true, true, true, true, 'Marble', 'Central Heat', 'Central AC', 'Saratoga Hills', 'Saratoga Union School District', 65, 'Low', 'Wine country foothills', '2022-04-15', 2285000.00, 27500.00, 0.00, NULL, NULL, 'Excellent', 'Luxury estate, wine cellar', 'A+'),

(2017, '847 The Alameda Unit 12', 'San Jose', 'CA', '95126', 'Santa Clara County', 2, 2.0, 1420, 0, 2017, 'Condo', 2, false, false, false, true, false, 'Laminate', 'Central Heat', 'Central AC', 'Alameda', 'San Jose USD', 75, 'Medium', 'Light rail accessible', '2022-04-20', 785000.00, 9200.00, 425.00, '2019-08-30', 595000.00, 'Good', 'Transit-oriented living', 'B+'),

(2018, '3421 Piedmont Avenue', 'Oakland', 'CA', '94611', 'Alameda County', 3, 2.0, 1850, 6800, 2014, 'Single Family', 2, false, true, false, true, true, 'Hardwood', 'Central Heat', 'None', 'Piedmont Hills', 'Oakland USD', 89, 'Medium', 'Walking to Piedmont shops', '2022-05-01', 945000.00, 11500.00, 0.00, '2017-11-22', 725000.00, 'Good', 'Charming Oakland hills home', 'B+'),

(2019, '2847 State Street', 'Santa Barbara', 'CA', '93105', 'Santa Barbara County', 4, 3.5, 3180, 9500, 2018, 'Single Family', 3, true, true, false, true, true, 'Tile', 'Central Heat', 'Central AC', 'Upper State', 'Santa Barbara USD', 72, 'Low', '5 minutes to beaches', '2022-05-05', 1485000.00, 16800.00, 0.00, '2020-07-15', 1185000.00, 'Excellent', 'Spanish-style, ocean breezes', 'A'),

(2020, '1247 Nob Hill Circle', 'Los Angeles', 'CA', '90210', 'Los Angeles County', 6, 5.5, 4850, 22000, 2021, 'Single Family', 4, true, true, true, true, true, 'Marble', 'Central Heat', 'Central AC', 'Beverly Hills', 'Beverly Hills USD', 78, 'Low', 'Beverly Hills adjacent', '2022-05-10', 3485000.00, 38500.00, 0.00, NULL, NULL, 'Excellent', 'Modern luxury estate', 'A+'),

(2021, '825 Prospect Street Unit 301', 'La Jolla', 'CA', '92037', 'San Diego County', 2, 2.0, 1680, 0, 2019, 'Condo', 2, false, false, false, true, false, 'Luxury Vinyl', 'Central Heat', 'Central AC', 'La Jolla Village', 'San Diego USD', 85, 'Low', 'Walking to La Jolla Cove', '2022-05-15', 1185000.00, 12500.00, 565.00, '2021-03-08', 925000.00, 'Excellent', 'Ocean views, luxury finishes', 'A'),

(2022, '4567 Park Boulevard', 'San Diego', 'CA', '92116', 'San Diego County', 3, 2.0, 1950, 7200, 2016, 'Single Family', 2, false, true, false, true, true, 'Hardwood', 'Central Heat', 'Central AC', 'University Heights', 'San Diego USD', 79, 'Medium', 'Walking to Balboa Park', '2022-05-20', 785000.00, 8900.00, 0.00, '2018-12-05', 585000.00, 'Good', 'Character home near park', 'B+'),

(2023, '2156 J Street', 'Sacramento', 'CA', '95816', 'Sacramento County', 3, 2.5, 2080, 8500, 2017, 'Single Family', 2, false, true, false, true, true, 'Hardwood', 'Central Heat', 'Central AC', 'Midtown', 'Sacramento City USD', 88, 'Medium', 'Capitol building area', '2022-06-01', 585000.00, 7200.00, 0.00, '2019-05-18', 445000.00, 'Good', 'Historic midtown charm', 'B+'),

(2024, '867 Vine Street', 'Napa', 'CA', '94559', 'Napa County', 4, 3.0, 2750, 12500, 2019, 'Single Family', 3, false, true, true, true, true, 'Hardwood', 'Central Heat', 'Central AC', 'Downtown Napa', 'Napa Valley USD', 68, 'Low', 'Walking to wineries', '2022-06-05', 1385000.00, 15200.00, 0.00, '2020-09-22', 1085000.00, 'Excellent', 'Wine country lifestyle', 'A'),

-- ================================================================
-- FLORIDA PROPERTIES (2025-2036) - 12 properties
-- ================================================================
(2025, '1247 Ocean Drive Unit 1205', 'Miami Beach', 'FL', '33139', 'Miami-Dade County', 2, 2.0, 1450, 0, 2018, 'Condo', 2, false, false, false, true, false, 'Marble', 'Central AC', 'Central AC', 'South Beach', 'Miami-Dade Schools', 95, 'Medium', 'Ocean front building', '2022-04-15', 785000.00, 8500.00, 625.00, '2020-02-28', 595000.00, 'Excellent', 'Art Deco building, ocean views', 'A'),

(2026, '8456 SW 72nd Avenue', 'Miami', 'FL', '33143', 'Miami-Dade County', 4, 3.0, 2650, 11200, 2017, 'Single Family', 3, true, true, false, true, true, 'Tile', 'Central AC', 'Central AC', 'Pinecrest', 'Miami-Dade Schools', 65, 'Low', 'Top-rated schools', '2022-04-20', 685000.00, 9800.00, 0.00, '2019-07-12', 525000.00, 'Excellent', 'Family neighborhood, pool', 'A'),

(2027, '2156 Bayshore Drive', 'Tampa', 'FL', '33606', 'Hillsborough County', 3, 2.5, 2180, 8500, 2019, 'Townhouse', 2, false, true, false, true, true, 'Luxury Vinyl', 'Central AC', 'Central AC', 'Bayshore', 'Hillsborough Schools', 78, 'Low', 'Tampa Bay waterfront', '2022-04-25', 485000.00, 6200.00, 285.00, '2021-01-20', 395000.00, 'Excellent', 'Waterfront community', 'A'),

(2028, '756 Las Olas Boulevard Unit 4A', 'Fort Lauderdale', 'FL', '33301', 'Broward County', 1, 1.5, 1180, 0, 2020, 'Condo', 1, false, false, false, false, false, 'Luxury Vinyl', 'Central AC', 'Central AC', 'Las Olas', 'Broward Schools', 92, 'Low', 'Las Olas entertainment', '2022-05-01', 425000.00, 4800.00, 485.00, NULL, NULL, 'Excellent', 'High-rise downtown living', 'A'),

(2029, '3847 Millenia Boulevard', 'Orlando', 'FL', '32839', 'Orange County', 4, 3.0, 2850, 10500, 2018, 'Single Family', 3, true, true, true, true, true, 'Tile', 'Central AC', 'Central AC', 'Millenia', 'Orange County Schools', 58, 'Low', 'Close to theme parks', '2022-05-05', 565000.00, 7800.00, 0.00, '2020-06-15', 445000.00, 'Excellent', 'Resort-style community', 'A'),

(2030, '1847 1st Street North', 'Jacksonville', 'FL', '32250', 'Duval County', 3, 2.0, 1950, 7800, 2016, 'Single Family', 2, false, true, false, true, true, 'Laminate', 'Central AC', 'Central AC', 'Jacksonville Beach', 'Duval County Schools', 72, 'Medium', '10 minutes to beaches', '2022-05-10', 385000.00, 5200.00, 0.00, '2018-09-30', 295000.00, 'Good', 'Beach community lifestyle', 'B+'),

(2031, '4567 Gulf Shore Drive', 'Naples', 'FL', '34108', 'Collier County', 3, 3.0, 2450, 8500, 2019, 'Condo', 2, false, false, false, true, false, 'Luxury Vinyl', 'Central AC', 'Central AC', 'Pelican Bay', 'Collier County Schools', 45, 'Low', 'Gulf of Mexico access', '2022-05-15', 685000.00, 8200.00, 485.00, '2021-04-08', 545000.00, 'Excellent', 'Resort-style beachfront', 'A'),

(2032, '2847 Central Avenue', 'St. Petersburg', 'FL', '33701', 'Pinellas County', 2, 2.0, 1580, 5200, 2017, 'Townhouse', 1, false, true, false, true, true, 'Hardwood', 'Central AC', 'Central AC', 'Grand Central', 'Pinellas County Schools', 85, 'Medium', 'Downtown arts district', '2022-05-20', 385000.00, 4800.00, 185.00, '2019-11-22', 295000.00, 'Good', 'Arts district revitalization', 'B+'),

(2033, '1456 Worth Avenue', 'Palm Beach', 'FL', '33480', 'Palm Beach County', 4, 4.0, 3450, 15200, 2020, 'Single Family', 4, true, true, true, true, true, 'Marble', 'Central AC', 'Central AC', 'Worth Avenue', 'Palm Beach County Schools', 68, 'Low', 'Luxury shopping district', '2022-06-01', 1485000.00, 18500.00, 0.00, NULL, NULL, 'Excellent', 'Palm Beach luxury estate', 'A+'),

(2034, '8567 University Drive', 'Gainesville', 'FL', '32611', 'Alachua County', 3, 2.0, 1750, 6800, 2015, 'Single Family', 2, false, true, false, true, true, 'Laminate', 'Central AC', 'Central AC', 'University Area', 'Alachua County Schools', 78, 'Medium', 'Walking to UF campus', '2022-06-05', 285000.00, 3200.00, 0.00, '2017-08-15', 225000.00, 'Good', 'College town charm', 'B'),

(2035, '5678 Overseas Highway', 'Key Largo', 'FL', '33037', 'Monroe County', 2, 2.0, 1680, 8500, 2019, 'Single Family', 2, false, true, false, true, true, 'Tile', 'Central AC', 'Central AC', 'Ocean Reef', 'Monroe County Schools', 42, 'Low', 'Ocean access community', '2022-06-10', 785000.00, 6200.00, 0.00, '2021-05-18', 625000.00, 'Excellent', 'Keys lifestyle, water views', 'A'),

(2036, '9876 Bayfront Drive', 'Sarasota', 'FL', '34236', 'Sarasota County', 3, 2.5, 2150, 9200, 2018, 'Condo', 2, false, false, false, true, false, 'Luxury Vinyl', 'Central AC', 'Central AC', 'Bayfront', 'Sarasota County Schools', 75, 'Low', 'Sarasota Bay waterfront', '2022-06-15', 585000.00, 6800.00, 425.00, '2020-10-12', 465000.00, 'Excellent', 'Cultural arts community', 'A'),

-- ================================================================
-- COLORADO PROPERTIES (2037-2048) - 12 properties
-- ================================================================
(2037, '1847 17th Street', 'Denver', 'CO', '80202', 'Denver County', 3, 2.5, 2180, 4500, 2018, 'Townhouse', 2, false, true, false, true, false, 'Hardwood', 'Forced Air', 'Central AC', 'Highland', 'Denver Public Schools', 89, 'Medium', 'LoDo entertainment district', '2022-05-15', 585000.00, 6800.00, 225.00, '2020-03-22', 465000.00, 'Excellent', 'Urban living, mountain views', 'A'),

(2038, '2456 Arapahoe Avenue', 'Boulder', 'CO', '80302', 'Boulder County', 4, 3.0, 2750, 8500, 2019, 'Single Family', 3, false, true, true, true, true, 'Hardwood', 'Radiant Heat', 'Central AC', 'Mapleton Hill', 'Boulder Valley Schools', 82, 'Low', 'Flatirons hiking trails', '2022-05-20', 785000.00, 8200.00, 0.00, '2021-07-15', 625000.00, 'Excellent', 'Boulder lifestyle, outdoor access', 'A'),

(2039, '3567 Tejon Street', 'Colorado Springs', 'CO', '80907', 'El Paso County', 3, 2.0, 1850, 7200, 2017, 'Single Family', 2, false, true, false, true, true, 'Laminate', 'Forced Air', 'Swamp Cooler', 'Old Colorado City', 'District 11', 68, 'Low', 'Pikes Peak views', '2022-05-25', 425000.00, 4200.00, 0.00, '2019-04-30', 325000.00, 'Good', 'Historic area, mountain proximity', 'B+'),

(2040, '4678 13th Avenue', 'Denver', 'CO', '80204', 'Denver County', 2, 2.0, 1420, 3200, 2016, 'Condo', 1, false, false, false, true, false, 'Polished Concrete', 'Forced Air', 'Central AC', 'Capitol Hill', 'Denver Public Schools', 94, 'Medium', 'Walking to downtown', '2022-06-01', 485000.00, 5200.00, 325.00, '2018-11-18', 385000.00, 'Good', 'Hip neighborhood, walkable', 'B+'),

(2041, '5789 Main Street', 'Fort Collins', 'CO', '80524', 'Larimer County', 4, 3.5, 2950, 9800, 2020, 'Single Family', 3, true, true, true, true, true, 'Tile', 'Radiant Heat', 'Central AC', 'Old Town', 'Poudre School District', 78, 'Low', 'CSU campus nearby', '2022-06-05', 685000.00, 7200.00, 0.00, NULL, NULL, 'Excellent', 'New construction, energy efficient', 'A+'),

(2042, '6890 Village Road', 'Keystone', 'CO', '80435', 'Summit County', 3, 2.5, 1950, 5200, 2019, 'Condo', 2, false, false, false, true, false, 'Hardwood', 'Radiant Heat', 'None', 'River Run Village', 'Summit School District', 25, 'Low', 'Ski-in/ski-out access', '2022-06-10', 785000.00, 4200.00, 485.00, '2021-02-15', 625000.00, 'Excellent', 'Mountain resort living', 'A'),

(2043, '7901 Vail Valley Drive', 'Vail', 'CO', '81657', 'Eagle County', 4, 4.0, 3450, 8500, 2021, 'Single Family', 3, true, true, true, true, true, 'Hardwood', 'Radiant Heat', 'None', 'Vail Village', 'Eagle County Schools', 15, 'Low', 'World-class skiing', '2022-06-15', 2185000.00, 12500.00, 0.00, NULL, NULL, 'Excellent', 'Luxury ski resort home', 'A+'),

(2044, '8012 Canyon Boulevard', 'Boulder', 'CO', '80302', 'Boulder County', 2, 1.5, 1320, 2800, 2018, 'Condo', 1, false, false, false, false, false, 'Luxury Vinyl', 'Forced Air', 'Central AC', 'The Hill', 'Boulder Valley Schools', 89, 'Low', 'CU Boulder campus', '2022-06-20', 485000.00, 4800.00, 385.00, '2020-08-25', 385000.00, 'Good', 'University area, walkable', 'B+'),

(2045, '9123 Cherry Creek Drive', 'Denver', 'CO', '80246', 'Denver County', 3, 3.0, 2350, 6500, 2017, 'Townhouse', 2, false, true, false, true, true, 'Hardwood', 'Forced Air', 'Central AC', 'Cherry Creek', 'Cherry Creek Schools', 85, 'Low', 'High-end shopping district', '2022-06-25', 785000.00, 8500.00, 425.00, '2019-12-10', 625000.00, 'Excellent', 'Luxury shopping area', 'A'),

(2046, '1034 Washington Avenue', 'Golden', 'CO', '80401', 'Jefferson County', 3, 2.0, 1750, 6200, 2016, 'Single Family', 2, false, true, false, true, true, 'Laminate', 'Forced Air', 'Swamp Cooler', 'Downtown Golden', 'Jefferson County Schools', 72, 'Low', 'Coors Brewery tours', '2022-07-01', 485000.00, 5200.00, 0.00, '2018-05-15', 385000.00, 'Good', 'Small town charm, brewery culture', 'B+'),

(2047, '1145 Ski Hill Road', 'Breckenridge', 'CO', '80424', 'Summit County', 2, 2.0, 1450, 0, 2019, 'Condo', 1, false, false, false, true, false, 'Carpet', 'Radiant Heat', 'None', 'Peak 9 Base', 'Summit School District', 18, 'Low', 'Ski lift access', '2022-07-05', 585000.00, 3200.00, 525.00, '2021-06-20', 465000.00, 'Excellent', 'Ski resort condo', 'A'),

(2048, '1256 University Boulevard', 'Denver', 'CO', '80206', 'Denver County', 4, 2.5, 2450, 7800, 2020, 'Single Family', 2, false, true, false, true, true, 'Hardwood', 'Forced Air', 'Central AC', 'Glendale', 'Cherry Creek Schools', 75, 'Low', 'DU campus nearby', '2022-07-10', 685000.00, 7200.00, 0.00, NULL, NULL, 'Excellent', 'University area, family-friendly', 'A'),

-- ================================================================
-- ARIZONA PROPERTIES (2049-2060) - 12 properties
-- ================================================================
(2049, '7890 Camelback Road', 'Scottsdale', 'AZ', '85251', 'Maricopa County', 4, 3.5, 3250, 12500, 2019, 'Single Family', 3, true, true, false, true, true, 'Travertine', 'Central AC', 'Central AC', 'McCormick Ranch', 'Scottsdale USD', 45, 'Low', 'Golf course community', '2022-06-15', 785000.00, 6200.00, 0.00, '2021-03-20', 625000.00, 'Excellent', 'Desert luxury, golf course views', 'A'),

(2050, '1234 Central Avenue Unit 1205', 'Phoenix', 'AZ', '85004', 'Maricopa County', 2, 2.0, 1380, 0, 2020, 'Condo', 2, false, false, false, false, false, 'Luxury Vinyl', 'Central AC', 'Central AC', 'Midtown Phoenix', 'Phoenix Elementary District', 88, 'Medium', 'Downtown Phoenix', '2022-06-20', 385000.00, 3200.00, 425.00, NULL, NULL, 'Excellent', 'Urban loft-style living', 'A'),

(2051, '2345 Desert Vista Drive', 'Phoenix', 'AZ', '85048', 'Maricopa County', 3, 2.0, 2150, 8500, 2018, 'Single Family', 2, true, false, false, true, true, 'Tile', 'Central AC', 'Central AC', 'Ahwatukee', 'Kyrene Elementary District', 52, 'Low', 'South Mountain views', '2022-06-25', 485000.00, 4800.00, 0.00, '2020-01-15', 385000.00, 'Good', 'Family-friendly community', 'B+'),

(2052, '3456 University Drive', 'Tempe', 'AZ', '85281', 'Maricopa County', 2, 1.5, 1250, 3200, 2017, 'Condo', 1, false, false, false, true, false, 'Laminate', 'Central AC', 'Central AC', 'Mill Avenue', 'Tempe Elementary District', 92, 'Medium', 'ASU campus area', '2022-07-01', 325000.00, 2800.00, 285.00, '2019-06-30', 265000.00, 'Good', 'University area, nightlife', 'B'),

(2053, '4567 Golf Club Drive', 'Chandler', 'AZ', '85249', 'Maricopa County', 4, 3.0, 2850, 10200, 2019, 'Single Family', 3, false, true, false, true, true, 'Tile', 'Central AC', 'Central AC', 'Ocotillo', 'Chandler USD', 48, 'Low', 'Golf course living', '2022-07-05', 585000.00, 5200.00, 0.00, '2021-08-12', 465000.00, 'Excellent', 'Golf community amenities', 'A'),

(2054, '5678 Speedway Boulevard', 'Tucson', 'AZ', '85719', 'Pima County', 3, 2.0, 1850, 7200, 2016, 'Single Family', 2, false, false, false, true, true, 'Saltillo Tile', 'Evaporative', 'Central AC', 'Sam Hughes', 'Tucson USD', 68, 'Medium', 'University of Arizona', '2022-07-10', 385000.00, 3200.00, 0.00, '2018-10-22', 295000.00, 'Good', 'Historic neighborhood charm', 'B+'),

(2055, '6789 Northern Avenue', 'Glendale', 'AZ', '85301', 'Maricopa County', 3, 2.5, 2180, 8200, 2020, 'Single Family', 2, true, true, false, true, true, 'Luxury Vinyl', 'Central AC', 'Central AC', 'Arrowhead Ranch', 'Glendale Elementary District', 42, 'Low', 'Sports complex nearby', '2022-07-15', 485000.00, 4200.00, 0.00, NULL, NULL, 'Excellent', 'New construction, family community', 'A'),

(2056, '7890 Scottsdale Road Unit 502', 'Scottsdale', 'AZ', '85253', 'Maricopa County', 2, 2.0, 1450, 0, 2018, 'Condo', 2, false, false, false, true, false, 'Travertine', 'Central AC', 'Central AC', 'Old Town Scottsdale', 'Scottsdale USD', 78, 'Low', 'Old Town entertainment', '2022-07-20', 485000.00, 4200.00, 485.00, '2020-04-15', 385000.00, 'Excellent', 'Resort-style amenities', 'A'),

(2057, '8901 Pinnacle Peak Road', 'Scottsdale', 'AZ', '85255', 'Maricopa County', 5, 4.5, 4250, 18500, 2021, 'Single Family', 4, true, true, true, true, true, 'Travertine', 'Central AC', 'Central AC', 'Troon North', 'Scottsdale USD', 25, 'Low', 'Desert Mountain golf', '2022-07-25', 1485000.00, 8500.00, 0.00, NULL, NULL, 'Excellent', 'Luxury desert estate', 'A+'),

(2058, '9012 Campbell Avenue', 'Tucson', 'AZ', '85718', 'Pima County', 2, 2.0, 1420, 5200, 2017, 'Townhouse', 1, false, true, false, true, true, 'Tile', 'Evaporative', 'Central AC', 'Campbell Corridor', 'Tucson USD', 72, 'Medium', 'Foothills hiking trails', '2022-08-01', 285000.00, 2800.00, 185.00, '2019-09-18', 225000.00, 'Good', 'Mountain views, hiking access', 'B+'),

(2059, '1123 Carefree Highway', 'Carefree', 'AZ', '85377', 'Maricopa County', 3, 2.5, 2450, 15200, 2019, 'Single Family', 3, false, true, true, true, true, 'Saltillo Tile', 'Central AC', 'Central AC', 'Desert Foothills', 'Cave Creek USD', 15, 'Low', 'Desert preserve access', '2022-08-05', 685000.00, 4500.00, 0.00, '2021-11-30', 545000.00, 'Excellent', 'Desert luxury, mountain views', 'A'),

(2060, '1234 Mill Avenue Unit 304', 'Tempe', 'AZ', '85281', 'Maricopa County', 1, 1.0, 980, 0, 2019, 'Condo', 1, false, false, false, false, false, 'Polished Concrete', 'Central AC', 'Central AC', 'Downtown Tempe', 'Tempe Elementary District', 95, 'Medium', 'ASU campus walking', '2022-08-10', 285000.00, 2200.00, 385.00, '2021-01-25', 225000.00, 'Good', 'Student housing, downtown', 'B');

-- ================================================================
-- VERIFY DATA INSERTION
-- ================================================================
SELECT 'HOUSE_CHARACTERISTICS' AS TABLE_NAME, COUNT(*) AS RECORD_COUNT FROM HOUSE_CHARACTERISTICS
UNION ALL
SELECT 'Properties by State:' AS INFO, 'TX: 12, CA: 12, FL: 12, CO: 12, AZ: 12' AS DISTRIBUTION
UNION ALL
SELECT 'Property Types:' AS INFO, 'Single Family, Condo, Townhouse, Duplex' AS TYPES
UNION ALL
SELECT 'Price Range:' AS INFO, '$285K - $3.485M (diverse market segments)' AS RANGE
UNION ALL
SELECT 'Year Built Range:' AS INFO, '2014-2021 (modern properties)' AS BUILD_YEARS
UNION ALL
SELECT 'Ready for 1:1 Sales:' AS STATUS, 'Each house will sell to exactly one customer' AS CONFIRMATION;

-- ================================================================
-- PROPERTY MARKET ANALYSIS
-- ================================================================
-- Average prices by state
SELECT 
    STATE,
    COUNT(*) AS PROPERTY_COUNT,
    ROUND(AVG(LISTING_PRICE), 0) AS AVG_LISTING_PRICE,
    ROUND(MIN(LISTING_PRICE), 0) AS MIN_PRICE,
    ROUND(MAX(LISTING_PRICE), 0) AS MAX_PRICE,
    ROUND(AVG(SQUARE_FOOTAGE), 0) AS AVG_SQFT,
    ROUND(AVG(LISTING_PRICE / SQUARE_FOOTAGE), 0) AS AVG_PRICE_PER_SQFT
FROM HOUSE_CHARACTERISTICS
GROUP BY STATE
ORDER BY AVG_LISTING_PRICE DESC;

-- Property type distribution
SELECT 
    PROPERTY_TYPE,
    COUNT(*) AS COUNT,
    ROUND(AVG(LISTING_PRICE), 0) AS AVG_PRICE,
    ROUND(AVG(SQUARE_FOOTAGE), 0) AS AVG_SQFT
FROM HOUSE_CHARACTERISTICS
GROUP BY PROPERTY_TYPE
ORDER BY AVG_PRICE DESC;

COMMENT ON TABLE HOUSE_CHARACTERISTICS IS '60 properties across 5 states with comprehensive details, market data, and condition information for 1:1 customer sales';