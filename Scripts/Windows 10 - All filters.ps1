<# #Create the PSCredential object
$adminUPN = Read-Host -Prompt "Enter UPN"
$adminPwd = Read-Host -AsSecureString -Prompt "Enter password for $adminUPN"
$creds = New-Object System.Management.Automation.PSCredential ($adminUPN, $adminPwd)

#Log in with these credentials
Connect-MSGraph -PSCredential $creds #>

# $Domainscope = @(
# [pscustomobject]@{BU='ASFR';Domain='adeo.com'}
# [pscustomobject]@{BU='ASFR'; Domain='ext.adeo.com'}
# [pscustomobject]@{BU='LMIT'; Domain='leroymerlin.it'}
# [pscustomobject]@{BU='LMPL'; Domain='leroymerlin.pl.adeo.com'}
# [pscustomobject]@{BU='LMIT'; Domain='ext.leroymerlin.it'}
# [pscustomobject]@{BU='LMPT'; Domain='leroymerlin.pt'}
# [pscustomobject]@{BU='BCIT'; Domain='bricocenter.it'}
# [pscustomobject]@{BU='LMPT'; Domain='ext.leroymerlin.pt'}
# [pscustomobject]@{BU='LMFR'; Domain='ext.leroymerlin.fr'}
# [pscustomobject]@{BU='LMFR'; Domain='leroymerlin.fr'}
# [pscustomobject]@{BU='BMFR'; Domain='ext.bricoman.fr'}
# [pscustomobject]@{BU='BMFR'; Domain='bricoman.fr'}
# [pscustomobject]@{BU='ZDFR'; Domain='zodio.fr'}
# [pscustomobject]@{BU='ZDFR'; Domain='ext.zodio.fr'}
# [pscustomobject]@{BU='LMCI'; Domain='leroymerlin.ci'}
# [pscustomobject]@{BU='FRAT'; Domain='techshoplm.fr'}
# [pscustomobject]@{BU='LMZA'; Domain='leroymerlin.co.za'}
# )

# $Updatescope = @(
# [pscustomobject]@{BU='ASFR';License='CEP';SyncGroup=$true;licensecheck=$true;licensefix=$true}
# [pscustomobject]@{BU='ASFR'; License='TM';SyncGroup=$true;licensecheck=$false;licensefix=$false}
# [pscustomobject]@{BU='LMIT'; License='CEP';SyncGroup=$true;licensecheck=$false;licensefix=$false}
# [pscustomobject]@{BU='LMIT'; License='TM';SyncGroup=$true;licensecheck=$false;licensefix=$false}
# [pscustomobject]@{BU='LMPT'; License='CEP';SyncGroup=$true;licensecheck=$false;licensefix=$false}
# [pscustomobject]@{BU='LMPT'; License='TM';SyncGroup=$true;licensecheck=$false;licensefix=$false}
# )



$Resource = "deviceManagement/assignmentFilters"
$graphApiVersion = "Beta"
$uri = "https://graph.microsoft.com/$graphApiVersion/$($resource)"

#region Windows 10 & Later
Write-Host "Creating Filters for Windows 10 & Later"

