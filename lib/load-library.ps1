$ProfileDir = (split-path $MyInvocation.MyCommand.Path -Parent)


Push-Location $ProfileDir
	. ./add-topath.ps1
	. ./get-fileEncoding.ps1
	. ./format-hex.ps1
	. ./start-visualstudio.ps1
	. ./elevate-process.ps1
Pop-Location
