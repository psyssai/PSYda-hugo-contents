
jupyter nbconvert --to markdown /C/Users/82103/PandasBlogPosting/PandasBasic_1_Series.ipynb --output /d/PSYda/content/blog/BigData/pandas/2_Series.md
jupyter nbconvert --to markdown /C/Users/82103/PandasBlogPosting/PandasBasic_2_DataFrame.ipynb --output /d/PSYda/content/blog/BigData/pandas/3_DataFrame.md
sed -i 's/img\//\/img\//g' /d/PSYda/content/blog/BigData/pandas/3_DataFrame.md
jupyter nbconvert --to markdown /C/Users/82103/PandasBlogPosting/PandasBasic_3_DataFrame_Merge.ipynb --output /d/PSYda/content/blog/BigData/pandas/4_DataFrame_Merge.md
sed -i 's/img\//\/img\//g' /d/PSYda/content/blog/BigData/pandas/4_DataFrame_Merge.md
jupyter nbconvert --to markdown /C/Users/82103/PandasBlogPosting/PandasBasic_4_DataFrame_FileIO.ipynb --output /d/PSYda/content/blog/BigData/pandas/5_dataframe_fileio.md

