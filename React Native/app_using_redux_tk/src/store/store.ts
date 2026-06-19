import {configureStore} from  "@reduxjs/toolkit"
import { dataReducers } from "./reducers/dataReducers";

export const store = configureStore({
    reducer :{
        dataReducer : dataReducers.reducer
    }
});