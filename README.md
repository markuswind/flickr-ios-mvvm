# flickr-mvvm

Simple example of a Flickr app for iOS, using the MVVM architecture.

### Screenshots

<img src="https://github.com/markuswind/flickr-ios-mvvm/blob/master/images/screenshot1.png?raw=true" width=300px/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://github.com/markuswind/flickr-ios-mvvm/blob/master/images/screenshot2.png?raw=true" width=300px/>

### Running


Step 1:
```
git clone https://github.com/markuswind/flickr-ios-mvvm
```

Step 2: 
```
carthage update
```

Step 3:

Get API keys/secret from https://www.flickr.com/services/apps/create/apply and create a configuration.plist file.

```
see: SupportingFiles/Configuration.plist.example
```

### Features

* Searching photos with specific term
* History of recent searches
* Lazy loading while user is scrolling
* Simple interaction for showing fullscreen images

### Data flow

Simple data flow used for retrieving data from the API:

<img src="https://github.com/markuswind/flickr-ios-mvvm/blob/master/images/dataflow.png?raw=true" width=500px/>


### Plugins used


* [Alamofire](https://github.com/alamofire/alamofire)
* [AlamofireImage](https://github.com/alamofire/alamofireimage)
* [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
* \+ [StyleGuide](https://github.com/raywenderlich/swift-style-guide)

## License

MIT.
