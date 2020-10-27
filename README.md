# Team Mango Mochi
By: Tenzin Zomkyi, Christina Chen, Noah Logman, and Justin Ung
## Domain of Interest
**Why are you interested in this field/domain?**

  In the midst of political, social, and economic polarization induced by COVID outbreaks, it would be interesting to explore the new dynamics of the labor force. Particularly, we will focus on the intersecting components of *employment and recession*: gender, race, age, income level, etc. By doing so, we hope to discover and understand the stories behind the numbers.

**What other examples of data driven project have you found related to this domain?**

- This [NBER Working Paper ](https://www.nber.org/system/files/working_papers/w26947/w26947.pdf) delves into the implications for gender equality in COVID-19 times, focusing on the downturn and recovery of work. Written during the earlier phase, the authors reveal that in contrast to “regular” recessions, women will face the most adverse effects. This conclusion derives from existing data involving childcare, volatility of work hours, occupational flexibility, and gender norms.

- [Washington Post]((https://www.washingtonpost.com/graphics/2020/business/coronavirus-recession-equality/) uses data to emphasize the overwhelming economic detriment of COVID-19 on low-wage, minority workers. Especially the  groups most impacted by the crisis in terms of job recovery - Black women, Black men, Hispanic men, Asian Americans, younger Americans, and people without degrees. The key takeaway is in the title: that the COVID-19 recession is the most unequal in modern U.S history.

- [The Institute for Policy Studies](https://inequality.org/great-divide/updates-billionaire-pandemic/) presents an ongoing project, centering on COVID-19 and billionaire wealth. With real time updates, it showcases the magnitude of the gap between pandemic profiteers (both domestic and globally) and the working class. While billionaire wealth continues to skyrocket, certain demographics continue to face hardships in the food, housing, and unemployment sector.

**What data-driven questions do you hope to answer about this domain (share at least 3)?**
- What *demographic(s)* have faced the worst recession during COVID-19?
- Which *industries* faced the biggest economic downturn, and labor wise?
- How does *unemployment rates* compare to previous years and recessions?
***
## Finding Data
**Datasets:**
1. [Covid State Policy](https://www.openicpsr.org/openicpsr/project/119446/version/V38/view?path=/openicpsr/119446/fcr:versions/V38)
2. [Labor Force Statistics](https://data.bls.gov/cgi-bin/surveymost?ln )
3. [Track The Recovery]((https://tracktherecovery.org/)
4. [Billionaire Data](https://docs.google.com/spreadsheets/d/1GcxHDqshl4b57ZgZd8OZ9O1d-BhyqTLcWo_emqVYvP0/edit)

**How was the data collected or generated? Who or what the data is about?**
1. The data was collected from a variety of sources including state mandates, orders, and official governor press releases. It was then compiled by researchers at the Boston University School of Public Health. The data includes state policies on closures, shelter-in-place orders, housing protections, changes to Medicaid and SNAP, physical distancing closures, reopening and more.

2. The dataset was obtained from the U.S. Bureau of Labor Statistics, Current Population Survey’s Labor Force Statistics. The Current Population Survey (CPS) is a monthly survey of households conducted by the Bureau of Census for the Bureau of Labor Statistics. It provides a comprehensive body of data on the labor force, employment, unemployment, persons not in the labor force, hours of work, earnings, and other demographic and labor force characteristics <sup>1</sup>.

3. The data was collected from private data partners: PAYCHEX, Intuit, Earnin, and Kronos. The data includes information about the American population sorted by various demographics such as income level, location, and industry.

4. The data is collected every 5 minutes respective to when the stock market is open to when it is closed. The data is compiled through Forbes and compares the top billionaires net worth. This compares the net worth of the person from February, March and the current month.

**How many observations (rows) are in your data?**
1. 50 observations (one for each state)
2. 11 observations
3. 11935 observations
4. 681 observations (real-time updates)

**How many features (columns) are in the data?**
1. 136 features
2. 12 features
3. 12 features
4. 12 features

**What questions (from above) can be answered using the data in this dataset?**
1. We can assess what *industries* are being hit the most by COVID (ie. businesses, restaurants, daycares, gyms), and how long they have been closed. Additionally we can find how states are accommodating the unemployed through insurance and medical care policies.

2. We can discover which *population* is most severely impacted by the factors of age, race, gender, education, etc. This dataset also contains information on employment types (part time, full time, etc) that can aid the analysis of impacts on industries.

3. We can explore how various *demographic(s)* have been affected by COVID, and analyze its affect in comparison to *previous recessions*.

4. We can incorporate Data Feminism concepts and find answers about the changing dynamics of the labor force (*industries*, income levels)<sup>2</sup>.
****
## Key Analysis Notes

[1] This dataset contains a multitude of dataframes and those of interest can be merged into 1 big dataframe, with each heading being a feature. Data frame of interest example:
> Unemployment rates for: 16-19 Years, 20 Years & Over - Men, 20 Years & Over - Women, White, Black or African American, Asian, Hispanic or Latino, 25 Years & Over (Less than a High School Diploma, High School Graduates No College, Some College or Associate Degree, Bachelor's Degree and Higher). here are ~40 features, each mentioned feature has a data matrix containing statistics from 2010-2020, January-December.

[2] We can sort by industry and see how much net loss each billionaire had throughout the year.
