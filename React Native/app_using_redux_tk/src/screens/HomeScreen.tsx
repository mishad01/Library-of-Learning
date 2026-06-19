import { Button, StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { useDispatch, useSelector } from 'react-redux';
import { increaseTotalLike, increateTotalLikeByAmount } from '../store/reducers/dataReducers';

const HomeScreen = () => {

  const dispatch = useDispatch();
  const data = useSelector(state => state.dataReducer);
  return (
    <View style={styles.container}>
      <Text style={styles.text}>HomeScreen</Text>
      <Text style={styles.text}>Total Likes : {data.totalLike}</Text>
      <Button title="Increase Like" onPress={() => {
        dispatch(increaseTotalLike())
      }} />
      <Button title="Decrease Like" onPress={() => {
        dispatch(increateTotalLikeByAmount(10))
      }} />

    </View>
  )
}

export default HomeScreen

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#fff',
        alignItems: 'center',
        justifyContent: 'center',
    },
    text: {
        fontSize: 30,
    },
})