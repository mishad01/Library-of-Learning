import { View,StyleSheet, Text } from "react-native";

export default function FlexScreen() {
    return (
        <View style = {{flex:1,flexDirection: "row",
          backgroundColor: 'powderblue',
        justifyContent: 'space-between',
        flexWrap: 'wrap',
        alignItems: 'center'}}>
            <View style = {{flex:1,backgroundColor: 'powderblue',flexDirection: "row"}}>
              <View style={styles.box}></View>
              <View style={styles.box}></View>
              <View style={styles.box}></View>
              <View style={styles.box}></View>
              <View style={styles.box}></View>
              <View style={styles.box}></View>

            </View>
            <View style = {{flex:2,backgroundColor: 'skyblue'}}></View>
            <View style = {{flex:3,backgroundColor: 'steelblue'}}></View>
        </View>
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
    color: 'white',
    left: 10,
    right: 20,

    
  },


  imageSize:{
    height: 100,
    width: 100,
    alignSelf: 'center',
    marginTop: 20,

  }
});
