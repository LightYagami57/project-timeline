$start = Get-Date "2026-01-01"
$end = Get-Date "2026-05-01"

$current = $start

while($current -le $end){

    Add-Content timeline.txt "Update $($current.ToString('yyyy-MM-dd'))"

    git add .

    $date = $current.ToString("yyyy-MM-dd 12:00:00")

    $env:GIT_AUTHOR_DATE = $date
    $env:GIT_COMMITTER_DATE = $date

    git commit -m "Project update $date"

    $current = $current.AddDays(1)
}