#Create filters
$displayName = "Windows 10 - Corporate Windows devices"
$description = "Windows 10 - Corporate Windows devices"
$platform = "Windows10AndLater"
$rule = '(device.deviceOwnership -eq \"Corporate\")'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Non-Corporate Windows devices"
$description = "Windows 10 - Non-Corporate Windows devices"
$platform = "Windows10AndLater"
$rule = '(device.deviceOwnership -ne \"Corporate\")'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Personal Windows devices"
$description = "Windows 10 - Personal Windows devices"
$platform = "Windows10AndLater"
$rule = '(device.deviceOwnership -eq \"Personal\")'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Non Personal Windows devices"
$description = "Windows 10 - Non Personal Windows devices"
$platform = "Windows10AndLater"
$rule = '(device.deviceOwnership -ne \"Personal\")'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Corporate Windows 10 version 1909"
$description = "Windows 10 - CCorporate Windows 10 version 1909"
$platform = "Windows10AndLater"
$rule = '((device.deviceOwnership -eq \"Corporate\") and (device.osVersion -startsWith \"10.0.18363\"))'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Corporate Windows 10 version 2004"
$description = "Windows 10 - Corporate Windows 10 version 2004"
$platform = "Windows10AndLater"
$rule = '((device.deviceOwnership -eq \"Corporate\") and (device.osVersion -startsWith \"10.0.19041\"))'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Corporate Windows 10 version 20h2"
$description = "Windows 10 - Corporate Windows 10 version 20h2"
$platform = "Windows10AndLater"
$rule = '((device.deviceOwnership -eq \"Corporate\") and (device.osVersion -startsWith \"10.0.19042\"))'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Corporate Windows 10 version 21h1"
$description = "Windows 10 - Corporate Windows 10 version 21h1"
$platform = "Windows10AndLater"
$rule = '((device.deviceOwnership -eq \"Corporate\") and (device.osVersion -startsWith \"10.0.19043\"))'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Corporate Windows 10 version 21h2"
$description = "Windows 10 - Corporate Windows 10 version 21h2"
$platform = "Windows10AndLater"
$rule = '((device.deviceOwnership -eq \"Corporate\") and (device.osVersion -startsWith \"10.0.19044\"))'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Corporate Windows 11 version 21h2"
$description = "Windows 10 - Corporate Windows 11 version 21h2"
$platform = "Windows10AndLater"
$rule = '((device.deviceOwnership -eq \"Corporate\") and (device.osVersion -startsWith \"10.0.22000\"))'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Personal Windows 10 version 1909"
$description = "Windows 10 - Personal Windows 10 version 1909"
$platform = "Windows10AndLater"
$rule = '((device.deviceOwnership -eq \"Personal\") and (device.osVersion -startsWith \"10.0.18363\"))'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Personal Windows 10 version 2004"
$description = "Windows 10 - Personal Windows 10 version 2004"
$platform = "Windows10AndLater"
$rule = '((device.deviceOwnership -eq \"Personal\") and (device.osVersion -startsWith \"10.0.19041\"))'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Personal Windows 10 version 20h2"
$description = "Windows 10 - Personal Windows 10 version 20h2"
$platform = "Windows10AndLater"
$rule = '((device.deviceOwnership -eq \"Personal\") and (device.osVersion -startsWith \"10.0.19042\"))'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Personal Windows 10 version 21h1"
$description = "Windows 10 - Personal Windows 10 version 21h1"
$platform = "Windows10AndLater"
$rule = '((device.deviceOwnership -eq \"Personal\") and (device.osVersion -startsWith \"10.0.19043\"))'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Personal Windows 10 version 21h2"
$description = "Windows 10 - Personal Windows 10 version 21h2"
$platform = "Windows10AndLater"
$rule = '((device.deviceOwnership -eq \"Personal\") and (device.osVersion -startsWith \"10.0.19044\"))'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Personal Windows 11 version 21h2"
$description = "Windows 10 - Personal Windows 11 version 21h2"
$platform = "Windows10AndLater"
$rule = '((device.deviceOwnership -eq \"Personal\") and (device.osVersion -startsWith \"10.0.22000\"))'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Windows 10 Enterprise"
$description = "Windows 10 - Windows 10 Enterprise"
$platform = "Windows10AndLater"
$rule = '(device.operatingSystemSKU -in [\"Enterprise\", \"EnterpriseS\", \"EnterpriseN\", \"EnterpriseEval\"])'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Windows 10 Professional"
$description = "Windows 10 - Windows 10 Professional"
$platform = "Windows10AndLater"
$rule = '(device.operatingSystemSKU -in [\"Professional\", \"ProfessionalWorkstation\", \"ProfessionalN\", \"BusinessN\"])'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Windows 10 Enterprise Multi-session"
$description = "Windows 10 - Windows 10 Enterprise Multi-session"
$platform = "Windows10AndLater"
$rule = '(device.operatingSystemSKU -eq \"ServerRdsh\")'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Windows 10 - Windows 10 Holographic"
$description = "Windows 10 - Windows 10 Holographic"
$platform = "Windows10AndLater"
$rule = '(device.operatingSystemSKU -eq \"Holographic\")'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

$displayName = "Hardware - Microsoft - All Microsoft Devices"
$description = "Windows 10 - Windows 10 Holographic"
$platform = "Windows10AndLater"
$rule = '(device.operatingSystemSKU -eq \"Holographic\")'
  
$JSON = @"
{
"displayName":"$($displayName)","description":"$($description)","platform":"$($platform)","rule":"$($rule)","roleScopeTags":["0"]
}
"@

Invoke-MSGraphRequest -HttpMethod POST -Url $uri -Content $JSON

#endregion Windows 10 & Later