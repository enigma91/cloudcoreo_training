## This file was auto-generated by CloudCoreo CLI
	Anything contained in this directory will act as an override for the stack in which it is contained.

	The paths should be considered relative to the parent of this directory.

	For example, if you have a directory structure like this,
	
	```
	+-- parent
	|   +-- overrides
	|   |   +-- stack-a
	|   |   |   +-- boot-scripts
	|   |   |   |   +-- order.yaml
	|   +-- stack-a
	|   |   +-- boot-scripts
	|   |   |   +-- order.yaml
	```
	Because the directory structure within the override directory matches the structure of the parent,
	the 'order.yaml' file will be ignored in the stack-a directory and instead the overrides/stack-a order.yaml
	file will be used.