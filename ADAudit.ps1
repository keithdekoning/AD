<# 
This script is built to quickly and easly audit Active Directory and scan the Networks the computer running it has access to. 
#>

#DefineVariables
$path = "C:\Audit\AD\ADAudit-$env:userdomain-$(((get-date).ToUniversalTime()).ToString("yyyy-MM-dd-hh-mm-ss")).xlsx"

#Commands
Get-ADDomain | Export-Excel -WorkSheetname "Get-ADDomain" $Path
Get-ADForest | Export-Excel -WorkSheetname "Get-ADForest" $Path
Get-ADComputer -Filter * -Properties * | Export-Excel -WorkSheetname "Get-ADComputer" $Path
Get-ADROOTDSE | Export-Excel -WorkSheetname "Get-ADROOTDSE" $Path
Get-ADDefaultDomainPasswordPolicy | Export-Excel -WorkSheetname "Get-ADDefaultDomainPasswordPolicy" $Path
Get-ADUser -Filter * -Properties * | Export-Excel -WorkSheetname "Get-ADUser" $Path
Get-ADUser -Filter ‘useraccountcontrol -band 65536’ -Properties useraccountcontrol | Export-Excel -WorkSheetname "NoPasswordExpiration" $Path
Get-ADUser -Filter ‘useraccountcontrol -band 32’ -Properties useraccountcontrol | Export-Excel -WorkSheetname "NoPasswordRequired" $Path
Get-ADUser -Filter ‘useraccountcontrol -band 128’ -Properties useraccountcontrol | Export-Excel -WorkSheetname "PassworedStoredWithReversableEncryption" $Path
Get-ADUser -Filter ‘useraccountcontrol -band 524288’ -Properties useraccountcontrol | Export-Excel -WorkSheetname "KerberosDelegation" $Path
Get-ADUser -Filter ‘useraccountcontrol -band 4194304’ -Properties useraccountcontrol | Export-Excel -WorkSheetname "NoPreAuthentication" $Path
Get-ADUser -Filter ‘useraccountcontrol 
