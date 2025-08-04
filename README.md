# Housing Intelligence - Complete Snowflake Cortex System

A comprehensive Snowflake Agent combining **Cortex Analyst** (structured data) and **Cortex Search** (document search) for housing market intelligence.

## 🎯 System Overview

This system enables natural language analysis of real estate markets through dual intelligence capabilities:
- **📊 Structured Data Analysis**: Ask questions about sales trends, customer patterns, and market metrics
- **📄 Document Search**: Search through purchase agreements and legal documents semantically
- **🔗 Integrated Intelligence**: Combined insights from both data sources

## 📊 Data Coverage

### Geographic Scope
- **5 States**: Texas, California, Florida, Colorado, Arizona
- **25+ Markets**: From Silicon Valley to Miami Beach to Colorado ski resorts
- **Diverse Segments**: Urban condos to luxury estates to suburban family homes

### Temporal Scope  
- **Time Period**: January 2022 - December 2023 (24 months)
- **Market Evolution**: Captures interest rate changes from 4% to 7%+
- **Seasonal Patterns**: Full seasonal cycles across different climate zones

### Data Volume
- **35 Customers** with complete demographic and financial profiles
- **60 Properties** with detailed characteristics and amenities  
- **58 Sales Transactions** with comprehensive financing details
- **58 Purchase Agreement PDFs** with legal terms and contingencies

## 🚀 Quick Start

**Total Setup Time**: ~20 minutes

```bash
# 1. Database Setup (3 min)
Execute: 01_database_setup.sql

# 2. Load Multi-State Data (4 min)  
Execute: 02_sample_data_multi_state.sql
Execute: 03_house_sales_2022_2023.sql

# 3. Generate Documents (5 min)
python 04_purchase_agreements_generator.py

# 4. Upload to Snowflake (3 min)
PUT file://purchase_agreements/* @PURCHASE_AGREEMENTS_STAGE;
PUT file://05_semantic_model.yaml @SEMANTIC_MODELS_STAGE;

# 5. Create Analytics Layer (3 min)
Execute: 06_semantic_view.sql

# 6. Deploy Cortex Services (2 min)
Execute: 07_cortex_setup.sql
```

## 🗣️ Ask Questions in Natural Language

### Market Analysis
- *"What is the average sale price by state?"*
- *"How did home prices change from 2022 to 2023?"*
- *"Which regions have the highest price per square foot?"*
- *"Compare cash sales vs financed sales by market"*

### Customer Intelligence  
- *"How does customer income correlate with home prices?"*
- *"Which age group buys the most expensive homes?"*
- *"What credit score ranges dominate luxury purchases?"*

### Property Analysis
- *"Which states have the highest walk scores?"*
- *"How do premium features affect sale prices?"*
- *"Compare days on market across property types"*

### Document Search
- *"Find all agreements with inspection contingencies"*
- *"Search for FHA financing terms"*
- *"Locate contracts with escalation clauses"*

## 🏗️ System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    USER INTERFACE                          │
│              Natural Language Queries                      │
└─────────────────┬───────────────────┬───────────────────────┘
                  │                   │
          ┌───────▼────────┐ ┌────────▼────────┐
          │ CORTEX ANALYST │ │ CORTEX SEARCH   │
          │ Structured Data│ │ PDF Documents   │
          └───────┬────────┘ └────────┬────────┘
                  │                   │
        ┌─────────▼─────────┐ ┌───────▼────────┐
        │ SEMANTIC VIEW     │ │ DOCUMENT STAGE │
        │ Enriched Dims.    │ │ Purchase PDFs  │
        └─────────┬─────────┘ └────────────────┘
                  │
    ┌─────────────▼─────────────┐
    │     CORE DATA TABLES      │
    │ Customers | Properties    │
    │ Sales | Agreements        │
    └───────────────────────────┘
