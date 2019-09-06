

```python
# 블로그에 포스팅하기 위한 스타일 조정
from IPython.core.display import display, HTML
display(HTML("<style> .container{width:90% !important;}</style>"))
```


<style> .container{width:90% !important;}</style>



```python
import pandas as pd
from pandas import Series , DataFrame
```

# 8. Series와 DataFrame에 외부 함수 적용하기

- map 함수 : Series에서 사용하며 모든 요소에 함수 일괄 적용
- apply 함수 : DataFrame에서 사용하며 각각의 행 또는 열(Series)에 함수 일괄 적용
- applymap 함수 : DataFrame에서 사용하며 모든 요소에 함수 일괄 적용

## 8.1 Series의 각각의 요소에 함수 적용하기

map함수
- Series에서 사용가능한 함수
- Series의 모든값(values)에 대해 함수 일괄 적용
<img src = "img/mapFunction.jpg" alt="mapFunction" />


```python
srAge = Series([10,13,15,23,22,36])
srAge
```




    0    10
    1    13
    2    15
    3    23
    4    22
    5    36
    dtype: int64



나이의 범위에 따라 10대, 20대, 30대로 변경하는 함수 생성
- 10~19 : 10대
- 20~29 : 20대
- 30~39 : 30대
- 그외 : NaN값


```python
def weekday2weeknumber(age):
    if age >= 10 and age < 20:
        ageRange = '10대'
    elif age >= 20 and age < 30:
        ageRange = '20대'
    elif age >= 30 and age < 40:
        ageRange = '30대'
    else:
        ageRange = pd.np.nan
    return ageRange
```

Series의 각각의 값에 함수 적용


```python
srAgeRange = srAge.map(weekday2weeknumber)
srAgeRange
```




    0    10대
    1    10대
    2    10대
    3    20대
    4    20대
    5    30대
    dtype: object



## 8.2 DataFrame의 각 열 또는 행에 함수 일괄 적용하기

apply함수
- DataFrame에서 사용 가능한 함수
- DataFrame의 행 또는 열에 해당하는 Series에 함수를 일괄 적용

axis 옵션
- 0(Defualt) : 열기준 함수 적용
- 1 : 행기준 함수 적용

<img src = "img/applyFunction.jpg" alt="applyFunction" />


```python
df = DataFrame([[1,3,5],[4,5,6],[7,8,10]])
df
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
      <th>0</th>
      <th>1</th>
      <th>2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>3</td>
      <td>5</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
    </tr>
    <tr>
      <th>2</th>
      <td>7</td>
      <td>8</td>
      <td>10</td>
    </tr>
  </tbody>
</table>
</div>



행 또는 열의 최대값과 최소값의 차이를 구하는 함수 생성


```python
def maxMinusMin(sr):
    return sr.max() - sr.min()
```


```python
df.apply(maxMinusMin, axis = 0)
```




    0    6
    1    5
    2    5
    dtype: int64




```python
df.apply(maxMinusMin, axis = 1)
```




    0    4
    1    2
    2    3
    dtype: int64



return값을 조정하여 여러개의 열 또는 컬럼으로 출력 가능


```python
def maxMinusMin2(sr):
    sr2 = Series([sr.max(), sr.min(), sr.max()-sr.min()], index = ['최대값','최소값','차이'])
    return sr2
```


```python
df.apply(maxMinusMin2, axis =0)
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
      <th>0</th>
      <th>1</th>
      <th>2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>최대값</th>
      <td>7</td>
      <td>8</td>
      <td>10</td>
    </tr>
    <tr>
      <th>최소값</th>
      <td>1</td>
      <td>3</td>
      <td>5</td>
    </tr>
    <tr>
      <th>차이</th>
      <td>6</td>
      <td>5</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.apply(maxMinusMin2, axis =1)
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
      <th>최대값</th>
      <th>최소값</th>
      <th>차이</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5</td>
      <td>1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>6</td>
      <td>4</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>10</td>
      <td>7</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>



## 8.3 DataFrmae의 각각 요소에 함수 일괄 적용하기

applymap함수
- DataFrame에서 사용가능한 함수
- DataFrame의 모든값(values)에 대해 함수 일괄 적용
<img src = "img/applymapFunction.jpg" alt="applymapFunction" />


```python
df2 = DataFrame([[1,1,1],[2,2,2],[3,3,3]])
df2
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
      <th>0</th>
      <th>1</th>
      <th>2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>3</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>



입력값의 제곱을 리턴하는 함수 생성


```python
def square(x):
    y = x * x
    return y
```


```python
df2.applymap(square)
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
      <th>0</th>
      <th>1</th>
      <th>2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4</td>
      <td>4</td>
      <td>4</td>
    </tr>
    <tr>
      <th>2</th>
      <td>9</td>
      <td>9</td>
      <td>9</td>
    </tr>
  </tbody>
</table>
</div>


