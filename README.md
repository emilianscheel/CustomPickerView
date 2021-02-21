# CustomPickerView
You can easily create a custom UIPickerView. Just download the source code from files.


## How to use

1. Create your Sections with `CustomPickerSection`.
```Swift
var sections: [CustomPickerSection] = []
sections.append(CustomPickerSection(range: 20, suffix: " km"))
sections.append(CustomPickerSection(range: 100, suffix: " m"))
```

2. Over the `viewDidLoad()` method create a global customPicker.
```Swift
let customPicker = CustomPickerDelegate()
```


3. Set the sections for the `customPicker`.
```Swift
customPicker.sections = sections
customPicker.resultView = bodyHeightTextField
```


4. Create a `UIPickerView` and set its dataSource and delegate to your `customPicker`.

```Swift
let picker = UIPickerView()
picker.dataSource = customPicker
picker.delegate = customPicker
```

5. Last set the just created `picker` as inputView to your `textField`
```Swift
textField.inputView = picker
```
