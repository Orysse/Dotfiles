#!/bin/bash
pactl load-module module-null-sink sink_name=Virtual1
pactl load-module module-loopback source=alsa_input.usb-Razer_Razer_BlackShark_V2_Pro-00.mono-fallback sink=Virtual1
pactl load-module module-loopback source=Virtual1.monitor sink=alsa_output.usb-Razer_Razer_BlackShark_V2_Pro-00.analog-stereo
