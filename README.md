# Team Mango Mochi
By: Tenzin Zomkyi, Christina Chen, Noah Logman, and Justin Ung
## Domain of Interest
- Why are you interested in this field/domain?
- What other examples of data driven project have you found related to this domain (share at least 3)?
- What data-driven questions do you hope to answer about this domain (share at least 3)?


## Finding Data
### Dataset 1
- Where did you download the data (e.g., a web URL)?
   - [Track The Recovery Data](https://tracktherecovery.org/)
- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
   - The data was collected from private data partners: PAYCHEX, Intuit, earnin, and Kronos. The American population
- How many observations (rows) are in your data?
   - 11935 observations
- How many features (columns) are in the data?
   - 12 features
- What questions (from above) can be answered using the data in this dataset?
   - What demographic(s) have faced the worst recession during COVID-19? With this data we will be able to find how different demographics have been affected by Covid.

### Dataset 2
- Where did you download the data (e.g., a web URL)?
   - [Covid State Policy Data](https://www.openicpsr.org/openicpsr/project/119446/version/V38/view?path=/openicpsr/119446/fcr:versions/V38)
- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
   - The data was collected from a variety of sources including state mandates, orders, and official governor press releases. The data was then compiled by researchers at the Boston University School of Public Health. The data includes state policies on closures, shelter-in-place orders, housing protections, changes to Medicaid and SNAP, physical distancing closures, reopening and more.
- How many observations (rows) are in your data?
   - 50 observations (one for each state)
- How many features (columns) are in the data?
   - 136 features
- What questions (from above) can be answered using the data in this dataset?
   - We can assess what businesses are being hit the most by covid ex: businesses, restaurants, daycares, gyms, etc… We can also see how long they have been closed.
   - We can also see how states are accommodating unemployed people through insurance and  medical care policies.


### Dataset 3
- Where did you download the data (e.g., a web URL)?
   - [Labor Force Statistics Data](https://data.bls.gov/cgi-bin/surveymost?ln )
- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
   - From the U.S. Bureau of Labor Statistics, Current Population Survey’s Labor Force Statistics
   - The Current Population Survey (CPS) is a monthly survey of households conducted by the Bureau of Census for the Bureau of Labor Statistics. It provides a comprehensive body of data on the labor force, employment, unemployment, persons not in the labor force, hours of work, earnings, and other demographic and labor force characteristics.
   - Interested dataframes - we can merge all these data into 1 big dataframe if needed, each heading can be a feature
   - Unemployment Rate for:
      - 16-19 Years, 20 Years & Over Men, 20 Years & Over Women, White, Black or African American, Asian, Hispanic or Latino, 25 Years & Over (Less than a High School Diploma, High School Graduates No College, Some College or Associate Degree, Bachelor's Degree and Higher)
- How many observations (rows) are in your data?
   - 11 observations
- How many features (columns) are in the data?
   - 12 features
- What questions (from above) can be answered using the data in this dataset?
   - Answers the demographics question, allowing analysis of which population is most severely impacted by the factors of age, race, gender, education, etc.
   - Also contains data about industries as well as different type of employment (part time, full time, etc) that can aid the analysis of impacts on industries.


### Dataset 4
- Where did you download the data (e.g., a web URL)?
   - [Billionaire Data](https://docs.google.com/spreadsheets/d/1GcxHDqshl4b57ZgZd8OZ9O1d-BhyqTLcWo_emqVYvP0/edit)
- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
   - The data is collected every 5 minutes respective to when the stock market is open to when it is closed. The data is compiled through Forbes and compares the top billionaires net worth. This compares the networth of the person from February, March and the current month.
- How many observations (rows) are in your data?
   - 681 observations
- How many features (columns) are in the data?
   - 12 features
- What questions (from above) can be answered using the data in this dataset?
   - This dataset is great for answering which industries are facing the biggest economic hit. We can sort by industry and see how much net loss each billionaire had throughout the year.
