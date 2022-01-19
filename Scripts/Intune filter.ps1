<# #Create the PSCredential object
$adminUPN = Read-Host -Prompt "Enter UPN"
$adminPwd = Read-Host -AsSecureString -Prompt "Enter password for $adminUPN"
$creds = New-Object System.Management.Automation.PSCredential ($adminUPN, $adminPwd)

#Log in with these credentials
Connect-MSGraph -PSCredential $creds #>

$Resource = "deviceManagement/assignmentFilters"
$graphApiVersion = "Beta"
$uri = "https://graph.microsoft.com/$graphApiVersion/$($resource)"

#Create filters
$displayName = "Windows 10 - Only Corporate Windows devices"
$description = "Windows 10 - Only Corporate Windows devices"
$platform = "Windows10AndLater"
$rule = '(device.deviceOwnership -eq \"Corporate\")'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Only non Corporate Windows devices"
$description = "Windows 10 - Only non Corporate Windows devices"
$platform = "Windows10AndLater"
$rule = '(device.deviceOwnership -ne \"Corporate\")'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Only Corporate Windows 10 - 1909"
$description = "Windows 10 - Only Corporate Windows 10 - 1909"
$platform = "Windows10AndLater"
$rule = '((device.deviceOwnership -eq \"Corporate\") and (device.osVersion -startsWith \"10.0.18363\"))'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON