require('fs').readFileSync(0).toString().split`
`.map(x=>(c=x.split` `[3])<255?process.stdout.write(String.fromCharCode(351-c)):0)
