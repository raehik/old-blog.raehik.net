---
layout: post
title: "BIOS-GPT: Why?"
date: 2014-08-04 23:53:10
---

//remember: rule of three,
            paragraphs often,
            link them,
            stay on topic.

Different systems bootstrap different OSes on different storage media...
differently. There are multiple stages to booting an operating system, and the
process is often not well understood because in general OSes don't tell people
about it, since knowledge on the boot process isn't needed for general use.
But for doing things such as complex partition schemes or installing a Linux
distro on a USB key, you might encounter some problems if you don't know about
BIOS and [U]EFI or MBR and GPT.

Let's start with MBR. Standing for Master Boot Record, MBR is a disk partitioning
scheme. (That basically means a way to store data about your partitions, which
are 'sections' of disks you can create to allow having multiple filesystems on
one physical disk.) Partition information is stored in a partition table in the
first [sector](http://en.wikipedia.org/wiki/Disk_sector) of the disk - in just
512 bytes! In fact, much of that is **empty space**: this is where bootloaders
come in.

GRUB 2, the most popular Linux bootloader, exploits the extra space available
in MBR partition schemes, in empty sectors in the MBR and between it and the first
partition. It embeds a small `boot.img` in the the MBR (about 32 KB), which
points to `core.img`, approximately 32 KB, which is stored in the free space in
the first sector after the MBR partition table. This file contains utilities
which allow it to find the partition with `/boot/grub` in (e.g. filesystem drivers).

<!-- http://en.wikipedia.org/wiki/File:GNU_GRUB_on_MBR_partitioned_hard_disk_drives.svg -->
<!-- Remember to attribute -->

It's old. [1983 old](http://en.wikipedia.org/wiki/Master_boot_record#Overview). With MBR, you can't address disks larger than 2 TB. You're also limited to just 4 primary partitions (though you can have more if you use extended partitions, they have the feeling of an bugfix rather than a design principal).

GPT, for GUID Partition Table, is a

In the GPT partitioning scheme, there *isn't* any extra space -- it's used for
the partition table (??).

The word BIOS, standing for Basic Input/Output System, was
coined in 1975. The principals have stayed very much the same up to the present
day - be limited in configuration, difficult to debug, and really ugly to look
at.

A common problem (or at least, something that happened to me) is installing
Linux with a GPT partition table (excuse the [redundancy](http://tvtropes.org/pmwiki/pmwiki.php/Main/DepartmentOfRedundancyDepartment).
on a BIOS system.

BIOS: Basic Input/Output System. A 1975 technology.
UEFI: Unified Extensible Firmware Interface. 2005.

GPT: GUID Partition Table.
MBR: Master Boot Record. Hold just 3

References:
    - Wikipedia (namely pages on the [BIOS](), [GPT](), [MBR]() and [GRUB]())
    - Knowledge likely obtained from [the brilliant Arch wiki](https://wiki.archlinux.org/)
