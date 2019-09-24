
jupyter nbconvert --to markdown /C/Users/82103/PandasBlogPosting/PandasBasic_1_Series.ipynb --output /d/PSYda/content/blog/bigdata/pandas/2_Series.md

jupyter nbconvert --to markdown /C/Users/82103/PandasBlogPosting/PandasBasic_2_DataFrame.ipynb --output /d/PSYda/content/blog/bigdata/pandas/3_DataFrame.md
sed -i 's/img\//\/img\//g' /d/PSYda/content/blog/bigdata/pandas/3_DataFrame.md

jupyter nbconvert --to markdown /C/Users/82103/PandasBlogPosting/PandasBasic_3_DataFrame_Merge.ipynb --output /d/PSYda/content/blog/bigdata/pandas/4_DataFrame_Merge.md
sed -i 's/img\//\/img\//g' /d/PSYda/content/blog/bigdata/pandas/4_DataFrame_Merge.md

jupyter nbconvert --to markdown /C/Users/82103/PandasBlogPosting/PandasBasic_4_DataFrame_FileIO.ipynb --output /d/PSYda/content/blog/bigdata/pandas/5_dataframe_fileio.md

jupyter nbconvert --to markdown /C/Users/82103/PandasBlogPosting/PandasBasic_5_DataFrame_ArithmeticOperation.ipynb --output /d/PSYda/content/blog/bigdata/pandas/6_dataframe_calc.md
sed -i 's/img\//\/img\//g' /d/PSYda/content/blog/bigdata/pandas/6_dataframe_calc.md

jupyter nbconvert --to markdown /C/Users/82103/PandasBlogPosting/PandasBasic_6_DataFrame_Statistic.ipynb --output /d/PSYda/content/blog/bigdata/pandas/7_dataframe_statistic.md
sed -i 's/D\%3A\/PSYda\/content\//\//g' /d/PSYda/content/blog/bigdata/pandas/7_dataframe_statistic.md

jupyter nbconvert --to markdown /C/Users/82103/PandasBlogPosting/PandasBasic_7_DataFrame_sort_rank.ipynb --output /d/PSYda/content/blog/bigdata/pandas/8_dataframe_sortrank.md