
Write-Host "" <#For UI reasons#>
                
Write-Host "What would you like to do?"
Write-Host "A) Collect new Baseline?"
Write-Host "B) Begin monitoring files with saved Baseline?"
Write-Host "" <#For UI reasons#>

$response= Read-Host -Prompt "Please enter A or B"
Write-Host "" <#For UI reasons#>

Function Calculate-File-Hash($filepath) {
   $filehash = Get-FileHash -Path $filepath -Algorithm SHA512
   return $filehash
}


<# To test the hashing algorithm #>
<#Calculate-File-Hash "C:\Users\niket\Documents\- IT\Projects\FIle Integrity Monitor\test1.txt"#> 
                                                                                             
                                                                                             

if ($response -eq "A".ToUpper()){
  #Calculate Hash from the target files amd store in baseline.txt
  Write-Host "Calculate Hashes, make new baseline.txt" -ForegroundColor Yellow

}
elseif ($response -eq "B".ToUpper()){
#Begin monitoring files with saved Baseline
write-Host "Read existing baseline.txt, begin monitoring files." -ForegroundColor Yellow
}
