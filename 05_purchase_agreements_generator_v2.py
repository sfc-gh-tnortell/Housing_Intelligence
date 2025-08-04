#!/usr/bin/env python3
"""
HOUSING INTELLIGENCE PURCHASE AGREEMENT GENERATOR V2
================================================================
Generates PDF purchase agreements using ACTUAL sales data from the V2 database
Each PDF corresponds exactly to a sale record with real customer and property details

Features:
- Reads actual sales data from 04_sales_data_v2.sql
- Reads customer data from 02_customers_data_v2.sql  
- Reads property data from 03_houses_data_v2.sql
- Generates 60 PDFs with real transaction details
- Creates registration SQL with actual metadata
- Ensures 100% data consistency
"""

import os
import re
import sys
from datetime import datetime, timedelta
from pathlib import Path
from reportlab.lib.pagesizes import letter
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle
from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_LEFT, TA_RIGHT

def parse_sql_data():
    """Parse all SQL data files to extract actual transaction details"""
    print("📊 Parsing SQL data files...")
    
    # Parse customer data - simplified approach
    customers = {}
    try:
        with open('02_customers_data_v2.sql', 'r') as f:
            content = f.read()
            
            # Find all INSERT lines that start with (1xxx for customers
            lines = content.split('\n')
            for line in lines:
                line = line.strip()
                if line.startswith('(1') and line.endswith('),'):
                    # Remove leading ( and trailing ),
                    data_part = line[1:-2]
                    
                    # Split by commas but handle quoted strings
                    fields = []
                    current_field = ""
                    in_quote = False
                    
                    i = 0
                    while i < len(data_part):
                        char = data_part[i]
                        if char == "'" and (i == 0 or data_part[i-1] != '\\'):
                            in_quote = not in_quote
                            current_field += char
                        elif char == ',' and not in_quote:
                            fields.append(current_field.strip())
                            current_field = ""
                        else:
                            current_field += char
                        i += 1
                    
                    # Add the last field
                    if current_field:
                        fields.append(current_field.strip())
                    
                    if len(fields) >= 24:  # Ensure we have enough fields
                        try:
                            customer_id = int(fields[0])
                            customers[customer_id] = {
                                'first_name': fields[1].strip("'"),
                                'last_name': fields[2].strip("'"),
                                'email': fields[3].strip("'"),
                                'phone': fields[4].strip("'"),
                                'date_of_birth': fields[5].strip("'"),
                                'annual_income': float(fields[6]),
                                'credit_score': int(fields[7]),
                                'employment_status': fields[8].strip("'"),
                                'marital_status': fields[9].strip("'"),
                                'family_size': int(fields[10]),
                                'preferred_location': fields[11].strip("'"),
                                'budget_min': float(fields[12]),
                                'budget_max': float(fields[13]),
                                'customer_since': fields[14].strip("'"),
                                'home_state': fields[15].strip("'"),
                                'occupation': fields[16].strip("'"),
                                'employer': fields[17].strip("'"),
                                'years_employed': int(fields[18]),
                                'monthly_income': float(fields[19]),
                                'debt_to_income_ratio': float(fields[20]),
                                'savings_amount': float(fields[21]),
                                'first_time_buyer': fields[22].upper() == 'TRUE',
                                'pre_approved_amount': float(fields[23])
                            }
                        except (ValueError, IndexError) as e:
                            print(f"❌ Error parsing customer line: {e}")
                            continue
    except Exception as e:
        print(f"❌ Error parsing customer data: {e}")
        return {}, {}, {}
    
    print(f"✅ Parsed {len(customers)} customers")
    
    # Parse house data - simplified approach
    houses = {}
    try:
        with open('03_houses_data_v2.sql', 'r') as f:
            content = f.read()
            
            # Find all INSERT lines that start with (2xxx for houses
            lines = content.split('\n')
            for line in lines:
                line = line.strip()
                if line.startswith('(2') and line.endswith('),'):
                    # Remove leading ( and trailing ),
                    data_part = line[1:-2]
                    
                    # Split by commas but handle quoted strings
                    fields = []
                    current_field = ""
                    in_quote = False
                    
                    i = 0
                    while i < len(data_part):
                        char = data_part[i]
                        if char == "'" and (i == 0 or data_part[i-1] != '\\'):
                            in_quote = not in_quote
                            current_field += char
                        elif char == ',' and not in_quote:
                            fields.append(current_field.strip())
                            current_field = ""
                        else:
                            current_field += char
                        i += 1
                    
                    # Add the last field
                    if current_field:
                        fields.append(current_field.strip())
                    
                    if len(fields) >= 12:  # Ensure we have enough fields for basic house info
                        try:
                            house_id = int(fields[0])
                            houses[house_id] = {
                                'address': fields[1].strip("'"),
                                'city': fields[2].strip("'"),
                                'state': fields[3].strip("'"),
                                'zip_code': fields[4].strip("'"),
                                'county': fields[5].strip("'"),
                                'bedrooms': int(fields[6]),
                                'bathrooms': float(fields[7]),
                                'square_footage': int(fields[8]),
                                'lot_size_sqft': int(fields[9]),
                                'year_built': int(fields[10]),
                                'property_type': fields[11].strip("'")
                            }
                        except (ValueError, IndexError) as e:
                            print(f"❌ Error parsing house line: {e}")
                            continue
    except Exception as e:
        print(f"❌ Error parsing house data: {e}")
        return {}, {}, {}
    
    print(f"✅ Parsed {len(houses)} houses")
    
    # Parse sales data with simpler approach
    sales = {}
    try:
        with open('04_sales_data_v2.sql', 'r') as f:
            content = f.read()
            
            # Find all INSERT lines that start with (4xxx
            lines = content.split('\n')
            for line in lines:
                line = line.strip()
                if line.startswith('(4') and line.endswith('),'):
                    # Remove leading ( and trailing ),
                    data_part = line[1:-2]
                    
                    # Split by commas but handle quoted strings
                    fields = []
                    current_field = ""
                    in_quote = False
                    
                    i = 0
                    while i < len(data_part):
                        char = data_part[i]
                        if char == "'" and (i == 0 or data_part[i-1] != '\\'):
                            in_quote = not in_quote
                            current_field += char
                        elif char == ',' and not in_quote:
                            fields.append(current_field.strip())
                            current_field = ""
                        else:
                            current_field += char
                        i += 1
                    
                    # Add the last field
                    if current_field:
                        fields.append(current_field.strip())
                    
                    if len(fields) >= 28:  # Ensure we have enough fields
                        try:
                            sale_id = int(fields[0])
                            sales[sale_id] = {
                                'house_id': int(fields[1]),
                                'customer_id': int(fields[2]),
                                'sale_date': fields[3].strip("'"),
                                'sale_price': float(fields[4]),
                                'listing_price': float(fields[5]),
                                'days_on_market': int(fields[6]),
                                'sale_type': fields[7].strip("'"),
                                'financing_type': fields[8].strip("'"),
                                'down_payment_amount': float(fields[9]),
                                'loan_amount': float(fields[10]),
                                'interest_rate': float(fields[11]),
                                'loan_term_years': int(fields[12]),
                                'monthly_payment': float(fields[13]),
                                'agent_id': int(fields[14]),
                                'agent_name': fields[15].strip("'"),
                                'agent_company': fields[16].strip("'"),
                                'commission_rate': float(fields[17]),
                                'commission_amount': float(fields[18]),
                                'closing_costs': float(fields[19]),
                                'inspection_passed': fields[20].upper() == 'TRUE',
                                'appraisal_value': float(fields[21]),
                                'title_company': fields[22].strip("'"),
                                'escrow_company': fields[23].strip("'"),
                                'contingencies': fields[24].strip("'"),
                                'special_terms': fields[25].strip("'"),
                                'sale_status': fields[26].strip("'"),
                                'purchase_agreement_path': fields[27].strip("'")
                            }
                        except (ValueError, IndexError) as e:
                            print(f"❌ Error parsing sales line: {e}")
                            continue
    except Exception as e:
        print(f"❌ Error parsing sales data: {e}")
        return {}, {}, {}
    
    print(f"✅ Parsed {len(sales)} sales transactions")
    print(f"📈 Data consistency check: {len(customers)} customers, {len(houses)} houses, {len(sales)} sales")
    
    return customers, houses, sales

