+++ 
author = "Theme author" 
categories = ["Hugo"] 
tags = ["tutorial"] 
date = "2014-09-28" 
description = "Learn how to create a theme on Hugo" 
featured = "pic03.jpg" 
featuredalt = "Pic 3" 
featuredpath = "date" 
linktitle = "" 
title = "Creating a New Theme" 
type = "post" 
+++


```python
# 블로그에 포스팅하기 위한 스타일 조정
from IPython.core.display import display, HTML
display(HTML("<style> .container{width:90% !important;}</style>"))
```


<style> .container{width:90% !important;}</style>



```python
import pandas as pd
from pandas import Series, DataFrame
```

# 3. DataFrame Join

Join 이란?
- 두 개의 DataFrame을 합치는 것
- 열기준 컬럼명으로 합치기 : merge
- 열기준 Index명로 합치기 : merge, concat
- 행기준으로 합치기 : concat, append

합치는 방법은?
- Inner : 두 DataFrame의 기준 컬럼에서 둘 다 존재하는 데이터만 Join
- Left Outer join : 왼쪽 DataFrame으로 합치기
- Right Outer Join : 오른쪽 DataFrame으로 합치기
- Outer Join : 두 DataFrame의 모든 Data를 합치기

Merge 명령어 사용법?
- pd.merge(left, right, how, on, left_on, right_on, left_index, right_index)
- left : Merge 할 왼쪽 DataFrame
- right : Merge 할 오른쪽 DataFrame
- how : inner, left, right, outer
- on : 두 DataFrame을 Join할 기준 컬럼명(컬럼명이 동일할 경우)
- left_on : Join할 기준 컬럼의 왼쪽 DataFrame의 컬럼명
- right_on : Join할 기준 컬럼의 오른쪽 DataFrame의 컬럼명
- left_index : 왼쪽 DataFrame index로 Join할 경우 True
- right_index : 오른쪽 DataFrame index로 Join할 경우 True

concat 명령어 사용법?
- pd.concat([left,right], axis, join,...)
- [left,right] : left DataFrame과 right DataFrame으로 이루어진 List
- axis = 0 : 행기준으로 합치기, 1: 열기준으로 Index명으로 합치기

## 3.1 같은 Column끼리 합치기


```python
DF1 = DataFrame([["싸이",180,75],["덕구",160,65],["또치",170,75]], columns = ["이름","키","몸무게"])
DF1
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>이름</th>
      <th>키</th>
      <th>몸무게</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>싸이</td>
      <td>180</td>
      <td>75</td>
    </tr>
    <tr>
      <th>1</th>
      <td>덕구</td>
      <td>160</td>
      <td>65</td>
    </tr>
    <tr>
      <th>2</th>
      <td>또치</td>
      <td>170</td>
      <td>75</td>
    </tr>
  </tbody>
</table>
</div>




```python
DF2 = DataFrame([["싸이","포워드","잘함"],["덕구","미드필더","못함"],["똥갈","수비수","잘함"]], columns = ["이름","포지션","실력"])
DF2
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>이름</th>
      <th>포지션</th>
      <th>실력</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>싸이</td>
      <td>포워드</td>
      <td>잘함</td>
    </tr>
    <tr>
      <th>1</th>
      <td>덕구</td>
      <td>미드필더</td>
      <td>못함</td>
    </tr>
    <tr>
      <th>2</th>
      <td>똥갈</td>
      <td>수비수</td>
      <td>잘함</td>
    </tr>
  </tbody>
</table>
</div>



### 3.1.1 Inner Join

- 두 DataFrame의 기준 컬럼에서 둘 다 존재하는 데이터만 Join
<img src = "img/Merge_1.jpg" />


