import pandas as pd   
import glob
import os

input_path='/mnt/c/Users/khaph/OneDrive/Desktop/Data_Science/Data_Engineer/Phase1/Week1/project1/input'
output_path='/mnt/c/Users/khaph/OneDrive/Desktop/Data_Science/Data_Engineer/Phase1/Week1/project1/output'

csvfile=glob.glob(os.path.join(input_path,'*.csv'))

lis=[]
for i in csvfile:
    df=pd.read_csv(i, index_col=None, header=0)
    lis.append(df)

df1=pd.concat(lis,axis=0,ignore_index=True)
df1.to_csv(output_path+"/"+'data.csv')