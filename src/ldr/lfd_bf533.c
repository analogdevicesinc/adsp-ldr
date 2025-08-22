// SPDX-License-Identifier: BSD-3-Clause
/*
 * Copyright (c) 2006-2021, Analog Devices, Inc. All rights reserved.
 */

#define __LFD_INTERNAL
#include "ldr.h"

static const char * const bf533_aliases[] = { "BF531", "BF532", "BF533", "BF538", "BF539", NULL };
static const struct lfd_target bf533_lfd_target = {
	.name = "BF533",
	.description = "Blackfin LDR handler for BF531/BF532/BF533 and BF538/BF539",
	.aliases = bf533_aliases,
	.uart_boot = false,
	.iovec = {
		.read_block_header = bf53x_lfd_read_block_header,
		.display_dxe = bf53x_lfd_display_dxe,
		.write_ldr = bf53x_lfd_write_ldr,
		.write_block = bf53x_lfd_write_block,
		.dump_block = bf53x_lfd_dump_block,
	},
	.em = EM_BLACKFIN,
	.dyn_sections = false,
};

__attribute__((constructor))
static void bf533_lfd_target_register(void)
{
	lfd_target_register(&bf533_lfd_target);
}
