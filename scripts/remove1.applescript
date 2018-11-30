-- TODO: add case 0 => no number displayed

set einer to "left-einer"
set zehner to "left-zehner"

on decreaseEiner()
	tell application id "com.figure53.QLab.4" to tell front workspace
		set groupCue to cues of cue (my einer)
		
		set runningIndex to 0
		repeat with n from 1 to count groupCue
			if running of groupCue's item n is true then set runningIndex to n
		end repeat
		
		if runningIndex is 1 then
			-- kalkuliere zehner position
			set runningIndexZehner to 0
			set groupCueZehner to cues of cue (my zehner)
			repeat with n from 1 to count groupCueZehner
				if running of groupCueZehner's item n is true then set runningIndexZehner to n
			end repeat
			-- resette nur, wenn zehner nicht bei 0
			if runningIndexZehner is not 1 then
				my decreaseZehner()
				start groupCue's item 10
				stop groupCue's item 1
			end if
		else if runningIndex is not 0 then
			start groupCue's item (runningIndex - 1)
			stop groupCue's item runningIndex
		end if
	end tell
end decreaseEiner

decreaseEiner()

on decreaseZehner()
	tell application id "com.figure53.QLab.4" to tell front workspace
		set groupCue to cues of cue (my zehner)
		
		set runningIndex to 0
		repeat with n from 1 to count groupCue
			if running of groupCue's item n is true then set runningIndex to n
		end repeat
		
		if runningIndex is 1 then
			-- zehner bereits 0
			-- setze einer auf 0
			set groupCueEinser to cues of cue (my einer)
			start groupCueEinser's item 1
			repeat with n from 2 to count groupCueEinser
				if running of groupCueEinser's item n is true then stop groupCueEinser's item n
			end repeat
		else if runningIndex is not 0 then
			-- aktuellen stoppen und vorherigen zehner starten
			start groupCue's item (runningIndex - 1)
			stop groupCue's item runningIndex
		end if
	end tell
end decreaseZehner
