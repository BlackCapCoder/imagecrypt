require('fs').readFileSync(0).toString().split`
`.map((l,i)=>console.log(l+' '+(i>21?255:255+96-'loremipsumdolorsitamet'.split``[i].charCodeAt(0))))
