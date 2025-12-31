$start = Get-Date "2026-01-01"
$end = Get-Date "2026-12-31"

$current = $start
$day = 1

while($current -le $end){

    # Folder name
    $folder = "Day$day"

    # Create folder if not exists
    if(!(Test-Path $folder)){
        New-Item -ItemType Directory -Path $folder | Out-Null
    }

    # Create file inside folder
    $file = "$folder\day$day.txt"

    "Work log for Day $day - $($current.ToString('yyyy-MM-dd'))" | Out-File $file

    git add .

    $date = $current.ToString("yyyy-MM-ddTHH:mm:ss")

    $env:GIT_AUTHOR_DATE = $date
    $env:GIT_COMMITTER_DATE = $date

    git commit -m "Day $day : $($current.ToString('yyyy-MM-dd'))"

    $current = $current.AddDays(1)
    $day++
}

Write-Host "Completed 365 folders + commits"