import pandas as pd

# 比较两个csv字典表，以modified_file.csv为基准，比较另一个csv与其的差异:
# 1. 比标准字典多出来的代码 -> added.csv
# 2. 代码与标准相同，但名称与标准不同的记录 -> bugs.csv

# 读取CSV文件
# modified_file.csv是用作标准或转换目标的文件
modified_df = pd.read_csv('modified_file.csv')
# filtered_file.csv是非标准的或转换源的文件
filtered_df = pd.read_csv('filtered_file.csv')

# 任务1：将code存在于filtered_file.csv中，但不存在于modified_file.csv中的记录保存在added.csv中
added_df = filtered_df[~filtered_df['code'].isin(modified_df['code'])]
added_df.to_csv('added.csv', index=False)

# 任务2：以modified_file.csv为基准，找出filtered_file.csv中code相同但value不同的记录
# 使用merge，但只保留inner join的结果，然后找出value不同的记录
inner_merge_df = pd.merge(modified_df, filtered_df, on='code', suffixes=('_modified', '_filtered'), how='inner')
bugs_df = inner_merge_df[inner_merge_df['value_modified'] != inner_merge_df['value_filtered']]

# 选择需要的列，并重命名以匹配原始格式（只保留code和value，且value来自filtered_file.csv）
bugs_df = bugs_df[['code', 'value_filtered']].rename(columns={'value_filtered': 'value'})

# 将结果保存到bugs.csv中
bugs_df.to_csv('bugs.csv', index=False)

print("任务完成：added.csv和bugs.csv已生成。")