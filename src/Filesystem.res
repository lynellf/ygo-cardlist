type jsError = {
  message: string
}

@module("fs")
external readFile: (string, (option<jsError>, string) => unit) => unit = "readFile"
@send external readFileSync: (string) => string = "readFileSync"
external writeFile: (string, string, (option<jsError>) => unit) => unit = "writeFile"
external readDir: (string, (array<string>) => unit) => unit = "readDir"
@send external readDirSync: (string) => array<string> = "readDirSync"


let unwrapErr = (errObj) => Js.Option.getWithDefault({ message: "" }, errObj).message
