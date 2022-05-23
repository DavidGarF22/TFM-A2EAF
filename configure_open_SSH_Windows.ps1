Import-Module -Name 'NetSecurity'
 
# Setup windows update service to manual
$wuauserv = Get-WmiObject Win32_Service -Filter "Name = 'wuauserv'"
$wuauserv_starttype = $wuauserv.StartMode
Set-Service wuauserv -StartupType Manual
 
# Install OenSSH
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
 
# Set service to automatic and start
Set-Service sshd -StartupType Automatic
Start-Service sshd
 
# Setup windows update service to original
Set-Service wuauserv -StartupType $wuauserv_starttype
 
# Configure PowerShell as the default shell
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "$Env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force
 
# Restart the service
Restart-Service sshd
 
# Configure SSH public key
$content = @"
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+whZTy7mHli9YNA99Y85Xg5QDsFtYCiivy7sVv1SrRBOLjO9b9T77TIe1ZikIhuO80acnpycj8sa3bC6+ChhvxrYu8W5jIkzKPGKNpK3mq7W+X2ZK0/ywY97SIQC+U/3UkmsmRJWjynWuMiOYYePuE5Uq0uZxh2yrjFDu/7HMhoAlpPAL2srwVig2NcKqbSUiC8fZnaphzgNcYhCjJpVqGgZ6kJ8+8PJSyT7mvm40bB8glfIMBP+Ic6PkCdI53AkPNld/MHXBswixc3wlNRPweBfwACqI6FX+wLh96qXfWACmGNjkMhnDQbisQln7fIhnpmZRz5aepMOleJjHt9HDwxRC4HHMwPYvAERuQPgvtpKFTXsoBuzuRlCJNEk00ZXphjEDv0Zy238rTVw4Ie6eG7P+O2/iqbGvT5GHZfPC/Ez31+4AfuhpvWcbYcN4c7BO6zVCR8N6t/sA5tgLJ8aAmEYdnfUzEGpE/GJy607tQMuMmKu7yhGZq3/mwTjedG0= david@TFM-Controlador
"@
 
# Write public key to file
$content | Set-Content -Path "$Env:ProgramData\ssh\administrators_authorized_keys"
 
# set acl on administrators_authorized_keys
$admins = ([System.Security.Principal.SecurityIdentifier]'S-1-5-32-544').Translate( [System.Security.Principal.NTAccount]).Value
$acl = Get-Acl $Env:ProgramData\ssh\administrators_authorized_keys
$acl.SetAccessRuleProtection($true, $false)
$administratorsRule = New-Object system.security.accesscontrol.filesystemaccessrule($admins,"FullControl","Allow")
$systemRule = New-Object system.security.accesscontrol.filesystemaccessrule("SYSTEM","FullControl","Allow")
$acl.SetAccessRule($administratorsRule)
$acl.SetAccessRule($systemRule)
$acl | Set-Acl
 
# Open firewall port 22
$FirewallParams = @{ 
  "DisplayName"       = 'OpenSSH SSH Server (sshd)'
  "Direction"         = 'Inbound'
  "Action"            = 'Allow'
  "Protocol"          = 'TCP'
  "LocalPort"         = '22'
  "Program"           = '%SystemRoot%\system32\OpenSSH\sshd.exe'
}
New-NetFirewallRule @FirewallParams