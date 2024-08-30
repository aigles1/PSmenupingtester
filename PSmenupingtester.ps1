function Show-Menu {
    param (
        [string]$Title = 'Ping Tester'
    )
    Write-Host "=========== $Title ==========="
    
    Write-Host "Press '1' to Ping 8.8.8.8 Google DNS"
    Write-Host "Press '2' to Ping 1.1.1.1 Cloudflare DNS"
    Write-Host "Press '3' to Ping 172.64.34.227 Cloudflare DNS"
    Write-Host "Press '4' to Ping 205.251.196.120 Amazon DNS"
    Write-Host "Press '5' to Ping 208.67.222.222 Cisco OpenDNS"
    Write-Host "Press '6' to Ping 9.9.9.9 Quad9"
    Write-Host "Press '7' to Enter a host (Example: www.cloudflare.com or 8.8.4.4)"
    Write-Host "Press 'q' to quit"
}

do {
    Show-Menu
    $num = Read-Host "Enter a number"

    # Check if the user entered 'q' to quit
    if ($num -eq 'q') {
        Write-Host "Exiting the program..."
        break
    }

    # Ask the user for the number of pings (Count)
    $count = Read-Host "Enter the number of pings (Count)"

    # Ensure the user input is a valid number for the count
    if (-not [int]::TryParse($count, [ref]$null)) {
        Write-Host "Invalid count. Please enter a valid number."
        continue
    }

    # Execute the appropriate ping based on user input
    Switch ($num) {
        '1' {Invoke-Expression "Test-Connection -TargetName 8.8.8.8 -Count $count" | Format-Table}
        '2' {Invoke-Expression "Test-Connection -TargetName 1.1.1.1 -Count $count" | Format-Table}
        '3' {Invoke-Expression "Test-Connection -TargetName 172.64.34.227 -Count $count" | Format-Table}
	'4' {Invoke-Expression "Test-Connection -TargetName 205.251.196.120 -Count $count" | Format-Table}
	'5' {Invoke-Expression "Test-Connection -TargetName 208.67.222.222 -Count $count" | Format-Table}
	'6' {Invoke-Expression "Test-Connection -TargetName 9.9.9.9 -Count $count" | Format-Table}
	'7' {$Server = Read-Host -Prompt 'Input host'; Invoke-Expression "Test-Connection -TargetName $Server -Count $count" | Format-Table}
        default { Write-Host "Invalid option, please try again." }
    }

    # Prompt to press Enter to continue, only if not quitting
    #pause

} until ($false)  # Loop indefinitely, break command will exit the loop
