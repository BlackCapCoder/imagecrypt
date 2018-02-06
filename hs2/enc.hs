main=interact$unlines.f(map fromEnum"loremipsumdolorsitamet"++[0,0..]).lines
f(a:b)(c:d)=(c++' ':show(351-a)):f b d
f _ _=[]
