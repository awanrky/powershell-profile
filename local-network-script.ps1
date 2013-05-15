# this file is for creating functions and aliases that apply depending on the network subnet the current computer on

$IpAddresses = Get-NetIPAddress | 
	where { $_.AddressFamily -eq 'IPv4' -and $_.AddressState -eq 'Preferred' -and $_.IPAddress -match '192.168.'} |
	select -property IPAddress


[string[]]$Networks = $IpAddresses | 
	ForEach { $_.IpAddress.Split('.')[2] }

if ($Networks -contains '13') # home sweet home
{
	# echo '13'
	function set-location-projects 
	{
		Set-Location d:\Projects
		ls
	}
}

if ($Networks -contains '4') # dev
{
	# echo '4!'
}

if ($Networks -contains '11') # automated test boxes
{
	# echo '11!'
}

if ($Networks -contains '11' -or $Networks -contains '4')
{
	# write-host 'forty-eleven!'

	function enter-pssession-umbriel
	{
		enter-pssession -computername umbriel -credential umbriel\mark.ott
	}
	set-alias umbriel enter-pssession-umbriel

	function set-location-projects 
	{
		Set-Location c:\Projects
		ls
	}
}