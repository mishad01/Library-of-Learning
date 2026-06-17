import HomeScreen from '../screens/HomeScreen';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { Ionicons } from '@expo/vector-icons';
import Settings from '../screens/Settings';
import DataScreen from '../screens/DataScreen';

const Tab = createBottomTabNavigator();

export default function BottomTabs() {
  return (
    <Tab.Navigator screenOptions={{
      tabBarActiveTintColor: "#fe6113",
      tabBarInactiveTintColor: "#181C2E",
      tabBarLabelStyle: { fontSize: 12, fontWeight: "500" },
      tabBarStyle: { height: 60 },
    }}>
      <Tab.Screen name='home' component={HomeScreen} options={{
        headerShown: false,
        title: "Home",
        tabBarIcon: ({ color, focused, size }) => (
          <Ionicons name={focused ? "home" : "home-outline"} size={size} color={color} />
        ),
      }} />
      <Tab.Screen name='payment' component={DataScreen} options={{
        headerShown: false,
        title: "Payment",
        tabBarIcon: ({ color, focused, size }) => (
          <Ionicons name={focused ? "card" : "card-outline"} size={size} color={color} />
        ),
      }} />
      <Tab.Screen name='settings' component={Settings} options={{
        headerShown: false,
        title: "Settings",
        tabBarIcon: ({ color, focused, size }) => (
          <Ionicons name={focused ? "cog" : "cog-outline"} size={size} color={color} />
        ),
      }} />
    </Tab.Navigator>
  )
}
