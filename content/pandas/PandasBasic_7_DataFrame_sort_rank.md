

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

# 7. DataFrame의 sort, rank 함수

- sort 함수 : 데이터를 정렬하는 함수(sort_values, sort_index)
- rank 함수 : 데이터의 순위를 매기는 함수

## 7.1 DataFrame의 sort

DataFrame에서는 sort를 index 및 column 기준으로 sort를 할 수 있다.
- sort_values(axis = 0) : 열방향 정렬(default)
- sort_values(axis = 1) : 행방향 정렬
- sort_index(axis = 0) : 인덱스명 정렬(defualt)
- sort_index(axis = 1) : 컬럼명 정렬

정렬은 ascending 옵션을 통해 오름차순과 내림차순 정렬이 가능하다.
- ascending = True : 오름차순 정렬, 영어의 경우 a 부터
- ascending = False : 내림차순 정렬, 영어의 경우 z부터


### 7.1.1 sort_values() : 열방향 또는 행방향 데이터 정렬

sort_values 함수 옵션
- ascending = True : True 이면 오름차순, False이면 내림차순 정렬
- inplace = False: True 이면 정렬한 값을 DataFrame에 바로 반영
- by : 정렬할 기준 변수 지정
- na_position = last : NaN값 위치 지정, last이면 마지막, first이면 처음
- axis = 0 : 0이면 열방향 정렬, 1이면 행방향 정렬


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



#### 7.1.1.1 by 옵션

DataFrame에서 정렬할 변수를 지정 할 수 있다.(Serise의 경우 한 컬럼이므로 by옵션 설정 필요 없음)
- axis = 0 이면 컬럼명 지정
- axis = 1 이면 인덱스명 지정


```python
players.sort_values(by = 'ShortPassing').head()
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
      <th>Deng Xiaofei</th>
      <td>7.0</td>
      <td>6.0</td>
      <td>12.0</td>
      <td>11.0</td>
    </tr>
    <tr>
      <th>Zhang Chong</th>
      <td>7.0</td>
      <td>16.0</td>
      <td>9.0</td>
      <td>22.0</td>
    </tr>
    <tr>
      <th>Cheng Yuelei</th>
      <td>8.0</td>
      <td>13.0</td>
      <td>10.0</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>A. Donnarumma</th>
      <td>11.0</td>
      <td>19.0</td>
      <td>11.0</td>
      <td>23.0</td>
    </tr>
    <tr>
      <th>Gabri Prestão</th>
      <td>11.0</td>
      <td>18.0</td>
      <td>12.0</td>
      <td>20.0</td>
    </tr>
  </tbody>
</table>
</div>



#### 7.1.1.2 ascending 옵션

- True(Default) : 오른차순 정렬
- False : 내림차순 정렬,


```python
players.sort_values(ascending = False,by = 'ShortPassing').head()
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
      <th>David Silva</th>
      <td>93.0</td>
      <td>89.0</td>
      <td>87.0</td>
      <td>94.0</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>93.0</td>
      <td>90.0</td>
      <td>88.0</td>
      <td>93.0</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>92.0</td>
      <td>81.0</td>
      <td>93.0</td>
      <td>90.0</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>92.0</td>
      <td>86.0</td>
      <td>91.0</td>
      <td>91.0</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>91.0</td>
      <td>84.0</td>
      <td>88.0</td>
      <td>91.0</td>
    </tr>
  </tbody>
</table>
</div>



#### 7.1.1.3 na_position 옵션

- 'last'(Defualt) : 결측값(NaN)을 뒤로 정렬
- 'first' : 결측값(NaN)을 앞으로 정렬


