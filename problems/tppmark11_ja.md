# TPPmark11

**開催:** 第7回 TPP (2011) 産総研つくば

## 問題

`N` 人の子どもが円形に座り、それぞれが偶数個のキャンディを持っている。以下の 2 つの操作を繰り返し行う（無限回繰り返す）。

1. 各子どもは自分のキャンディの半分を左隣の子どもに渡す。
2. その結果奇数個のキャンディを持つ子どもがいた場合、先生が 1 個追加で渡す。

この手順を有限回行えば、すべての子どもが同じ個数のキャンディを持つようになることを証明せよ。

## 証明の道筋

`m(i, k)` を「`k` 回目の操作後に子ども `i`（`i` は `1` から `N`）が持っているキャンディの数」と定義する。まず次の補題を証明する。

1. `max(k + 1) <= max(k)`
2. `min(k) <= min(k + 1)`
3. `min(k) < m(i, k)` ならば `min(k) < m(i, k + 1)`
4. `m(i, k) < m(right(i), k)` ならば `m(i, k) < m(i, k + 1)`

ここで

```
max(k)  = max{ m(i, k) | i in {1, ..., N} }
min(k)  = min{ m(i, k) | i in {1, ..., N} }
right(i) = (i < N なら i + 1、そうでなければ 1)
```

次に次の重要な補題を示す。

5. ある `i` について `min(k) < m(i, k)` ならば、`num(min(k), k + 1) < num(min(k), k)`

ここで `num(m, k)` は「`k` 回目の操作後にちょうど `m` 個のキャンディを持つ子どもの人数」を表す。

補題 1〜5 を組み合わせることで、最小値と最大値が同じ値に収束することが分かり、最終的に全員のキャンディの数が揃う。

## 参考文献

- Bohman, T.; Pikhurko, O.; Frieze, A.; Sleator, D. *The Puzzle TOAD, Puzzle 6: Uniform Candy Distribution.* Carnegie Mellon School of Computer Science. 2011-10-13 閲覧。

## 定理証明支援系による解

- Isabelle — 礒部 祥尚（スライド）（スクリプト）
- Coq — 山本 光晴（スクリプト）
- Coq — 才川 隆文（スクリプト）
- SSReflect — Reynald Affeldt（PDF）（スクリプト）
- Z3 — 酒井 政裕（UTF-8 スクリプト）（ローカルコピー）
- Coq — Jacques Garrigue（スクリプト）
- Isabelle — 南出 靖彦（スクリプト）
