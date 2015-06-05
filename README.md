# ChefDK Adventures

> Resting in this hallowed repository lay the stories of legend.

Contained here is a conceptual ideas of making a gamified training experience.

The learner is the protagonist of this story. Laid before them are a series of obstacles that require them to use Chef tools and practices to overcome them.

The content is separated into episodes.

## Episodes

### Episode 1

>
> The learner is the player.
>
> The trainer is the storyteller.
>
> The game engine is the villain and friend.
>

The storyteller begins the training session by giving the players an instance, a user name, and a password. She invites them to login to the systems.

The players login to the systems. They are greeted with a message that informs them that the system has been hacked. That the instances will be terminated as long as the villain maintains control of the system.

After the player is unable to install the package necessary to accomplish the first objective. A message appears to the players. It is from a friend. This friend tells you that they were note able to grant you sudo access for all things, they were able to sneak that access in for various chef commands. The message concludes by telling the player to ask the storyteller how to use tool chef-apply.

The storyteller explains chef-apply and resources.

The players install the package with chef-apply and complete the objective.

Another friendly message arrives that instructs the players that they have a key that will help them accomplish the next objective. To recieve the key they will need to deploy a web application listening on a specific url and port. That application is stored on Github in a git repository. So they will need to retrieve that project with a remote file. The message concludes by telling the player to ask the storyteller for assistance.

The storyteller explains chef-apply, creating recipe files, and ordered execution of resources. She explains the remote_file resource and the execute resource.

The player creates a recipe file that is able to retreive the web application, unzip it, and install dependencies. The player receives the key at the specified location.

The key allows the player to decrypt a file. The command requires sudo level permissions so it requires them to use an execute resource.

A friendly message arrives and tells the player that the decrypted file needs to be placed in three specific directories on the system. The friendly message informs the player that they have one piece and encourages the player to find the other two pieces.

* Piece One is stored in an C application on the network. The player needs to download the application source. Compile it and run it. The output is the directory path.

* Piece Two is file on the system that has been corrupted by the villain. To fix the corruption the player needs to place the corrupted file at a particular path and then execute code through a cron job to uncorrupt it.

When the players recover the two pieces they are greeted with a friendly message. The message informs the players to open a telnet connection so that they can chat further.

The players connect to the remote system and begin the chat. The friendly service that was helping them presents Piece Three. Immediately after the communication is hacked by the villain. The villain informs them their friends machine will be terminated.

The players are disconnected. With the three file locations the player is able to write the last recipe that will place the unencrypted file at the three locations. The player is able to take control of the sudoers file and remove the sudoer permissions of the villain.

The villain warns the player that this is not the last that they have seen of them!

## Challenges

The player needs to face challenges that require him to use Chef to overcome. This section defines the obstacles that stand in the player's way. These obstacles stand here without the narrative above to make it easier to write, collect, review and select them for use in episodes.

### Remote Artifact

An application exists on a remote system.

* remote_file

### Some Assembly Required

The application needs to be unarchived. The application needs to be compiled. The application needs to be executed.

* execute
* notifies

### Put the Weapon Down

A directory may have to be created. A file with little or no content has to be created.

* directory
* file


### Drop the Idol

A directory may have to be created. The file has to be copied.

* directory
* cookbook_file


### Drop The Idol - This Time No Funny Business

A directory may have to be created. The file has to be copied. The contents of the file require a special value.

* directory
* template


### Lets Get This Machine Up and Running

A service may need to be configured. A service needs to be started.

* template
* service



## Contributing

So the scene that you may have just read inspired you to contribute. Good I'm glad. That's that this project needs. We need to bring more detail to that above scene. We also need to write more scenes. We could also use challenges for the player.