import Codec.Picture
import Codec.Picture.Types
import Data.Maybe
import Data.List
import Control.Monad
import Control.Monad.ST
import Data.Function


-- Available characters
alphabeth = ['a' .. 'z']

-- Message to hide
message = "loremipsumdolorsitamet"

-- Indicies in alphabeth
message'
  | as <- zip [1..] alphabeth
  = map fst . catMaybes . flip map message $ \c -> find ((==c).snd) as


writeMessage img msg = runST $ do
  pic <- thawImage img

  let w = imageWidth img

  forM_ (zip [0..] msg) $ \(ix, c) -> do
    let x = mod ix w
        y = div ix w
    PixelRGBA8 r g b _ <- readPixel pic x y
    writePixel pic x y $ PixelRGBA8 r g b (255 - c)

  freezeImage pic

readMessage :: Image PixelRGBA8 -> String
readMessage img = runST $ do
  pic <- thawImage img

  let w = imageWidth  img

  msg <- flip fix 0 $ \r ix -> do
    let x = mod ix w
        y = div ix w
    PixelRGBA8 _ _ _ a <- readPixel pic x y
    if a==255
       then return []
       else do
         xs <- r $ ix + 1
         return $ fromIntegral (255-a) : xs

  return $ (alphabeth!!) . pred <$> msg


main :: IO ()
main = do
  -- Hide message
  Right img <- readImage "../kitten.jpg"
  let img' = writeMessage (convertRGBA8 img) message'
  writePng "kitten.png" img'

  -- Load message
  let msg = readMessage img'
  putStrLn msg
