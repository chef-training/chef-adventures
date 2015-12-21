# ChefDK Adventures

> Resting in this hallowed repository lay the stories of legend.

ChefDK Adventures is an interactive training experience.  It can be done solo or with an instructor. The instructor is sometimes referred to as CM (Chef Master).

The learner is the protagonist of this story. Laid before them are a series of obstacles that require them to use Chef tools and practices to overcome them.

The content is separated into episodes.

```
...newb raises the ChefDK and watches it shimmer...
      /| ________________
O|===|* >________________>
      \|
```

## Episodes

### Episode 0: Everyone was once a newb...AKA Welcome to Your Chef Workstation
Objectives:
  + Enter the dungeon via the gates of RDP
  + Equip your tools including:
    - Atom text editor
    - ConEmu and Powershell
    - Chef Development Kit

The storyteller begins the training session by giving the players an instance, a user name, and a password. She invites them to login to the systems.  These workstations were created using the most excellent Food Trailers script: https://github.com/chef-cft/food_trailers.  

The players login to the systems.  Explain the tools available to them and what is on the desktop.  These tools include ConEMU, the Atom text editor, and the ChefDK. 

### Episode 1: My First Quest™: Hello World
  + Manage a single file on the desktop
    - Create hello.txt with a recipe called greeting.rb
    - Edit, manipulate, etc.
    - Delete hello.txt with a recipe called goodbye.rb
  + Create a cookbook
    - Remove all folders from Atom
    - Open the chef-repo folder in Atom
    - cd ~/chef-repo/cookbooks
    - chef generate cookbook web
    - cd web
  + Basic Git commands
    - git status
    - git add .
    - git commit -m "Initial commit"
  + Make it your own
    - git status
    - Edit metadata.rb, save it
    - git status
    - git log
    - git log --oneline --all --decorate --graph
    - git commit -m "Customized metadata.rb"
    - git status
  + Configure Test Kitchen
    - cp ~/Desktop/.kitchen.linux.yml .kitchen.yml
    - Customize .kitchen.yml to our needs
    - Put your name in the 'Tags' field
    - Fix the run list so it has web::default in it
    - git add .
    - git commit -m "Preparing the Test Kitchen..."
  + Spin up a VM in AWS
    - kitchen create
    - Look how the .kitchen folder appeared.  Peek inside. What's in there?
    - kitchen list
    - Talk about how kitchen list shows the last known state of the VM
    - OPTIONAL:  Show everyone's VMs spinning up in the AWS console
    - kitchen converge
    - kitchen converge again
    - Note how much faster it runs the second time
    - kitchen login
    - Open a new tab in ConEmu, rename your tabs, one Workstation one Linux VM
    - In the workstation tab cd into the ~/chef-repo/cookbooks/web directory
  + Learn package, file, service resources
    - In Atom open the default recipe
    - Write a package resource to install httpd
    - kitchen converge
    - Write a file resource to manage /var/www/html/index.html
    - kitchen converge
    - Write a service resource to enable and start apache
    - kitchen converge
    - curl localhost in the VM to see if it worked
    - Git side quest - Time Travel!
      * Commit your changes to git
      * View your git history with 'git log --oneline'
      * git checkout 782973e # go back in time! Walk around. Talk to past you.
      * git checkout master # back to the latest commit on the master branch
      * This absolutely must have a Back to the Future slide.  Or Dr. Who.
  + Destroy and rebuild your VM from scratch
    - kitchen destroy
    - kitchen converge # explain how this includes create
    - kitchen login
    - curl localhost # everything's right back where it was!
    - Do you feel like a wizard yet?  You should!

### Episode 2: Hack and Slash: Refactoring your Code
  + Refactoring Chef cookbooks for fun and profit
  + Turn hello world into something useful
  + Let's put your hostname and ip address into the homepage
  + How do we get our public IP address?
  + Use the AWS metadata endpoint from within a VM
    - curl http://169.254.169.254/latest/meta-data/public-ipv4
  + Now that we have the public IP, we can load the homepage in a browser
  + Hard-code the hostname and public IP into the HTML code
  + What about other info like memory, CPU, etc?
  + Use this script to generate new HTML code to show all the data:
    - curl -L http://tinyurl.com/my-sysinfo-sh -o sysinfo.sh
    - sh sysinfo.sh
    - copy the output, put it into the 'file' resource in our recipe
  + Move the HTML code out of our recipe and into a template resource
  + Generate a template file
    - chef generate template index.html
    - edit index.html.erb in Atom
    - Change 'file' in the recipe resource to 'template'
    - Remove the 'content' line and replace with 'source'
  + Add the availability zone to the file.  How can we capture this?  (hint: metadata)

### Episode 3: 🐱  Your Familiar, Ohai: Dynamic Attributes
  + Separate code from variables (attributes)
  + Introducing Ohai
  + Learn about node attributes
  + Refactor status page to use node attributes instead of hard-coded values
  + Go through each hard-coded value one at a time, replacing them with node attributes
  + Do the first two with the students and then let them finish the rest with node attributes
  + They can run `ohai | less` on their node to see all the available attributes

### Episode 4: Shall We Play a Game? 🍔  👾
  + We've learned about machine-generated attributes in the previous section
  + Learn about customizable attributes
  + Generate an attributes file
  + Put an embeddable game from Kongregate on your site:  http://www.kongregate.com/games_for_your_site
  + Refactor the code to use attributes to determine which game shows up on your site (width, height, base, src)
  + Test different attributes using Test Kitchen attributes in .kitchen.yml



Here be dragons...
===============================

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
