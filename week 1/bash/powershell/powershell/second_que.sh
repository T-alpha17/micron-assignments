$path_dir = Read-Host -Prompt "Enter the source path"
$destination_dir = Read-Host -Prompt "Enter the destination path"
Get-ChildItem -Path $path_dir | Where-Object { $_.LastAccessTime -lt (Get-Date).AddDays(-1) } | ForEach-Object { Copy-Item -Path $_.FullName -Destination $destination_dir }
echo "The backup is done"
