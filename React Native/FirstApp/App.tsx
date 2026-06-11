import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { Alert, Button, Image, Pressable, StyleSheet, Text, TouchableOpacity, View, ScrollView, Platform } from 'react-native';
import { SafeAreaView, SafeAreaProvider } from 'react-native-safe-area-context';
import FlexScreen from './FlexScreen';

const Stack = createNativeStackNavigator();

function App({ navigation }: any) {
  const onButtonPress = () => Alert.alert('Button component pressed!');

  return (
    <SafeAreaProvider>
      <ScrollView showsVerticalScrollIndicator={false}>
        <SafeAreaView style={styles.container}>
          <Text onPress={() => Alert.alert('Text pressed hahhhahhahhahahahaaa!')} style={styles.text}>
            Writing our first <Text style={styles.secondText}>"Hello, world!" </Text> app is a celebrated rite of passage in the world of coding.
          </Text>

          <Text>{Platform.OS}</Text>

          <Pressable onPress={onButtonPress}>
            <Image style={styles.imageSize} source={require('./assets/splash-icon.png')} />
          </Pressable>

          <Image style={styles.imageSize} source={require('./assets/splash-icon.png')} />
          <Image style={styles.imageSize} source={require('./assets/splash-icon.png')} />
          <Image style={styles.imageSize} source={require('./assets/splash-icon.png')} />
          <Image style={styles.imageSize} source={require('./assets/splash-icon.png')} />
          <Image style={styles.imageSize} source={require('./assets/splash-icon.png')} />

          <TouchableOpacity onPress={onButtonPress}>
            <Image source={{ uri: 'https://picsum.photos/200/300' }} style={styles.imageSize} />
          </TouchableOpacity>

          <Button title="Press me" onPress={onButtonPress} />

          <View style={styles.box} />

          <Button title="Go to Flex Screen" onPress={() => navigation.navigate('FlexScreen')} />

          <View style={styles.box2}>
            <View style={styles.childbox2} />
          </View>
        </SafeAreaView>
      </ScrollView>
    </SafeAreaProvider>
  );
}

export default function Root() {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Home" component={App} />
        <Stack.Screen name="FlexScreen" component={FlexScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'rgb(159, 159, 159)',
    padding: 10,
  },
  text: {
    color: 'black',
    fontSize: 30,
    fontWeight: 'bold',
  },
  secondText: {
    color: 'blue',
  },
  box: {
    height: 100,
    width: 100,
    backgroundColor: 'skyblue',
    borderRadius: 10,
    shadowColor: 'black',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    elevation: 5,
  },
  box2: {
    height: 100,
    width: 100,
    backgroundColor: 'skyblue',
    borderRadius: 10,
    shadowColor: 'black',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    elevation: 5,
    marginTop: 10,
  },
  childbox2: {
    height: 50,
    width: 50,
    backgroundColor: 'steelblue',
    borderRadius: 10,
    shadowColor: 'black',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    elevation: 5,
    marginTop: 25,
  },
  imageSize: {
    height: 100,
    width: 100,
    alignSelf: 'center',
    marginTop: 20,
  },
});
