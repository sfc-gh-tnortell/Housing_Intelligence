# Housing Intelligence - Snowflake Cortex Analyst Implementation

This repository contains a complete implementation of a Snowflake Agent with Cortex Analyst capabilities for housing sales analysis. The system enables natural language querying of housing sales data, customer demographics, and property characteristics.

## 🏗️ Architecture Overview

The solution consists of:
- **Database & Schema**: Structured storage for housing data
- **Data Tables**: Customer, property characteristics, and sales transaction data  
- **Semantic Model**: YAML-based model defining relationships and business context
- **Semantic View**: SQL view with derived dimensions and measures
- **Cortex Analyst**: Natural language to SQL conversion engine
- **Dashboard Views**: Pre-built analytics for common queries

## 📁 Project Structure

```
Housing_Intelligence/
├── 01_database_setup.sql          # Database, schema, and table creation
├── 02_sample_data.sql              # Sample data insertion and validation
├── 03_semantic_model.yaml          # Semantic model definition for Cortex
├── 04_semantic_view.sql            # Semantic view and derived dimensions
├── 05_cortex_analyst_setup.sql     # Cortex Analyst and analytical views
├── Prompt_Intelligence_house.md    # Original requirements document
└── README_IMPLEMENTATION.md        # This implementation guide
```

## 🚀 Deployment Instructions

### Step 1: Database Setup
```sql
-- Execute the database setup script
@01_database_setup.sql
```
This creates:
- `HOUSING_INTELLIGENCE` database
- `CORE` schema
- Three main tables: `CUSTOMERS`, `HOUSE_CHARACTERISTICS`, `HOUSE_SALES`
- Indexes and constraints for performance

### Step 2: Load Sample Data
```sql
-- Execute the sample data script
@02_sample_data.sql
```
This populates the tables with realistic sample data for testing.

### Step 3: Deploy Semantic Model
1. Upload the YAML semantic model to Snowflake:
```sql
PUT file://03_semantic_model.yaml @HOUSING_INTELLIGENCE.CORE.SEMANTIC_MODELS;
```
2. Execute the semantic view creation:
```sql
@04_semantic_view.sql
```

### Step 4: Setup Cortex Analyst
```sql
-- Execute the Cortex Analyst setup
@05_cortex_analyst_setup.sql
```

## 📊 Data Model

### Core Tables

#### CUSTOMERS
- Customer demographics and preferences
- Income, credit score, family information
- Buying preferences and budget ranges

#### HOUSE_CHARACTERISTICS  
- Property details: location, size, features
- Amenities: pool, fireplace, garage
- Neighborhood and school district information

#### HOUSE_SALES
- Transaction records linking customers to properties
- Pricing, financing, and agent information
- Market timing and contingency details

### Derived Dimensions

The semantic view adds calculated dimensions:
- **Customer Age Groups**: Under 30, 30-39, 40-49, 50-59, 60+
- **Income Brackets**: Under $50K, $50K-$75K, $75K-$100K, $100K-$150K, $150K+
- **Credit Ratings**: Poor, Fair, Good, Very Good, Excellent
- **Property Size Categories**: Small, Medium, Large, Very Large
- **Property Age Categories**: New, Recent, Modern, Established, Vintage
- **Market Timing**: Very Fast, Fast, Normal, Slow

## 🗣️ Natural Language Queries

With Cortex Analyst deployed, you can ask questions like:

### Market Analysis
- "What is the average sale price by property type?"
- "Show me the top 5 neighborhoods by average sale price"
- "How has the average days on market changed over time?"
- "What percentage of sales are cash vs financed?"

### Customer Analysis  
- "How does customer income affect the price of homes they buy?"
- "What is the most popular property type for families with children?"
- "Compare purchasing patterns between married and single customers"
- "What credit score range buys the most expensive homes?"

### Property Analysis
- "Which property features correlate with higher sale prices?"
- "How does walkability affect property values?"
- "Compare price per square foot across different cities"
- "What is the relationship between property age and sale speed?"

