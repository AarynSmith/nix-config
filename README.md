# Aaryn's Universal Nix Config

## Installation (MacOS)

1. Install Nix

``` bash
> curl --proto '=https' -tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Close and reopen terminal and test nix

``` bash
> nix run "nixpkgs#hello"
Hello, world!
```

3. Clone this repository to ~/.config/nix-config/

``` bash 
git clone https://github.com/AarynSmith/nix-config.git ~/.config/nix-config/
nix run nix-darwin -- switch --flake .
```