```python
players.sort_values(ascending = False,by = 'ShortPassing', na_position='first').head()
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
      <th>J. McNulty</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>J. Barrera</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>J. Stead</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>A. Semprini</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>R. Bingham</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>



#### 7.1.1.4 inplace 옵션

- False(Default) : 정렬된 내용을 단순 출력만함
- True : 정렬된 내용을 DataFrame에 저장


```python
players.sort_values(ascending = False,by = 'ShortPassing', inplace = True)
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
      <th>David Silva</th>
      <td>93.0</td>
      <td>89.0</td>
      <td>87.0</td>
      <td>94.0</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>93.0</td>
      <td>90.0</td>
      <td>88.0</td>
      <td>93.0</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>92.0</td>
      <td>81.0</td>
      <td>93.0</td>
      <td>90.0</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>92.0</td>
      <td>86.0</td>
      <td>91.0</td>
      <td>91.0</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>91.0</td>
      <td>84.0</td>
      <td>88.0</td>
      <td>91.0</td>
    </tr>
  </tbody>
</table>
</div>



#### 7.1.1.5 axis 옵션

- 0 : 열방향으로 정렬(위에서 아래로)
- 1 : 행방향으로 정렬(좌에서 우로)


```python
players.sort_values(axis = 1, by = 'David Silva').head()
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
      <th>LongPassing</th>
      <th>Dribbling</th>
      <th>ShortPassing</th>
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
      <th>David Silva</th>
      <td>87.0</td>
      <td>89.0</td>
      <td>93.0</td>
      <td>94.0</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>88.0</td>
      <td>90.0</td>
      <td>93.0</td>
      <td>93.0</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>93.0</td>
      <td>81.0</td>
      <td>92.0</td>
      <td>90.0</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>91.0</td>
      <td>86.0</td>
      <td>92.0</td>
      <td>91.0</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>88.0</td>
      <td>84.0</td>
      <td>91.0</td>
      <td>91.0</td>
    </tr>
  </tbody>
</table>
</div>



### 7.1.2 sort_index() : 인덱스명 정렬

sort_index 함수의 옵션(sort_values 와 옵션이 거의 동일)
- axis = 0 : 0이면 index기준으로 열방향 정렬, 1이면 컬럼명을 정렬

A 부터 오름차순 정렬


```python
players.sort_index().head()
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
      <th>A. Abang</th>
      <td>52.0</td>
      <td>56.0</td>
      <td>28.0</td>
      <td>59.0</td>
    </tr>
    <tr>
      <th>A. Abdellaoui</th>
      <td>53.0</td>
      <td>39.0</td>
      <td>45.0</td>
      <td>47.0</td>
    </tr>
    <tr>
      <th>A. Abdennour</th>
      <td>58.0</td>
      <td>48.0</td>
      <td>62.0</td>
      <td>51.0</td>
    </tr>
    <tr>
      <th>A. Abdi</th>
      <td>74.0</td>
      <td>70.0</td>
      <td>72.0</td>
      <td>74.0</td>
    </tr>
    <tr>
      <th>A. Abdu Jaber</th>
      <td>49.0</td>
      <td>61.0</td>
      <td>40.0</td>
      <td>59.0</td>
    </tr>
  </tbody>
</table>
</div>



내림차순 정렬


```python
players.sort_index(ascending = False).head()
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
      <th>Óscar Whalley</th>
      <td>32.0</td>
      <td>16.0</td>
      <td>30.0</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>Óscar Valentín</th>
      <td>68.0</td>
      <td>58.0</td>
      <td>63.0</td>
      <td>68.0</td>
    </tr>
    <tr>
      <th>Óscar Plano</th>
      <td>68.0</td>
      <td>72.0</td>
      <td>65.0</td>
      <td>73.0</td>
    </tr>
    <tr>
      <th>Óscar Pinchi</th>
      <td>65.0</td>
      <td>69.0</td>
      <td>63.0</td>
      <td>70.0</td>
    </tr>
    <tr>
      <th>Óscar Gil</th>
      <td>37.0</td>
      <td>57.0</td>
      <td>34.0</td>
      <td>50.0</td>
    </tr>
  </tbody>
</table>
</div>



컬럼명 정렬


```python
players.sort_index(axis = 1).head()
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
      <th>BallControl</th>
      <th>Dribbling</th>
      <th>LongPassing</th>
      <th>ShortPassing</th>
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
      <th>David Silva</th>
      <td>94.0</td>
      <td>89.0</td>
      <td>87.0</td>
      <td>93.0</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>93.0</td>
      <td>90.0</td>
      <td>88.0</td>
      <td>93.0</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>90.0</td>
      <td>81.0</td>
      <td>93.0</td>
      <td>92.0</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>91.0</td>
      <td>86.0</td>
      <td>91.0</td>
      <td>92.0</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>91.0</td>
      <td>84.0</td>
      <td>88.0</td>
      <td>91.0</td>
    </tr>
  </tbody>
