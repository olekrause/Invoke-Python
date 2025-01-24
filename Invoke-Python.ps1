function Invoke-Python {
	param (
		[string]$ScriptBlock,
		[string]$Path,
		[bool]$Interaction
	)
	# State is a bitwise calc to determine how Python should be started and how to handle user interaction.
	# Prettier that using fifteen ifs elses
	$state = 0
	if ($ScriptBlock) { $state += 1 }
	if ($Path) { $state += 2 }
	if ($Interaction) { $state += 4 }

	switch ($state) {
		1 {
			# ScriptBlock only
			$out = Python -c $ScriptBlock
			return $out
		}
		2 {
			# Path only
			$out = python $Path
			return $out
		}
		5 {
			# ScriptBlock with Interaction
			Python -c $ScriptBlock
            
		}
		6 {
			# Path with Interaction
			python $Path
		}
		default {
			throw "Invalid combination of parameters."
		}
	}
}
