$ip = $args[0]
$result = Test-Connection -ComputerName $ip -Count 1 -ErrorAction SilentlyContinue

if ($result -eq $null) {
    exit 0   # IP disponible
} else {
    exit 1   # IP no disponible
}
