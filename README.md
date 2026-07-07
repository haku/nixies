## How To Poke at Things

```
$ nix repl
> :lf .
> nixos = inputs.nixpkgs.lib.nixosSystem { system = "x86_64-linux"; modules = [ nixosModules.default ]; }
> nixos.config.systemd.oomd
> nixos.options.nixies
> home = inputs.home-manager.lib.homeManagerConfiguration { pkgs = nixos.pkgs; modules = [ homeModules.default {home = {stateVersion = "26.05"; username = "test"; homeDirectory = "/tmp";};} ]; }
> :p home.config.services.clipman
> :p home.config.services.wob.settings
```

# TODO

* investigate and try to understand https://github.com/mightyiam/dendritic
