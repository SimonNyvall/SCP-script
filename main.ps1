# Variables
$send_folder_path = "path ot the folder on host A"
$files = Get-ChildItem $send_folder_path
$username = "user"
$ip_address = "ip"
$destination = "Path to the folder on host B"
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
