open Promise

let getDirectoriesFromUser = (dispatch) => {
  Prompt.ask("Provide a directory path. Press Ctrl + C to exit. \n")
    ->then(msg => {
      dispatch(msg)
      resolve(msg)
  })
}

let rec main = (state) => {
  let { state } = State.context(state)
  let isDone = state.contents === State.Done
  isDone ? () : main(state.contents)
}

main(State.Init)