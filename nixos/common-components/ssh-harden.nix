{ config, pkgs, lib, ... }:
{
  services.openssh = {
    enable = true;
    banner = ''
      Welcome to the NixOS machine
    '';
    startWhenNeeded = false;
    useDns = true;
    forwardX11 = true;
    passwordAuthentication = true;
    ports = [ 2222 ];
    ciphers = [
      "chacha20-poly1305@openssh.com"
      "aes256-gcm@openssh.com"
      "aes128-gcm@openssh.com"
    ];
    kexAlgorithms = [
      "sntrup761x25519-sha512@openssh.com"
      "curve25519-sha256"
      "curve25519-sha256@libssh.org"
    ];
    macs = [
      "hmac-sha2-512"
      "hmac-sha2-512-etm@openssh.com"
      "hmac-sha2-256"
      "hmac-sha2-256-etm@openssh.com"
    ];
    extraConfig = ''
      GSSAPIAuthentication yes
      UsePAM yes
      GSSAPICleanupCredentials yes
      PasswordAuthentication yes
    '';
  };
}