def create_purchase_agreement_pdf(sale_id, sale_data, customer_data, house_data, output_dir):
    """Create a purchase agreement PDF using actual transaction data"""
    
    filename = f"agreement_{sale_id}.pdf"
    file_path = os.path.join(output_dir, filename)
    
    # Create PDF document
    doc = SimpleDocTemplate(file_path, pagesize=letter, topMargin=0.5*inch, bottomMargin=0.5*inch)
    story = []
    styles = getSampleStyleSheet()
    
    # Custom styles
    title_style = ParagraphStyle('CustomTitle', parent=styles['Heading1'], alignment=TA_CENTER, spaceAfter=20)
    section_style = ParagraphStyle('Section', parent=styles['Heading2'], spaceBefore=15, spaceAfter=10)
    normal_style = styles['Normal']
    
    # Document title
    story.append(Paragraph("RESIDENTIAL REAL ESTATE PURCHASE AGREEMENT", title_style))
    story.append(Spacer(1, 0.2*inch))
    
    # Contract information table
    contract_date = datetime.strptime(sale_data['sale_date'], '%Y-%m-%d') - timedelta(days=30)
    
    contract_info = [
        ['Contract Date:', contract_date.strftime('%B %d, %Y')],
        ['Sale Date:', datetime.strptime(sale_data['sale_date'], '%Y-%m-%d').strftime('%B %d, %Y')],
        ['Property Address:', f"{house_data['address']}, {house_data['city']}, {house_data['state']} {house_data['zip_code']}"],
        ['Sale ID:', str(sale_id)]
    ]
    
    contract_table = Table(contract_info, colWidths=[2*inch, 4*inch])
    contract_table.setStyle(TableStyle([
        ('FONTNAME', (0, 0), (-1, -1), 'Helvetica'),
        ('FONTSIZE', (0, 0), (-1, -1), 10),
        ('ALIGN', (0, 0), (0, -1), 'RIGHT'),
        ('VALIGN', (0, 0), (-1, -1), 'TOP'),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 5),
    ]))
    story.append(contract_table)
    story.append(Spacer(1, 0.2*inch))
    
    # Parties section
    story.append(Paragraph("1. PARTIES", section_style))
    
    buyer_name = f"{customer_data['first_name']} {customer_data['last_name']}"
    
    parties_text = f"""
    <b>BUYER:</b> {buyer_name}<br/>
    Address: {customer_data['preferred_location']}, {customer_data['home_state']}<br/>
    Phone: {customer_data['phone']}<br/>
    Email: {customer_data['email']}<br/><br/>
    
    <b>SELLER'S AGENT:</b> {sale_data['agent_name']}<br/>
    Company: {sale_data['agent_company']}<br/>
    License: {sale_data['agent_id']}<br/>
    """
    story.append(Paragraph(parties_text, normal_style))
    
    # Property description
    story.append(Paragraph("2. PROPERTY DESCRIPTION", section_style))
    
    property_text = f"""
    <b>Property Address:</b> {house_data['address']}, {house_data['city']}, {house_data['state']} {house_data['zip_code']}<br/>
    <b>County:</b> {house_data['county']}<br/>
    <b>Property Type:</b> {house_data['property_type']}<br/>
    <b>Bedrooms:</b> {house_data['bedrooms']}<br/>
    <b>Bathrooms:</b> {house_data['bathrooms']}<br/>
    <b>Square Footage:</b> {house_data['square_footage']:,} sq ft<br/>
    <b>Lot Size:</b> {house_data['lot_size_sqft']:,} sq ft<br/>
    <b>Year Built:</b> {house_data['year_built']}<br/>
    """
    story.append(Paragraph(property_text, normal_style))
    
    # Purchase price and terms
    story.append(Paragraph("3. PURCHASE PRICE AND TERMS", section_style))
    
    price_text = f"""
    <b>Purchase Price:</b> ${sale_data['sale_price']:,.2f}<br/>
    <b>Original Listing Price:</b> ${sale_data['listing_price']:,.2f}<br/>
    <b>Days on Market:</b> {sale_data['days_on_market']} days<br/>
    <b>Earnest Money:</b> ${sale_data['sale_price'] * 0.01:,.2f} (1% of purchase price)<br/>
    """
    story.append(Paragraph(price_text, normal_style))
    
    # Financing details
    story.append(Paragraph("4. FINANCING DETAILS", section_style))
    
    if sale_data['financing_type'] == 'Cash':
        financing_text = f"""
        <b>Financing Type:</b> {sale_data['financing_type']}<br/>
        <b>Cash Payment:</b> ${sale_data['sale_price']:,.2f}<br/>
        <b>No financing contingency required</b><br/>
        """
    else:
        financing_text = f"""
        <b>Financing Type:</b> {sale_data['financing_type']}<br/>
        <b>Down Payment:</b> ${sale_data['down_payment_amount']:,.2f}<br/>
        <b>Loan Amount:</b> ${sale_data['loan_amount']:,.2f}<br/>
        <b>Interest Rate:</b> {sale_data['interest_rate']:.3f}%<br/>
        <b>Loan Term:</b> {sale_data['loan_term_years']} years<br/>
        <b>Monthly Payment:</b> ${sale_data['monthly_payment']:,.2f}<br/>
        """
    story.append(Paragraph(financing_text, normal_style))
    
    # Buyer financial qualification
    story.append(Paragraph("5. BUYER FINANCIAL QUALIFICATION", section_style))
    
    buyer_financial_text = f"""
    <b>Annual Income:</b> ${customer_data['annual_income']:,.2f}<br/>
    <b>Monthly Income:</b> ${customer_data['monthly_income']:,.2f}<br/>
    <b>Credit Score:</b> {customer_data['credit_score']}<br/>
    <b>Employment:</b> {customer_data['occupation']} at {customer_data['employer']}<br/>
    <b>Years Employed:</b> {customer_data['years_employed']}<br/>
    <b>Debt-to-Income Ratio:</b> {customer_data['debt_to_income_ratio']:.1%}<br/>
    <b>Savings Amount:</b> ${customer_data['savings_amount']:,.2f}<br/>
    <b>Pre-approved Amount:</b> ${customer_data['pre_approved_amount']:,.2f}<br/>
    <b>First-time Buyer:</b> {'Yes' if customer_data['first_time_buyer'] else 'No'}<br/>
    """
    story.append(Paragraph(buyer_financial_text, normal_style))
    
    # Contingencies and special terms
    story.append(Paragraph("6. CONTINGENCIES AND SPECIAL TERMS", section_style))
    
    contingencies_text = f"""
    <b>Contingencies:</b> {sale_data['contingencies']}<br/>
    <b>Special Terms:</b> {sale_data['special_terms']}<br/>
    <b>Inspection Contingency:</b> 10 business days from contract acceptance<br/>
    <b>Financing Contingency:</b> 21 business days from contract acceptance<br/>
    <b>Appraisal Contingency:</b> Subject to property appraisal at or above purchase price<br/>
    """
    story.append(Paragraph(contingencies_text, normal_style))
    
    # Closing information
    story.append(Paragraph("7. CLOSING INFORMATION", section_style))
    
    closing_text = f"""
    <b>Estimated Closing Costs:</b> ${sale_data['closing_costs']:,.2f}<br/>
    <b>Title Company:</b> {sale_data['title_company']}<br/>
    <b>Escrow Company:</b> {sale_data['escrow_company']}<br/>
    <b>Appraisal Value:</b> ${sale_data['appraisal_value']:,.2f}<br/>
    <b>Inspection Status:</b> {'Passed' if sale_data['inspection_passed'] else 'Pending'}<br/>
    """
    story.append(Paragraph(closing_text, normal_style))
    
    # Agent commission
    story.append(Paragraph("8. REAL ESTATE COMMISSION", section_style))
    
    commission_text = f"""
    <b>Listing Agent:</b> {sale_data['agent_name']}<br/>
    <b>Commission Rate:</b> {sale_data['commission_rate']:.1%}<br/>
    <b>Commission Amount:</b> ${sale_data['commission_amount']:,.2f}<br/>
    """
    story.append(Paragraph(commission_text, normal_style))
    
    # Signatures section
    story.append(Spacer(1, 0.3*inch))
    story.append(Paragraph("9. SIGNATURES", section_style))
    
    signature_text = """
    By signing below, the parties acknowledge they have read, understood, and agree to all terms and conditions of this Purchase Agreement.
    """
    story.append(Paragraph(signature_text, normal_style))
    story.append(Spacer(1, 0.3*inch))
    
    # Signature table
    sig_data = [
        ['BUYER SIGNATURE', 'DATE'],
        ['', ''],
        [f'{buyer_name}', ''],
        ['', ''],
        ['AGENT SIGNATURE', 'DATE'],
        ['', ''],
        [f'{sale_data["agent_name"]}', ''],
    ]
    
    sig_table = Table(sig_data, colWidths=[3*inch, 2*inch])
    sig_table.setStyle(TableStyle([
        ('FONTNAME', (0, 0), (-1, -1), 'Helvetica'),
        ('FONTSIZE', (0, 0), (-1, -1), 10),
        ('BOTTOMPADDING', (1, 1), (1, 1), 20),
        ('BOTTOMPADDING', (1, 3), (1, 3), 20),
        ('BOTTOMPADDING', (1, 6), (1, 6), 20),
        ('LINEBELOW', (0, 1), (0, 1), 1, colors.black),
        ('LINEBELOW', (1, 1), (1, 1), 1, colors.black),
        ('LINEBELOW', (0, 4), (0, 4), 1, colors.black),
        ('LINEBELOW', (1, 4), (1, 4), 1, colors.black),
        ('LINEBELOW', (0, 6), (0, 6), 1, colors.black),
        ('LINEBELOW', (1, 6), (1, 6), 1, colors.black),
    ]))
    story.append(sig_table)
    
    # Footer
    story.append(Spacer(1, 0.2*inch))
    footer_text = f"""
    <i>This agreement was generated on {datetime.now().strftime('%B %d, %Y')} for Housing Intelligence Database Sale ID {sale_id}.<br/>
    All financial figures and terms reflect actual transaction data.</i>
    """
    story.append(Paragraph(footer_text, normal_style))
    
    # Build PDF
    doc.build(story)
    return filename

