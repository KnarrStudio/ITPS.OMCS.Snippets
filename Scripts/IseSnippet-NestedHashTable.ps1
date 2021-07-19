#requires -Version 2.0 -Modules ISE

$SnipData = @{
  Title       = 'ks: Hash Tables Nested'
  Author      = 'Erik'
  Description = 'Nested hash table example'
}

$SnipText = @'
$MyVar = @{
  tst1 = @{
    tst1a = 'c:\temp\'
    tst1b = 'Pumkin'
  }
  tet2 = 'testing'
}

'@

New-IseSnippet  @SnipData -Text $SnipText


