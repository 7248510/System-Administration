#/usr/bin/sh

output ()
{
        message="Listing current VM'S"
        echo $message
}

list ()
{
        command=('vboxmanage list vms')
        $command
}

output
list
