open Promise

let getDirectoriesFromUser = () => {
  Prompt.ask("Provide a directory path. Press Ctrl + C to exit. \n")->then(msg => {
    resolve(msg)
  })
}

let fromConfig = () => {
  let configJson = Config.readConfig()
  let config = Config.jsonToConfig(configJson)
  let paths = config["paths"]
  CardParser.parseCards(paths)
  CardFormatter.formatCards()
}

let fromInput = () => {
  let action = getDirectoriesFromUser()->then(paths => {
    CardParser.parseCards(paths)
    CardFormatter.formatCards()
    resolve()
  })

  Js.log(action)
}

let main = () => {
  let hasConfig = Config.checkForConfig()
  hasConfig ? fromConfig() : fromInput()
}

main()
