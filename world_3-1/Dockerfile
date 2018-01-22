# --- CHEFDK ---

FROM ubuntu:trusty
MAINTAINER Matthieu Fronton <fronton@ekino.com>
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV TIMEZONE Europe/Paris

# timezone
RUN echo $TIMEZONE > /etc/timezone && dpkg-reconfigure tzdata

# chefdk
RUN apt-get update
RUN apt-get install curl -y
RUN curl -L https://www.opscode.com/chef/install.sh | sudo bash -s -- -P chefdk

#https://github.com/berkshelf/berkshelf-api/issues/112#issuecomment-44171378
ENV LANG en_US.UTF-8
RUN locale-gen $LANG

# other tools
RUN apt-get install -y expect vim tig ssh-client

# cleanup
RUN apt-get clean

#
# GAME CODE AHEAD
#
# TODO-workflow: the game should probably exist unarchived on the house system, be archived in the building process, copied into the image, and then unpackaged.
#
# TODO-workflow: It would also be great to be able to spin up a studio that lets you use your local file-system mounted to make it easier to bring in changes. Changes here would not able to translate directly to the game being played (e.g. bashrc). We would also want to possibly create a temp directory where it would install the file system locally and then mount into the studio. This would give a better view of what is going on.
#
# TODO-feature: This view concept sounds like something a webpage could report. Imagining an instructor watching over and coming in to provide help if needed within the context of the adventure. They would be able to see what is happening all through the browser representation. Ultimately, the service that watches the file system could also send these events to the queue and the webpage could read that queue and update the state of the game board and read state calls inserted from the game client.

# Add the game engine
RUN mkdir /game
ADD Gemfile /game
RUN cd /game && /opt/chefdk/bin/chef exec bundle install
ADD wake.rb /game
RUN mkdir /game/lib
ADD lib/* /game/lib/

# Add the shell state
ADD bashrc /root/.bashrc
ADD bash_history /root/.bash_history

# Add the game
ADD .game_state.yml /game
RUN mkdir /game/woodpecker-and-the-oak && mkdir /game/woodpecker-and-the-oak/art && mkdir /game/woodpecker-and-the-oak/scenes
ADD woodpecker-and-the-oak/scenes/* /game/woodpecker-and-the-oak/scenes/
ADD woodpecker-and-the-oak/art/* /game/woodpecker-and-the-oak/art/

# Add the condition tools
RUN mkdir /game/inspec && mkdir /game/inspec/looked_around
ADD inspec/* /game/inspec/

# TODO-feature: Should the actor itself know how to define itself. Right now the actors being added to that folder do not have a list of who they are and where they need to be at what time.

RUN mkdir -p /game/tree/trunk/tallest_branch
RUN mkdir -p /game/tree/trunk/shortest_branch
RUN mkdir -p /game/tree/trunk/average_branch
RUN mkdir -p /game/tree/roots/more_roots/roots_worms_and_dirt

ADD woodpecker-and-the-oak/actors/woodpecker.bird /game/woodpecker.bird
ADD woodpecker-and-the-oak/actors/termites.bug /game/tree/trunk/termites.bug
ADD woodpecker-and-the-oak/actors/lady.bug /game/tree/trunk/ladybug.bug

RUN mkdir -p /game/box
ADD woodpecker-and-the-oak/actors/box/* /game/box/


# presets
VOLUME ["/data"]
ENTRYPOINT ["/bin/bash"]
