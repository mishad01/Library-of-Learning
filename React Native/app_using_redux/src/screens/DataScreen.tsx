import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { useSelector } from 'react-redux'
import { RootState } from '../store/store'

const DataScreen = () => {

  const totalLikes = useSelector((state: RootState) => state.dataReducer.totalLike)
  return (
    <View style={styles.container}>
      <Text style={styles.text}>DataScreen</Text>
      <Text style={styles.text}>Total Likes : {totalLikes}</Text>
    </View>
  )
}

export default DataScreen

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