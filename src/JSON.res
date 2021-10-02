open Json.Decode
let check = (input: string) => Json.parseOrRaise(input)
let parse = (data: Js.Json.t) => {
    "paths": field("config", array(string), data)
}