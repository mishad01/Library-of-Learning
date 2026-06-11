import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { Alert,
   Button, Image, Pressable, StyleSheet, Text, Touchable, TouchableOpacity, View, ScrollView,Platform,ActivityIndicator} from 'react-native';
import { SafeAreaView ,SafeAreaProvider} from 'react-native-safe-area-context';
import FlexScreen from './FlexScreen';


const Stack = createNativeStackNavigator();

function HomeScreen({ navigation }: { navigation: any }) {
    const onButtonPress = ()=> Alert.alert('Button component pressed!');
  return (
    <SafeAreaProvider>
      <ScrollView
      showsVerticalScrollIndicator = {false}
     // horizontal = {true}
      >
        <SafeAreaView style={styles.container}>
        <Text onPress={() => Alert.alert('Text pressed hahhhahhahhahahahaaa!')}
        // style = {{
        //   color: 'black',
        //   fontSize: 30,
        //   fontWeight: 'bold',
        // }}
        style = {styles.text}
        >Writing our first <Text style={styles.secondText}>"Hello, world!" </Text> app is a celebrated rite of passage in the world of coding.</Text>


       <Text>{Platform.OS}</Text>

       {/* <ActivityIndicator color={'blue'}></ActivityIndicator> */}
        <Pressable onPress={onButtonPress}>
          <Image style={styles.imageSize} source ={require('./assets/splash-icon.png')} />
        </Pressable>
                  <Image style={styles.imageSize} source ={require('./assets/splash-icon.png')} />

          <Image style={styles.imageSize} source ={require('./assets/splash-icon.png')} />

          <Image style={styles.imageSize} source ={require('./assets/splash-icon.png')} />

          <Image style={styles.imageSize} source ={require('./assets/splash-icon.png')} />

          <Image style={styles.imageSize} source ={require('./assets/splash-icon.png')} />


        <TouchableOpacity onPress={onButtonPress}><Image
          source={{uri: 'https://picsum.photos/200/300'}}
          style={styles.imageSize}
        /></TouchableOpacity>

     <Button title = "Press me" onPress={
      onButtonPress
     }>

     </Button>



     <View style={styles.box}></View>

     <Button title="Press me too" onPress={ ()=>
      navigation.navigate('FlexScreen')
     }></Button>

    <View style={styles.box2}>
      <View style={styles.childbox2}></View>
    </View>
      </SafeAreaView></ScrollView>
          <View style ={{flex:2,backgroundColor: 'tomato'}}></View>

    </SafeAreaProvider>
  );
}

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Home" component={HomeScreen} />
        <Stack.Screen name="FlexScreen" component={FlexScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}



/*
StyleSheet.create = Create method is taking an object as an argument and returning an object
with the same keys but with the values transformed to a style object that can be used in the*/
const styles = StyleSheet.create({
  container: {
    flex: 1, //How much space the container should take up
   // height: 100, //Height of the container
    backgroundColor: 'rgb(159, 159, 159)',
    padding:10,
   // alignItems: 'center',
   // justifyContent: 'center',
  },

  text:{
    color: 'black',
    fontSize: 30,
    fontWeight: 'bold',
  },

  secondText:{
    color: 'blue',
  },

  box : {
    height: 100,
    width: 100,
    backgroundColor: 'skyblue',
    borderRadius: 10,
    shadowColor: 'black',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    elevation: 5, //for android
  },

  box2 : {
    height: 100,
    width: 100,
    backgroundColor: 'skyblue',
    borderRadius: 10,
    shadowColor: 'black',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    elevation: 5, //for android
    marginTop: 10,
  },

  childbox2 : {
    height: 50,
    width: 50,
    backgroundColor: 'steelblue',
    borderRadius: 10,
    shadowColor: 'black',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    elevation: 5, //for android
    marginTop: 25,
    marginLeft: 0,
    
  },

  imageSize:{
    height: 100,
    width: 100,
    alignSelf: 'center',
    marginTop: 20,

  }
});
