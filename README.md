# TDDropdownList
Customizable dropdown list for iOS. Written in swift3.

![](http://i.giphy.com/26gsqIELUNnWtS47u.gif)

##Installation
###CocoaPods
```swift
pod 'TDDropdownList'
```
###Manually
Drag `TDDropdownList.swift` file into your project structure

##Usage
```swift
import UIKit
import TDDropdownList

class ViewController: UIViewController , TDDropdownListDelegate {
    
let list = TDDropdownList(frame: CGRect(x:60 , y : 100 , width: 200 , height: 50))
override func viewDidLoad() {
    list.initialize(data: ["Github","Theduman","Dropdown","List"])
    list.delegate = self
    self.view.addSubview(list)
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
}
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
func listTapped(sender: UIButton) {
    let alert = UIAlertController(title: "TDDropdownList" ,message: "Selected item: \(sender.currentTitle!)", preferredStyle:.alert)
    alert.addAction(UIAlertAction(title:"OK", style: .default, handler:nil))
    self.present(alert, animated: true, completion: nil)
}
}
```    
    
You need to conform TDDropdownListDelegate to get the selected item of dropdown list.

Pass the string array to `initialize()` function that you want to show.

##Customization
```swift
initialize(data: [String],selectedItemColor: UIColor = UIColor(red:0.74, green:0.03, blue:0.11, alpha:1.00),itemColor:UIColor = UIColor(red:0.03, green:0.30, blue:0.53, alpha:1.00),textColor: UIColor = .white,selectedItemPlaceholder:String = "\u{02304}" , animationTimer: Double = 0.5)
```
In the `initialize()` function you can customize the UI of the library.

You can; 

 * Change the background color of selected item using `selectedItemColor: UIColor` parameter 
 * Change the background color of extended ites using `itemColor:UIColor` parameter
 * Change the text color using `textColor: UIColor`
 * Change the placeholder of the selected item for the first time running using `selectedItemPlaceholder:String`.You can also provide Unicode characters.
 * Chance the animation time of expanding using `animationTimer: Double` parameter
