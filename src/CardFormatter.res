let formatDirectory = (inputDir, outputDir) => {
    let format = %raw(`require("cdb-formatter")`)
    format(inputDir, outputDir)
}

let formatCards = () => formatDirectory("./temp", "./temp-formatted")