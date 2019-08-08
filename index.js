import React from 'react';
import {AppRegistry, StyleSheet, Text, View,NativeModules,NativeEventEmitter} from 'react-native';
var nativeToRNEventModule = NativeModules.NativeToRNEventEmitter;
class App extends React.Component {
  constructor(){
    super();
    this.state={
      RNtoIOS:'',
      IOStoRN:''
    }
  }
  componentDidMount(){
    var self=this;
    // Response 调用方式
    // 创建原生模块
    var NativeTest = require('react-native').NativeModules.NativeTest;
    // 方法调用
    NativeTest.doSomething(('RN->原生的数据'),(error,events) => {
        if (error) {
            console.warn(error);
        } else {
            alert(events)//返回的数据
            self.setState({
              RNtoIOS: events
          });
        }
    });
    return
    var eventEmitter = new NativeEventEmitter(nativeToRNEventModule);
    self.listener = eventEmitter.addListener("CustomEventName", (result) => {
        alert("监听到通知事件" + result);
        self.setState({
            IOStoRN: result.name
        });
    })
  }

  componentWillUnmount() {
      this.listener && this.listener.remove();
  }

  render() {
    var contents = this.props['scores'].map((score) => (
      <Text key={score.name}>
        {score.name}:{score.value}
        {'\n'}
      </Text>
    ));
    return (
      <View style={styles.container}>
        <Text style={styles.highScoresTitle}>2048 High Scores!</Text>
        <Text style={styles.scores}>{contents}</Text>
        <Text style={styles.highScoresTitle}>{this.state.IOStoRN}</Text>
        <Text style={styles.highScoresTitle}>{this.state.RNtoIOS}</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
  },
  highScoresTitle: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  scores: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('iOSHybridRNDemo', () => App)