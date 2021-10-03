@module("cdb-formatter")
external format: (array<Js.Json.t>, string) => unit = "formatData"

let formatFile = (file, outputDir) => format(file, outputDir)

let formatCards = () => {
  let filenames = Filesystem.readDirSync("./temp")

  let files = Belt.Array.map(filenames, filename => {
    let pathname = `./temp/${filename}`
    let json = Filesystem.readFileSync(pathname)
    Parser.check(json)
  })

  Belt.Array.forEachWithIndex(files, (index, file) => {
    let filename = filenames[index]
    formatFile([file], `./cards-json/${filename}.json`)
  })

  let formattedFiles = Belt.Array.map(filenames, filename => {
    let pathname = `./cards-json/${filename}.json`
    Filesystem.readFileSync(pathname)
  })

  Belt.Array.forEachWithIndex(formattedFiles, (index, file) => {
    let filename = filenames[index]
    let parsedFilename = Js.String.split(".json", filename)
    let output = `module.exports = ${file}`
    Filesystem.writeFileSync(`./cards/${parsedFilename[0]}.js`, output)
  })
}
