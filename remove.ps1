$searchterm = read-host "Enter search term for uninstallers"
$uninstallers = get-childitem HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall
$founditems = $uninstallers | ? {(Get-ItemProperty -path ("HKLM:\"+$_.name) -name Displayname -erroraction silentlycontinue) -match $searchterm}
write-host "Searched registry for uninstall information on $searchterm"
write-host "------------------------------------------"
if ($founditems -eq $null) {"None found"} else {
write-host "Found "($founditems | measure-object).count" item(s):`n"
$founditems | % {
Write-host "Displayname: "$_.getvalue("Displayname")
Write-host "Displayversion: "$_.getvalue("Displayversion")
Write-host "InstallDate: "$_.getvalue("InstallDate")
Write-host "InstallSource: "$_.getvalue("InstallSource")
Write-host "UninstallString: "$_.getvalue("UninstallString")
Write-host "`n"
}
}