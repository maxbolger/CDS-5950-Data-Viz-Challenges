# -*- coding: utf-8 -*-
"""wk2_gt_preprocess.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1z6VXmV9Bcu3KsKdB-cnz6gQrq7fdfQRM
"""

import pandas as pd

df = pd.read_csv('athlete_events.csv')

df = pd.get_dummies(df, columns=['Medal'])

gc = df.groupby(['Games','NOC','Event'])[['Medal_Gold']].max().reset_index().groupby(['Games','NOC'])[['Medal_Gold']].sum().reset_index()

gt = df.groupby(['Games'])[['Event']].nunique().rename(columns={'Event':'Event_Num'})

golds = pd.merge(gc,gt,on='Games')

golds['Gold_Share'] = round((golds.Medal_Gold / golds.Event_Num)*100,1)

golds.sort_values(by='Gold_Share',ascending=False).head(10).to_csv('golds.csv')