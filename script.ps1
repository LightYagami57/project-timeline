$start = Get-Date "2026-01-01"
$end = Get-Date "2026-12-31"

$current = $start
$day = 1

while($current -le $end){

    $folder = "Day$day"

    if(!(Test-Path $folder)){
        New-Item -ItemType Directory -Path $folder | Out-Null
    }

    $file = "$folder\notes.txt"

    @"
Day: $day
Date: $($current.ToString('yyyy-MM-dd'))
Summary: Work snapshot
"@ | Out-File $file

    git add .

    $date = $current.ToString("yyyy-MM-ddTHH:mm:ss")

    $env:GIT_AUTHOR_DATE = $date
    $env:GIT_COMMITTER_DATE = $date

    git commit -m "Timeline Day $day"

    $current = $current.AddDays(1)
    $day++
}