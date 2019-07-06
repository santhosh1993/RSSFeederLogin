# RSSFeederLogin

Items Yet to be completed:
- API integrations 
- Updating of podspec accordingly

For Installing using Pods use

```
pod 'RSSFeederLogin' , :git => 'https://github.com/santhosh1993/RSSFeederLogin.git' ,:tag => "0.0.4"
```


Use the below code to authenticate the user Using the default login
```
RSSFeeder.authenticateTheUser(callBack: ) // callBack should be the reference for the class 
which implements RSSFeederLoginCallBack protocol
```
