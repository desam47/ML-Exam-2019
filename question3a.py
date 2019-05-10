#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue May  7 19:12:40 2019

@author: dipesh
"""
#Answer for 3 (a)

# Library import
import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestClassifier

# Load Dataset
dataset = pd.read_csv('question-2 (copy).csv', delimiter=',')

# Encoding Categorical values
status1 = {'yes' : 0,'no' : 1}
status2 = {'good' : 0, 'bad' : 1}
dataset['married'] = dataset['married'].replace(status1)
dataset['unemployed'] = dataset['unemployed'].replace(status1)
dataset['credit'] = dataset['credit'].replace(status2)

dataset

# Attributes to predict
outcome = np.array(dataset['credit'])

# Creating dataset without the outcome variable
dataset_features= dataset.drop('credit', axis = 1)

outcome

# Random Forest model with mtry = 1 (max_features = 1 in python) to construct a forest of 3 trees (n_estimators = 3 in python) 
rfModel = RandomForestClassifier(n_estimators = 3, max_features= 1, random_state = 10)

# Train the model on training data
rfModel.fit(dataset_features, outcome);

#Answer for 3 (b)


test_dataset = pd.read_csv('question-3-b.csv')

test_dataset['married'] = test_dataset['married'].replace(status1)
test_dataset['unemployed'] = test_dataset['unemployed'].replace(status1)
test_dataset['credit'] = test_dataset['credit'].replace(status2)

test_dataset = test_dataset.drop("credit", axis=1)

# Use the forest's predict method on the test data
predictions = rfModel.predict(test_dataset)

predictions