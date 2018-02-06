require('fs').readFileSync(0).toString().split`
`.map(x=>(c=x.split` `[3])<255?process.stdout.write(String.fromCharCode(255-c+96)):0)
