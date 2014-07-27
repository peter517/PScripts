# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := mymath
DEFS_Debug := '-DDEBUG'

# Flags passed to all source files.
CFLAGS_Debug := 

# Flags passed to only C files.
CFLAGS_C_Debug := 

# Flags passed to only C++ files.
CFLAGS_CC_Debug := 

INCS_Debug := -Imodules/math/include

DEFS_Release := '-DNDEBUG'

# Flags passed to all source files.
CFLAGS_Release := 

# Flags passed to only C files.
CFLAGS_C_Release := 

# Flags passed to only C++ files.
CFLAGS_CC_Release := 

INCS_Release := -Imodules/math/include

OBJS := $(obj).target/$(TARGET)/modules/math/math.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE)) $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE)) $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := 

LDFLAGS_Release := 

LIBS := 

$(obj).target/modules/math/libmymath.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/modules/math/libmymath.a: LIBS := $(LIBS)
$(obj).target/modules/math/libmymath.a: TOOLSET := $(TOOLSET)
$(obj).target/modules/math/libmymath.a: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,alink)

all_deps += $(obj).target/modules/math/libmymath.a
# Add target alias
.PHONY: mymath
mymath: $(obj).target/modules/math/libmymath.a

# Add target alias to "all" target.
.PHONY: all
all: mymath

