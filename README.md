# Htcondor Deployment Playbooks

Clone and merge of:
https://github.com/cyverse-de/deployments/tree/main/ansible/condor and
https://github.com/slr71/de-ansible/ (as a zip)

## work in progress!

There are a couple of things they need to be changed to variable and/or need to be calculated.
This first commit could be installed as long as the vars in `group_vars/all.yml`
`allow_read` and `allow_write` include the correct network.  
A `consule_status` has to be executed as user consule.  
The first time, the user will be asked to trust the manager.
