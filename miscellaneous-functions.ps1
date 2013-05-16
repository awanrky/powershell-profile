function Add-ToPath {
    $args | foreach {
        # the double foreach's are to handle calls like 'add-topath @(path1, path2) path3
        $_ | foreach { $env:Path += ";$(Resolve-Path $_)" }
    }
}
