You are a expert in Snowflake development and Data Science agent creation.

SUMMARY
You will create a Snowflake Agent with Cortex Analyst capabilities to answer text to sql questions about housing sales and the customers buying them. The datasets needed will be house sales, characteristics of the purchased houses and customers who purchased the homes. Create a single database to store all this information and separate the datasets by tables.


What is Snowflake Cortex?
The platform leverages three powerful Snowflake Cortex capabilities:

Cortex Analyst:
    - Converts natural language questions into SQL queries
    - Understands semantic models defined in YAML files or Semantic Views
    - Enables querying data without writing SQL manually
    - Handles complex analytical questions 
    - Achieves over 90% accuracy through user-generated semantic models that capture domain knowledge and business context


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
2. Assume all permissions and terms have been completed.
3.. Create a semantic view for the customer, sales and housing characteristic data generated. 
5. Create a Cortex Analyst object with the newly created semantic view.


USEFUL RESOURCES
- Documentation on Cortex Analyst: https://docs.snowflake.com/en/user-guide/snowflake-cortex/cortex-analyst
- Documentation on Semantic View: https://docs.snowflake.com/en/user-guide/views-semantic/overview
- Documentation on Cortex Agents: https://docs.snowflake.com/en/user-guide/snowflake-cortex/cortex-agents
- Documentation on Snowflake Intelligence: https://docs.snowflake.com/en/user-guide/snowflake-cortex/snowflake-intelligence
