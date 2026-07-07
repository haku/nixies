{ config, lib, ... }:
with lib;
{
  options.nixies.oomd = {
    slices = mkOption {
      type = types.listOf types.str;
      description = "Existing systemd slices to attach oomd config to.";
      default = [];
    };
    services = mkOption {
      type = types.listOf types.str;
      description = "Systemd services to be put into a slice with oomd configured.";
      default = [];
    };
  };

  config = let
    sliceConfig = {
      ManagedOOMMemoryPressure = "kill";
      ManagedOOMMemoryPressureLimit = lib.mkDefault "80%";
    };
    cfg = config.nixies.oomd;
  in {
    systemd.oomd = {
      enable = true;
      enableSystemSlice = false;  # dangerous without planning.
      enableUserSlices = true;
    };

    systemd.slices = listToAttrs (map (slice: nameValuePair slice {
      sliceConfig = sliceConfig;
    }) cfg.slices)
    // {
      system-general = {
        description = "Services that are in scope for oomd.";
        sliceConfig = sliceConfig;
      };
    };

    systemd.services = listToAttrs (map (svc: nameValuePair svc {
      serviceConfig.Slice = "system-general.slice";
    }) cfg.services);
  };
}
