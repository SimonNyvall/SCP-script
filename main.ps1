# Variables
$send_folder_path = "/home/simon/Desktop/Server-file-transfer"
$files = Get-ChildItem $send_folder_path
$username = "ubuntu"
$ip_address = "192.168.1.229"
$destination = "/home/ubuntu/NAS/ssh-file-transfer-folder/"
function main {

    # Command To transfer files
    for ($i = 0; $i -lt $files.Count; $i++) {
        $SCP_command = ("scp " + [string]$files[$i] + " " + $username + "@" + $ip_address + ":" + $destination)
        iex $SCP_command
    }
    # Deletes the transferd files
    $cd_command = ("cd " + $send_folder_path)
    iex $cd_command

    $delete_command = "rm *"
    iex $delete_command
}

main;

Write-Host("Done")