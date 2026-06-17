import { DECREASE_TOTAL_LIKES, INCREASE_TOTAL_LIKES, INCREASE_TOTAL_LIKES_BY_AMOUNT } from "../types"

const initialState = {
    totalLike: 12,
    userName: "Sakif",
}

export const dataReducer = (state = initialState, action) => { //action contains meta data
    switch (action.type) {
        case INCREASE_TOTAL_LIKES:
            return {
                ...state,
                totalLike: state.totalLike + 1
            }
        case DECREASE_TOTAL_LIKES:
            return {
                ...state,
                totalLike: state.totalLike - 1
            }
        case INCREASE_TOTAL_LIKES_BY_AMOUNT:
            return {
                ...state,
                totalLike: state.totalLike + action.payload
            }
        default:
            return state
    }
}