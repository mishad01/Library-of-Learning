

import { createSlice, PayloadAction } from '@reduxjs/toolkit'

const initialState = {
    totalLike:100
}

export const dataReducers = createSlice({
  name: "dataSlice",
  initialState,
  reducers: {
    increaseTotalLike : (state)=>{
        state.totalLike += 1
    },

    increateTotalLikeByAmount :(state, action: PayloadAction<number>)=>{
        state.totalLike += action.payload
    }
  }
});

export const { increaseTotalLike, increateTotalLikeByAmount } = dataReducers.actions

export default dataReducers.reducer