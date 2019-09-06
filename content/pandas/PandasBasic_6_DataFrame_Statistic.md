

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

# 6.Pandas DataFrame 통계

DataFrame의 주요한 통계 함수는 아래와 같다.
- Describe : 전체 주요 통계량 출력
- sum : 합계 출력
- cumsum : 누적합계 출력
- mean : 평균값 출력 
- Std : 표준 편차 출력
- var : 분산 출력
- median : 중앙값 출력
- count : 데이터 개수 출력
- min, max, idxmin, idxmax : 최소값,최대값,최소값의 index, 최대값의 index 출력
- corr, cov : 상관계수, 공분산 출력

위의 통계 함수를 비롯한 대부분의 함수에서 axis 옵션을 이용해 사용할 축을 설정할 수 있다.
- axis = 0 : 열방향으로 통계량 산출(Default)
- axis = 1 : 행방향으로 통계량 산출

실습을 위해 Fifa19 선수들의 Stat 정보를 Load


```python
players = pd.read_csv('data/Ch6_1_fifaStats.csv', index_col = 'Name')
players.head()
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
      <th>ShortPassing</th>
      <th>Dribbling</th>
      <th>LongPassing</th>
      <th>BallControl</th>
    </tr>
    <tr>
      <th>Name</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>L. Messi</th>
      <td>90.0</td>
      <td>97.0</td>
      <td>87.0</td>
      <td>96.0</td>
    </tr>
    <tr>
      <th>Cristiano Ronaldo</th>
      <td>81.0</td>
      <td>88.0</td>
      <td>77.0</td>
      <td>94.0</td>
    </tr>
    <tr>
      <th>Neymar Jr</th>
      <td>84.0</td>
      <td>96.0</td>
      <td>78.0</td>
      <td>95.0</td>
    </tr>
    <tr>
      <th>De Gea</th>
      <td>50.0</td>
      <td>18.0</td>
      <td>51.0</td>
      <td>42.0</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>92.0</td>
      <td>86.0</td>
      <td>91.0</td>
      <td>91.0</td>
    </tr>
  </tbody>
</table>
</div>



## 6.1 전체 통계량 요약 보기(describe)

describe 함수 : 컬럼별 전체 통계량을 요약해서 볼 수 있다.
- 데이터 개수, 평균, 표준편차, 최소값, 4분위값, 최대값 출력
- 숫자형 컬럼만 통계량을 출력함


```python
players.describe()
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
      <th>ShortPassing</th>
      <th>Dribbling</th>
      <th>LongPassing</th>
      <th>BallControl</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>18159.000000</td>
      <td>18159.000000</td>
      <td>18159.000000</td>
      <td>18159.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>58.686712</td>
      <td>55.371001</td>
      <td>52.711933</td>
      <td>58.369459</td>
    </tr>
    <tr>
      <th>std</th>
      <td>14.699495</td>
      <td>18.910371</td>
      <td>15.327870</td>
      <td>16.686595</td>
    </tr>
    <tr>
      <th>min</th>
      <td>7.000000</td>
      <td>4.000000</td>
      <td>9.000000</td>
      <td>5.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>54.000000</td>
      <td>49.000000</td>
      <td>43.000000</td>
      <td>54.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>62.000000</td>
      <td>61.000000</td>
      <td>56.000000</td>
      <td>63.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>68.000000</td>
      <td>68.000000</td>
      <td>64.000000</td>
      <td>69.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>93.000000</td>
      <td>97.000000</td>
      <td>93.000000</td>
      <td>96.000000</td>
    </tr>
  </tbody>
</table>
</div>



## 6.2 함수별 통계량 보기

### 6.2.1 sum():합계 출력


```python
players.sum()
```




    ShortPassing    1065692.0
    Dribbling       1005482.0
    LongPassing      957196.0
    BallControl     1059931.0
    dtype: float64



### 6.2.2 cumsum():누적합계 출력


