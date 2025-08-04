#!/usr/bin/env python3
"""
HOUSING INTELLIGENCE PURCHASE AGREEMENT GENERATOR - UPDATED WITH ACTUAL DATA
=============================================================================
This script generates realistic purchase agreement PDFs for each sale
in the Housing Intelligence database using ACTUAL sales data from the database.

Based on: Washington Residential Real Estate Purchase Agreement
https://freeforms.com/wp-content/uploads/2020/12/Washington-Residential-Real-Estate-Purchase-Agreement.pdf
"""

import os
import sys
from datetime import datetime, timedelta
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.lib import colors
# import snowflake.connector
import random

class PurchaseAgreementGenerator:
    def __init__(self, output_dir="purchase_agreements"):
        self.output_dir = output_dir
        self.styles = getSampleStyleSheet()
        self.create_custom_styles()
        
        # Create output directory if it doesn't exist
        if not os.path.exists(output_dir):
            os.makedirs(output_dir)
    
    def create_custom_styles(self):
        """Create custom paragraph styles for the documents"""
        self.title_style = ParagraphStyle(
            'CustomTitle',
            parent=self.styles['Heading1'],
            fontSize=16,
            spaceAfter=30,
            textColor=colors.black,
            alignment=1  # Center alignment
        )
        
        self.section_style = ParagraphStyle(
            'CustomSection',
            parent=self.styles['Heading2'],
            fontSize=12,
            spaceBefore=12,
            spaceAfter=6,
            textColor=colors.black
        )
        
        self.body_style = ParagraphStyle(
            'CustomBody',
            parent=self.styles['Normal'],
            fontSize=10,
            spaceBefore=3,
            spaceAfter=3,
            textColor=colors.black
        )
    
    def generate_agreement_content(self, sale_data):
        """Generate the content for a purchase agreement"""
        content = []
        
        # Title
        title = Paragraph("RESIDENTIAL REAL ESTATE PURCHASE AGREEMENT", self.title_style)
        content.append(title)
        content.append(Spacer(1, 20))
        
        # Agreement date and parties
        agreement_date = datetime.strptime(sale_data['sale_date'], '%Y-%m-%d') - timedelta(days=30)
        
        parties_text = f"""
        This Agreement is made on {agreement_date.strftime('%B %d, %Y')}, between 
        <b>{sale_data['buyer_name']}</b> ("Buyer") and the Property Owner ("Seller"), 
        with {sale_data['agent_name']} serving as the listing agent.
        """
        content.append(Paragraph(parties_text, self.body_style))
        content.append(Spacer(1, 12))
        
        # Property Description
        content.append(Paragraph("1. PROPERTY DESCRIPTION", self.section_style))
        property_text = f"""
        The property subject to this Agreement is located at:
        <b>{sale_data['property_address']}</b>
        
        This includes all fixtures, systems, and appurtenances currently on the property.
        """
        content.append(Paragraph(property_text, self.body_style))
        content.append(Spacer(1, 12))
        
        # Purchase Price and Terms
        content.append(Paragraph("2. PURCHASE PRICE AND TERMS", self.section_style))
        price_text = f"""
        Purchase Price: <b>${sale_data['sale_price']:,.2f}</b>
        
        Payment Terms:
        • Down Payment: ${sale_data['down_payment']:,.2f}
        • Loan Amount: ${sale_data['loan_amount']:,.2f}
        • Financing Type: {sale_data['financing_type']}
        
        The Buyer agrees to pay the Purchase Price according to the terms specified herein.
        """
        content.append(Paragraph(price_text, self.body_style))
        content.append(Spacer(1, 12))
        
        # Financing Contingency
        content.append(Paragraph("3. FINANCING CONTINGENCY", self.section_style))
        if sale_data['financing_type'] == 'Cash':
            financing_text = f"""
            This is a CASH PURCHASE. No financing contingency applies as Buyer will pay the full 
            purchase price of ${sale_data['sale_price']:,.2f} in cash at closing.
            
            Buyer has provided proof of funds and the ability to complete this cash transaction.
            """
        else:
            financing_text = f"""
            This Agreement is contingent upon Buyer obtaining financing for {sale_data['financing_type']} 
            loan in the amount of ${sale_data['loan_amount']:,.2f} within 30 days of the effective date 
            of this Agreement.
            
            If Buyer cannot obtain financing as specified, this Agreement may be terminated 
            by written notice to Seller.
            """
        content.append(Paragraph(financing_text, self.body_style))
        content.append(Spacer(1, 12))
        
        # Inspection Contingency
        content.append(Paragraph("4. INSPECTION CONTINGENCY", self.section_style))
        inspection_text = f"""
        {sale_data['contingencies']}
        
        Buyer has the right to conduct inspections of the property within 10 days of the 
        effective date of this Agreement. If unsatisfactory conditions are discovered, 
        Buyer may request repairs or terminate this Agreement.
        """
        content.append(Paragraph(inspection_text, self.body_style))
        content.append(Spacer(1, 12))
        
        # Closing Information
        closing_date = datetime.strptime(sale_data['sale_date'], '%Y-%m-%d')
        content.append(Paragraph("5. CLOSING INFORMATION", self.section_style))
        closing_text = f"""
        Closing Date: <b>{closing_date.strftime('%B %d, %Y')}</b>
        
        Closing shall take place at a mutually agreed upon title company or attorney's office.
        All required documents and funds must be available at closing.
        """
        content.append(Paragraph(closing_text, self.body_style))
        content.append(Spacer(1, 12))
        
        # Additional Terms
        content.append(Paragraph("6. ADDITIONAL TERMS AND CONDITIONS", self.section_style))
        additional_terms = f"""
        Special Considerations: {sale_data['contingencies']}
        
        Time is of the essence in this Agreement. All deadlines specified herein are firm 
        unless modified in writing by both parties.
        
        This Agreement constitutes the entire agreement between the parties and may only 
        be modified in writing signed by both parties.
        """
        content.append(Paragraph(additional_terms, self.body_style))
        content.append(Spacer(1, 20))
        
        # Signature Section
        content.append(Paragraph("SIGNATURES", self.section_style))
        
        # Create signature table
        signature_data = [
            ['BUYER:', '', 'DATE:', ''],
            [f'{sale_data["buyer_name"]}', '_' * 30, agreement_date.strftime('%m/%d/%Y'), ''],
            ['', '', '', ''],
            ['SELLER:', '', 'DATE:', ''],
            ['Property Owner', '_' * 30, agreement_date.strftime('%m/%d/%Y'), ''],
            ['', '', '', ''],
            ['LISTING AGENT:', '', 'DATE:', ''],
            [f'{sale_data["agent_name"]}', '_' * 30, agreement_date.strftime('%m/%d/%Y'), '']
        ]
        
        signature_table = Table(signature_data, colWidths=[1.5*inch, 2*inch, 1*inch, 1*inch])
        signature_table.setStyle(TableStyle([
            ('FONTNAME', (0, 0), (-1, -1), 'Helvetica'),
            ('FONTSIZE', (0, 0), (-1, -1), 10),
            ('VALIGN', (0, 0), (-1, -1), 'TOP'),
            ('LEFTPADDING', (0, 0), (-1, -1), 0),
            ('RIGHTPADDING', (0, 0), (-1, -1), 0),
        ]))
        
        content.append(signature_table)
        
        return content
    
    def generate_pdf(self, sale_data):
        """Generate a PDF purchase agreement for a single sale"""
        filename = f"agreement_{sale_data['sale_id']:04d}.pdf"
        filepath = os.path.join(self.output_dir, filename)
        
        # Create PDF document
        doc = SimpleDocTemplate(
            filepath,
            pagesize=letter,
            rightMargin=72,
            leftMargin=72,
            topMargin=72,
            bottomMargin=18
        )
        
        # Generate content
        content = self.generate_agreement_content(sale_data)
        
        # Build PDF
        doc.build(content)
        
        print(f"Generated: {filename}")
        return filepath
    
    def generate_all_agreements(self, sales_data_list):
        """Generate purchase agreements for all sales"""
        generated_files = []
        
        for sale_data in sales_data_list:
            try:
                filepath = self.generate_pdf(sale_data)
                generated_files.append(filepath)
            except Exception as e:
                print(f"Error generating PDF for sale {sale_data['sale_id']}: {e}")
        
        return generated_files

