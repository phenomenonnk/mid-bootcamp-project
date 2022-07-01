# mid-bootcamp-project

Project  - regression

Targets of the Mid Bootcamp Project

Data analysis of the real estate company’s data
Explore the data
Build a machine learning model to predict the selling prices of houses based on features provided in the dataset
Compare the accuracies of different models  and find the model that best fits our data Explore the characteristics of the houses using some business intelligence tools
Understanding which factors are responsible for higher property value - $650K and above
Visualize the explored data
Answering SQL and Tableau given questions


Background: working as an analyst for a real estate company.
The company wants to build a machine learning model to predict the selling prices of houses based on a variety of features on which the value of the house is evaluated.

Objective: The task is to build a model that will predict the price of a house based on features provided in the dataset.
The senior management also wants to explore the characteristics of the houses using some business intelligence tool. 
One of those parameters include understanding which factors are responsible for higher property value - \$650K and above.
The questions have been provided later in the document for which you can use tableau.

Data: The data set consists of information on some 22,000 properties.  The dataset consisted of historic data of houses sold between May 2014 to May 2015.
These are the definitions of data points provided:
(Note: For some of the variables that are self explanatory, no definition has been provided)

- **Id**: Unique identification number for the property.
- **date**: date the house was sold.
- **price**: price of the house.
- **waterfront**: house which has a view to a waterfront.
- **condition**: How good the condition is (overall). **1** indicates worn out property and **5** excellent.
- **grade**: Overall grade given to the housing unit, based on King County grading system. 1 poor ,13 excellent.
- **Sqft_above**: square footage of house apart from basement.
- **Sqft_living15**: Living room area in 2015(implies - some renovations). This might or might not have affected the lotsize area.
- **Sqft_lot15**: lotSize area in 2015(implies - some renovations).


I also upload the presentation where you can find the process we followed and you
can find comments and notes in Jupyter notebook so you can understand the exact process in detail.

The basic process we followed is:
We compared 3 different models and we found that the model, with applying Linear Regression after using MinMaxScaler scaling, 
encoded for categorical and using the whole data without extreme outliers (outliers of the outliers), 
that means observations smaller than 2 M$, fits best to our data with correlation 0.83040.

here are the tableau material
story of the regression tableau
https://public.tableau.com/views/StoryRegressiontableau/StoryRegressiontableau?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link

dashboard of the regression tableau
https://public.tableau.com/views/DashboardRegressiontableau/DashboardRegressiontableau?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link