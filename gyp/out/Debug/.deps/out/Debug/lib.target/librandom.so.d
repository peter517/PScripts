cmd_out/Debug/lib.target/librandom.so := ln -f "out/Debug/obj.target/modules/random/librandom.so" "out/Debug/lib.target/librandom.so" 2>/dev/null || (rm -rf "out/Debug/lib.target/librandom.so" && cp -af "out/Debug/obj.target/modules/random/librandom.so" "out/Debug/lib.target/librandom.so")
