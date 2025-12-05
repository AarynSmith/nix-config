cp ~/Library/Preferences/com.jordanbaird.Ice.plist ./configurations/ice/com.jordanbaird.Ice.plist


cp ~/Library/Application\ Support/VSCodium/User/keybindings.json ./configurations/vscodium/User/
cp ~/Library/Application\ Support/VSCodium/User/settings.json ./configurations/vscodium/User/
cp -r ~/Library/Application\ Support/VSCodium/User/snippets ./configurations/vscodium/User/
codium --list-extensions > ./configurations/vscodium/extensions.txt