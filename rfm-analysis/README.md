# RFM Analysis
This project was completed as part of HiCounselor's Data Science module.

This project aims to uncover valuable insights by from customer data by analyzing recency, frequency, and monetary (RFM) behavior. Through RFM analysis, we can identify loyal customers and market to them to increase longevity. Specifically, we will use pandas to:
  * load customer data
  * calculate the number of days since the last purchase
  * calculate the number of purchases a customer made
  * calculate the sum of all purchases for each customer
  * calculate a ranking for the recency, frequency, and monetary value for each customer
  * combine the scores calculated and assigning an overall rank
      * Low-Value
      * Mid-Value
      * High-Value


## Dataset
[Customer Data](customer_data.csv) is a table of transactions:

| Variable | Description |
| :-----------: | -------- |
| CustomerID | The customer's unique ID |
| PurchaseDate | Date of the transaction |
| TransactionAmount | Total cost of the order |
| ProductInformation | The product's name |
| OrderID | The transaction's unique ID |
| Location | Customer's location |


## Libraries
To run the code locally, you will need Python 3.7+ and the following libraries:
  * pandas
  * datetime
  * matplotlib
  * seaborn
