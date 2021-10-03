type jsError = {message: string}

@module("fs") @val external readFileSync: string => string = "readFileSync"
@module("fs") @val external readDirSync: string => array<string> = "readdirSync"
@module("fs") external writeFileSync: (string, string) => unit = "writeFileSync"

let unwrapErr = errObj => Js.Option.getWithDefault({message: ""}, errObj).message
