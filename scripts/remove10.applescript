-- TODO: add case 0 => no number displayed

set einer to "left-einer"
set zehner to "left-zehner"

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

decreaseZehner()