def generate_registration_sql(sales_data, customers_data, houses_data):
    """Generate SQL file to register all purchase agreements"""
    
    registration_lines = [
        "-- ================================================================",
        "-- PURCHASE AGREEMENT REGISTRATION - V2 DATA",
        "-- ================================================================",
        "-- Register 60 purchase agreement PDFs with actual sales data",
        "",
        "USE DATABASE HOUSING_INTELLIGENCE;",
        "USE SCHEMA CORE;",
        "",
        "-- Register each purchase agreement with actual metadata",
        ""
    ]
    
    for sale_id in sorted(sales_data.keys()):
        sale = sales_data[sale_id]
        customer = customers_data[sale['customer_id']]
        house = houses_data[sale['house_id']]
        
        # Calculate contract date (30 days before closing)
        contract_date = datetime.strptime(sale['sale_date'], '%Y-%m-%d') - timedelta(days=30)
        
        # Create summary of key terms
        buyer_name = f"{customer['first_name']} {customer['last_name']}"
        property_address = f"{house['address']}, {house['city']}, {house['state']}"
        
        if sale['financing_type'] == 'Cash':
            financing_summary = f"Cash Purchase: ${sale['sale_price']:,.2f}"
        else:
            financing_summary = f"Financing: {sale['financing_type']} | Down Payment: ${sale['down_payment_amount']:,.2f} | Loan: ${sale['loan_amount']:,.2f}"
        
        special_terms_summary = f"{sale['contingencies']} | {financing_summary}"
        
        registration_lines.extend([
            f"CALL REGISTER_PURCHASE_AGREEMENT(",
            f"    {sale_id},",
            f"    'agreement_{sale_id}.pdf',",
            f"    '@PURCHASE_AGREEMENTS_STAGE/agreement_{sale_id}.pdf',",
            f"    '{contract_date.strftime('%Y-%m-%d')}',",
            f"    '{sale['sale_date']}',",
            f"    '{special_terms_summary}'",
            ");",
            ""
        ])
    
    registration_lines.extend([
        "-- ================================================================",
        "-- VERIFY REGISTRATION",
        "-- ================================================================",
        "SELECT ",
        "    'Purchase Agreements Registered' AS STATUS,",
        "    COUNT(*) AS TOTAL_AGREEMENTS",
        "FROM PURCHASE_AGREEMENTS;",
        "",
        "-- Show sample registrations",
        "SELECT ",
        "    AGREEMENT_ID,",
        "    SALE_ID,",
        "    DOCUMENT_NAME,",
        "    CONTRACT_DATE,",
        "    SPECIAL_TERMS",
        "FROM PURCHASE_AGREEMENTS",
        "ORDER BY SALE_ID",
        "LIMIT 10;",
        "",
        f"COMMENT ON TABLE PURCHASE_AGREEMENTS IS 'Metadata for 60 purchase agreement PDFs generated from actual V2 sales data on {datetime.now().strftime('%Y-%m-%d')}';",
    ])
    
    with open('register_purchase_agreements_v2.sql', 'w') as f:
        f.write('\n'.join(registration_lines))
    
    print(f"✅ Generated registration SQL: register_purchase_agreements_v2.sql")

