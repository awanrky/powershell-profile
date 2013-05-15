#--------------------------------------------------------
# parts stolen from: https://github.com/drmohundro/PowerShellEnv
# Thanks dude!
#--------------------------------------------------------

$NTIdentity = ([Security.Principal.WindowsIdentity]::GetCurrent())
$NTPrincipal = (new-object Security.Principal.WindowsPrincipal $NTIdentity)
$IsAdmin = ($NTPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))	

$global:shortenPathLength = 3

function prompt {
    $chost = [ConsoleColor]::Green
    $cdelim = [ConsoleColor]::DarkCyan
    $cloc = [ConsoleColor]::Cyan
    $cadmin = [ConsoleColor]::Yellow

    Write-Host ' '


    Write-Host ([Environment]::MachineName) -nonewline -foregroundcolor $chost
    Write-Host ' {' -nonewline -foregroundcolor $cdelim
    Write-Host (Shorten-Path (pwd).Path) -nonewline -foregroundcolor $cloc
    Write-Host '} ' -nonewline -foregroundcolor $cdelim
    if ($isAdmin) { Write-Host '(Admin) ' -nonewline -foreground $cadmin }


    $promptCalls | foreach { $_.Invoke() }


    #Write-Host "»" -nonewline -foregroundcolor $cloc
    #' '


    $host.UI.RawUI.ForegroundColor = [ConsoleColor]::White
} 


function Shorten-Path([string] $path = $pwd) {
   $loc = $path.Replace($HOME, '~')
   # remove prefix for UNC paths
   $loc = $loc -replace '^[^:]+::', ''
   # make path shorter like tabs in Vim,
   # handle paths starting with \\ and . correctly
   return ($loc -replace "\\(\.?)([^\\]{$shortenPathLength})[^\\]*(?=\\)",'\$1$2')
} 
