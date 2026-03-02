{ ... }:

{
  users.users.angelo = {
    isNormalUser = true;
    description = "Angelo Montenegro";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [ ];
  };
}
