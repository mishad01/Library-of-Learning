import  {createStackNavigator} from '@react-navigation/stack';
import HomeScreen from '../screens/HomeScreen';

import React from 'react'
import DataScreen from '../screens/DataScreen';
import Settings from '../screens/Settings';

const Stack = createStackNavigator();

const MainStackNavigator = () => {
  return (
   <Stack.Navigator>
    <Stack.Screen name='home' component={HomeScreen} options={{headerShown:false}}/>
    <Stack.Screen name='data' component={DataScreen} options={{headerShown:false}}/>
    <Stack.Screen name='settings' component={Settings} options={{headerShown:false}}/>

   </Stack.Navigator>
  )
}

export default MainStackNavigator