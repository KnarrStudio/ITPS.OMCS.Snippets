#requires -Version 3.0 -Modules ISE
#Filename - IseSnippet-NestedHashTable.ps1


$SnipData = @{
  Title       = 'ks: New-Snippet from File'
  Author      = 'Erik'
  Description = 'How to create a snippet from a file'
}

$SnipText = Get-Content -Path .\Snippet-ExampleFile.ps1 -Raw

New-IseSnippet  @SnipData -Text $SnipText -Force

# OR

New-IseSnippet -Title 'Snippet Name' -Author 'Erik' 
-Description 'How to create a snippet from a file' 
-Text (Get-Content .\SomeCodeSnippet.ps1 -Raw)

# OR

New-IseSnippet -Title 'Snippet Name' -Author 'Erik' 
-Description 'How to create a snippet from a file' 
-Text @'

Get-Process powershell_ise
Start-Process winword
'@




