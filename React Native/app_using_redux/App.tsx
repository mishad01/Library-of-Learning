import { NavigationContainer } from "@react-navigation/native";
import MyTabs from "./src/navigation/BottomTabs";
import {Provider} from "react-redux"
import store from "./src/store/store";
import BottomTabs from "./src/navigation/BottomTabs";
  
export default function App() {
  return (
    <Provider store = {store}>
      <NavigationContainer>
      <BottomTabs/>
    </NavigationContainer>
    </Provider>
  );
}


// 1. Install Redux
// 2. Create Reducer
// 3. Create Store
// 4. Provide Store to App
// 5. Use useSelector and useDispatch in components