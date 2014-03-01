-- ------------------------------------------------------------------
--
--  概要
--    甲州記法のためのラムダ算法
--
--  使用例
--    let ns = ["/a", "/b"]
--        cs = [2, 3]
--        e1 = call "+" [lit 1, term "/a"]
--        e2 = reduce [("+", sum)] [] ns e1
--    in run e2 cs
--
-- ------------------------------------------------------------------
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -Wall #-}

module Exp (
 -- datatype
 Exp (..),
 Fn, BaseFn, NamedExp,
 lit, term, ap, ap1,
 var, call, fn,

 -- calculation
 unlist, debruijn,
 link, position, beta,
 reduce, run, 
) where

import qualified Text.PrettyPrint as P


-- ----------------------  ユーティリティ

mapSnd :: (b -> c) -> [(a, b)] -> [(a, c)]
mapSnd = map . fmap

indexFrom :: (Eq a) => Int -> a -> [a] -> Maybe Int
indexFrom origin key = ind origin where
    ind _ []                 = Nothing
    ind i (x:xs) | x == key  = Just i
                 | otherwise = ind (i + 1) xs


-- ----------------------  データ型

data Exp c
    = Literal c                -- 基礎: 定数
    | Term String Int          -- 基礎: 項目参照
    | BaseL String ([c] -> c)  -- 基礎: 組み込み関数
    | ApplyL (Exp c)  [Exp c]  -- 基礎/導出: 関数適用 (複数の引数)

    | Var     String   Int     -- 導出: 変数 (変数名とド・ブラン索引)
    | Deriv   String  (Exp c)  -- 導出: 関数抽象
    | DerivL [String] (Exp c)  -- さらなる導出: 関数抽象 (複数の変数)

type Fn c = [Exp c] -> Exp c

mapToExp :: (Exp c -> Exp c) -> Exp c -> Exp c
mapToExp g (ApplyL f xs) = ApplyL (g f) (map g xs)
mapToExp g (Deriv  x  e) = Deriv  x  (g e)
mapToExp g (DerivL xs e) = DerivL xs (g e)
mapToExp _ e = e


-- ----------------------  コンストラクタ

lit :: c -> Exp c
lit = Literal

term :: String -> Exp c
term n = Term n 0

ap :: Exp c -> [Exp c] -> Exp c
ap = ApplyL

ap1 :: Exp c -> Exp c -> Exp c
ap1 f x = ApplyL f [x]

var :: String -> Exp c
var v = Var v 0

call :: String -> Fn c
call v = (var v `ap`)

fn :: String -> Exp c -> Exp c
fn = DerivL . words


-- ----------------------  整形

instance Show c => Show (Exp c) where
    show = P.render . doc

doc :: (Show c) => Exp c -> P.Doc
doc (Literal c)   = P.text $ show c
doc (Term n i)    = n `docDot` i
doc (Var  v i)    = v `docDot` i
doc (ApplyL f xs) = docParen $ map doc (f:xs)
doc (BaseL n _)   = P.text "base" P.<+> P.text n
doc (Deriv  v  b) = docDeriv [v] b
doc (DerivL vs b) = docDeriv vs  b

docDot :: String -> Int -> P.Doc
docDot v i = P.text v P.<> P.text "." P.<> P.int i

docDeriv :: (Show c) => [String] -> Exp c -> P.Doc
docDeriv vs b =
    let vars = P.hsep $ map P.text vs
    in docWith "(|" "|)" $ vars P.<+> P.text "|" P.<+> doc b

docParen :: [P.Doc] -> P.Doc
docParen = docWith "(" ")" . P.hsep

docWith :: String -> String -> P.Doc -> P.Doc
docWith open close content = P.text open P.<+> content P.<+> P.text close


-- ----------------------  計算の実行

-- 1. 複数変数の展開

unlist :: Exp c -> Exp c
unlist (DerivL (v:vs) e) = Deriv v $ unlist $ DerivL vs e
unlist (DerivL []     e) = e
unlist e                 = mapToExp unlist e

-- 2. ド・ブラン索引の付与

debruijn :: Exp c -> Exp c
debruijn = de [] where
    de :: [String] -> Exp c -> Exp c
    de vars e =
        case e of
          Var v _    -> maybe e (Var v) $ indexFrom 1 v vars
          ApplyL _ _ -> mapToExp (de vars) e
          Deriv v _  -> mapToExp (de $ v : vars) e
          _          -> e

-- 3. 自由変数の置換

type BaseFn   c = (String, [c] -> c)
type NamedExp c = (String, Exp c)

link :: forall c. [BaseFn c] -> [NamedExp c] -> Exp c -> Exp c
link base deriv = li where
    li :: Exp c -> Exp c
    li e@(Var n 0) = maybe e id $ lookup n fnlist
    li e = mapToExp li e

    fnlist :: [NamedExp c]
    fnlist = mapSnd li deriv ++ map basefn base

    basefn :: BaseFn c -> NamedExp c
    basefn (n, f) = (n, BaseL n f)

-- 4. 項目索引の付与

position :: [String] -> Exp c -> Exp c
position ns = pos where
    pos (Term n _) = Term n $ maybe 0 id $ indexFrom 0 n ns
    pos e = mapToExp pos e

-- 5. ベータ変換

beta :: Exp c -> Exp c
beta = be [] where
    be :: [Maybe (Exp c)] -> Exp c -> Exp c
    be args e =
        case e of
          Var _ i    -> maybe e id $ args !! (i - 1)
          Deriv v e2 -> Deriv v $ be (Nothing : args) e2
          ApplyL _ _ -> app args $ mapToExp (be args) e
          _          -> e

    app :: [Maybe (Exp c)] -> Exp c -> Exp c
    app args (ApplyL (Deriv _ b) (x:xs)) =
        app (Just x : args) $ ApplyL b xs
    app args (ApplyL f []) = be args f
    app _ e = e

-- 6. 還元

reduce :: [BaseFn c] -> [NamedExp c] -> [String] -> Exp c -> Exp c
reduce base deriv ns = beta . ln . position ns . du where
    ln = link base $ mapSnd du deriv
    du = debruijn . unlist

-- 7. 実行

run :: forall c. (Show c) => Exp c -> [c] -> c
run e cs = r e where
    r :: Exp c -> c
    r (Literal c)             = c
    r (Term _ n)              = cs !! n
    r (ApplyL (BaseL _ f) xs) = f $ map r xs
    r e2 = error $ "couldn't run expression: " ++ show e2

