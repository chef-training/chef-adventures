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
ADD Gemfile /
RUN /opt/chefdk/bin/chef exec bundle install
ADD wake.rb /

# Add the shell state
ADD bashrc /root/.bashrc
ADD bash_history /root/.bash_history

# Add the game
ADD .game_state.yml /
ADD silicon-mountain.txt /

# Add the additional commands for InSpec for player
RUN mkdir /tools
# TODO: eventually thet ools should remain in here and then be distributed when they are needed.
ADD tools/find_tools/ /find_tools
ADD tools/find_fortune/ /find_fortune

# Add InSpec for Game
RUN mkdir /events
ADD events/player_discovered_tools/ /events/player_discovered_tools
ADD events/player_discovered_fortune/ /events/player_discovered_fortune
ADD events/player_recovered_fortune/ /events/player_recovered_fortune

# presets
VOLUME ["/data"]
ENTRYPOINT ["/bin/bash"]
