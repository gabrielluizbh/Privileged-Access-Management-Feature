# Script Recurso de Gerenciamento de Acesso Privilegiado (Privileged Access Management Feature) -  Comandos utilizados - Créditos Gabriel Luiz - www.gabrielluiz.com ##


# Verificar se o recurso esta presente.

Get-ADOptionalFeature -Filter {Name -like "Privileged*"}

# Verficar o nível da floresta e domínio.

(Get-ADForest).ForestMode
(Get-ADDomain).DomainMode

# Verificar o Active Directory Domain suffix.

 Get-ADDomain | Select-Object DNSRoot | fl

# Ative o Recurso de gerenciamento de acesso privilegiado (Privileged Access Management Feature).


Enable-ADOptionalFeature "Privileged Access Management Feature" -Scope ForestOrConfigurationSet -Target gabrielluiz.local


# Verificar se o Recurso de gerenciamento de acesso privilegiado (Privileged Access Management Feature).

Get-ADOptionalFeature -filter {name -like "Privileged*"}


# Verficar o o atributo SamAccountName dos usuários.

Get-ADUser -Filter * | Select SamAccountName


# Ativa a configuração de membros do grupo baseados em tempo para usuário gabriel.luiz no grupo Administradores do Domínio durante o tempo de 30 minutos.

Add-ADGroupMember -Identity ' Administradores do Domínio' -Members 'gabriel.luiz' -MemberTimeToLive (New-TimeSpan -Minutes 30)


# Verificar o valor de tempo de vida do usuário gabriel.luiz no grupo Administradores do Domínio.

Get-ADGroup 'Administradores do Domínio' -Properties Member -ShowMemberTimeToLive


# Referências:


# https://docs.microsoft.com/en-us/powershell/module/addsadministration/add-adgroupmember?view=win10-ps

# https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-adgroup?view=win10-ps

# https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-aduser?view=win10-ps

# https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-adoptionalfeature?view=win10-ps

# https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-adforest?view=win10-ps

# https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-addomain?view=win10-ps

# https://docs.microsoft.com/en-us/powershell/module/addsadministration/enable-adoptionalfeature?view=win10-ps

# https://sid-500.com/2017/09/24/windows-server-2016-configuring-time-based-group-membership-with-powershell/