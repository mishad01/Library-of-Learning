import { StyleSheet, Text, View } from 'react-native'
import React from 'react'

const DataScreen = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.text}>DataScreen</Text>
      <Text style={styles.text}>Total Likes : 7</Text>
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