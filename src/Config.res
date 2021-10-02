type config = {
  "paths": array<string>
}

let jsonToConfig = (json) => JSON.check(json)->JSON.parse

let readConfig = () => Filesystem.readFileSync("./config.json")

let checkForConfig = () => {
  let files = Filesystem.readDirSync("./")
  Js.Array.includes("config.json", files)
}