def get_actual_sales_data():
    """Get the actual sales data from the house_sales table (matches 03_house_sales_2022_2023.sql)"""
    
    # Property address mapping from house_characteristics data
    property_addresses = {
        2001: '123 Main St, Austin, TX 78701',
        2002: '456 Oak Ave, Austin, TX 78702',
        2003: '789 Pine Dr, Round Rock, TX 78664',
        2004: '321 Elm St, Austin, TX 78703',
        2005: '654 Cedar Ln, Pflugerville, TX 78660',
        2006: '987 Birch Way, Austin, TX 78704',
        2007: '147 Maple St, Cedar Park, TX 78613',
        2008: '258 Walnut Ave, Austin, TX 78705',
        2009: '369 Hickory Dr, Leander, TX 78641',
        2010: '741 Spruce Ct, Austin, TX 78746',
        2011: '852 Redwood Blvd, Austin, TX 78759',
        2012: '963 Poplar Ave, Georgetown, TX 78628',
        2013: '111 River Oaks Dr, Houston, TX 77027',
        2014: '222 Memorial Dr, Houston, TX 77024',
        2015: '333 Galleria Blvd, Houston, TX 77056',
        2016: '123 Beach Blvd, San Diego, CA 92101',
        2017: '456 Tech Dr, San Jose, CA 95110',
        2018: '789 Ocean View, Los Angeles, CA 90210',
        2019: '321 Sunset Ave, San Francisco, CA 94102',
        2020: '654 Valley Rd, Sacramento, CA 95814',
        2021: '987 Highland St, Oakland, CA 94601',
        2022: '147 Coast Hwy, Santa Barbara, CA 93101',
        2023: '258 University Ave, Palo Alto, CA 94301',
        2024: '369 Vineyard Ln, Napa, CA 94558',
        2025: '741 Lake Shore, Lake Tahoe, CA 96150',
        2026: '852 Silicon Dr, Mountain View, CA 94041',
        2027: '963 Marina Blvd, San Francisco, CA 94123',
        2028: '111 Rodeo Dr, Beverly Hills, CA 90210',
        2029: '222 Lombard St, San Francisco, CA 94133',
        2030: '333 Sunset Strip, West Hollywood, CA 90069',
        2031: '123 Bayshore Dr, Miami, FL 33101',
        2032: '456 Golf Course Rd, Tampa, FL 33602',
        2033: '789 Beach Walk, Fort Lauderdale, FL 33301',
        2034: '321 Palmetto St, Orlando, FL 32801',
        2035: '654 Sunset Blvd, Jacksonville, FL 32202',
        2036: '987 Marina Way, Naples, FL 34102',
        2037: '147 Key Biscayne, Key Biscayne, FL 33149',
        2038: '258 South Beach, Miami Beach, FL 33139',
        2039: '369 Coral Gables, Coral Gables, FL 33134',
        2040: '741 Clearwater, Clearwater, FL 33755',
        2041: '123 Mountain View Dr, Denver, CO 80202',
        2042: '456 Ski Trail Rd, Boulder, CO 80301',
        2043: '789 Downtown Loft, Denver, CO 80203',
        2044: '321 Aspen Grove, Colorado Springs, CO 80903',
        2045: '654 Tech Center, Aurora, CO 80014',
        2046: '987 Valley View, Fort Collins, CO 80521',
        2047: '147 Ski Village, Vail, CO 81657',
        2048: '258 Steamboat, Steamboat Springs, CO 80487',
        2049: '369 Cherry Creek, Denver, CO 80206',
        2050: '741 Highlands Ranch, Highlands Ranch, CO 80126',
        2051: '123 Desert Ridge Dr, Phoenix, AZ 85001',
        2052: '456 Cactus Rd, Scottsdale, AZ 85251',
        2053: '789 University Dr, Tempe, AZ 85281',
        2054: '321 Golf Club Dr, Chandler, AZ 85224',
        2055: '654 Sunset Mesa, Tucson, AZ 85701',
        2056: '987 Mountain Park, Flagstaff, AZ 86001',
        2057: '147 Desert Oasis, Paradise Valley, AZ 85253',
        2058: '258 Camelback, Phoenix, AZ 85018',
        2059: '369 Sedona Red Rock, Sedona, AZ 86336',
        2060: '741 Biltmore, Phoenix, AZ 85016'
    }

    # Customer name mapping from customers data
    customer_names = {
        1001: 'John Smith', 1002: 'Sarah Johnson', 1003: 'Michael Brown', 1004: 'Emily Davis', 1005: 'David Wilson',
        1006: 'Jennifer Miller', 1007: 'Robert Garcia', 1008: 'Lisa Martinez', 1009: 'James Anderson', 1010: 'Amanda Taylor',
        1011: 'William Thompson', 1012: 'Jessica White', 1013: 'Christopher Lee', 1014: 'Ashley Harris', 1015: 'Matthew Clark',
        1016: 'Rachel Turner', 1017: 'Kevin Moore', 1018: 'Michelle Wright', 1019: 'Daniel Lopez', 1020: 'Nicole Hill',
        1021: 'Brian Scott', 1022: 'Stephanie Green', 1023: 'Gregory Adams', 1024: 'Melissa Baker', 1025: 'Anthony Nelson',
        1026: 'Kimberly Carter', 1027: 'Joshua Mitchell', 1028: 'Laura Perez', 1029: 'Ryan Roberts', 1030: 'Samantha Phillips',
        1031: 'Timothy Campbell', 1032: 'Angela Parker', 1033: 'Mark Evans', 1034: 'Christina Edwards', 1035: 'Steven Collins'
    }

    # Actual sales data from house_sales table (matching 03_house_sales_2022_2023.sql)
    # Format: (sale_id, house_id, customer_id, sale_date, sale_price, listing_price, days_on_market, sale_type, agent_id, agent_name, commission_rate, commission_amount, financing_type, down_payment, loan_amount, interest_rate, closing_costs, inspection_passed, appraisal_value, contingencies, sale_status)
    actual_sales_raw = [
        (3001, 2001, 1001, '2022-03-15', 375000.00, 385000.00, 45, 'Financed', 101, 'Jane Thompson', 0.030, 11250.00, 'Conventional', 75000.00, 300000.00, 5.250, 8500.00, True, 378000.00, 'Inspection contingency', 'COMPLETED'),
        (3002, 2002, 1002, '2022-03-20', 280000.00, 285000.00, 35, 'FHA', 102, 'Bob Martinez', 0.030, 8400.00, 'FHA', 14000.00, 266000.00, 5.500, 7200.00, True, 282000.00, 'Financing contingency', 'COMPLETED'),
        (3003, 2003, 1003, '2022-04-01', 475000.00, 485000.00, 52, 'Conventional', 103, 'Carol Johnson', 0.030, 14250.00, 'Conventional', 95000.00, 380000.00, 5.000, 12000.00, True, 480000.00, 'Appraisal contingency', 'COMPLETED'),
        (3004, 2004, 1004, '2022-04-10', 315000.00, 325000.00, 38, 'VA', 104, 'David Chen', 0.030, 9450.00, 'VA', 0.00, 315000.00, 4.750, 6800.00, True, 318000.00, 'VA inspection', 'COMPLETED'),
        (3005, 2005, 1005, '2022-04-15', 615000.00, 625000.00, 28, 'Cash', 105, 'Emma Wilson', 0.025, 15375.00, 'Cash', 615000.00, 0.00, 0.000, 5200.00, True, 620000.00, 'None', 'COMPLETED'),
        (3006, 2006, 1006, '2022-04-25', 225000.00, 235000.00, 42, 'FHA', 106, 'Frank Rodriguez', 0.030, 6750.00, 'FHA', 11250.00, 213750.00, 5.750, 5800.00, True, 228000.00, 'Inspection contingency', 'COMPLETED'),
        (3007, 2007, 1007, '2022-05-05', 425000.00, 435000.00, 48, 'Conventional', 107, 'Grace Kim', 0.030, 12750.00, 'Conventional', 85000.00, 340000.00, 5.125, 9500.00, True, 430000.00, 'Appraisal contingency', 'COMPLETED'),
        (3008, 2008, 1008, '2022-05-12', 290000.00, 295000.00, 33, 'Conventional', 108, 'Henry Lee', 0.030, 8700.00, 'Conventional', 58000.00, 232000.00, 5.375, 7800.00, True, 292000.00, 'None', 'COMPLETED'),
        (3009, 2009, 1009, '2022-05-20', 535000.00, 545000.00, 25, 'Conventional', 109, 'Ivy Patel', 0.030, 16050.00, 'Conventional', 107000.00, 428000.00, 4.875, 11500.00, True, 540000.00, 'Inspection contingency', 'COMPLETED'),
        (3010, 2010, 1010, '2022-05-28', 405000.00, 425000.00, 55, 'Conventional', 110, 'Jack Davis', 0.030, 12150.00, 'Conventional', 81000.00, 324000.00, 5.500, 9200.00, True, 410000.00, 'Appraisal contingency', 'COMPLETED'),
        (3011, 2016, 1011, '2022-06-15', 665000.00, 685000.00, 32, 'Conventional', 111, 'Kate Morrison', 0.030, 19950.00, 'Conventional', 133000.00, 532000.00, 5.250, 15500.00, True, 670000.00, 'Appraisal contingency', 'COMPLETED'),
        (3012, 2017, 1012, '2022-06-22', 895000.00, 925000.00, 28, 'Conventional', 112, 'Leo Chang', 0.025, 22375.00, 'Conventional', 179000.00, 716000.00, 4.750, 18200.00, True, 900000.00, 'Tech company relocation', 'COMPLETED'),
        (3013, 2018, 1013, '2022-07-10', 1225000.00, 1250000.00, 45, 'Jumbo', 113, 'Maria Santos', 0.025, 30625.00, 'Jumbo', 245000.00, 980000.00, 5.125, 25000.00, True, 1240000.00, 'Luxury home inspection', 'COMPLETED'),
        (3014, 2019, 1014, '2022-07-18', 765000.00, 785000.00, 38, 'Conventional', 114, 'Nick Taylor', 0.030, 22950.00, 'Conventional', 153000.00, 612000.00, 5.375, 18500.00, True, 770000.00, 'Earthquake contingency', 'COMPLETED'),
        (3015, 2020, 1015, '2022-07-25', 465000.00, 485000.00, 42, 'Conventional', 115, 'Olivia Brown', 0.030, 13950.00, 'Conventional', 93000.00, 372000.00, 5.125, 12200.00, True, 470000.00, 'Financing contingency', 'COMPLETED'),
        (3016, 2031, 1021, '2022-08-05', 455000.00, 465000.00, 35, 'Conventional', 116, 'Paul Green', 0.030, 13650.00, 'Conventional', 91000.00, 364000.00, 5.250, 11800.00, True, 460000.00, 'Hurricane insurance', 'COMPLETED'),
        (3017, 2032, 1022, '2022-08-12', 375000.00, 385000.00, 48, 'Conventional', 117, 'Quinn Adams', 0.030, 11250.00, 'Conventional', 75000.00, 300000.00, 5.500, 9500.00, True, 380000.00, 'Golf membership transfer', 'COMPLETED'),
        (3018, 2033, 1023, '2022-08-20', 315000.00, 325000.00, 52, 'FHA', 118, 'Rachel White', 0.030, 9450.00, 'FHA', 15750.00, 299250.00, 5.750, 8200.00, True, 318000.00, 'Beachfront assessment', 'COMPLETED'),
        (3019, 2034, 1024, '2022-08-28', 425000.00, 445000.00, 48, 'Conventional', 119, 'Sam Garcia', 0.030, 12750.00, 'Conventional', 85000.00, 340000.00, 5.375, 11500.00, True, 430000.00, 'Theme park proximity', 'COMPLETED'),
        (3020, 2035, 1025, '2022-09-05', 285000.00, 295000.00, 42, 'Conventional', 120, 'Tina Lopez', 0.030, 8550.00, 'Conventional', 57000.00, 228000.00, 5.625, 7800.00, True, 288000.00, 'River access rights', 'COMPLETED'),
        (3021, 2041, 1026, '2022-10-15', 505000.00, 525000.00, 35, 'Conventional', 121, 'Uma Singh', 0.030, 15150.00, 'Conventional', 101000.00, 404000.00, 5.125, 13200.00, True, 510000.00, 'Mountain view preservation', 'COMPLETED'),
        (3022, 2042, 1027, '2022-10-22', 655000.00, 685000.00, 28, 'Conventional', 122, 'Victor Park', 0.025, 16375.00, 'Conventional', 131000.00, 524000.00, 4.875, 16800.00, True, 660000.00, 'Ski area access', 'COMPLETED'),
        (3023, 2043, 1028, '2022-11-10', 415000.00, 425000.00, 45, 'Cash', 123, 'Wendy Clark', 0.025, 10375.00, 'Cash', 415000.00, 0.00, 0.000, 8500.00, True, 420000.00, 'Urban loft conversion', 'COMPLETED'),
        (3024, 2044, 1029, '2022-11-18', 355000.00, 365000.00, 38, 'Conventional', 124, 'Xavier Moore', 0.030, 10650.00, 'Conventional', 71000.00, 284000.00, 5.750, 9200.00, True, 358000.00, 'Military base proximity', 'COMPLETED'),
        (3025, 2045, 1030, '2022-11-25', 375000.00, 385000.00, 42, 'VA', 125, 'Yolanda Rivera', 0.030, 11250.00, 'VA', 0.00, 375000.00, 5.000, 8800.00, True, 378000.00, 'VA benefits transfer', 'COMPLETED'),
        (3026, 2051, 1031, '2022-12-05', 375000.00, 385000.00, 35, 'Conventional', 126, 'Zach Williams', 0.030, 11250.00, 'Conventional', 75000.00, 300000.00, 5.250, 9500.00, True, 378000.00, 'Desert landscaping', 'COMPLETED'),
        (3027, 2052, 1032, '2022-12-12', 655000.00, 675000.00, 48, 'Conventional', 127, 'Alice Johnson', 0.030, 19650.00, 'Conventional', 131000.00, 524000.00, 5.500, 16800.00, True, 660000.00, 'Golf course access', 'COMPLETED'),
        (3028, 2053, 1033, '2022-12-20', 275000.00, 285000.00, 52, 'FHA', 128, 'Brian Davis', 0.030, 8250.00, 'FHA', 13750.00, 261250.00, 5.750, 7200.00, True, 278000.00, 'University district', 'COMPLETED'),
        (3029, 2054, 1034, '2022-12-28', 415000.00, 425000.00, 48, 'Conventional', 129, 'Cathy Miller', 0.030, 12450.00, 'Conventional', 83000.00, 332000.00, 5.375, 11200.00, True, 418000.00, 'Retirement community', 'COMPLETED'),
        (3030, 2055, 1035, '2023-01-15', 285000.00, 295000.00, 42, 'Conventional', 130, 'Dan Wilson', 0.030, 8550.00, 'Conventional', 57000.00, 228000.00, 6.125, 7800.00, True, 288000.00, 'Desert climate adaptation', 'COMPLETED'),
        (3031, 2056, 1001, '2023-02-10', 475000.00, 485000.00, 25, 'Cash', 131, 'Eva Santos', 0.025, 11875.00, 'Cash', 475000.00, 0.00, 0.000, 12500.00, True, 480000.00, 'Mountain cabin features', 'COMPLETED'),
        (3032, 2024, 1011, '2023-02-18', 1095000.00, 1125000.00, 32, 'Jumbo', 132, 'Frank Anderson', 0.025, 27375.00, 'Jumbo', 219000.00, 876000.00, 6.000, 22800.00, True, 1100000.00, 'Wine cellar inspection', 'COMPLETED'),
        (3033, 2025, 1012, '2023-03-05', 1795000.00, 1850000.00, 28, 'Jumbo', 133, 'Grace Thompson', 0.025, 44875.00, 'Jumbo', 359000.00, 1436000.00, 5.750, 35500.00, True, 1810000.00, 'Lakefront rights', 'COMPLETED'),
        (3034, 2026, 1013, '2023-03-15', 1425000.00, 1450000.00, 35, 'Jumbo', 134, 'Henry Kim', 0.025, 35625.00, 'Jumbo', 285000.00, 1140000.00, 6.125, 28500.00, True, 1440000.00, 'Tech headquarters relocation', 'COMPLETED'),
        (3035, 2027, 1014, '2023-03-22', 1095000.00, 1125000.00, 42, 'Jumbo', 135, 'Iris Chen', 0.025, 27375.00, 'Jumbo', 219000.00, 876000.00, 6.250, 25500.00, True, 1110000.00, 'Marina access rights', 'COMPLETED'),
        (3036, 2028, 1015, '2023-04-05', 2795000.00, 2850000.00, 38, 'Jumbo', 136, 'Jack Martinez', 0.025, 69875.00, 'Jumbo', 559000.00, 2236000.00, 6.375, 55000.00, True, 2820000.00, 'Celebrity privacy clause', 'COMPLETED'),
        (3037, 2029, 1016, '2023-04-12', 1645000.00, 1685000.00, 28, 'Jumbo', 137, 'Kelly Wong', 0.025, 41125.00, 'Jumbo', 329000.00, 1316000.00, 6.125, 32500.00, True, 1665000.00, 'Historic district compliance', 'COMPLETED'),
        (3038, 2030, 1017, '2023-04-20', 875000.00, 895000.00, 45, 'Conventional', 138, 'Luis Rodriguez', 0.030, 26250.00, 'Conventional', 175000.00, 700000.00, 6.625, 22500.00, True, 885000.00, 'Entertainment district location', 'COMPLETED'),
        (3039, 2037, 1018, '2023-04-28', 855000.00, 875000.00, 25, 'Conventional', 139, 'Maria Garcia', 0.030, 25650.00, 'Conventional', 171000.00, 684000.00, 6.500, 21500.00, True, 865000.00, 'Oceanfront hurricane insurance', 'COMPLETED'),
        (3040, 2013, 1019, '2023-05-15', 1795000.00, 1850000.00, 32, 'Jumbo', 140, 'Nina Patel', 0.025, 44875.00, 'Jumbo', 359000.00, 1436000.00, 6.250, 42500.00, True, 1820000.00, 'River Oaks historic preservation', 'COMPLETED'),
        (3041, 2014, 1020, '2023-05-22', 895000.00, 925000.00, 38, 'Conventional', 141, 'Oscar Lee', 0.030, 26850.00, 'Conventional', 179000.00, 716000.00, 6.750, 22500.00, True, 910000.00, 'Memorial Villages exclusivity', 'COMPLETED'),
        (3042, 2015, 1021, '2023-06-05', 465000.00, 485000.00, 42, 'Conventional', 142, 'Paula Davis', 0.030, 13950.00, 'Conventional', 93000.00, 372000.00, 6.625, 12200.00, True, 475000.00, 'Galleria shopping access', 'COMPLETED'),
        (3043, 2038, 1022, '2023-07-12', 665000.00, 685000.00, 48, 'Conventional', 143, 'Quinn Johnson', 0.030, 19950.00, 'Conventional', 133000.00, 532000.00, 7.000, 18500.00, True, 675000.00, 'Art Deco historic value', 'COMPLETED'),
        (3044, 2039, 1023, '2023-07-20', 1095000.00, 1125000.00, 52, 'Jumbo', 144, 'Rosa Martinez', 0.025, 27375.00, 'Jumbo', 219000.00, 876000.00, 6.875, 28500.00, True, 1110000.00, 'Coral Gables architectural review', 'COMPLETED'),
        (3045, 2040, 1024, '2023-08-05', 415000.00, 425000.00, 35, 'Conventional', 145, 'Steve Wilson', 0.030, 12450.00, 'Conventional', 83000.00, 332000.00, 7.125, 11200.00, True, 420000.00, 'Beach access rights', 'COMPLETED'),
        (3046, 2047, 1025, '2023-08-15', 2175000.00, 2250000.00, 28, 'Cash', 146, 'Tara Singh', 0.020, 43500.00, 'Cash', 2175000.00, 0.00, 0.000, 55000.00, True, 2200000.00, 'Ski-in ski-out privileges', 'COMPLETED'),
        (3047, 2048, 1026, '2023-08-22', 925000.00, 945000.00, 32, 'Jumbo', 147, 'Uma Thompson', 0.025, 23125.00, 'Jumbo', 185000.00, 740000.00, 6.750, 24500.00, True, 935000.00, 'Ski resort amenities', 'COMPLETED'),
        (3048, 2049, 1027, '2023-09-10', 665000.00, 685000.00, 42, 'Conventional', 148, 'Victor Chang', 0.030, 19950.00, 'Conventional', 133000.00, 532000.00, 7.000, 18500.00, True, 675000.00, 'Cherry Creek luxury shopping', 'COMPLETED'),
        (3049, 2050, 1028, '2023-09-18', 605000.00, 625000.00, 38, 'Conventional', 149, 'Wendy Garcia', 0.030, 18150.00, 'Conventional', 121000.00, 484000.00, 7.125, 16800.00, True, 615000.00, 'Family community amenities', 'COMPLETED'),
        (3050, 2057, 1029, '2023-10-05', 1425000.00, 1450000.00, 35, 'Jumbo', 150, 'Xavier Patel', 0.025, 35625.00, 'Jumbo', 285000.00, 1140000.00, 6.875, 35500.00, True, 1440000.00, 'Desert mountain privacy', 'COMPLETED'),
        (3051, 2058, 1030, '2023-10-15', 465000.00, 485000.00, 42, 'Conventional', 151, 'Yara Lee', 0.030, 13950.00, 'Conventional', 93000.00, 372000.00, 7.250, 12500.00, True, 475000.00, 'Camelback mountain views', 'COMPLETED'),
        (3052, 2059, 1031, '2023-10-22', 605000.00, 625000.00, 38, 'Conventional', 152, 'Zoe Davis', 0.030, 18150.00, 'Conventional', 121000.00, 484000.00, 7.125, 16500.00, True, 615000.00, 'Red rock hiking access', 'COMPLETED'),
        (3053, 2060, 1032, '2023-11-05', 705000.00, 725000.00, 35, 'Conventional', 153, 'Adam Rodriguez', 0.030, 21150.00, 'Conventional', 141000.00, 564000.00, 7.000, 19500.00, True, 715000.00, 'Biltmore district exclusivity', 'COMPLETED'),
        (3054, 2021, 1033, '2023-11-15', 605000.00, 625000.00, 42, 'Conventional', 154, 'Betty Wilson', 0.030, 18150.00, 'Conventional', 121000.00, 484000.00, 7.250, 16800.00, True, 615000.00, 'Bay Area tech transfer', 'COMPLETED'),
        (3055, 2022, 1034, '2023-11-22', 1095000.00, 1125000.00, 28, 'Jumbo', 155, 'Carlos Martinez', 0.025, 27375.00, 'Jumbo', 219000.00, 876000.00, 6.875, 28500.00, True, 1110000.00, 'Coastal commission approval', 'COMPLETED'),
        (3056, 2023, 1035, '2023-12-05', 875000.00, 895000.00, 32, 'Jumbo', 156, 'Diana Johnson', 0.025, 21875.00, 'Jumbo', 175000.00, 700000.00, 6.750, 24500.00, True, 885000.00, 'Stanford University proximity', 'COMPLETED'),
        (3057, 2011, 1001, '2023-12-15', 305000.00, 315000.00, 48, 'Conventional', 157, 'Eric Chen', 0.030, 9150.00, 'Conventional', 61000.00, 244000.00, 7.375, 8500.00, True, 308000.00, 'Investment property', 'COMPLETED'),
        (3058, 2012, 1002, '2023-12-22', 385000.00, 395000.00, 52, 'Conventional', 158, 'Fiona Davis', 0.030, 11550.00, 'Conventional', 77000.00, 308000.00, 7.250, 10200.00, True, 390000.00, 'End of year closing', 'COMPLETED')
    ]
    
    # Convert to structured sales data for PDF generation
    sales_data = []
    for sale_record in actual_sales_raw:
        sale_id, house_id, customer_id, sale_date, sale_price, listing_price, days_on_market, sale_type, agent_id, agent_name, commission_rate, commission_amount, financing_type, down_payment, loan_amount, interest_rate, closing_costs, inspection_passed, appraisal_value, contingencies, sale_status = sale_record
        
        sale_data = {
            'sale_id': sale_id,
            'house_id': house_id,
            'customer_id': customer_id,
            'sale_date': sale_date,
            'sale_price': sale_price,
            'property_address': property_addresses.get(house_id, f'Property {house_id}'),
            'buyer_name': customer_names.get(customer_id, f'Customer {customer_id}'),
            'agent_name': agent_name,
            'financing_type': financing_type,
            'down_payment': down_payment,
            'loan_amount': loan_amount,
            'contingencies': contingencies if contingencies != 'None' else 'Standard terms and conditions apply'
        }
        
        sales_data.append(sale_data)
    
    return sales_data

