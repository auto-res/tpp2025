# TPPmark12

**日付:** 2012年10月18日

[1] にあるハフマン木構成法を取り上げる。これは既知の正の確率を持つ有限アルファベットに対して最適な二分前置符号木を与えるアルゴリズムである。

## ハフマン木の構成

1. 葉に対応する確率を並べたリスト `L` を用意する。
2. `L` から最も小さい確率を 2 つ取り出し、それらの葉を兄弟にし、親ノードを追加して子との枝に `0` と `1` のラベルを付ける。
3. 2 つの確率をその和で置き換えてリスト `L` を更新する。`L` が 1 要素になれば終了し、そうでなければ手順 2 に戻る。

## 問題

すべての記号の出現確率は正であると仮定する。二分符号木が **兄弟性 (sibling property)** [1] を満たすとは、「根以外の各ノードに兄弟が存在し、ノードを確率の非増加順に並べたときに各ノードが兄弟と隣り合うように列挙できる」ことを指す。

次を示せ。

1. 任意のハフマン木は兄弟性を満たす。
2. 兄弟性を満たす任意の二分符号木はハフマン木である。

## ヒント

- 実数の確率の代わりに正の整数重みで議論してもよい。
  - 各葉に、その記号の出現回数を表す正の整数を割り当てる（同じ回数の葉を区別する場合はラベルなどを付ける）。
  - 各内部ノードにはちょうど 2 つの子を持たせ、子孫の葉の重みの総和を割り当てる。
- [1] には両方向の非形式的な証明が掲載されている（定理 1）。
- 既存の形式化 [2, 3] も利用できる。[2] の述語 `build` は「ハフマン木であること」を表すが、親ノードの左子の重みが右子の重みを超えないという制約がある。この定義を採用するなら、項目 2 を示す際に兄弟性にも同様の制約を加える必要がある。

## 参考文献

- [1] Robert G. Gallager, “Variations on a Theme by Huffman,” *IEEE Transactions on Information Theory*, IT-24(6):668–674, 1978.
- [2] Laurent Thery, “Formalising Huffman’s Algorithm,” 技術報告 TRCS 034, University of L’Aquila 情報学科, 2004。Coq 証明: http://coq.inria.fr/pylons/pylons/contribs/view/Huffman/v8.4
- [3] Jasmin Christian Blanchette, “Proof Pearl: Mechanizing the Textbook Proof of Huffman’s Algorithm,” *Journal of Automated Reasoning*, 43(1):1–18, 2009。Isabelle/HOL 証明: http://afp.sourceforge.net/browser_info/current/HOL/Huffman/Huffman.html
