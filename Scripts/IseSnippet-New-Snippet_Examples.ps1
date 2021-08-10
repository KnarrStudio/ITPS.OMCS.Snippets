#requires -Version 3.0 -Modules ISE 

# File with the content '.\Snippet-ExampleFile.txt'


$SnipData = @{
  Title       = 'ks: New-Snippet_Examples'
  Author      = 'Erik'
  Description = 'Examples of how to create a snippet'
}

$SnipText = Get-Content -Path .\Snippet-ExampleFile.txt -Raw

New-IseSnippet  @SnipData -Text $SnipText -Force

