# Organization function
function OrganizeMe {
    $Exten = $args[0]
    $Source = $args[1]
    $Files = Get-ChildItem -Path $Source -Filter *$Exten
    Foreach($File in $Files){
        $FileBaseName = $File.BaseName
        $FileExtension = $File.Extension
        $Destination = $args[2]
        $FileName = "{0}{1}{2}" -f $FileBaseName,$i,$FileExtension
        While(Test-Path -Path "$Destination\$Filename"){
            $i++
            $FileName = "{0}{1}{2}" -f $FileBaseName,(" ("+$i+")"),$FileExtension
        }
        Remove-Variable I -ErrorAction SilentlyContinue
        $NewFileDestination = "{0}{1}" -f $Destination,$FileName
        Move-item -literalPath $File.FullName -Destination $NewFileDestination
    }
}
# Source folder
# $SourceFolder = "C:\source"

# Destination folder
# OrganizeMe ".txt" $SourceFolder "C:\destination\"
