mkdir ~/tmp
curl https://prerelease.keybase.io/Keybase.dmg > ~/tmp/Keybase.dmg
sudo hdiutil attach ~/tmp/Keybase.dmg
cp -r /Volumes/Keybase/Keybase.app /Applications
sudo hdiutil detach /Volumes/Keybase
rm -rf ~/tmp
