//
//  SettingsController.swift
//  Magic Drumpad
//
//  Created by Damiaan on 4/08/18.
//  Copyright © 2018 Damiaan Dufaux. All rights reserved.
//

import Cocoa

let soundDrummers = [
    SoundPlayer(withSound: NSDataAsset(name: .init("drum1"))!.data),
    SoundPlayer(withSound: NSDataAsset(name: .init("drum3"))!.data),
    SoundPlayer(withSound: NSDataAsset(name: .init("drum2"))!.data),
	SoundPlayer(withSound: NSDataAsset(name: .init("drum2"))!.data)
]
let midiSender = try! MidiSender(name: "Magic Drumpad")
let midiDrummers = [
    MidiPlayer(note: 36, sender: midiSender),
    MidiPlayer(note: 40, sender: midiSender),
    MidiPlayer(note: 42, sender: midiSender),
	MidiPlayer(note: 46, sender: midiSender)
]
var drummers: [Player] = midiDrummers

class SettingsController: NSViewController {
	@IBOutlet weak var midiSwitch: NSButton!
	
	override func viewWillAppear() {
		super.viewWillAppear()
		if drummers.first is MidiPlayer {
			midiSwitch.state = .on
		} else {
			midiSwitch.state = .off
		}
	}
	
	@IBAction func changeOutput(_ sender: NSButton) {
		if sender.state == .on {
			drummers = midiDrummers
		} else {
			drummers = soundDrummers
		}
	}
	
}
