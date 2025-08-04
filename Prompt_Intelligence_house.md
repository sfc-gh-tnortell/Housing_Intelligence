You are a expert in Snowflake development and Data Science agent creation.

SUMMARY
You will create a Snowflake Agent with both Cortex Analyst and Cortex Search capabilities.  The datasets needed will be house sales, housing characteristics of the purchased houses and customers who purchased the homes. For each home sale there will also need to be a PDF document with a Purchase Agreement which will be stored as a PDF in a Snowflake Stage.  Create a single database to store all this information and separate the datasets by tables.


What is Snowflake Cortex?
The platform leverages three powerful Snowflake Cortex capabilities:

Cortex Analyst:
    - Converts natural language questions into SQL queries
    - Understands semantic models defined in YAML files or Semantic Views
    - Enables querying data without writing SQL manually
    - Handles complex analytical questions 
    - Achieves over 90% accuracy through user-generated semantic models that capture domain knowledge and business context

Cortex Search:
    - Delivers best-in-class search performance through a hybrid approach combining semantic and keyword search
    - Leverages an advanced embedding model (E5) to understand complex semantic relationships
    - Enables searching across unstructured data with exceptional accuracy and speed
    - Supports real-time indexing and querying of large-scale text data
    - Returns contextually relevant results ranked by relevance scores


Cortex Agents:
The Cortex Agents is a stateless REST API endpoint that:

    - Seamlessly combines Cortex Search's hybrid search capabilities with Cortex Analyst's 90%+ accurate SQL generation
    - Streamlines complex workflows by handling:
        - Context retrieval through semantic and keyword search
        - Natural language to SQL conversion via semantic models
        - LLM orchestration and prompt management
    - Enhances response quality through:
        - In-line citations to source documents
        - Built-in answer abstaining for irrelevant questions
        - Multi-message conversation context management
    - Optimizes application development with:
        - Single API call integration
        - Streamed responses for real-time interactions
        - Reduced latency through efficient orchestration
    - These capabilities work together to:
        - Search through sales conversations for relevant context
        - Go from Text to SQL to answer analytical questions
        - Combine structured and unstructured data analysis
        - Provide natural language interactions with your data


REQUIREMENTS
1. Create a database and schema to store each of the datasets in their own tables.
2. The datasets should spanning two years of sales and have more than one state for the location of the houses being purchased.
3. Each customer should only buy one house, make enough customer and house data to support this.
4. Create a purchase agreement matching the sales data for each sale using the example purchase agreement linked in USEFUL RESOURCES and store them in an internal stage for the newly created database
5. for the purchase agreement generator input all the sales_data to match the generated house sales data, the purchase agreements should not be generated with random numbers they should match the values in the created table
6. Create a semantic view for the customer, sales and housing characteristic data generated. 
7. Create a Cortex Analyst object with the newly created semantic view.
8. Create a Cortex Search service for the purchase agreements.


USEFUL RESOURCES
- Documentation on Cortex Analyst: https://docs.snowflake.com/en/user-guide/snowflake-cortex/cortex-analyst
- Documentation on Semantic View: https://docs.snowflake.com/en/user-guide/views-semantic/overview
- Documentation on Cortex Search: https://docs.snowflake.com/en/user-guide/snowflake-cortex/cortex-search/cortex-search-overview
- Documentation on Cortex Agents: https://docs.snowflake.com/en/user-guide/snowflake-cortex/cortex-agents
- Documentation on Snowflake Intelligence: https://docs.snowflake.com/en/user-guide/snowflake-cortex/snowflake-intelligence
- Example Residential Real Estate Purchase Agreement: https://freeforms.com/wp-content/uploads/2020/12/Washington-Residential-Real-Estate-Purchase-Agreement.pdf
- Documentation on Snowflake Stages for PDF: https://docs.snowflake.com/en/user-guide/data-load-local-file-system-create-stage