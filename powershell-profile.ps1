$ProfileDir = (split-path $MyInvocation.MyCommand.Path -Parent)

Push-Location $ProfileDir
	. ./prompt.ps1
	. ./eye-candy.ps1
	. ./aliases.ps1
	. ./local-network-script.ps1
Pop-Location
