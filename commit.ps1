$gitCommitMessage = read-host "Git Commit Message"

write-output "clearing old public folder"
remove-item -Path .\public\ -Recurse

write-output "creating public content with HUGO"

## TODO need to be more precise about hugo version

Hugo 

write-output "checking for public folder"
$publicFolderPath =".\public"
if (test-path $publicFolderPath) {
    git add .
    git commit -m $gitCommitMessage
    git push
} else {
    write-output "something went WRONG"
}