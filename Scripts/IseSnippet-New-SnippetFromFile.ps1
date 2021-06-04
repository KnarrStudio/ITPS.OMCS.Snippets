#requires -Version 3.0 -Modules ISE

$SnipData = @{
Title = 'ks_ New-Snippet from File' 
Author = 'Erik' 
Description = 'How to create a snippet from a file' 
}

$SnipText = @'
(Get-Content -Path .\Snippet-ExampleFile.ps1)
'@

New-IseSnippet  @SnipData -Text (Get-Content -Path .\Snippet-ExampleFile.ps1 -Raw) -Force

