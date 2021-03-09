
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
	var appSettingsKey: AppSettings.key?
	
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return sections.count
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return sections[component].range
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return sections[component].präfix + String(row) + sections[component].suffix
	}
	
	func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
		if sections[component].width != 0 {
			return sections[component].width!
		} else {
			return CGFloat(Int(pickerView.bounds.width)/sections.count)
		}
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		sections[component].value = row
		
		resultView?.text = ""
		
		for section in sections {
			resultView?.text! += section.präfix + String(section.value ?? 0) + section.suffix
		}
		
		guard appSettingsKey != nil else {
			return
		}
		
		AppSettings[appSettingsKey!] = row
	}
}



struct CustomPickerSection {
	var range: Int
	var suffix: String
	var präfix: String
	var value: Int?
	var width: CGFloat?
	
	init(range: Int, suffix: String = "", präfix: String = "", width: CGFloat = 0) {
		self.range = range
		self.suffix = suffix
		self.präfix = präfix
		self.width = width
	}
}
