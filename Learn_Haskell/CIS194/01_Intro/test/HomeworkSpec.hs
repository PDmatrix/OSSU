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