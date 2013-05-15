$ProfileDir = (split-path $MyInvocation.MyCommand.Path -Parent)

Push-Location $ProfileDir
	. ./aliases.ps1
	. ./local-network-script.ps1
Pop-Location