```python
pd.merge(left = DF1 , right = DF2, how = "inner", on = "이름")
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>이름</th>
      <th>키</th>
      <th>몸무게</th>
      <th>포지션</th>
      <th>실력</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>싸이</td>
      <td>180</td>
      <td>75</td>
      <td>포워드</td>
      <td>잘함</td>
    </tr>
    <tr>
      <th>1</th>
      <td>덕구</td>
      <td>160</td>
      <td>65</td>
      <td>미드필더</td>
      <td>못함</td>
    </tr>
  </tbody>
</table>
</div>



### 3.1.2 Left Outer Join

- 왼쪽 DataFrame의 모든 데이터 출력 + 
- 오른쪽 DataFrame 중 왼쪽 DataFrame에 있는 Data는 출력
- 오른쪽 DataFrame 중 왼쪽 DataFrame에 없는 Data는 NaN으로 처리
<img src = "img/Merge_2.jpg" />


```python
pd.merge(left = DF1 , right = DF2, how = "left", on = "이름")
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>이름</th>
      <th>키</th>
      <th>몸무게</th>
      <th>포지션</th>
      <th>실력</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>싸이</td>
      <td>180</td>
      <td>75</td>
      <td>포워드</td>
      <td>잘함</td>
    </tr>
    <tr>
      <th>1</th>
      <td>덕구</td>
      <td>160</td>
      <td>65</td>
      <td>미드필더</td>
      <td>못함</td>
    </tr>
    <tr>
      <th>2</th>
      <td>또치</td>
      <td>170</td>
      <td>75</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>



### 3.1.3 Right Outer Join

- 오른쪽 DataFrame의 모든 데이터 출력 + 
- 왼쪽 DataFrame 중 오른쪽 DataFrame에 있는 Data는 출력
- 왼쪽 DataFrame 중 오른쪽 DataFrame에 없는 Data는 NaN으로 처리
<img src = "img/Merge_3.jpg" />


```python
pd.merge(left = DF1 , right = DF2, how = "right", on = "이름")
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>이름</th>
      <th>키</th>
      <th>몸무게</th>
      <th>포지션</th>
      <th>실력</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>싸이</td>
      <td>180.0</td>
      <td>75.0</td>
      <td>포워드</td>
      <td>잘함</td>
    </tr>
    <tr>
      <th>1</th>
      <td>덕구</td>
      <td>160.0</td>
      <td>65.0</td>
      <td>미드필더</td>
      <td>못함</td>
    </tr>
    <tr>
      <th>2</th>
      <td>똥갈</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>수비수</td>
      <td>잘함</td>
    </tr>
  </tbody>
</table>
</div>



### 3.1.4 Outer Join

- 왼쪽, 오른쪽 DataFrame의 모든 데이터 출력 +
- 왼쪽 DataFrame 중 오른쪽 DataFrame에 있는 Data는 NaN으로 처리
- 오른쪽 DataFrame 중 왼쪽 DataFrame에 없는 Data는 NaN으로 처리
<img src = "img/Merge_4.jpg" />


```python
pd.merge(left = DF1 , right = DF2, how = "outer", on = "이름")
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>이름</th>
      <th>키</th>
      <th>몸무게</th>
      <th>포지션</th>
      <th>실력</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>싸이</td>
      <td>180.0</td>
      <td>75.0</td>
      <td>포워드</td>
      <td>잘함</td>
    </tr>
    <tr>
      <th>1</th>
      <td>덕구</td>
      <td>160.0</td>
      <td>65.0</td>
      <td>미드필더</td>
      <td>못함</td>
    </tr>
    <tr>
      <th>2</th>
      <td>또치</td>
      <td>170.0</td>
      <td>75.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>똥갈</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>수비수</td>
      <td>잘함</td>
    </tr>
  </tbody>
</table>
</div>



## 3.2 같은 Index 기준으로 합치기

DF1 과 DF2의 이름 컬럼을 인덱스로 이동
- set_index("컬럼명") : 컬럼명의 데이터가 Index로 설정, 컬럼데이터는 삭제됨