</table>
</div>



## 7.2 DataFrame의 rank

rank 함수 (데이터의 순위를 측정) 옵션
- ascending : False 이면 숫자가 큰 것이 순위가 높다(rank 값이 작다)
- axis : 0이면 열방향, 1이면 행방향으로 순위 측정
- method : 동점인 경우 순위 측정에 사용할 방법(평균, 최소값, 최대값 등)
- pct : True 이면 상위 몇% 인지 보여줌

### 7.2.1 ascending 옵션

- True(Default) : 데이터 수치가 클 수록 rank값이 커짐(순위가 낮아짐)
- False : 데이터 수치가 작을 수록 rank값이 작아짐(순위가 높아짐)


```python
players.rank().head()
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
      <th>David Silva</th>
      <td>18158.5</td>
      <td>18131.5</td>
      <td>18145.0</td>
      <td>18155.0</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>18158.5</td>
      <td>18141.5</td>
      <td>18150.5</td>
      <td>18152.5</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>18156.5</td>
      <td>17790.5</td>
      <td>18159.0</td>
      <td>18137.5</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>18156.5</td>
      <td>18061.0</td>
      <td>18158.0</td>
      <td>18145.0</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>18155.0</td>
      <td>17982.5</td>
      <td>18150.5</td>
      <td>18145.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
players.rank(ascending = False).head()
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
      <th>David Silva</th>
      <td>1.5</td>
      <td>28.5</td>
      <td>15.0</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>1.5</td>
      <td>18.5</td>
      <td>9.5</td>
      <td>7.5</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>3.5</td>
      <td>369.5</td>
      <td>1.0</td>
      <td>22.5</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>3.5</td>
      <td>99.0</td>
      <td>2.0</td>
      <td>15.0</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>5.0</td>
      <td>177.5</td>
      <td>9.5</td>
      <td>15.0</td>
    </tr>
  </tbody>
</table>
</div>



### 7.2.2 axis 옵션

- 0(Defualt) : 열방향으로 순위 측정
- 1 : 행방향으로 순위 측정 


```python
players.rank(ascending = False, axis = 1).head()
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
      <th>David Silva</th>
      <td>2.0</td>
      <td>3.0</td>
      <td>4.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>1.5</td>
      <td>3.0</td>
      <td>4.0</td>
      <td>1.5</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>2.0</td>
      <td>4.0</td>
      <td>1.0</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>1.0</td>
      <td>4.0</td>
      <td>2.5</td>
      <td>2.5</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>1.5</td>
      <td>4.0</td>
      <td>3.0</td>
      <td>1.5</td>
    </tr>
  </tbody>
</table>
</div>



### 7.2.3 method 옵션

데이터 수치가 동점일 경우 순위 측정 방법
- average(Default) : 평균으로 순위 측정( Ex. 1위가 2명인경우 1.5 )
- first : 동점없이 정렬된 순서대로 순위 측정( Ex. 1위가 3명인 경위 위에서부터 1,2,3 )
- max : 동점인 데이터들 중 순위가 낮은 값 선정( Ex. 1위가 3명인 경우 3 )
- min : 동점인 데이터들 중 순위가 높은 값 선정( Ex. 1위가 3명인 경우 1등, 4번째 데이터의 경우 4등 )
- dense : min과 비슷하지만 동점 다음 데이터 순위 측정에서 차이가 있음( Ex. 1위가 3명인 경우 1등, 4번째 데이터의 경우 2등 )


