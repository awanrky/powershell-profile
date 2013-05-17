$ProfileDir = (split-path $MyInvocation.MyCommand.Path -Parent)

Push-Location $ProfileDir
	. ./lib/load-library.ps1
	. ./prompt.ps1
	. ./eye-candy.ps1
	. ./aliases.ps1
	. ./local-network-script.ps1
Pop-Location

Add-ToPath "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE"