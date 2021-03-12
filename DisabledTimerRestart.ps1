#Load the Sharepoint snapin

Add-PSSnapin *sh*

#Store the sp farm object in a variable

$SpFarm = Get-SPFarm

#get the disabled timer instances

$DisabledTimerInstances = $SpFarm.TimerService.Instance | ?{$_.Status -ne "Online"}

#Enable the instances

if($DisabledTimerInstances -ne $null){
  foreach($TimerInstances in DisabledTimerInstances){
      $TimerInstances.Status = [Microsoft.Sharepoint.Administration.SPObjrectStatus]::Online
      $TimerInstances.Update()
      }
   }
