import { CHANGE_ROLE } from "../types"

const initialState = {
    userRole: "Admin",
}

export default (state = initialState, action) => {
  switch (action.type) {

  case CHANGE_ROLE:
    return {
      ...state,
      userRole: action.payload
    }
  

  default:
    return state
  }
}
