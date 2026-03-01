{ config, pkgs, ... }:

{
  users.users.angelo = {
    isNormalUser = true;
    description = "Angelo Montenegro";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