```python
players.rank(ascending = False, method = 'average').head()
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
      <th>David Silva</th>
      <td>1.5</td>
      <td>28.5</td>
      <td>15.0</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>1.5</td>
      <td>18.5</td>
      <td>9.5</td>
      <td>7.5</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>3.5</td>
      <td>369.5</td>
      <td>1.0</td>
      <td>22.5</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>3.5</td>
      <td>99.0</td>
      <td>2.0</td>
      <td>15.0</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>5.0</td>
      <td>177.5</td>
      <td>9.5</td>
      <td>15.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
players.rank(ascending = False, method = 'first').head()
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
      <th>David Silva</th>
      <td>1.0</td>
      <td>25.0</td>
      <td>11.0</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>2.0</td>
      <td>13.0</td>
      <td>9.0</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>3.0</td>
      <td>332.0</td>
      <td>1.0</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>4.0</td>
      <td>80.0</td>
      <td>2.0</td>
      <td>13.0</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>5.0</td>
      <td>153.0</td>
      <td>10.0</td>
      <td>14.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
players.rank(ascending = False, method = 'max').head()
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
      <th>David Silva</th>
      <td>2.0</td>
      <td>32.0</td>
      <td>19.0</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>2.0</td>
      <td>24.0</td>
      <td>10.0</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>4.0</td>
      <td>407.0</td>
      <td>1.0</td>
      <td>27.0</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>4.0</td>
      <td>118.0</td>
      <td>2.0</td>
      <td>17.0</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>5.0</td>
      <td>202.0</td>
      <td>10.0</td>
      <td>17.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
players.rank(ascending = False, method = 'min').head()
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
      <th>David Silva</th>
      <td>1.0</td>
      <td>25.0</td>
      <td>11.0</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>1.0</td>
      <td>13.0</td>
      <td>9.0</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>3.0</td>
      <td>332.0</td>
      <td>1.0</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>3.0</td>
      <td>80.0</td>
      <td>2.0</td>
      <td>13.0</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>5.0</td>
      <td>153.0</td>
      <td>9.0</td>
      <td>13.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
players.rank(ascending = False, method = 'dense').head()
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
      <th>David Silva</th>
      <td>1.0</td>
      <td>9.0</td>
      <td>6.0</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>1.0</td>
      <td>8.0</td>
      <td>5.0</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>2.0</td>
      <td>17.0</td>
      <td>1.0</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>2.0</td>
      <td>12.0</td>
      <td>2.0</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>3.0</td>
      <td>14.0</td>
      <td>5.0</td>
      <td>6.0</td>
    </tr>
  </tbody>
</table>
</div>



### 7.2.4 pct 옵션

- False(Default) : rank를 순위(숫자)로 매김
- True : 순위의 퍼센테이지값으로 매김(ex. 4명 중 1등인 경우 0.25, 4등은 1.0)


```python
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
      <th>David Silva</th>
      <td>93.0</td>
      <td>89.0</td>
      <td>87.0</td>
      <td>94.0</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>93.0</td>
      <td>90.0</td>
      <td>88.0</td>
      <td>93.0</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>92.0</td>
      <td>81.0</td>
      <td>93.0</td>
      <td>90.0</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>92.0</td>
      <td>86.0</td>
      <td>91.0</td>
      <td>91.0</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>91.0</td>
      <td>84.0</td>
      <td>88.0</td>
      <td>91.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
players.rank(ascending = False, axis = 1, pct = True).head()
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
      <th>David Silva</th>
      <td>0.500</td>
      <td>0.75</td>
      <td>1.000</td>
      <td>0.250</td>
    </tr>
    <tr>
      <th>L. Modrić</th>
      <td>0.375</td>
      <td>0.75</td>
      <td>1.000</td>
      <td>0.375</td>
    </tr>
    <tr>
      <th>T. Kroos</th>
      <td>0.500</td>
      <td>1.00</td>
      <td>0.250</td>
      <td>0.750</td>
    </tr>
    <tr>
      <th>K. De Bruyne</th>
      <td>0.250</td>
      <td>1.00</td>
      <td>0.625</td>
      <td>0.625</td>
    </tr>
    <tr>
      <th>C. Eriksen</th>
      <td>0.375</td>
      <td>1.00</td>
      <td>0.750</td>
      <td>0.375</td>
    </tr>
  </tbody>
</table>
</div>