```python
DF1 = DF1.set_index("이름")
DF1
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>키</th>
      <th>몸무게</th>
    </tr>
    <tr>
      <th>이름</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>싸이</th>
      <td>180</td>
      <td>75</td>
    </tr>
    <tr>
      <th>덕구</th>
      <td>160</td>
      <td>65</td>
    </tr>
    <tr>
      <th>또치</th>
      <td>170</td>
      <td>75</td>
    </tr>
  </tbody>
</table>
</div>




```python
DF2 = DF2.set_index("이름")
DF2
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>포지션</th>
      <th>실력</th>
    </tr>
    <tr>
      <th>이름</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>싸이</th>
      <td>포워드</td>
      <td>잘함</td>
    </tr>
    <tr>
      <th>덕구</th>
      <td>미드필더</td>
      <td>못함</td>
    </tr>
    <tr>
      <th>똥갈</th>
      <td>수비수</td>
      <td>잘함</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.merge(left = DF1, right = DF2, left_index = True, right_index = True, how = "inner")
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>키</th>
      <th>몸무게</th>
      <th>포지션</th>
      <th>실력</th>
    </tr>
    <tr>
      <th>이름</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>싸이</th>
      <td>180</td>
      <td>75</td>
      <td>포워드</td>
      <td>잘함</td>
    </tr>
    <tr>
      <th>덕구</th>
      <td>160</td>
      <td>65</td>
      <td>미드필더</td>
      <td>못함</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.concat([DF1,DF2],axis = 1, join = 'inner')
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>키</th>
      <th>몸무게</th>
      <th>포지션</th>
      <th>실력</th>
    </tr>
    <tr>
      <th>이름</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>싸이</th>
      <td>180</td>
      <td>75</td>
      <td>포워드</td>
      <td>잘함</td>
    </tr>
    <tr>
      <th>덕구</th>
      <td>160</td>
      <td>65</td>
      <td>미드필더</td>
      <td>못함</td>
    </tr>
  </tbody>
</table>
</div>



## 3.3 행기준으로 합치기

- 같은 컬럼명이 존재하면, 데이터 저장
- 다른 컬럼명이 존재하면, 해당 컬럼이 있는 DataFrame은 데이터 저장, 없는 DataFrame은 NaN 처리
- 일반적으로 concat보다 append가 더 빠르다고 합니다.


```python
DF3 = DataFrame([[187, 80, 30], [190,85, 20]], columns = ["키","몸무게","나이"], index = ["거북이","깜디"])
DF3
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>키</th>
      <th>몸무게</th>
      <th>나이</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>거북이</th>
      <td>187</td>
      <td>80</td>
      <td>30</td>
    </tr>
    <tr>
      <th>깜디</th>
      <td>190</td>
      <td>85</td>
      <td>20</td>
    </tr>
  </tbody>
</table>
</div>




```python
DF1.append(DF3, sort=False)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>키</th>
      <th>몸무게</th>
      <th>나이</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>싸이</th>
      <td>180</td>
      <td>75</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>덕구</th>
      <td>160</td>
      <td>65</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>또치</th>
      <td>170</td>
      <td>75</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>거북이</th>
      <td>187</td>
      <td>80</td>
      <td>30.0</td>
    </tr>
    <tr>
      <th>깜디</th>
      <td>190</td>
      <td>85</td>
      <td>20.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.concat([DF1, DF3], axis = 0, sort=False)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>키</th>
      <th>몸무게</th>
      <th>나이</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>싸이</th>
      <td>180</td>
      <td>75</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>덕구</th>
      <td>160</td>
      <td>65</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>또치</th>
      <td>170</td>
      <td>75</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>거북이</th>
      <td>187</td>
      <td>80</td>
      <td>30.0</td>
    </tr>
    <tr>
      <th>깜디</th>
      <td>190</td>
      <td>85</td>
      <td>20.0</td>
    </tr>
  </tbody>
</table>
</div>


head.txt 
