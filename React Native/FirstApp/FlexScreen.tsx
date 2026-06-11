import { View,StyleSheet } from "react-native";

export default function FlexScreen() {
    return (
        <View style = {{flex:1}}>
            <View style = {{flex:1,backgroundColor: 'powderblue'}}></View>
            <View style = {{flex:2,backgroundColor: 'skyblue'}}></View>
            <View style = {{flex:3,backgroundColor: 'steelblue'}}></View>
        </View>
    );
}

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
  },});