def main():
    """Main function to generate all purchase agreement PDFs with actual sales data"""
    print("Housing Intelligence Purchase Agreement Generator - UPDATED WITH ACTUAL DATA")
    print("=" * 75)
    
    # Initialize generator
    generator = PurchaseAgreementGenerator()
    
    # Get actual sales data from the database tables
    sales_data = get_actual_sales_data()
    
    print(f"Generating {len(sales_data)} purchase agreement PDFs using ACTUAL sales data...")
    print("Data matches 03_house_sales_2022_2023.sql exactly")
    
    # Generate all PDFs
    generated_files = generator.generate_all_agreements(sales_data)
    
    print(f"\nGenerated {len(generated_files)} purchase agreement PDFs")
    print(f"Files saved to: {generator.output_dir}/")
    
    # Generate SQL to register the purchase agreements
    print("\nGenerating SQL to register purchase agreements...")
    
    sql_statements = []
    for sale_data in sales_data:
        # Use actual sale date minus 30 days for contract date
        contract_date = datetime.strptime(sale_data['sale_date'], '%Y-%m-%d') - timedelta(days=30)
        closing_date = datetime.strptime(sale_data['sale_date'], '%Y-%m-%d')
        
        # Create realistic special terms based on actual contingencies and financing
        special_terms = f"{sale_data['contingencies']} | Financing: {sale_data['financing_type']}"
        if sale_data['financing_type'] != 'Cash':
            special_terms += f" | Down Payment: ${sale_data['down_payment']:,.2f} | Loan: ${sale_data['loan_amount']:,.2f}"
        else:
            special_terms += f" | Cash Purchase: ${sale_data['sale_price']:,.2f}"
        
        sql = f"""
CALL REGISTER_PURCHASE_AGREEMENT(
    {sale_data['sale_id']},
    'agreement_{sale_data["sale_id"]:04d}.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_{sale_data["sale_id"]:04d}.pdf',
    '{contract_date.strftime("%Y-%m-%d")}',
    '{closing_date.strftime("%Y-%m-%d")}',
    '{special_terms}'
);"""
        sql_statements.append(sql)
    
    # Write SQL file
    with open('register_purchase_agreements.sql', 'w') as f:
        f.write("-- Purchase Agreement Registration SQL\n")
        f.write("-- Generated by purchase_agreements_generator_updated.py\n")
        f.write("-- Uses ACTUAL sales data from 03_house_sales_2022_2023.sql\n\n")
        f.write("USE DATABASE HOUSING_INTELLIGENCE;\n")
        f.write("USE SCHEMA CORE;\n\n")
        f.write("-- Register all purchase agreement PDFs with actual sales data\n")
        for sql in sql_statements:
            f.write(sql + "\n")
    
    print("SQL registration file created: register_purchase_agreements.sql")
    print("\nNext steps:")
    print("1. Upload PDFs to Snowflake stage: PUT file://purchase_agreements/* @PURCHASE_AGREEMENTS_STAGE;")
    print("2. Run the registration SQL file in Snowflake")
    print("3. Set up Cortex Search service on the PDF documents")
    print("\nAll PDFs generated with ACTUAL sales data from your database!")

if __name__ == "__main__":
    main()