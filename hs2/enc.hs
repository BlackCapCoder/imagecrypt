main=interact$unlines.f"loremipsumdolorsitamet".lines
f[](c:d)=(c++" 255"):f[]d
f(a:b)(c:d)=(c++' ':show(255-fromEnum a+96)):f b d
f _ _=[]
