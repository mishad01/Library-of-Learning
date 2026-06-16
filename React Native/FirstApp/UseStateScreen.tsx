import { useState } from 'react';
import { Button, Modal, StyleSheet, Text, TextInput, View,ImageBackground } from 'react-native';
import { SafeAreaProvider, SafeAreaView } from 'react-native-safe-area-context';
import AntDesign from '@expo/vector-icons/AntDesign';


export default function UseStateScreen() {
  // const [state, setState] = useState(10);
  // const [modalVisible, setModalVisible] = useState(false);
  // const IncreaseValue = () => setState(state + 1);
  // const DecreaseValue = () => setState(state - 1);

  const [state, setState] = useState(10);
  const [modalVisible, setModalVisible] = useState(false);

  const IncreaseValue = ()=> setState(state+1);
  const DecreaseValue =()=>setState(state-1);

  const [textInput, setTextInput] = useState("");

  console.log('User Type',textInput);

  return (
    <SafeAreaView style={styles.container}>

     <ImageBackground source={require('./assets/bg.jpg')} resizeMode="cover" style={{flex: 1, justifyContent: 'center'}}>
      <Text style={styles.heading}>useState Hook</Text>


   <Button title="Increase" onPress={IncreaseValue}/>
    <Text>Count: {state}</Text>
       <Button title="Decrease" onPress={DecreaseValue}/>
       <Button title="Open Modal" onPress={() => setModalVisible(true)}/>

       <Modal visible={modalVisible}>
         <SafeAreaProvider>
           <SafeAreaView>
             <Text style={{color: 'black', alignSelf: 'center'}}>Modal Content</Text>
             <AntDesign name="shopping" size={50} color="red" />
             <Button title="Close Modal" onPress={() => setModalVisible(false)}/>
            <TextInput 
            style={styles.input} 
            keyboardType='numeric'
            multiline ={true}
            editable={true}
            onChangeText={setTextInput}
            placeholder="Enter text here"/>

            <Text>Input: {textInput}</Text>

           </SafeAreaView>
         </SafeAreaProvider>
       </Modal></ImageBackground>

    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  heading: {
    fontSize: 28,
    fontWeight: 'bold',
    marginBottom: 24,
    textAlign: 'center',
  },
  section: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    marginBottom: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.1,
    shadowRadius: 3,
    elevation: 2,
  },
  label: {
    fontSize: 18,
    marginBottom: 10,
  },
  row: {
    flexDirection: 'row',
    justifyContent: 'space-around',
  },
  input: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 8,
    padding: 10,
    marginBottom: 10,
    fontSize: 16,
  },
  message: {
    marginTop: 12,
    fontSize: 16,
    color: 'steelblue',
    textAlign: 'center',
  },
});
