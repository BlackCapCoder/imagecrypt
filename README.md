# Imagecrypt

We had an exercise after a lecture to use this nasty GUI application to hide a textual message in an image. Clearly that's not much of an exercise, so I decided to implement it myself.

This hides a message in the alpha channel of an image. Haskell was apparently a bad choice of language for this, or rather, JuicyPixels is an extremely verbose library, because conceptually the code could just be:

```haskell
writeImg pthOut
  =<< zipWith (\c -> _a $= 255-c) (msg ++ repeat 0)
    . toRGBA8
  <$> readImg pthIn
```

Being a golfing addict I obviously couldn't settle for a 63 line solution, and so my quest began to find the shortest language to do this in.

## Scoreboard

| Language                     | Size                 |
| -------------------          | --------             |
| Haskell (Ideomatic)          | 63 lines, 1310 bytes |
| Python (Ideomatic)           | 30 lines, 619 bytes  |
| Haskell (golfed)             | 199 bytes            |
| Javascript (node, golfed)    | 278 bytes            |
| Javascript (browser, golfed) | 200 bytes            |
| Vim                          | 159 keypresses       |
