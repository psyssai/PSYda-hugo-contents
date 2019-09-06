

```python
# 블로그에 포스팅하기 위한 스타일 조정
from IPython.core.display import display, HTML
display(HTML("<style> .container{width:90% !important;}</style>"))
```


<style> .container{width:90% !important;}</style>



```python
import pandas as pd
from pandas import Series, DataFrame
import numpy as np
```

# 5.Pandas DataFrame 산술 연산

DataFrame 의 연산은 아래의 두 가지 케이스가 있다.
- DataFrame vs DataFrame 연산
- DataFrame vs Series 연산

## 5.1 DataFrame vs DataFrame 연산

DataFrame의 연산 규칙은 아래와 같다.
- 같은 index 이면서 같은 column 명을 가진 두 value를 연산함
- 같은 index 이면서 같은 column 명을 가진 두 value 중 하나라도 NaN이 있으면 NaN으로 채워진다.
- index나 column 명이 다르면 NaN으로 채워진다.
<img src = "img/OperationRule.jpg" alt="OperationRule" />

연산하는 방법에는 두 가지 방법이 있다.
- 연산자를 이용한 연산 ( +, -, *, / )
- 함수를 이용한 연산 ( add, sub, mul, div )

기본 연산은 동일하지만 함수를 사용하면 fill_value와 axis 옵션을 사용할 수 있다.

Ex) df1.add(df2, fill_value = 0, axis = 0)
- fill_value = 0 : NaN값을 0으로 간주하고 연산, 0이 아닌 값 입력 가능
- axis = 0 : DataFrame와 Series간의 연산에서 방향을 지정(5.1.2 참고)

<img src = "img/OperationRule2.jpg" alt="OperationRule2" />

곱하기, 나누기, 빼기 등도 동일한 방법이므로, 더하기만 실습해보겠다.


```python
df1 = DataFrame([[1,3,5],[7,9,11],[5,13,15]])
df1
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
      <td>7</td>
      <td>9</td>
      <td>11</td>
    </tr>
    <tr>
      <th>2</th>
      <td>5</td>
      <td>13</td>
      <td>15</td>
    </tr>
  </tbody>
</table>
</div>




```python
df2 = DataFrame([[1,2,3],[4,np.nan,6],[7,8,9]], columns=[0,1,3], index=[0,1,3])
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
      <th>3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2.0</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4</td>
      <td>NaN</td>
      <td>6</td>
    </tr>
    <tr>
      <th>3</th>
      <td>7</td>
      <td>8.0</td>
      <td>9</td>
    </tr>
  </tbody>
</table>
</div>




```python
df1 + df2
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
      <th>3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2.0</td>
      <td>5.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>11.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>




```python
df1.add(df2,fill_value=0)
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
      <th>3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2.0</td>
      <td>5.0</td>
      <td>5.0</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>11.0</td>
      <td>9.0</td>
      <td>11.0</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>5.0</td>
      <td>13.0</td>
      <td>15.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>7.0</td>
      <td>8.0</td>
      <td>NaN</td>
      <td>9.0</td>
    </tr>
  </tbody>
</table>
</div>



## 5.2 DataFrame vs Series 연산

연산 함수(add, sub, mul, div) 의 axis 옵션을 통해 행, 열 방향으로 연산 가능

Ex) df1.add(df2, axis = 0)

axis = 0 : Index방향(행방향)으로 DataFrame과 Series 연산
- DataFrame과 Series가 동일한 Index를 가지면 연산, 다르면거나 한쪽만 있으면 NaN

axis = 1 : Column방향으로 DataFrame과 Series 연산
- DataFrame과 Series가 동일한 Column명을 가지면 연산, 다르면거나 한쪽만 있으면 NaN


```python
s1 = Series([1,2,3,4])
s1
```




    0    1
    1    2
    2    3
    3    4
    dtype: int64




```python
df1
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
      <td>7</td>
      <td>9</td>
      <td>11</td>
    </tr>
    <tr>
      <th>2</th>
      <td>5</td>
      <td>13</td>
      <td>15</td>
    </tr>
  </tbody>
</table>
</div>




```python
df1.add(s1, axis = 0)
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
      <td>2.0</td>
      <td>4.0</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>9.0</td>
      <td>11.0</td>
      <td>13.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>8.0</td>
      <td>16.0</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>




```python
df1.add(s1, axis = 1)
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
      <th>3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2</td>
      <td>5</td>
      <td>8</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>8</td>
      <td>11</td>
      <td>14</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>6</td>
      <td>15</td>
      <td>18</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>