```

## 📁 File Structure

| File | Purpose | Size |
|------|---------|------|
| `01_database_setup.sql` | Database structure & stages | 4.9KB |
| `02_sample_data_multi_state.sql` | Customer & property data | 15.2KB |
| `03_house_sales_2022_2023.sql` | Sales transactions 2022-2023 | 12.8KB |
| `04_purchase_agreements_generator.py` | PDF document generator | 8.1KB |
| `05_semantic_model.yaml` | Business context for Cortex | 9.4KB |
| `06_semantic_view.sql` | Analytical views & dimensions | 7.7KB |
| `07_cortex_setup.sql` | Cortex Analyst & Search setup | 9.0KB |
| `DEPLOYMENT_GUIDE.md` | Complete setup instructions | 8.1KB |

## 🎯 Key Features

### Structured Data Intelligence
- **50+ Derived Dimensions**: Age groups, income brackets, market timing, regional classifications
- **Comprehensive Metrics**: Price trends, market performance, customer segmentation
- **Temporal Analysis**: Seasonal patterns, interest rate impacts, market evolution
- **Geographic Insights**: Multi-state comparisons, regional market performance

### Document Intelligence  
- **Semantic Search**: Find relevant contracts by meaning, not just keywords
- **Legal Term Analysis**: Search contingencies, financing terms, special clauses
- **Contextual Results**: Documents linked to property and customer data
- **Contract Intelligence**: Analyze trends in legal terms and contingencies

### Integrated Analytics
- **Unified Queries**: Combine structured metrics with document insights
- **Enriched Context**: Property data enhances document search results  
- **Dashboard Ready**: Pre-built views for visualization tools
- **API Functions**: Helper functions for application development

## 🔧 Technical Capabilities

### Snowflake Cortex Features
- ✅ **Cortex Analyst**: Natural language to SQL conversion
- ✅ **Cortex Search**: Hybrid semantic + keyword document search  
- ✅ **Semantic Models**: YAML-based business context
- ✅ **Semantic Views**: Enriched analytical dimensions
- ✅ **Integration Functions**: Combined intelligence capabilities

### Performance & Scale
- **Query Performance**: Optimized indexes and analytical views
- **Document Indexing**: Real-time search across PDF documents
- **Result Caching**: Snowflake native caching for repeated queries
- **Scalable Architecture**: Handles growing data volumes efficiently

## 🎯 Use Cases

### Real Estate Professionals
- Market trend analysis and competitive intelligence
- Customer segmentation and targeting
- Property valuation and pricing strategies
- Contract term analysis and legal research

### Financial Institutions
- Risk assessment and loan portfolio analysis
- Market condition monitoring for lending decisions
- Customer creditworthiness evaluation
- Economic trend correlation analysis

### Property Investors
- Market opportunity identification
- Investment performance analysis
- Regional market comparison
- Due diligence and contract review

### Market Researchers
- Housing market trend analysis
- Demographic correlation studies
- Economic impact assessment
- Policy and regulation impact analysis

## 🔄 Next Steps

### Expand Data Sources
- **MLS Integration**: Connect live market data
- **Economic Indicators**: Add employment, income, demographic data
- **Market Indices**: Integrate regional price indices
- **Property Records**: Add tax assessments, permits, inspections

### Advanced Analytics
- **Predictive Modeling**: Price forecasting and trend prediction
- **Market Scoring**: Automated market opportunity scoring
- **Risk Analysis**: Default probability and market risk models
- **Investment Analytics**: ROI calculations and yield analysis

### Application Development
- **Web Dashboard**: Interactive analytics interface
- **Mobile App**: Field analysis for agents and investors
- **API Integration**: Connect to CRM and property management systems
- **Automated Reporting**: Scheduled market reports and alerts

## 📞 Support

- **Setup Guide**: See `DEPLOYMENT_GUIDE.md` for detailed instructions
- **Snowflake Docs**: [Cortex Documentation](https://docs.snowflake.com/en/user-guide/snowflake-cortex/)
- **Sample Queries**: Example natural language queries included in setup files
- **Troubleshooting**: Common issues and solutions in deployment guide

---

**System Status**: ✅ Production Ready  
**Deployment Time**: ~20 minutes  
**Query Capabilities**: Natural language + semantic document search  
**Integration**: Unified structured and unstructured data intelligence

Start analyzing housing markets with the power of natural language! 🏠📊