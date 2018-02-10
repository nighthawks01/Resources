
$d = date
$stopProcessScript = "False"



While ($stopProcessScript -eq "False")
{
    If ((test-path c:\tmp) -eq $true ) {
    
        $4 = echo "Number of processes"
        $5 = (get-process).count
        $6 = get-process | fl name
        ($4,$5,$6)> c:\tmp\Proc2.txt
        cd c:\tmp
        #compare-object (get-content proc.txt) (get-content proc2.txt)
        $6 > c:\tmp\p2.txt
        $P1 = get-content c:\tmp\p1.txt
        $P2 = get-content c:\tmp\p2.txt
        $Proc1 = @($P1)
        $Proc2 = @($P2)
        $Stop = @($Proc2 | where {$Proc1 -notcontains $_})
        $Stop | Foreach-Object {$_ -replace 'Name : '} > c:\tmp\StopProc.txt
        $StopProc = get-content c:\tmp\stopProc.txt
        If ($StopProc -eq $null) {
        $StopProc = "nothing"
        } else {
        $StopProc | Foreach-Object { stop-process -name "$_" -confirm }
        }


    } elseif ((test-path c:\tmp) -eq $false) {
        md c:\tmp
        $d = date
        $1 = echo " ********************************************** "
        $2 = echo " Today's date is $d"
        $3 = echo " ********************************************** " 
        $4 = echo "Number of processes"
        $5 = (get-process).count
        $6 = get-process | fl name
        $6 > c:\tmp\p1.txt
        ($1,$2,$3,$4,$5,$6)>> c:\tmp\Proc.txt
    }
Start-Sleep 5

}