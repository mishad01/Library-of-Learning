import { Button, StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { useDispatch, useSelector } from "react-redux"
import { RootState } from '../store/store'
import { changeRole } from '../store/actions/settingsAction'

const Settings = () => {
  const dispatch = useDispatch()
  const totalLikes = useSelector((state: RootState) => state.dataReducer.totalLike)
  const userName = useSelector((state: RootState) => state.settings.userRole)
  return (
    <View style={styles.container}>
      <Text style={styles.text}>Settings</Text>
      <Text style={styles.text}>Total Likes : {totalLikes}</Text>
      <Text style={styles.text}>User Name : {userName}</Text>
      <Button onPress={() => dispatch(changeRole("User"))} title="Change Role"/>
    </View>
  )
}

export default Settings

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