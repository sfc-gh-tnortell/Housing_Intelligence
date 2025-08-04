-- ================================================================
-- PURCHASE AGREEMENT REGISTRATION - V2 DATA
-- ================================================================
-- Register 60 purchase agreement PDFs with actual sales data

USE DATABASE HOUSING_INTELLIGENCE;
USE SCHEMA CORE;

-- Register each purchase agreement with actual metadata

CALL REGISTER_PURCHASE_AGREEMENT(
    4001,
    'agreement_4001.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4001.pdf',
    '2022-02-13',
    '2022-03-15',
    'Inspection contingency passed | Financing: Conventional | Down Payment: $123,000.00 | Loan: $492,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4002,
    'agreement_4002.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4002.pdf',
    '2022-02-20',
    '2022-03-22',
    'FHA inspection contingency | Financing: FHA | Down Payment: $18,750.00 | Loan: $356,250.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4003,
    'agreement_4003.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4003.pdf',
    '2022-03-06',
    '2022-04-05',
    'Luxury home inspection passed | Financing: Jumbo | Down Payment: $250,000.00 | Loan: $1,000,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4004,
    'agreement_4004.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4004.pdf',
    '2022-03-13',
    '2022-04-12',
    'FHA financing contingency | Financing: FHA | Down Payment: $13,750.00 | Loan: $261,250.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4005,
    'agreement_4005.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4005.pdf',
    '2022-03-19',
    '2022-04-18',
    'SF inspection and earthquake contingency | Financing: Jumbo | Down Payment: $285,000.00 | Loan: $1,140,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4006,
    'agreement_4006.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4006.pdf',
    '2022-03-26',
    '2022-04-25',
    'Tech company relocation package | Financing: Conventional | Down Payment: $177,000.00 | Loan: $708,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4007,
    'agreement_4007.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4007.pdf',
    '2022-04-10',
    '2022-05-10',
    'Cash purchase, no financing contingency | Cash Purchase: $725,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4008,
    'agreement_4008.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4008.pdf',
    '2022-04-17',
    '2022-05-17',
    'First-time buyer FHA program | Financing: FHA | Down Payment: $18,750.00 | Loan: $356,250.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4009,
    'agreement_4009.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4009.pdf',
    '2022-04-24',
    '2022-05-24',
    'Family home with lake access | Financing: Conventional | Down Payment: $103,000.00 | Loan: $412,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4010,
    'agreement_4010.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4010.pdf',
    '2022-05-03',
    '2022-06-02',
    'Conventional financing approved | Financing: Conventional | Down Payment: $133,000.00 | Loan: $532,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4011,
    'agreement_4011.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4011.pdf',
    '2022-05-09',
    '2022-06-08',
    'Tech executive relocation | Financing: Jumbo | Down Payment: $315,000.00 | Loan: $1,260,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4012,
    'agreement_4012.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4012.pdf',
    '2022-05-16',
    '2022-06-15',
    'Biotech professional purchase | Financing: Conventional | Down Payment: $153,000.00 | Loan: $612,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4013,
    'agreement_4013.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4013.pdf',
    '2022-06-12',
    '2022-07-12',
    'American Airlines executive purchase | Financing: Conventional | Down Payment: $179,000.00 | Loan: $716,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4014,
    'agreement_4014.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4014.pdf',
    '2022-06-20',
    '2022-07-20',
    'Tech professional Heights purchase | Financing: Conventional | Down Payment: $93,000.00 | Loan: $372,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4015,
    'agreement_4015.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4015.pdf',
    '2022-07-06',
    '2022-08-05',
    'Energy professional luxury purchase | Financing: Jumbo | Down Payment: $165,000.00 | Loan: $660,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4016,
    'agreement_4016.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4016.pdf',
    '2022-07-16',
    '2022-08-15',
    'Creative professional Mueller home | Financing: Conventional | Down Payment: $89,000.00 | Loan: $356,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4017,
    'agreement_4017.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4017.pdf',
    '2022-07-23',
    '2022-08-22',
    'Cash purchase luxury estate | Cash Purchase: $2,225,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4018,
    'agreement_4018.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4018.pdf',
    '2022-08-06',
    '2022-09-05',
    'State employee purchase | Financing: Conventional | Down Payment: $105,000.00 | Loan: $420,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4019,
    'agreement_4019.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4019.pdf',
    '2022-09-12',
    '2022-10-12',
    'Tech startup founder cash purchase | Cash Purchase: $1,395,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4020,
    'agreement_4020.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4020.pdf',
    '2022-09-20',
    '2022-10-20',
    'Market correction pricing | Financing: Conventional | Down Payment: $123,000.00 | Loan: $492,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4021,
    'agreement_4021.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4021.pdf',
    '2022-10-09',
    '2022-11-08',
    'Real estate developer purchase | Financing: Jumbo | Down Payment: $277,000.00 | Loan: $1,108,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4022,
    'agreement_4022.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4022.pdf',
    '2022-10-19',
    '2022-11-18',
    'Qualcomm executive purchase | Financing: Conventional | Down Payment: $153,000.00 | Loan: $612,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4023,
    'agreement_4023.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4023.pdf',
    '2022-11-02',
    '2022-12-02',
    'Marine biologist purchase | Financing: Conventional | Down Payment: $139,000.00 | Loan: $556,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4024,
    'agreement_4024.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4024.pdf',
    '2022-11-15',
    '2022-12-15',
    'Aerospace engineer purchase | Financing: Conventional | Down Payment: $113,000.00 | Loan: $452,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4025,
    'agreement_4025.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4025.pdf',
    '2022-12-13',
    '2023-01-12',
    'International banker Miami Beach | Financing: Conventional | Down Payment: $153,000.00 | Loan: $612,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4026,
    'agreement_4026.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4026.pdf',
    '2022-12-21',
    '2023-01-20',
    'Healthcare admin first-time buyer | Financing: FHA | Down Payment: $20,750.00 | Loan: $394,250.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4027,
    'agreement_4027.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4027.pdf',
    '2023-01-09',
    '2023-02-08',
    'Disney manager family purchase | Financing: Conventional | Down Payment: $93,000.00 | Loan: $372,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4028,
    'agreement_4028.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4028.pdf',
    '2023-01-19',
    '2023-02-18',
    'Cruise line executive purchase | Financing: FHA | Down Payment: $20,250.00 | Loan: $384,750.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4029,
    'agreement_4029.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4029.pdf',
    '2023-01-26',
    '2023-02-25',
    'Tech professional Denver purchase | Financing: Conventional | Down Payment: $113,000.00 | Loan: $452,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4030,
    'agreement_4030.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4030.pdf',
    '2023-02-06',
    '2023-03-08',
    'Environmental scientist Boulder | Financing: Conventional | Down Payment: $101,000.00 | Loan: $404,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4031,
    'agreement_4031.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4031.pdf',
    '2023-03-13',
    '2023-04-12',
    'Air Force officer VA purchase | Financing: VA | Down Payment: $0.00 | Loan: $415,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4032,
    'agreement_4032.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4032.pdf',
    '2023-03-21',
    '2023-04-20',
    'Veterinarian Fort Collins purchase | Financing: Conventional | Down Payment: $113,000.00 | Loan: $452,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4033,
    'agreement_4033.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4033.pdf',
    '2023-03-29',
    '2023-04-28',
    'Logistics manager Jacksonville | Financing: Conventional | Down Payment: $85,000.00 | Loan: $340,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4034,
    'agreement_4034.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4034.pdf',
    '2023-04-05',
    '2023-05-05',
    'Museum curator St. Petersburg | Financing: FHA | Down Payment: $18,250.00 | Loan: $346,750.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4035,
    'agreement_4035.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4035.pdf',
    '2023-04-15',
    '2023-05-15',
    'Investment advisor Sarasota | Financing: Conventional | Down Payment: $109,000.00 | Loan: $436,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4036,
    'agreement_4036.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4036.pdf',
    '2023-04-25',
    '2023-05-25',
    'Real estate agent purchase | Financing: Conventional | Down Payment: $77,000.00 | Loan: $308,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4037,
    'agreement_4037.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4037.pdf',
    '2023-06-08',
    '2023-07-08',
    'State government Tallahassee | Financing: Conventional | Down Payment: $83,000.00 | Loan: $332,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4038,
    'agreement_4038.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4038.pdf',
    '2023-06-18',
    '2023-07-18',
    'Resort manager Naples luxury | Financing: Conventional | Down Payment: $97,000.00 | Loan: $388,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4039,
    'agreement_4039.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4039.pdf',
    '2023-07-03',
    '2023-08-02',
    'NASA engineer Space Coast | Financing: Conventional | Down Payment: $77,000.00 | Loan: $308,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4040,
    'agreement_4040.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4040.pdf',
    '2023-07-16',
    '2023-08-15',
    'University researcher Gainesville | Financing: FHA | Down Payment: $15,750.00 | Loan: $299,250.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4041,
    'agreement_4041.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4041.pdf',
    '2023-07-23',
    '2023-08-22',
    'Business consultant cash purchase | Cash Purchase: $665,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4042,
    'agreement_4042.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4042.pdf',
    '2023-08-06',
    '2023-09-05',
    'Ski instructor Vail purchase | Financing: Conventional | Down Payment: $91,000.00 | Loan: $364,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4043,
    'agreement_4043.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4043.pdf',
    '2023-08-13',
    '2023-09-12',
    'Real estate broker Scottsdale | Financing: Conventional | Down Payment: $113,000.00 | Loan: $452,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4044,
    'agreement_4044.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4044.pdf',
    '2023-08-21',
    '2023-09-20',
    'Social worker Phoenix purchase | Financing: FHA | Down Payment: $18,250.00 | Loan: $346,750.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4045,
    'agreement_4045.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4045.pdf',
    '2023-09-08',
    '2023-10-08',
    'Contractor cash purchase | Cash Purchase: $465,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4046,
    'agreement_4046.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4046.pdf',
    '2023-09-18',
    '2023-10-18',
    'Teacher Glendale purchase | Financing: FHA | Down Payment: $15,750.00 | Loan: $299,250.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4047,
    'agreement_4047.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4047.pdf',
    '2023-09-25',
    '2023-10-25',
    'Golf course manager Scottsdale | Financing: Conventional | Down Payment: $129,000.00 | Loan: $516,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4048,
    'agreement_4048.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4048.pdf',
    '2023-10-06',
    '2023-11-05',
    'Park ranger Flagstaff purchase | Financing: Conventional | Down Payment: $73,000.00 | Loan: $292,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4049,
    'agreement_4049.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4049.pdf',
    '2023-10-13',
    '2023-11-12',
    'Teacher Aurora family purchase | Financing: Conventional | Down Payment: $97,000.00 | Loan: $388,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4050,
    'agreement_4050.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4050.pdf',
    '2023-10-21',
    '2023-11-20',
    'Google analyst Boulder purchase | Financing: Conventional | Down Payment: $113,000.00 | Loan: $452,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4051,
    'agreement_4051.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4051.pdf',
    '2023-10-29',
    '2023-11-28',
    'Energy analyst Grand Junction | Financing: Conventional | Down Payment: $83,000.00 | Loan: $332,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4052,
    'agreement_4052.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4052.pdf',
    '2023-11-05',
    '2023-12-05',
    'Cybersecurity analyst purchase | Financing: Conventional | Down Payment: $93,000.00 | Loan: $372,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4053,
    'agreement_4053.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4053.pdf',
    '2023-11-12',
    '2023-12-12',
    'Finance director Denver purchase | Financing: Conventional | Down Payment: $113,000.00 | Loan: $452,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4054,
    'agreement_4054.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4054.pdf',
    '2023-11-20',
    '2023-12-20',
    'UX designer Denver purchase | Financing: Conventional | Down Payment: $113,000.00 | Loan: $452,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4055,
    'agreement_4055.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4055.pdf',
    '2023-11-22',
    '2023-12-22',
    'Intel operations manager Phoenix | Financing: Conventional | Down Payment: $93,000.00 | Loan: $372,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4056,
    'agreement_4056.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4056.pdf',
    '2023-11-28',
    '2023-12-28',
    'ASU research scientist purchase | Financing: Conventional | Down Payment: $83,000.00 | Loan: $332,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4057,
    'agreement_4057.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4057.pdf',
    '2023-11-29',
    '2023-12-29',
    'Aerospace engineer luxury purchase | Cash Purchase: $1,425,000.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4058,
    'agreement_4058.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4058.pdf',
    '2023-11-30',
    '2023-12-30',
    'Marketing coordinator Phoenix | Financing: FHA | Down Payment: $19,250.00 | Loan: $365,750.00'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    4059,
    'agreement_4059.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_4059.pdf',
    '2023-12-01',
    '2023-12-31',
    'Investment manager Paradise Valley | Financing: Jumbo | Down Payment: $279,000.00 | Loan: $1,116,000.00'
);

-- ================================================================
-- VERIFY REGISTRATION
-- ================================================================
SELECT 
    'Purchase Agreements Registered' AS STATUS,
    COUNT(*) AS TOTAL_AGREEMENTS
FROM PURCHASE_AGREEMENTS;

-- Show sample registrations
SELECT 
    AGREEMENT_ID,
    SALE_ID,
    DOCUMENT_NAME,
    CONTRACT_DATE,
    SPECIAL_TERMS
FROM PURCHASE_AGREEMENTS
ORDER BY SALE_ID
LIMIT 10;

COMMENT ON TABLE PURCHASE_AGREEMENTS IS 'Metadata for 60 purchase agreement PDFs generated from actual V2 sales data on 2025-08-04';