{- Top-level handlers -}

{-# LANGUAGE TypeFamilies,
    MultiParamTypeClasses,
    GADTs,
    TypeOperators,
    RankNTypes,
    FlexibleContexts,
    QuasiQuotes
  #-}

module TopLevel where

import Handlers
import DesugarHandlers

[handler|
  HandlePure a :: a handles {} where
    Return x -> x
|]

[operation|forall a.Io :: IO a -> a|]
[handler|
  HandleIO a :: IO a handles {Io} where
    Return x -> x
    Io c k   -> do {x <- c; k x} 
|]
