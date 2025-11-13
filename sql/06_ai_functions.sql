-- Spam detection demo
CREATE TABLE IF NOT EXISTS dbsql_samuel.demo.inbox_messages (
  timestamp TIMESTAMP,
  from_number STRING,
  text STRING
);

SELECT
  text,
  ai_query(
    "databricks-meta-llama-3-3-70b-instruct",
    "Classify the following message as spam or not spam: " || text
  ) AS is_spam
FROM dbsql_samuel.demo.inbox_messages
LIMIT 10;

-- Airline type classification demo
SELECT
  IATA,
  ai_classify(
    content => IATA,
    labels => array('full service carriers','low cost carriers','regional airlines','charter airlines')
  ) AS airline_category
FROM dbsql_samuel.demo.airports
LIMIT 10;
