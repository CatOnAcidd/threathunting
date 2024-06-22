While($true)
{
    Get-WmiObject -Class Win32_Process -Filter "Name='w3wp.exe'" |` 
    Select-Object Name,ProcessID,ParentProcessID,Handle,CommandLine,@{e={$_.GetOwner().User}} |`
    Format-Table Name,ProcessId,ParentProcessId -Auto
}
