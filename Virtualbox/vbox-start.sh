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

start ()
{	
	startup=('vboxmanage startvm')
	headless=('--type headless')
	Bulldog=("66d3258e-6694-47ae-8a4e-8f00d4d67b9f")
	Pinky1=("4263befb-bad7-42df-859b-94fa173ad4fc")
	Pinky2=("9ebea899-1378-4a19-8fed-9e8f885319a9")
	Raven1=("4547d839-2f8d-4bd9-bae6-2042ac3bad78")
	Raven2=("c27975de-21df-457e-a0a8-69531dccc9cd")
	SolidState=("80b8702d-05ce-4ceb-8878-98d1406d18c6")
	OwaspSecShep=("bb55610d-2fbf-46d0-827e-6f9a7e0b64a1")
	LazySysAdmin=("9f1f57c3-5b1f-429a-8e4a-8ab4422005e6")
	pfsense=("eb99f2b8-6354-48ee-b6d6-a04223995219")
	metasploitable=("febe6f4f-7982-4a59-8dcd-c287fbc2fcd1")
	$startup $pfsense $headless
	$startup $metasploitable $headless
	$startup $Bulldog $headless
 	$startup $Pinky1 $headless
	$startup $Pinky2 $headless
	$startup $Raven1 $headless
	$startup $Raven2 $headless
	$startup $SolidState $headless
	$startup $OwaspSecShep $headless
	$startup $LazySysAdmin $headless
}


output
list
start
