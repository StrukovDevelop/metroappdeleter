Start-Transcript
$appName
$allUserString
$deletedApps
Write-Output "Will packeges delete for all users or only for this user? [Y] - for all user, [N] - for this user."
$allUserBool = Read-Host
switch($allUserBool)
{
    "Y"{$allUserString = "allusers"}
    "N"{$allUserString = ""}
}
Get-AppxPackage
while(1 -gt 0)
{
    Write-Output "Countinue? Y/N"
    $countinueString = Read-Host
    switch($countinueString)
    {
        "Y"
        {
            try
            {
                Write-Output "Enter package's name: "
                $appName = Read-Host
                Get-AppxPackage *$allUsersBool* *$appName* | Remove-AppxPackage
                Write-Output "Package " $appName " was deleted succesfully!"
                $deletedApps += 1
            }
            catch
            {
                Write-Output "There is no package named $appname."
            }
        }
        "N"
        {
            "You have deleted $deletedApps packeges!"
        }
    }
}