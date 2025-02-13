# Predicting Admission with Regression
In this project, we will be using application factors (such as test scores) to predict the likelihood that an applicant will be accepted to graduate school.

## Dataset
This dataset is taken from the [Graduate Admission 2](https://www.kaggle.com/datasets/mohansacharya/graduate-admissions) Dataset on Kaggle. The variables in the dataset include:

| Variable | Description |
| :-----------: | -------- |
| Serial No. | The application id |
| GRE Score | GRE Scores (out of 340) |
| TOEFL Score | TOEFL Scores (out of 120) |
| University Rating | University Rating (out of 5) |
| SOP | Letter of Recommendation |
| LOR | Statement of Purpose Strength (out of 5)  |
| CGPA  | Undergraduate GPA (out of 10) |
| Research | Research Experience (either 0 or 1) |
| Chance of Admit | Chance of Admission (ranging from 0 to 1) |


## Model
To predict the chance of admission, we will use a simple sequential model using TensorFlow's Keras module.

## Libraries
To run the code locally, you will need Python 3.7+ and the following libraries:
  * sklearn
  * tensorflow
  * keras
  * pandas
  * matplotlib
