$start = Get-Date "2026-01-01"
$end = Get-Date "2026-12-01"

$current = $start

while($current -le $end){

Add-Content timeline.txt "Update $current"

git add .

$date=$current.ToString("yyyy-MM-dd HH:mm:ss")

$env:GIT_AUTHOR_DATE=$date
$env:GIT_COMMITTER_DATE=$date

git commit -m "Project update $date"

$current=$current.AddDays(1)

}