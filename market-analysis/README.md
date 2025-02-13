# Consumer Analysis with Marketing Funnels and A/B Tests
A marketing funnel is a model of the customer journey that shows how people move from discovering a brand or product to making purchases and becoming loyal advocates. This model simplifies the complex customer journey so that businesses can understand the strengths and weaknesses of a process. When businesses can break down a process into tangible steps, they can curate a more effective business strategy to attract and retain more customers.

A/B tests compare two versions of the same product or content to see which one performs better. These tests are another way to break down complex consumer interactions by isolating variables to attract and retain more businesses in the future.

## Objective
This projects analyzes customer data for a website selling eyeglasses. In this project we will:
  * create a marketing funnel from a survey given to customers
  * create a funnel from the journey of several customers through the process of buying a product
  * compare the results of an A/B test given to users of a website
  * provide actionable insights and recommendations based on the results

We will use SQL to query the database and aggregate the data. Then we will use MS Excel to create summary tables. Finally, we will use MS PowerPoint to present the findings and provide recommendations.

## Files
This project contains two files:

| Filename | Description |
| :-----------: | -------- |
| Warby Parker Marketing Funnel.xlsx | Tables and graphs of results from SQL queries |
| Warby Parker Marketing Funnels.pdf | PowerPoint presentation of findings and recommendations |


## Database
This database includes 4 tables: survey, quiz, home_try_on, purchase.

### Survey Table
Includes survey questions and the corresponding answers for all customers.

| Variable | Description |
| :-----------: | -------- |
| question | The question the user answered |
| user_id | The user's unique ID |
| response | The user's answer to the question |

### Quiz Table
Includes quiz questions and the corresponding answers about the type of glasses a customer was looking for.

| Variable | Description |
| :-----------: | -------- |
| user_id | The customer's unique ID |
| style | Women's or Men's sytle (of glasses) |
| fit | The size of the glasses (medium, narrow, wide) |
| shape | The shape of the glasses (rectangular, round) |
| color | The color of the glasses |

### Survey Table
Includes the number of glasses a customer opted to try and their delivery address.

| Variable | Description |
| :-----------: | -------- |
| user_id | The customer's unique ID |
| number_of_pairs | The numeber of glasses a customer's will try on |
| address | The customer's address |

### Purchase Table
Includes a list of ordered glasses.

| Variable | Description |
| :-----------: | -------- |
| user_id | The user's unique ID |
| product_id | The product's unique ID |
| style | Women's or Men's sytle (of glasses) |
| model_name | The name of the version of a particular pair of glasses |
| color | The color of the glasses |
| price | The price of the pair of glasses |

