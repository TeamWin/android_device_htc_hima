/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <sys/stat.h>
#include <sys/mount.h>

#define DEV_BLOCK_SYSTEM "/dev/block/bootdevice/by-name/system"

void set_props_from_file(const char *filename)
{
    int IsSet_ro_product_device = 0;
    FILE *fp = fopen(filename, "r");

    if (fp) {
        char line[1024];

        char propname[PROP_NAME_MAX];
        char propvalue[PROP_VALUE_MAX];
        char *pch;

        while ((fgets(line, sizeof(line), fp))) {
            if (line[0] == '\n' || line[0] == '#') continue;

            pch = strtok(line, "=\n");
            if (!pch || strlen(pch) >= PROP_NAME_MAX) continue;
            strcpy(propname, pch);

            pch = strtok(NULL, "=\n");
            if (!pch || strlen(pch) >= PROP_VALUE_MAX) continue;
            strcpy(propvalue, pch);

            if (strcmp(propname, "ro.build.fingerprint") == 0) {
                property_set(propname, propvalue);
            }
            else if (strcmp(propname, "ro.product.device") == 0) {
                property_set(propname, propvalue);
                IsSet_ro_product_device = 1;
            }
        }
        fclose(fp);
    }

    if (!IsSet_ro_product_device) {
#ifdef GETPROP_RETURNS_STRING
        std::string propvalue;
        propvalue = property_get("ro.build.product");
        property_set("ro.product.device", propvalue.c_str());
#else
        char propvalue[PROP_VALUE_MAX];
        property_get("ro.build.product", propvalue);
        property_set("ro.product.device", propvalue);
#endif
    }
}

void set_props_from_build(void)
{
    if (access("/system/build.prop", R_OK) == 0) {
        set_props_from_file("/system/build.prop");
        return;
    }

    if (mkdir("/tmpsys", 777) != 0)
        return;

    int is_mounted = mount(DEV_BLOCK_SYSTEM, "/tmpsys", "ext4", MS_RDONLY | MS_NOATIME , "") == 0;

    if (!is_mounted)
        is_mounted = mount(DEV_BLOCK_SYSTEM, "/tmpsys", "f2fs", MS_RDONLY | MS_NOATIME , "") == 0;

    if (is_mounted) {
        set_props_from_file("/tmpsys/build.prop");
        umount("/tmpsys");
    }
    rmdir("/tmpsys");
}

void common_properties()
{
    property_set("rild.libargs", "-d /dev/smd0");
    property_set("ro.ril.hsdpa.category", "14");
    property_set("ro.ril.hsxpa", "4");
    property_set("ro.ril.disable.cpc", "1");
}

void cdma_properties(char const default_cdma_sub[], char const default_network[])
{
    property_set("ro.telephony.default_cdma_sub", default_cdma_sub);
    property_set("ro.telephony.default_network", default_network);

    property_set("telephony.lteOnCdmaDevice", "1");
    property_set("ro.ril.svdo", "true");
    property_set("ro.ril.disable.fd.plmn.prefix", "23402,23410,23411,23420");
    property_set("ro.ril.enable.sdr", "0");
    property_set("ro.ril.enable.gea3", "1");
    property_set("ro.ril.enable.a53", "1");
    property_set("ro.ril.enable.r8fd", "1");
    property_set("persist.radio.snapshot_enabled", "1");
    property_set("persist.radio.snapshot_timer", "22");
}

void gsm_properties(char const default_network[])
{
    property_set("ro.telephony.default_network", default_network);
    property_set("telephony.lteOnGsmDevice", "1");
}

void vendor_load_properties()
{
    char platform[PROP_VALUE_MAX];
    char bootmid[PROP_VALUE_MAX];
    char device[PROP_VALUE_MAX];
    int rc;

    rc = property_get("ro.board.platform", platform);
    if (!rc || strncmp(platform, ANDROID_TARGET, PROP_VALUE_MAX))
        return;

    property_get("ro.boot.mid", bootmid);

    if (strstr(bootmid, "0PJA20000")) {
        /* m9whl (himawhl) */
        common_properties();
        cdma_properties("1", "8");
        property_set("ro.build.product", "htc_himawhl");
        property_set("ro.product.model", "0PJA2");
    } else if (strstr(bootmid, "0PJA30000")) {
        /* m9wl (himawl) */
        common_properties();
        cdma_properties("0", "10");
        property_set("ro.product.model", "HTC6535LVW");
        property_set("ro.build.product", "htc_himawl");
    } else {
        /* m9ul (himaul) */
        common_properties();
        gsm_properties("9");
        property_set("ro.build.product", "htc_himaul");
        property_set("ro.product.model", "HTC One M9");
    }

    set_props_from_build();

    property_get("ro.product.device", device);
    ERROR("Found bootmid %s setting build properties for %s device\n", bootmid, device);
}
