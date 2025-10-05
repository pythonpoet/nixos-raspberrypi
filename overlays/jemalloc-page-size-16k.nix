(final: prev: {
  # Patch jemalloc for 16 KB pages (Raspberry Pi 5 / bcm2712)
  jemalloc = prev.jemalloc.overrideAttrs (old: {
    configureFlags =
      let
        pageSizeFlag = "--with-lg-page";
        # Remove any existing flag, replace with 14 (16 KB)
        filteredFlags = prev.lib.filter (flag: !(prev.lib.hasPrefix pageSizeFlag flag)) (old.configureFlags or []);
      in
        filteredFlags ++ [ "${pageSizeFlag}=14" ];

    # Optional: helps make the change clear in logs
    meta = old.meta // {
      description = "${old.meta.description} (patched for 16 KB page size)";
    };
  });
})
