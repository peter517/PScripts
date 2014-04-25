# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := linux_c_test
DEFS_Debug := '-DGYP_DEFINE' \
	'-DGYP_VAR' \
	'-DDEBUG'

# Flags passed to all source files.
CFLAGS_Debug := -Werror \
	-Wall

# Flags passed to only C files.
CFLAGS_C_Debug := 

# Flags passed to only C++ files.
CFLAGS_CC_Debug := -Werror \
	-Wall

INCS_Debug := -I. \
	-I.. \
	-Imodules \
	-Imodules/random/out/Debug/obj.target

DEFS_Release := '-DGYP_DEFINE' \
	'-DGYP_VAR' \
	'-DNDEBUG'

# Flags passed to all source files.
CFLAGS_Release := -Werror \
	-Wall

# Flags passed to only C files.
CFLAGS_C_Release := 

# Flags passed to only C++ files.
CFLAGS_CC_Release := -Werror \
	-Wall

INCS_Release := -I. \
	-I.. \
	-Imodules \
	-Imodules/random/out/Debug/obj.target

OBJS := $(obj).target/$(TARGET)/main.o \
	$(obj).target/$(TARGET)/modules/pthread/pthread_once_test.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(builddir)/lib.target/librandom.so $(obj).target/modules/math/libmymath.a $(obj).target/modules/random/librandom.so

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
LDFLAGS_Debug := -pthread \
	-Wl,-rpath=\$$ORIGIN/lib.target/ \
	-Wl,-rpath-link=\$(builddir)/lib.target/

LDFLAGS_Release := -pthread \
	-Wl,-rpath=\$$ORIGIN/lib.target/ \
	-Wl,-rpath-link=\$(builddir)/lib.target/

LIBS := 

$(builddir)/linux_c_test: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(builddir)/linux_c_test: LIBS := $(LIBS)
$(builddir)/linux_c_test: LD_INPUTS := $(OBJS) $(obj).target/modules/random/librandom.so $(obj).target/modules/math/libmymath.a
$(builddir)/linux_c_test: TOOLSET := $(TOOLSET)
$(builddir)/linux_c_test: $(OBJS) $(obj).target/modules/random/librandom.so $(obj).target/modules/math/libmymath.a FORCE_DO_CMD
	$(call do_cmd,link)

all_deps += $(builddir)/linux_c_test
# Add target alias
.PHONY: linux_c_test
linux_c_test: $(builddir)/linux_c_test

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/linux_c_test

