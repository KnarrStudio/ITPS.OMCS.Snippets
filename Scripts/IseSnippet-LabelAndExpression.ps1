$SnipData = @{
Title = 'ks: Label and Expression' 
Author = 'Erik' 
Description = 'Formatting output for more human kindness' 
}
$SnipText = @'
@{ label = ""; expression = {} }

Example: Get-ChildItem -File |
Format-Wide -Property @{e={'{0} ({1:N2}kb)' -f $_.name,($_.length/1kb)}}
'@
New-IseSnippet  @SnipData -Text $SnipText
  