# CDS-5950-Capstone

This repository consists of content produced for my Computational Data Science Capstone course such as weekly data viz challenges and my final project. My goal for this class was to really emphasize writing clean, tidy, and well-documented code. My code and viz files can be found in their respective folders while a quick weekly writeup including data sources can be found below.

---

## Week 1: US Broadband Access

This week utilized data from [Tidy Tuesday](https://github.com/rfordatascience/tidytuesday/blob/master/data/2021/2021-05-11/readme.md), and we were tasked with creating one choropleth map and one non-map viz. For my map I visualized broadband access by county and learned a lot about the intricacies of the plotly api in order to make advanced customizations. As for my non-map viz, I decided to get creative. I calculated the standard deviation of broadband access across counties for each state, took the top 10, and made a bar chart. Then, I created single-state choropleth maps for each of these 10 states and plotted them on their according bar. I also added a color bar for reference.

![bar-with-states](https://github.com/maxbolger/CDS-5950-Capstone/blob/main/Wk1_US_Broadband_Acess/w1_static.png?raw=true)

---

## Week 2: Olympic Data

In honor of the 2022 Winter Olympics currently in full swing, week 2 revolved around the [Olympic medals Kaggle dataset](https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results). One of our viz must have utilized the {gt} package in R. This package is amazing for creating data tables and there is even a {gtExtras} package created by [Tom Mock](https://twitter.com/thomas_mock) that allows for really cool advanced customizations. I ended up creating a table that displays the top 10 most dominant Olympic performances in history in terms of gold medal share. This package is a must-have in any data scientist's toolbox.

![gt](https://github.com/maxbolger/CDS-5950-Capstone/blob/main/Wk2_Olympics_Paralympics/wk2_gt.png)

---
