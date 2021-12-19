
$m = (@'
# Save Credentials
$CredentialFile = '{0}\{1}.cred' -f $env:USERPROFILE, $env:USERNAME 
Get-Credential | Export-CliXml -Path $CredentialFile

# Use Credentials
$CredentialFile = '{0}\{1}.cred' -f $env:USERPROFILE, $env:USERNAME 
$creds = Import-CliXml -Path $CredentialFile
'@ )

New-IseSnippet -Text $m -Title 'ks: Credential File' -Description 'Save credentials securely.' -Author 'Knarr Studio' -Force



