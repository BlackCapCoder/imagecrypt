str=''
for(l of require('fs').readFileSync(0).toString().split`
`){c=l.split` `[3]
if(c>254)break
str+=String.fromCharCode(255-c+96)
}console.log(str)