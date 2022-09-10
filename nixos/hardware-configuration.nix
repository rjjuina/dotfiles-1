# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules =
        [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    extraModprobeConfig = ''
      options i915 force_probe=46a6
    '';

  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/799ba8ac-87bb-4c4e-b060-1787b4708a90";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/209B-184A";
    fsType = "vfat";
  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking = {
    useDHCP = lib.mkDefault true;

  };
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs = { hostPlatform = lib.mkDefault "x86_64-linux"; };

  powerManagement = {
    cpuFreqGovernor = lib.mkDefault "powersave";
  };
  
  hardware = {
    cpu = {
      intel = {
        updateMicrocode =
          lib.mkDefault config.hardware.enableRedistributableFirmware;
      };
    };
  };
}
