for(l of require('fs').readFileSync(0).toString().split`
`){c=l.split` `[3]
if(c<255)process.stdout.write(String.fromCharCode(255-c+96))}
