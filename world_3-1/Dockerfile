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

RUN mkdir -p /game/tree/trunk/tallest_branch
RUN mkdir -p /game/tree/trunk/shortest_branch
RUN mkdir -p /game/tree/trunk/averge_branch
RUN mkdir -p /game/tree/trunk/median_branch
RUN mkdir -p /game/tree/trunk/git_branch
RUN mkdir -p /game/tree/roots/more_roots/roots_worms_and_dirt

ADD woodpecker-and-the-oak/actors/termites.bug /game/tree/trunk/termites.bug
ADD woodpecker-and-the-oak/actors/lady.bug /game/tree/trunk/ladybug.bug


# presets
VOLUME ["/data"]
ENTRYPOINT ["/bin/bash"]
