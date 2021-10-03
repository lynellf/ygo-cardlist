type config = {"paths": array<string>}

let jsonToConfig = json => Parser.check(json)->Parser.parse

let readConfig = () => Filesystem.readFileSync("./config.json")

let checkForConfig = () => {
  let files = Filesystem.readDirSync("./")
  Js.Array.includes("config.json", files)
}
