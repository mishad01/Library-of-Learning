// import { createStore,combineReducers } from "redux";
// import { dataReducer } from "./reducers/dataReducer";

// const store = createStore(dataReducer);

// export default store;

import { createStore,combineReducers } from "redux";
import { dataReducer } from "./reducers/dataReducer";
import settingsReducer from "./reducers/settingsReducer";

const rootReducer = combineReducers({
    dataReducer: dataReducer,
    settings: settingsReducer
})

const store = createStore(rootReducer);

export default store;

export type RootState = ReturnType<typeof rootReducer>