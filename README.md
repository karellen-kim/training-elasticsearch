# Elastic search

## Search UI
* https://www.elastic.co/guide/en/app-search/current/reference-ui-guide.html

## analyzer
* Nori
  * https://lucene.apache.org/core/9_12_0/analysis/nori/org/apache/lucene/analysis/ko/POS.Tag.html

## Mecab
* 설치 
  ```
  brew install mecab mecab-ko-dic
  pip install mecab-python3
  pip install mecab-ko
  ```

* [품사 태그](https://docs.google.com/spreadsheets/d/1-9blXKjtjeKZqsf4NzHeYJCrr49-nXeRF6D80udfcwY/edit?gid=589544265#gid=589544265)
* 설명
  * `NNG,*,F,멋쟁이,Compound,*,*,멋/NNG/*+쟁이/NNG/*`
    `품사 태그, 의미 부류, 종성 유무, 읽기, 타입, 첫번째 품사, 마지막 품사, 원형`
  * 품사 : NNG - 일반 명사 
  * 종성유무 : F
  * 타입 : Compound 