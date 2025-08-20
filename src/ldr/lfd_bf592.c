// SPDX-License-Identifier: BSD-3-Clause
/*
 * Copyright (c) 2006-2021, Analog Devices, Inc. All rights reserved.
 */

#define __LFD_INTERNAL
#include "ldr.h"

static const char * const bf592_aliases[] = { "BF592", NULL };
static const struct lfd_target bf592_lfd_target = {
	.name = "BF592",
	.description = "Blackfin LDR handler for BF592",
	.aliases = bf592_aliases,
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
static void bf592_lfd_target_register(void)
{
	lfd_target_register(&bf592_lfd_target);
}
