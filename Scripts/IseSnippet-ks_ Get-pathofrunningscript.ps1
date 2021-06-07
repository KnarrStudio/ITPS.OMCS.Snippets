$SnipData = @{
Title = 'ks: Get-path of running script' 
Author = 'Erik' 
Description = 'This only works while in the script' 
}

$SnipText = @'

To get the full path of the script:
$ScriptPath = $MyInvocation.MyCommand.Path

To get the folder that the script is running from:
$FolderPath = Split-Path ($MyInvocation.MyCommand.Path) -Parent

Example:
Get-Content -Path "$FolderPath\Snippet-ExampleFile.ps1" -Raw
'@

New-IseSnippet  @SnipData -Text $SnipText