### Financial Analysis
- "What is the average down payment percentage by income bracket?"
- "How do interest rates vary by customer credit score?"
- "What are the total commission amounts by agent?"
- "Compare closing costs across different financing types?"

## 📈 Pre-built Analytics

The implementation includes several analytical views:

### MONTHLY_SALES_TRENDS
Monthly aggregated metrics for trend analysis

### PROPERTY_TYPE_PERFORMANCE  
Performance comparison across property types

### GEOGRAPHIC_ANALYSIS
Location-based pricing and market analysis

### CUSTOMER_SEGMENT_ANALYSIS
Customer behavior segmentation

## 🔧 Usage Examples

### Using Cortex Analyst
```sql
SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST',
    'What is the average sale price for homes with pools in Austin?'
);
```

### Using Pre-built Procedures
```sql
-- Get market summary
CALL MARKET_ANALYSIS_SP();

-- Get customer analysis
CALL CUSTOMER_ANALYSIS_SP();
```

### Querying Analytical Views
```sql
-- View property type performance
SELECT * FROM PROPERTY_TYPE_PERFORMANCE;

-- View geographic trends
SELECT * FROM GEOGRAPHIC_ANALYSIS 
WHERE CITY = 'Austin';
```

## 🎯 Key Features

### Business Intelligence Capabilities
- **Natural Language Processing**: Ask questions in plain English
- **Automatic SQL Generation**: Cortex converts questions to optimized SQL
- **Rich Semantic Context**: YAML model provides business context
- **Multi-dimensional Analysis**: Customer, property, temporal, and geographic dimensions

### Performance Optimizations
- Indexed tables for fast queries
- Pre-aggregated views for common analyses  
- Efficient joins using primary/foreign key relationships
- Calculated fields stored in semantic view

### Extensibility
- Modular design allows easy addition of new data sources
- Semantic model can be extended with new dimensions/measures
- Additional analytical views can be created as needed
- Support for both streaming and batch data updates

## 🔐 Security & Permissions

All objects are created with appropriate permissions for `SYSADMIN` role. For production deployment:
1. Create dedicated roles for different user groups
2. Implement row-level security if needed
3. Set up proper data governance policies
4. Configure audit logging for compliance

## 🔄 Maintenance

### Adding New Data
```sql
-- Insert new customers
INSERT INTO CUSTOMERS VALUES (...);

-- Insert new properties  
INSERT INTO HOUSE_CHARACTERISTICS VALUES (...);

-- Insert new sales
INSERT INTO HOUSE_SALES VALUES (...);
```

### Updating Semantic Model
1. Modify the YAML file with new dimensions/measures
2. Re-upload to the stage
3. Refresh the Cortex Analyst configuration

### Performance Monitoring
- Monitor query performance through Snowflake's query history
- Analyze Cortex Analyst usage patterns
- Update indexes based on actual query patterns

## 📋 Requirements Fulfilled

✅ **Database and Schema**: Created `HOUSING_INTELLIGENCE` database with `CORE` schema  
✅ **Separate Tables**: Customer, house characteristics, and sales data in distinct tables  
✅ **Semantic View**: Comprehensive view with business context and derived dimensions  
✅ **Cortex Analyst**: Natural language query interface using semantic model  
✅ **Sample Data**: Realistic test data for demonstration  
✅ **Documentation**: Complete implementation and usage guide

## 🚀 Next Steps

1. **Data Integration**: Connect to real estate data sources (MLS, CRM systems)
2. **Advanced Analytics**: Add predictive models for price forecasting
3. **Visualization**: Create Snowsight dashboards or connect to BI tools
4. **Automation**: Set up scheduled data refreshes and model retraining
5. **Expansion**: Add more data sources (market trends, demographic data, etc.)

## 📞 Support

For questions about this implementation:
1. Review the Snowflake Cortex documentation links in the original prompt
2. Check the test queries in each SQL file
3. Examine the semantic model YAML for understanding data relationships
4. Use the pre-built analytical views as starting points for custom analysis

This implementation provides a solid foundation for housing market analysis with natural language capabilities through Snowflake's Cortex platform.