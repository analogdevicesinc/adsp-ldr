// SPDX-License-Identifier: BSD-3-Clause
/*
 * Copyright (c) 2006-2021, Analog Devices, Inc. All rights reserved.
 */

#define __LFD_INTERNAL
#include "ldr.h"

static const char * const bf527_aliases[] = { "BF522", "BF523", "BF524", "BF525", "BF526", "BF527", NULL };
static const struct lfd_target bf527_lfd_target = {
	.name = "BF527",
	.description = "Blackfin LDR handler for BF522/BF523/BF524/BF525/BF526/BF527",
	.aliases = bf527_aliases,
	.uart_boot = true,
	.iovec = {
		.read_block_header = bf54x_lfd_read_block_header,
		.display_dxe = bf54x_lfd_display_dxe,
		.write_block = bf54x_lfd_write_block,
		.dump_block = bf54x_lfd_dump_block,
	},
	.em = EM_BLACKFIN,
	.dyn_sections = false,
};

__attribute__((constructor))
static void bf527_lfd_target_register(void)
{
	lfd_target_register(&bf527_lfd_target);
}
