#requires -Version 3.0 -Modules ISE

$SnipData = @{
Title = 'ks: New-Snippet from File' 
Author = 'Erik' 
Description = 'How to create a snippet from a file' 
}

$SnipText = @'
(Get-Content -Path .\Snippet-ExampleFile.ps1)
'@

$mypath = Split-Path ($MyInvocation.MyCommand.Path) -Parent

New-IseSnippet  @SnipData -Text (Get-Content -Path "$mypath\Snippet-ExampleFile.ps1" -Raw) -Force

