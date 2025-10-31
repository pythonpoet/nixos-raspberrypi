sself: super: {
  # U-Boot for Raspberry Pi 64-bit as EFI application
  ubootRaspberryPi_64bit = super.buildUBoot rec {
    defconfig = "rpi_arm64_defconfig";
    extraMeta.platforms = [ "aarch64-linux" ];
    

    
    # Install file
    filesToInstall = [ "u-boot.bin" ];
    

  };


  uefi_rpi3 = super.fetchzip {
    url = "https://github.com/pftf/RPi3/releases/download/v1.39/RPi3_UEFI_Firmware_v1.39.zip";
    hash = super.lib.fakeHash;
    stripRoot = false;
  };
  uefi_rpi4 = super.fetchzip {
    url = "https://github.com/pftf/RPi4/releases/download/v1.38/RPi4_UEFI_Firmware_v1.38.zip";
    hash = super.lib.fakeHash;
    stripRoot = false;
  };
  # https://github.com/worproject/rpi5-uefi/
  uefi_rpi5 = super.fetchzip {
    url = "https://github.com/worproject/rpi5-uefi/releases/download/v0.3/RPi5_UEFI_Release_v0.3.zip";
    hash = "sha256-bjEvq7KlEFANnFVL0LyexXEeoXj7rHGnwQpq09PhIb0=";
    stripRoot = false;
  };
}