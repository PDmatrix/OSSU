{-# OPTIONS_GHC -Wall #-}

module HomeworkSpec
  ( spec
  ) where

import           Homework
import           Test.Hspec

spec :: Spec
spec = do
  describe "toDigits" $ do
    it "should return array of numbers" $ toDigits 1234 `shouldBe` [1, 2, 3, 4]
    it "should return array of numbers with reverse order" $
      toDigits 4321 `shouldBe` [4, 3, 2, 1]
    it "should return empty array with value 0" $ toDigits 0 `shouldBe` []
    it "should return empty array with negative value" $
      toDigits (-10) `shouldBe` []
  describe "toDigitsRev" $ do
    it "should return array of reversed numbers" $
      toDigitsRev 1234 `shouldBe` [4, 3, 2, 1]
    it "should return reversed array of reversed numbers" $
      toDigitsRev 4321 `shouldBe` [1, 2, 3, 4]
    it "should return empty array with value 0" $ toDigitsRev 0 `shouldBe` []
    it "should return empty array with negative value" $
      toDigitsRev (-29) `shouldBe` []
  describe "doubleEveryOther" $ do
    it "should double in array of size 3" $
      doubleEveryOther [3, 5, 7] `shouldBe` [3, 10, 7]
    it "should double in array of size 5" $
      doubleEveryOther [1, 2, 3, 4, 5] `shouldBe` [1, 4, 3, 8, 5]
    it "should double in array of size 6" $
      doubleEveryOther [1, 2, 3, 4, 5, 6] `shouldBe` [2, 2, 6, 4, 10, 6]
    it "should do nothing with array of size 1" $
      doubleEveryOther [1] `shouldBe` [1]
    it "should do nothing with an empty array" $
      doubleEveryOther [] `shouldBe` []
  describe "sumDigits" $ do
    it "should calculate right result" $ sumDigits [16, 5, 2, 4] `shouldBe` 18
    it "should calculate right result with one digit numbers" $
      sumDigits [1, 2, 3, 4] `shouldBe` 10
  describe "validate" $ do
    it "should be valid" $ validate 4012888888881881 `shouldBe` True
    it "should be invalid" $ validate 4012888888881882 `shouldBe` False
  describe "hanoi" $ do
    it "should build right path" $
      hanoi 3 "a" "b" "c" `shouldBe`
      [ ("a", "b")
      , ("a", "c")
      , ("b", "c")
      , ("a", "b")
      , ("c", "a")
      , ("c", "b")
      , ("a", "b")
      ]
    it "should build right path with 4 pegs" $
      hanoi2 3 "a" "b" "c" "d" `shouldBe`
      [("a", "c"), ("a", "d"), ("a", "b"), ("d", "b"), ("c", "b")]