def main():
    """Main function to generate all purchase agreement PDFs"""
    print("🏠 HOUSING INTELLIGENCE PURCHASE AGREEMENT GENERATOR V2")
    print("=" * 60)
    
    # Parse actual data from SQL files
    customers_data, houses_data, sales_data = parse_sql_data()
    
    if not customers_data or not houses_data or not sales_data:
        print("❌ Failed to parse SQL data files. Please check file format.")
        return
    
    # Verify data consistency
    print(f"\n📊 Data Verification:")
    print(f"   Customers: {len(customers_data)}")
    print(f"   Houses: {len(houses_data)}")
    print(f"   Sales: {len(sales_data)}")
    
    # Check for 1:1 relationships
    customer_ids_in_sales = set(sale['customer_id'] for sale in sales_data.values())
    house_ids_in_sales = set(sale['house_id'] for sale in sales_data.values())
    
    print(f"   Unique customers in sales: {len(customer_ids_in_sales)}")
    print(f"   Unique houses in sales: {len(house_ids_in_sales)}")
    
    if len(customer_ids_in_sales) == len(sales_data) and len(house_ids_in_sales) == len(sales_data):
        print("✅ Perfect 1:1 customer-house relationship confirmed!")
    else:
        print("❌ Data relationship error detected!")
        return
    
    # Create output directory
    output_dir = "purchase_agreements"
    Path(output_dir).mkdir(exist_ok=True)
    
    # Generate PDFs using actual data
    print(f"\n📄 Generating {len(sales_data)} purchase agreement PDFs using ACTUAL sales data...")
    print("   Data matches V2 database exactly")
    
    generated_files = []
    
    for sale_id in sorted(sales_data.keys()):
        sale = sales_data[sale_id]
        customer = customers_data[sale['customer_id']]
        house = houses_data[sale['house_id']]
        
        filename = create_purchase_agreement_pdf(sale_id, sale, customer, house, output_dir)
        generated_files.append(filename)
        print(f"   Generated: {filename}")
    
    # Generate registration SQL
    generate_registration_sql(sales_data, customers_data, houses_data)
    
    # Final summary
    print(f"\n🎉 GENERATION COMPLETE!")
    print(f"   Generated {len(generated_files)} purchase agreement PDFs")
    print(f"   Files saved to: {output_dir}/")
    print(f"   Registration SQL: register_purchase_agreements_v2.sql")
    print(f"   Data source: V2 database with perfect 1:1 relationships")
    print(f"\n✅ All PDFs generated with ACTUAL sales data from your V2 database!")
    print(f"   Each PDF reflects real customer, property, and transaction details")
    print(f"   Ready for Snowflake Cortex Search integration")

if __name__ == "__main__":
    main()