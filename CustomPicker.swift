
/**
 *
 *  CustomPicker.swift
 *  RunIt
 *
 *  Created by Emilian Scheel on 09.02.21
 *
 */








import Foundation
import UIKit

class CustomPickerDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
	
	var sections: [CustomPickerSection] = []
	var resultView: UITextField?
	
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return sections.count
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return sections[component].range
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return sections[component].präfix + String(row) + sections[component].suffix
	}
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		sections[component].value = row
		
		resultView?.text = sections[component].präfix + String(row) + sections[component].suffix
	}
}



struct CustomPickerSection {
	var range: Int
	var suffix: String
	var präfix: String
	var value: Int?
	
	init(range: Int, suffix: String = "", präfix: String = "") {
		self.range = range
		self.suffix = suffix
		self.präfix = präfix
	}
	
}
