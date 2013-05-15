set-alias subl "C:\Program Files\Sublime Text 3\sublime_text.exe"
set-alias ll ls

function Elevate-Process {
    $file, [string]$arguments = $args
    $psi = new-object System.Diagnostics.ProcessStartInfo $file
    $psi.Arguments = $arguments
    $psi.Verb = "runas"
    $psi.WorkingDirectory = Get-Location
    [System.Diagnostics.Process]::Start($psi)
}
Set-Alias sudo Elevate-Process

function Start-VisualStudio([string]$path) {
    & devenv $path
}
Set-Alias vs Start-VisualStudio


Set-Alias cdpr set-location-projects