# Edit

{ config, lib, modulesPath, suites, profiles, ... }: rec {

  system.nixos.tags = [ "with-gui" ];
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
  networking = { useDHCP = lib.mkDefault true; };
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs = { hostPlatform = lib.mkDefault "x86_64-linux"; };

  powerManagement = { cpuFreqGovernor = lib.mkDefault "powersave"; };

  hardware = {
    cpu = {
      intel = {
        updateMicrocode =
          lib.mkDefault config.hardware.enableRedistributableFirmware;
      };
    };
  };

  imports = [
    # Include the results of the hardware scan.
    (modulesPath + "/installer/scan/not-detected.nix")
    profiles.optional-apps.mysql
    profiles.core.nixos
    profiles.client-pkgs.nixos
    profiles.users.root
    profiles.users.freeman
  ] ++ suites.client-base;

  boot = {
    tmpOnTmpfs = lib.mkDefault true;
    loader = {
      systemd-boot = {
        # enable = true;
        editor = false;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = true;
        efiSupport = true;
        version = 2;
        device = "nodev";
        configurationLimit = 5;
        # Allow for dualboot
        extraEntries = ''
          menuentry "Windows" --class windows {
            insmod part_gpt
            insmod fat
            insmod search_fs_uuid
            insmod chain
            chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          }
        '';
      };
      grub2-theme = {
        enable = true;
        icon = "white";
        theme = "whitesur";
        screen = "1080p";
        splashImage = ./grub.jpg;
        footer = true;
      };
    };
  };

  networking.nat = {
    enable = true;
    internalInterfaces = [ "ve-+" ];
    externalInterface = "wlp0s20f3";
    # Lazy IPv6 connectivity for the container
    enableIPv6 = true;
  };

  # containers.nextcloud = {
  #   autoStart = true;
  #   privateNetwork = true;
  #   hostAddress = "192.168.100.10";
  #   localAddress = "192.168.100.11";
  #   hostAddress6 = "fc00::1";
  #   localAddress6 = "fc00::2";
  #   config = { config, pkgs, ... }: {

  #     services.nextcloud = {
  #       enable = true;
  #       hostName = "localhost";
  #       config = {
  #         adminpassFile = toString (pkgs.writeText "adminpass"
  #           "test123"); # DON'T DO THIS IN PRODUCTION - the password file will be world-readable in the Nix Store!
  #         extraTrustedDomains = [ "192.168.100.11" ];
  #       };
  #     };

  #     system.stateVersion = "22.11";

  #     networking.firewall = {
  #       enable = true;
  #       allowedTCPPorts = [ 80 ];
  #     };
  #     # Manually configure nameserver. Using resolved inside the container seems to fail
  #     # currently
  #     environment.etc."resolv.conf".text = "nameserver 8.8.8.8";
  #   };
  # };
}
