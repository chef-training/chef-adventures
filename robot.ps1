# This script can be run on a Food Trailers workstation to test the Chef Adventures content.
cd C:\Users\Administrator\chef-repo\cookbooks
# Clone the answer key
git clone http://github.com/scarolan/chef-adventures-answerkey web
cd web
# Walk through all of day 1 training content, one section at a time:
git checkout v1.3
kitchen converge
git checkout v1.4
kitchen converge
git checkout v1.5
kitchen converge
git checkout v1.6
kitchen converge
kitchen destroy
kitchen converge
git checkout v2.1
kitchen converge
git checkout v2.2
kitchen converge
git checkout v2.3
kitchen converge
git checkout v2.4
kitchen converge
git checkout v2.5
kitchen converge
git checkout v3.1
kitchen converge
git checkout v3.2
kitchen converge
git checkout v3.3
kitchen converge
git checkout v4.1
kitchen converge
git checkout v4.2
kitchen converge
git checkout v4.3
kitchen converge
git checkout v4.4
kitchen converge
