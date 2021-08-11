
# Variables
$files       = Get-ChildItem "/home/simon/Desktop/test"
$username    =               "ubuntu"
$ip_address  =               "192.168.1.229"
$destination =               "/home/ubuntu/NAS/ssh-file-transfer-folder/"
function main {

    # Command To transfer files
    for ($i = 0; $i -lt $files.Count; $i++) {
        iex $command = ("scp " + [string]$files[$i] + " " + $username + "@" + $ip_address + ":" + $destination)
    }
}

main;

Write-Host("Done")