# How to create vagrant box

1. Setup VirtualBox.
2. Install packer.io by hashicorp.
3. Run: `packer build ./template-packer.json`

**Note:**

Kickstart configuration file for anaconda installer is downloaded from github right now.

If you wish to use some local ks.cfg, feel free to edit `boot_command` in `template-packer.json`.

According to packer documentation, it is possible to use:
`http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg`
However, it is necessary to have a working VirtualBox networking for VM.

Maybe some additional settings of the host's IP address and networking settings for guest can help.
Example that can be tried - adding "vboxmanage":

```
[
    "modifyvm",
    "{{.Name}}",
    "--nic1=natnetwork",
    "--nat-network1=NatNetwork"
]
```

NAT networks can be listed by `vboxmanage list natnets`, host has IP address .2 (and .3 is for DNS server).

**Note2:** for VirtualBox, packer doc claims `.HTTPIP` is hardcoded to
`10.0.2.2`, so check `boot_command` and set proper value.

