module User where

import Data.Aeson
import Test.QuickCheck


data User = User { name :: String
                 , email :: String
                 , password :: String
                 , status :: Status
                 }

data Status = Enabled | Disabled


-- Exercise 1 - Implement instance of Show for User

-- class Show a where
--   show :: a -> String

-- Exercise 2 - Implement instance of ToJSON for User

-- class ToJSON a where
--   toJSON :: a -> Value


-- Exercise 3 - Implement instance of FromJSON for User

-- class FromJSON a where
--   parseJSON :: Value -> Data.Aeson.Types.Internal.Parser a

-- Exercise 4 - Implement instance of Arbitrary for User

-- class Arbitrary a where
--   arbitrary :: Gen a
