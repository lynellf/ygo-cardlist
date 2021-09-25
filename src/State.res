type dirs = array<string>

type state = 
| Init
| UserPrompt
| Running(dirs)
| Done
| Error(string)

type events =
| NoConfigFound
| AddDirs(dirs)
| Start(dirs)
| Finish
| Fail(string)

type context = {
  state: ref<state>,
  dispatch: (events) => unit
}

let getStateSetter = (stateRef) => (incomingState) => {
  stateRef.contents = incomingState
}

let context = (state) => {
  let internalState = ref(state)
  let setState = getStateSetter(internalState)

  let dispatch = (event) => {
    switch(event, state) {
      | (Start(dirs), Init) => setState(Running(dirs))
      | (Start(_), _) => setState(Init)
      | (NoConfigFound, Init) => setState(UserPrompt)
      | (NoConfigFound, _) => setState(Init)
      | (AddDirs(dirs), UserPrompt) => setState(Running(dirs))
      | (AddDirs(dirs), _) => setState(Running(dirs))
      | (Finish, Running(_)) => setState(Done)
      | (Finish, _) => setState(Done)
      | (Fail(msg), _) => setState(Error(msg))
    }
  }

  { state: internalState, dispatch }
}