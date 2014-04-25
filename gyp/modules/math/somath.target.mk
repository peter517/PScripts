# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := somath
DEFS_Debug := '-DDEBUG'

# Flags passed to all source files.
CFLAGS_Debug := 

# Flags passed to only C files.
CFLAGS_C_Debug := 

# Flags passed to only C++ files.
CFLAGS_CC_Debug := 

INCS_Debug := -Iinclude

DEFS_Release := '-DNDEBUG'

# Flags passed to all source files.
CFLAGS_Release := 

# Flags passed to only C files.
CFLAGS_C_Release := 

# Flags passed to only C++ files.
CFLAGS_CC_Release := 

INCS_Release := -Iinclude

OBJS := $(obj).target/$(TARGET)/math.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

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

$(obj).target/libsomath.so: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/libsomath.so: LIBS := $(LIBS)
$(obj).target/libsomath.so: LD_INPUTS := $(OBJS)
$(obj).target/libsomath.so: TOOLSET := $(TOOLSET)
$(obj).target/libsomath.so: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,solink)

all_deps += $(obj).target/libsomath.so
# Add target alias
.PHONY: somath
somath: $(builddir)/lib.target/libsomath.so

# Copy this to the shared library output path.
$(builddir)/lib.target/libsomath.so: TOOLSET := $(TOOLSET)
$(builddir)/lib.target/libsomath.so: $(obj).target/libsomath.so FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/lib.target/libsomath.so
# Short alias for building this shared library.
.PHONY: libsomath.so
libsomath.so: $(obj).target/libsomath.so $(builddir)/lib.target/libsomath.so

# Add shared library to "all" target.
.PHONY: all
all: $(builddir)/lib.target/libsomath.so
