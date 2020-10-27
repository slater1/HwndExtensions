# Get the most recent nupkg, one for netstandard, one for netcore
$file_netfw = gci -File . | ? {$_.Name -like "HwndExtensions.NetFramework.*.nupkg"} | sort LastWriteTime | select -last 1
$file_netcore = gci -File . | ? {$_.Name -like "HwndExtensions.NetCore.*.nupkg"} | sort LastWriteTime | select -last 1

$file_netfw = $file_netfw.FullName
$file_netcore = $file_netcore.FullName

echo "Publishing these packages:"
echo $file_netfw
echo $file_netcore

nuget push -SkipDuplicate -Source https://www.nuget.org -ApiKey $env:HWNDEXTENSIONS_NUGET_KEY $file_netfw
nuget push -SkipDuplicate -Source https://www.nuget.org -ApiKey $env:HWNDEXTENSIONS_NUGET_KEY $file_netcore

