## How To Poke at Things

```
$ nix repl
> :lf .
> sys = inputs.nixpkgs.lib.nixosSystem { system = "x86_64-linux"; modules = [ nixosModules.default ]; }
> sys.config.systemd.oomd
> sys.options.nixies
```

# TODO

* investigate and try to understand https://github.com/mightyiam/dendritic