```python
# 선수별 능력치 누적 합계 출력
players.head().cumsum(axis = 1)
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
      <th>ShortPassing</th>
      <th>Dribbling</th>
      <th>LongPassing</th>
      <th>BallControl</th>
    </tr>
    <tr>
      <th>Name</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>L. Messi</th>
      <td>90.0</td>
      <td>187.0</td>
      <td>274.0</td>
      <td>370.0</td>
    </tr>
    <tr>
      <th>Cristiano Ronaldo</th>
      <td>81.0</td>
      <td>169.0</td>
      <td>246.0</td>
      <td>340.0</td>
    </tr>
    <tr>
      <th>Neymar Jr</th>
      <td>84.0</td>
      <td>180.0</td>
      <td>258.0</td>
      <td>353.0</td>
    </tr>
    <tr>
      <th>De Gea</th>
      <td>50.0</td>
      <td>68.0</td>
      <td>119.0</td>
      <td>161.0</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>92.0</td>
      <td>178.0</td>
      <td>269.0</td>
      <td>360.0</td>
    </tr>
  </tbody>
</table>
</div>



### 6.2.3 mean(): 평균값 출력

- Stat별 평균(컬럼 기준)


```python
players.mean()
```




    ShortPassing    58.686712
    Dribbling       55.371001
    LongPassing     52.711933
    BallControl     58.369459
    dtype: float64



- 선수별 평균(행 기준)


```python
players.mean(axis=1).head()
```




    Name
    L. Messi             92.50
    Cristiano Ronaldo    85.00
    Neymar Jr            88.25
    De Gea               40.25
    K. De Bruyne         90.00
    dtype: float64



### 6.2.4 std(): 표준편차 출력


```python
players.std()
```




    ShortPassing    14.699495
    Dribbling       18.910371
    LongPassing     15.327870
    BallControl     16.686595
    dtype: float64



### 6.2.5 var():분산 출력


```python
players.var()
```




    ShortPassing    216.075157
    Dribbling       357.602135
    LongPassing     234.943613
    BallControl     278.442466
    dtype: float64



### 6.2.6 median():중앙값 출력


```python
players.median()
```




    ShortPassing    62.0
    Dribbling       61.0
    LongPassing     56.0
    BallControl     63.0
    dtype: float64



### 6.2.7 count() : 데이터 개수 출력


```python
players.count()
```




    ShortPassing    18159
    Dribbling       18159
    LongPassing     18159
    BallControl     18159
    dtype: int64



### 6.2.8 max(), min() : 최대값, 최소값 출력


```python
players.max()
```




    ShortPassing    93.0
    Dribbling       97.0
    LongPassing     93.0
    BallControl     96.0
    dtype: float64




```python
players.min()
```




    ShortPassing    7.0
    Dribbling       4.0
    LongPassing     9.0
    BallControl     5.0
    dtype: float64



### 6.2.9 idxmin(), idxmax():최대값,최소값에 해당하는 인덱스 출력

- 선수별 가장 낮은 능력치는?


```python
players.idxmin(axis = 1).head()
```




    Name
    L. Messi             LongPassing
    Cristiano Ronaldo    LongPassing
    Neymar Jr            LongPassing
    De Gea                 Dribbling
    K. De Bruyne           Dribbling
    dtype: object



- 스탯별 최고의 선수는?


```python
players.idxmax()
```




    ShortPassing    L. Modrić
    Dribbling        L. Messi
    LongPassing      T. Kroos
    BallControl      L. Messi
    dtype: object



### 6.2.10 corr(), cov(): 상관계수, 공분산 출력

- 전체 컬럼별 상관계수 행렬 출력


```python
corr_mat = players.corr()
corr_mat
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
      <th>ShortPassing</th>
      <th>Dribbling</th>
      <th>LongPassing</th>
      <th>BallControl</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>ShortPassing</th>
      <td>1.000000</td>
      <td>0.843722</td>
      <td>0.895722</td>
      <td>0.911451</td>
    </tr>
    <tr>
      <th>Dribbling</th>
      <td>0.843722</td>
      <td>1.000000</td>
      <td>0.722465</td>
      <td>0.938942</td>
    </tr>
    <tr>
      <th>LongPassing</th>
      <td>0.895722</td>
      <td>0.722465</td>
      <td>1.000000</td>
      <td>0.788650</td>
    </tr>
    <tr>
      <th>BallControl</th>
      <td>0.911451</td>
      <td>0.938942</td>
      <td>0.788650</td>
      <td>1.000000</td>
    </tr>
  </tbody>
</table>
</div>



- 특정 컬럼과 상관도가 높은 순서대로 출력


```python
corr_mat['ShortPassing'].sort_values(ascending = False)
```




    ShortPassing    1.000000
    BallControl     0.911451
    LongPassing     0.895722
    Dribbling       0.843722
    Name: ShortPassing, dtype: float64



- 전체 컬럼별 공분산 행렬 출력


```python
cov_mat = players.cov()
cov_mat
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
      <th>ShortPassing</th>
      <th>Dribbling</th>
      <th>LongPassing</th>
      <th>BallControl</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>ShortPassing</th>
      <td>216.075157</td>
      <td>234.531811</td>
      <td>201.816840</td>
      <td>223.564867</td>
    </tr>
    <tr>
      <th>Dribbling</th>
      <td>234.531811</td>
      <td>357.602135</td>
      <td>209.410657</td>
      <td>296.282958</td>
    </tr>
    <tr>
      <th>LongPassing</th>
      <td>201.816840</td>
      <td>209.410657</td>
      <td>234.943613</td>
      <td>201.712999</td>
    </tr>
    <tr>
      <th>BallControl</th>
      <td>223.564867</td>
      <td>296.282958</td>
      <td>201.712999</td>
      <td>278.442466</td>
    </tr>
  </tbody>
</table>
</div>



- 특정 컬럼과 공분산이 낮은 순서대로 출력


```python
cov_mat['Dribbling'].sort_values(ascending = True)
```




    LongPassing     209.410657
    ShortPassing    234.531811
    BallControl     296.282958
    Dribbling       357.602135
    Name: Dribbling, dtype: float64



## 6.3 통계량 시각화하기

### 6.3.1 histogram 시각화


```python
players.hist(figsize = (15,10))
```




    array([[<matplotlib.axes._subplots.AxesSubplot object at 0x000001611B2ADCC0>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611C023A20>],
           [<matplotlib.axes._subplots.AxesSubplot object at 0x000001611B3CEEF0>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611B3FC390>]],
          dtype=object)




![png](d%3A/PSYda/content/pandas/PandasBasic_6_DataFrame_Statistic_46_1.png)


### 6.3.2 상관계수 그래프 시각화


```python
pd.plotting.scatter_matrix(players, figsize = (15,10))
```




    array([[<matplotlib.axes._subplots.AxesSubplot object at 0x000001611B2625F8>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611DA36828>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611DA56C88>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611DA88160>],
           [<matplotlib.axes._subplots.AxesSubplot object at 0x000001611DAAE6A0>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611DAD6C18>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611DB081D0>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611DB30780>],
           [<matplotlib.axes._subplots.AxesSubplot object at 0x000001611DB307B8>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611DB88278>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611DBB27F0>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611DBD9D68>],
           [<matplotlib.axes._subplots.AxesSubplot object at 0x000001611DC0A320>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611DC32898>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611DC5AE10>,
            <matplotlib.axes._subplots.AxesSubplot object at 0x000001611DC8B3C8>]],
          dtype=object)




![png](d%3A/PSYda/content/pandas/PandasBasic_6_DataFrame_Statistic_48_1.png)

