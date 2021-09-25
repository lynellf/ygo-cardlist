type readline = {
  question: (. string, (. string) => unit) => unit,
  on: (. string, (. unit) => unit) => unit,
  close: (. unit) => unit,
  emitKeypressEvents: (. unit) => unit
}

@val external process: 'a = "process"
@module("readline") external createInterface: ({ "input": string, "output": string }) => readline = "createInterface"

let ask = (query) => {
  let readline = createInterface({
    "input": process["stdin"], 
    "output": process["stdout"] 
  })

  Promise.make((resolve, _reject) => {
    readline.on(. "SIGINT", (.) => {
      readline.close(.)
      resolve(. "")
    })

    readline.question(. query, (. response) => {
      readline.close(.)
      resolve(. response)
    })
  })
}