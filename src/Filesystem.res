type jsError = {
  message: string
}

module FS = {
  @module("fs")

  external readDir: (string, (array<string>) => unit) => unit = "readDir"

  @send external readFile: (string, (option<jsError>, string) => unit) => unit = "readFile"
  
  external writeFile: (string, string, (option<jsError>) => unit) => unit = "writeFile"
}

type config = {
  "paths": array<string>
}

@scope("JSON") @val external parseConfig: (string) => config = "parse"

let unwrapErr = (errObj) => Js.Option.getWithDefault({ message: "" }, errObj).message

let getConfig = (dispatch) => () => {
  FS.readFile("./config.json", (err, data) => {
    let hasError = Js.Option.isSome(err)

    hasError ? 
    dispatch(State.UserPrompt) : 
    dispatch(State.Running(parseConfig(data)["paths"]))
  })
}