let convertDirectory = (inputDir, outputDir) => {
    let cdbToJson = %raw(`require("cdb-to-json")`)
    cdbToJson(inputDir, outputDir)
}

let parseCards = (dirs) => Belt.Array.forEach(dirs, (dirname) => convertDirectory(dirname, "./temp"))