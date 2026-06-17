import { Button, StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { useSelector, useDispatch } from 'react-redux'
import { decreaseTotalLikes, increaseTotalLikes, increasreTotalLikesByAmount } from '../store/actions/dataActions'
import { RootState } from '../store/store'


const HomeScreen = () => {

   // const totalLikes = useSelector(state => state.totalLike)
   //const totalLikes = useSelector(state => state.dataReducer.totalLike)
      const totalLikes = useSelector((state : RootState) => state.dataReducer.totalLike)


  const dispatch = useDispatch()

  return (
    <View style={styles.container}>
      <Text style={styles.text}>HomeScreen</Text>
      <Text style={styles.text}>Total Likes : {totalLikes}</Text>
      <Button onPress={() => dispatch(increaseTotalLikes())} title="Increase Likes" />
      <Button onPress={() => dispatch(decreaseTotalLikes())} title="Decrease Likes" />
      <Button onPress={() => dispatch(increasreTotalLikesByAmount(5))} title="Increase Likes by 5" />

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