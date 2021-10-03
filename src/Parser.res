open Json.Decode
let check = (input: string) => Json.parseOrRaise(input)
let parse = (data: Js.Json.t) =>
  {
    "paths": field("paths", array(string), data),
  }
