<# Author Nikhil Thakur
  - Write-Host "" are used For UI reasons#>  


# Method Calculate-File-Hash uses SHA512 algorithm to get the hash from the target files

Function Calculate-File-Hash($filepath) {
   $filehash = Get-FileHash -Path $filepath -Algorithm SHA512
   return $filehash
}

Function Erase-Baseline-if-exists(){
    $baselineExists = Test-Path -Path .\baseline.txt
   
    if ($baselineExists){
    Remove-Item -Path .\baseline.txt
    }
}

Write-Host ""           
Write-Host "What would you like to do?"
Write-Host "" 
Write-Host "    A) Collect new Baseline?"
Write-Host "    B) Begin monitoring files with saved Baseline?"
Write-Host ""
$response= Read-Host -Prompt "Please enter A or B"
Write-Host ""



<# To test the hashing algorithm #>
<#Calculate-File-Hash "C:\Users\niket\Documents\- IT\Projects\FIle Integrity Monitor\Files\Test1.txt"#>
                                                                                             
                                                                                        

if ($response -eq "A".ToUpper()){
  #Delete Baseline.txt if it already exists
  Erase-Baseline-if-exists

  #Calculate Hash from the target files amd store in baseline.txt
  
  #Collect all files in the target folder
  $files = Get-ChildItem -Path .\Files
  
  #For file, Calculate the hash and write to baseline.txt
  foreach ($f in $files){
  $hash = Calculate-File-Hash $f.FullName
   "$($hash.Path)|$($hash.Hash)" | Out-File -FilePath .\baseline.txt -Append
      }
   write-Host "Hashes have been calculated and added to baseline.txt." -ForegroundColor Yellow
   .\FIM.ps1 -Append
}

elseif ($response -eq "B".ToUpper()){
     # Load file|hash from baseline.txt and store them in a dictionary
    

#Begin monitoring files with saved Baseline
write-Host "Read existing baseline.txt, begin monitoring files." -ForegroundColor Yellow
}
