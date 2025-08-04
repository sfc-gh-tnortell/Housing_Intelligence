# 🚀 Quick Start Guide - Housing Intelligence Snowflake Agent

## Overview
This guide will get your Housing Intelligence Snowflake Agent with Cortex Analyst up and running in 5 simple steps.

## Prerequisites
- Snowflake account with Cortex features enabled
- `SYSADMIN` role or equivalent permissions
- Access to Snowsight or SnowSQL

## 📋 Execution Checklist

### Step 1: Database Setup (2 minutes)
```sql
-- Copy and paste the entire content of:
-- 01_database_setup.sql
-- into Snowsight and execute
```
✅ Creates database, schema, and tables with proper indexes

### Step 2: Load Sample Data (1 minute)  
```sql
-- Copy and paste the entire content of:
-- 02_sample_data.sql
-- into Snowsight and execute
```
✅ Populates tables with 10 customers, 12 properties, and 10 sales records

### Step 3: Create Semantic View (1 minute)
```sql
-- Copy and paste the entire content of:
-- 04_semantic_view.sql
-- into Snowsight and execute
```
✅ Creates comprehensive semantic view with derived dimensions

### Step 4: Deploy Cortex Analyst (2 minutes)
```sql
-- Copy and paste the entire content of:
-- 05_cortex_analyst_setup.sql
-- into Snowsight and execute
```
✅ Sets up Cortex Analyst and analytical views

### Step 5: Test Natural Language Queries (1 minute)
```sql
-- Test with these example queries:
SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST_VIEW',
    'What is the average sale price by property type?'
);

SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST_VIEW', 
    'Show me customers who bought homes over $400,000'
);
```
✅ Validates natural language querying works

## 🎯 Expected Results

After completion, you'll have:
- ✅ 3 core tables with sample housing data
- ✅ 1 semantic view with 20+ derived dimensions  
- ✅ 1 Cortex Analyst for natural language queries
- ✅ 4 analytical views for common analyses
- ✅ 2 stored procedures for market insights

## 🔍 Verification Commands

Run these to verify successful deployment:

```sql
-- Check table record counts
SELECT 'CUSTOMERS' AS TABLE_NAME, COUNT(*) AS RECORDS FROM HOUSING_INTELLIGENCE.CORE.CUSTOMERS
UNION ALL
SELECT 'HOUSE_CHARACTERISTICS', COUNT(*) FROM HOUSING_INTELLIGENCE.CORE.HOUSE_CHARACTERISTICS  
UNION ALL
SELECT 'HOUSE_SALES', COUNT(*) FROM HOUSING_INTELLIGENCE.CORE.HOUSE_SALES;

-- Test semantic view
SELECT COUNT(*) AS SEMANTIC_VIEW_RECORDS 
FROM HOUSING_INTELLIGENCE.CORE.HOUSING_SALES_SEMANTIC_VIEW;

-- Test analytical procedures
CALL HOUSING_INTELLIGENCE.CORE.MARKET_ANALYSIS_SP();
```

Expected Output:
- CUSTOMERS: 10 records
- HOUSE_CHARACTERISTICS: 12 records  
- HOUSE_SALES: 10 records
- SEMANTIC_VIEW_RECORDS: 10 records
- Market analysis summary displayed

## 🗣️ Try These Natural Language Queries

Once deployed, ask these questions:

**Market Analysis:**
- "What is the average sale price in Austin?"
- "How many properties sold for over $500,000?"
- "Which property type has the highest average price?"

**Customer Analysis:**
- "What is the average income of customers who bought condos?"
- "How many married customers purchased homes?"
- "Show me customers with excellent credit ratings"

**Property Analysis:**
- "Which neighborhoods have the highest walk scores?"
- "How many properties have pools?"
- "What's the average square footage by property type?"

## ⚠️ Troubleshooting

**Issue**: Cortex Analyst not found
**Solution**: Ensure your Snowflake account has Cortex features enabled

**Issue**: Permission denied errors  
**Solution**: Verify you have SYSADMIN role or equivalent permissions

**Issue**: Semantic model errors
**Solution**: Check that all tables were created successfully before creating the semantic view

## 📞 Support Resources

- **Snowflake Cortex Documentation**: https://docs.snowflake.com/en/user-guide/snowflake-cortex/cortex-analyst
- **Semantic View Guide**: https://docs.snowflake.com/en/user-guide/views-semantic/overview  
- **Implementation Details**: See `README_IMPLEMENTATION.md`
- **Sample Queries**: Check individual SQL files for test queries

## 🎉 Success!

You now have a fully functional Housing Intelligence system with natural language querying capabilities powered by Snowflake Cortex Analyst!

**Total Setup Time**: ~7 minutes  
**Next Step**: Start asking questions about your housing data in plain English!