param($ID=$PID)

$CustomColumnID = @{
    Name = 'Id'
    Expression = { [Int[]]$_.ProcessID }
}

$result = Get-WmiObject -Class Win32_Process -Filter "ParentProcessID=$ID" |
Select-Object -Property ProcessName, $CustomColumnID, CommandLine

$result
$result | Where-Object { $_.ID -ne $null } | ForEach-Object {
    Find-ChildProcess -id $_.Id
}
